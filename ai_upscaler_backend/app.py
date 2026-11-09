"""
Headless GFPGAN + Real-ESRGAN upscaling API.

Deliberately NOT Gradio: Gradio's default /api/predict endpoint is flaky in
recent versions (404/405s, forced WebSocket/SSE queueing for busy Spaces),
which is a bad fit for a stateless mobile HTTP client. This is a plain
FastAPI app exposing a normal POST endpoint instead.
"""

import io
import os
import time
import logging

import cv2
import numpy as np
import torch
from fastapi import FastAPI, File, Form, Header, HTTPException, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse, Response
from PIL import Image

logging.basicConfig(level=logging.INFO)
log = logging.getLogger("upscaler")

app = FastAPI(title="AI Upscaler Backend")
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# ── Config ────────────────────────────────────────────────────────────────

API_TOKEN = os.environ.get("API_TOKEN", "").strip()  # empty = auth disabled
WEIGHTS_DIR = os.path.join(os.path.dirname(__file__), "weights")
GFPGAN_MODEL_PATH = os.path.join(WEIGHTS_DIR, "GFPGANv1.4.pth")
ESRGAN_MODEL_PATH = os.path.join(WEIGHTS_DIR, "RealESRGAN_x4plus.pth")

# Cap the longest edge before inference — keeps CPU time bounded on the
# free 2 vCPU tier. The model still regenerates real detail on the way
# back up, this just stops a 12MP photo from taking minutes.
MAX_INPUT_EDGE = 1024

_restorer = None  # lazily initialised GFPGANer, created once at startup


def _load_models():
    """Build the RealESRGAN background upsampler + GFPGAN face restorer.

    Runs once, at process startup, so per-request latency is just inference,
    not model loading.
    """
    global _restorer
    from basicsr.archs.rrdbnet_arch import RRDBNet
    from realesrgan import RealESRGANer
    from gfpgan import GFPGANer

    if not os.path.exists(GFPGAN_MODEL_PATH) or not os.path.exists(ESRGAN_MODEL_PATH):
        raise RuntimeError(
            "Model weights missing — did the Docker build step "
            "(download_weights.py) run correctly?"
        )

    log.info("Loading Real-ESRGAN background upsampler…")
    bg_model = RRDBNet(
        num_in_ch=3, num_out_ch=3, num_feat=64,
        num_block=23, num_grow_ch=32, scale=4,
    )
    bg_upsampler = RealESRGANer(
        scale=4,
        model_path=ESRGAN_MODEL_PATH,
        model=bg_model,
        tile=256,       # tiled inference — bounds memory use on CPU
        tile_pad=10,
        pre_pad=0,
        half=False,     # fp16 is not supported on CPU
        device=torch.device("cpu"),
    )

    log.info("Loading GFPGAN face restorer…")
    restorer = GFPGANer(
        model_path=GFPGAN_MODEL_PATH,
        upscale=4,
        arch="clean",           # GFPGANv1.4 uses the "clean" (no-CUDA-ext) arch
        channel_multiplier=2,
        bg_upsampler=bg_upsampler,
        device=torch.device("cpu"),
    )
    _restorer = restorer
    log.info("Models loaded.")


@app.on_event("startup")
def _startup():
    t0 = time.time()
    _load_models()
    log.info(f"Startup complete in {time.time() - t0:.1f}s")


# ── Endpoints ────────────────────────────────────────────────────────────

@app.get("/health")
def health():
    """Cheap wake/keep-alive ping. Call this as soon as the app opens or as
    soon as the user picks an image, so the Space is warm by the time they
    tap 'Upscale'."""
    return {"status": "ok", "model_loaded": _restorer is not None}


def _check_auth(authorization: str | None):
    if not API_TOKEN:
        return  # auth disabled
    expected = f"Bearer {API_TOKEN}"
    if authorization != expected:
        raise HTTPException(status_code=401, detail="Invalid or missing token")


@app.post("/api/upscale")
async def upscale(
    file: UploadFile = File(...),
    scale: int = Form(4),
    face_enhance: bool = Form(True),
    authorization: str | None = Header(default=None),
):
    _check_auth(authorization)

    if _restorer is None:
        raise HTTPException(status_code=503, detail="Model not ready yet, try again shortly")

    if scale not in (2, 4):
        raise HTTPException(status_code=400, detail="scale must be 2 or 4")

    raw = await file.read()
    if not raw:
        raise HTTPException(status_code=400, detail="Empty file")

    try:
        pil_img = Image.open(io.BytesIO(raw)).convert("RGB")
    except Exception:
        raise HTTPException(status_code=400, detail="Could not decode image")

    # Downscale oversized inputs before inference — see MAX_INPUT_EDGE.
    w, h = pil_img.size
    longest = max(w, h)
    if longest > MAX_INPUT_EDGE:
        ratio = MAX_INPUT_EDGE / longest
        pil_img = pil_img.resize((max(1, int(w * ratio)), max(1, int(h * ratio))), Image.LANCZOS)

    img_bgr = cv2.cvtColor(np.array(pil_img), cv2.COLOR_RGB2BGR)

    t0 = time.time()
    try:
        # GFPGANer is built with upscale=4 baked in; for a 2x request we
        # downscale the model's 4x output back down by half afterward,
        # which is still far sharper than never running the face/GAN
        # pass at all.
        _, _, restored_img = _restorer.enhance(
            img_bgr,
            has_aligned=False,
            only_center_face=False,
            paste_back=True,
            weight=0.5,  # fidelity vs. quality balance, mid-point
        ) if face_enhance else _bg_only_enhance(img_bgr)
    except Exception as e:
        log.exception("Inference failed")
        raise HTTPException(status_code=500, detail=f"Inference failed: {e}")

    if scale == 2:
        rh, rw = restored_img.shape[:2]
        restored_img = cv2.resize(
            restored_img, (max(1, rw // 2), max(1, rh // 2)),
            interpolation=cv2.INTER_LANCZOS4,
        )

    elapsed = time.time() - t0
    log.info(f"Processed {w}x{h} → {restored_img.shape[1]}x{restored_img.shape[0]} in {elapsed:.1f}s")

    out_rgb = cv2.cvtColor(restored_img, cv2.COLOR_BGR2RGB)
    out_pil = Image.fromarray(out_rgb)
    buf = io.BytesIO()
    out_pil.save(buf, format="JPEG", quality=92)
    return Response(content=buf.getvalue(), media_type="image/jpeg")


def _bg_only_enhance(img_bgr):
    """Skip GFPGAN's face pass entirely (used for the 'Illustration' mode,
    where running a real-face GAN on art/anime produces bad artifacts) and
    just run the Real-ESRGAN background upsampler directly."""
    out, _ = _restorer.bg_upsampler.enhance(img_bgr, outscale=4)
    return None, None, out


@app.exception_handler(Exception)
async def unhandled_exception_handler(request, exc):
    log.exception("Unhandled error")
    return JSONResponse(status_code=500, content={"detail": str(exc)})
