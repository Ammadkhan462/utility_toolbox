"""
Run once during `docker build` so model weights are baked into the image
layer — the container never has to download anything at runtime, which
would otherwise add a huge delay to every cold start on the free tier.
"""
import os
import urllib.request

WEIGHTS_DIR = os.path.join(os.path.dirname(__file__), "weights")
os.makedirs(WEIGHTS_DIR, exist_ok=True)

FILES = {
    "GFPGANv1.4.pth": (
        "https://github.com/TencentARC/GFPGAN/releases/download/v1.3.4/GFPGANv1.4.pth"
    ),
    "RealESRGAN_x4plus.pth": (
        "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth"
    ),
}


def download(url, dest):
    print(f"Downloading {url} -> {dest}")
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req) as resp, open(dest, "wb") as out:
        out.write(resp.read())


for filename, url in FILES.items():
    dest = os.path.join(WEIGHTS_DIR, filename)
    if os.path.exists(dest):
        print(f"{filename} already present, skipping")
        continue
    download(url, dest)

print("Weights ready:", os.listdir(WEIGHTS_DIR))


# Also warm up facexlib's face-detection/parsing models so they get baked
# into the image too, instead of being lazily downloaded on the first real
# request (which would make the first user's request extremely slow).
print("Warming up facexlib detection/parsing models…")
import numpy as np
from gfpgan import GFPGANer

restorer = GFPGANer(
    model_path=os.path.join(WEIGHTS_DIR, "GFPGANv1.4.pth"),
    upscale=2,
    arch="clean",
    channel_multiplier=2,
    bg_upsampler=None,
)
dummy = (np.random.rand(64, 64, 3) * 255).astype("uint8")
restorer.enhance(dummy, has_aligned=False, only_center_face=False, paste_back=True)
print("Warmup complete — facexlib weights cached into image.")
