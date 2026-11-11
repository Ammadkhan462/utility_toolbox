"""Render PNG exports of the logo with headless Chrome.

  * legacy launcher icons (API 24-25): mipmap-*/ic_launcher.png
  * Play Store icon: store_listing/icon_512.png (full-bleed square)

Run from the repo root after make_logo.py:  python tool/logo/render_pngs.py
"""
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SVG = (Path(__file__).parent / "logo.svg").resolve().as_uri()
CHROME = r"C:\Program Files\Google\Chrome\Application\chrome.exe"

TARGETS = {
    "android/app/src/main/res/mipmap-mdpi/ic_launcher.png": (48, "22%"),
    "android/app/src/main/res/mipmap-hdpi/ic_launcher.png": (72, "22%"),
    "android/app/src/main/res/mipmap-xhdpi/ic_launcher.png": (96, "22%"),
    "android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png": (144, "22%"),
    "android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png": (192, "22%"),
    "store_listing/icon_512.png": (512, "0"),
}


def render(out: Path, size: int, radius: str):
    # Show the launcher-visible middle 72/108 of the icon grid.
    html = (f'<!doctype html><style>html,body{{margin:0;background:transparent}}'
            f'div{{width:{size}px;height:{size}px;border-radius:{radius};overflow:hidden}}'
            f'img{{width:{size * 1.5}px;margin:-{size * 0.25}px;display:block}}</style>'
            f'<div><img src="{SVG}"></div>')
    with tempfile.NamedTemporaryFile("w", suffix=".html", delete=False) as fh:
        fh.write(html)
    subprocess.run([CHROME, "--headless=new", "--disable-gpu", "--hide-scrollbars",
                    "--allow-file-access-from-files", "--default-background-color=00000000",
                    f"--window-size={size},{size}", f"--screenshot={out}",
                    Path(fh.name).as_uri()], check=True, capture_output=True)


for rel, (size, radius) in TARGETS.items():
    out = ROOT / rel
    out.parent.mkdir(parents=True, exist_ok=True)
    render(out, size, radius)
    print(rel, out.stat().st_size)
