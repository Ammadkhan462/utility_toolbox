FROM python:3.10-slim

# opencv/torch runtime deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 \
    ffmpeg \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install torch/torchvision FIRST, on their own, from the CPU wheel index.
# basicsr's setup.py imports torch directly during its own build step — if
# we let pip resolve everything in one shot, pip's isolated build
# environment for basicsr fetches its OWN fresh (GPU, unpinned) copy of
# torch to satisfy that import, which drags in a mismatched nvidia-cublas
# and breaks the whole install. Installing torch up front, then disabling
# build isolation for the rest, forces basicsr to see and reuse this exact
# pinned CPU build instead.
RUN pip install --no-cache-dir torch==2.1.2+cpu torchvision==0.16.2+cpu \
    --extra-index-url https://download.pytorch.org/whl/cpu

COPY requirements.txt .
RUN pip install --no-cache-dir --no-build-isolation -r requirements.txt

# Known compatibility issue: basicsr 1.4.2 imports
# `torchvision.transforms.functional_tensor`, which newer torchvision
# versions removed. We pin a compatible torchvision in requirements.txt,
# but patch defensively in case the resolved version still differs.
RUN python -c "\
import basicsr, os; \
p = os.path.join(os.path.dirname(basicsr.__file__), 'data', 'degradations.py'); \
s = open(p).read(); \
s2 = s.replace('from torchvision.transforms.functional_tensor import rgb_to_grayscale', 'from torchvision.transforms.functional import rgb_to_grayscale'); \
open(p, 'w').write(s2) if s != s2 else None; \
print('basicsr patch check done')"

COPY . .

# Downloads GFPGAN + Real-ESRGAN weights AND warms up facexlib's
# detection/parsing models so everything is baked into this image layer —
# zero runtime downloads, fast cold starts.
RUN python download_weights.py

EXPOSE 8080

# Cloud Run injects the PORT env var (usually 8080) and requires the
# container to listen on it — this must NOT be a hardcoded port.
CMD exec uvicorn app:app --host 0.0.0.0 --port ${PORT:-8080}
