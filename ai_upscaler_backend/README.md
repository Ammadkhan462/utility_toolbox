---
title: ZeroFlow AI Upscaler
emoji: 🖼️
colorFrom: blue
colorTo: purple
sdk: docker
app_port: 7860
pinned: false
---

# AI Upscaler Backend (GFPGAN + Real-ESRGAN)

Headless FastAPI backend for face-restoring image upscaling, deployed on
Hugging Face Spaces' free CPU tier (2 vCPU / 16 GB RAM, $0/month).

- **Faces** → GFPGAN v1.4 (generative face restoration)
- **Background** → Real-ESRGAN x4plus (general super-resolution)
- No Gradio, no WebSocket/SSE queueing — plain HTTP POST/GET, safe for a
  stateless Flutter client using `http`/`dio`.

## Endpoints

- `GET  /health` — wake-up / keep-alive ping (call this before showing the
  upload UI so the container is warm by the time the user hits "Upscale")
- `POST /api/upscale` — multipart form:
  - `file` — image (jpg/png)
  - `scale` — `2` or `4` (default `4`)
  - `face_enhance` — `true`/`false` (default `true`)
  - Header `Authorization: Bearer <token>` — required only if the `API_TOKEN`
    secret is set on the Space

Returns the processed image as `image/jpeg` bytes, or a JSON error body on
failure.

## Deploying

1. Create a new Space on huggingface.co → **Docker** SDK, **CPU basic** (free)
   hardware.
2. Push these files (`Dockerfile`, `app.py`, `requirements.txt`, this
   `README.md`) to the Space's git repo.
3. Optional: Space → Settings → **Variables and secrets** → add secret
   `API_TOKEN` with any random string. Put the same string in the Flutter
   app's `cloudApiToken` constant. Leave both empty to skip auth.
4. Wait for the build to finish (first build downloads ~350MB of model
   weights and bakes them into the image — takes a few minutes, only once).
5. Your endpoint is `https://<your-username>-<space-name>.hf.space`.

## Notes on the free tier

- CPU-only inference: expect **5–15 seconds** per image. That's the real
  cost of actual face-reconstruction quality on free hardware — there's no
  way around it without paid GPU hardware.
- Spaces sleep after inactivity and take ~20–30s to cold-start. Ping
  `/health` from the app as soon as it opens (or as soon as the user picks
  an image) to hide this latency.
- Free tier has no uptime guarantee — that's why the Flutter client keeps
  the on-device model as a fallback if this backend is unreachable.
