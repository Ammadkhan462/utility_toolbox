"""Single source for the Utility Toolbox logo.

Generates, from one set of shapes on a 108x108 adaptive-icon grid:
  * tool/logo/logo.svg, logo_mono.svg            (masters / previews)
  * android res: ic_launcher_background.xml, ic_launcher_foreground.xml,
    ic_launcher_monochrome.xml (vector drawables)
  * lib/core/widgets/app_logo.dart                (Flutter painter)
PNG exports (legacy mipmaps, Play icon) are rendered from logo.svg by
render_pngs.py with headless Chrome.

Run from the repo root:  python tool/logo/make_logo.py
"""
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
RES = ROOT / "android/app/src/main/res"

INDIGO = "#3B2FCC"
BG_STOPS = [(0, "#6E5BFF"), (0.55, "#3B2FCC"), (1, "#22198F")]
ORANGE = [(0, "#FF9A4D"), (1, "#FF5C7A")]
CYAN = [(0, "#38E8FF"), (1, "#00A6D6")]
SHADOW = "#160F66"

SCALE = 0.86  # keeps every corner inside the 66dp safe-zone circle
PIVOT = (54, 54)

# Tile grid
T = 25.5  # tile size
G = 3  # gap
X0, Y0 = 27, 31.5
R = 6.5  # tile corner radius
TL = (X0, Y0)
TR = (X0 + T + G, Y0)
BL = (X0, Y0 + T + G)
BR = (X0 + T + G, Y0 + T + G)


def c(tile):
    return tile[0] + T / 2, tile[1] + T / 2


def f(v):
    s = f"{v:.2f}".rstrip("0").rstrip(".")
    return s if s != "-0" else "0"


# ── primitives ───────────────────────────────────────────────────────────
# path commands: ('M',x,y) ('L',x,y) ('Q',cx,cy,x,y) ('Z',)


def rrect(x, y, w, h, r):
    k = 0.5523 * r  # cubic approximation is not available in our tiny IR; use Q
    return [
        ("M", x + r, y),
        ("L", x + w - r, y),
        ("Q", x + w, y, x + w, y + r),
        ("L", x + w, y + h - r),
        ("Q", x + w, y + h, x + w - r, y + h),
        ("L", x + r, y + h),
        ("Q", x, y + h, x, y + h - r),
        ("L", x, y + r),
        ("Q", x, y, x + r, y),
        ("Z",),
    ]


def rect(x, y, w, h):
    return [("M", x, y), ("L", x + w, y), ("L", x + w, y + h), ("L", x, y + h), ("Z",)]


def sparkle(cx, cy, r, k=0.16):
    q = r * k
    return [
        ("M", cx, cy - r),
        ("Q", cx + q, cy - q, cx + r, cy),
        ("Q", cx + q, cy + q, cx, cy + r),
        ("Q", cx - q, cy + q, cx - r, cy),
        ("Q", cx - q, cy - q, cx, cy - r),
        ("Z",),
    ]


def round_line(x1, x2, y, t):
    """Horizontal line with round caps, as a filled shape."""
    return rrect(x1 - t / 2, y - t / 2, x2 - x1 + t, t, t / 2)


def to_d(cmds):
    out = []
    for cmd in cmds:
        out.append(cmd[0] + " ".join(f(v) for v in cmd[1:]))
    return "".join(out)


# Handle: an upside-down U drawn as a filled outline (no strokes, so it
# themes and scales identically everywhere).
def handle():
    cx = c(TL)[0] + (c(TR)[0] - c(TL)[0]) / 2
    w_out, w_in = 26, 16
    top_out, top_in = Y0 - 9, Y0 - 4
    ro, ri = 6, 2.5
    xl, xr = cx - w_out / 2, cx + w_out / 2
    il, ir = cx - w_in / 2, cx + w_in / 2
    base = Y0 + 4
    return [
        ("M", xl, base),
        ("L", xl, top_out + ro),
        ("Q", xl, top_out, xl + ro, top_out),
        ("L", xr - ro, top_out),
        ("Q", xr, top_out, xr, top_out + ro),
        ("L", xr, base),
        ("L", ir, base),
        ("L", ir, top_in + ri),
        ("Q", ir, top_in, ir - ri, top_in),
        ("L", il + ri, top_in),
        ("Q", il, top_in, il, top_in + ri),
        ("L", il, base),
        ("Z",),
    ]


# Glyphs
def qr_glyph():
    cx, cy = c(TL)
    o, i, d = 13.5, 8, 4.4
    return (
        rrect(cx - o / 2, cy - o / 2, o, o, 2.6),
        rrect(cx - i / 2, cy - i / 2, i, i, 1.1),
        rrect(cx - d / 2, cy - d / 2, d, d, 0.6),
    )


def doc_glyph():
    cx, cy = c(TR)
    w, h, fold = 12.5, 15.5, 4.6
    x, y = cx - w / 2, cy - h / 2
    page = [("M", x + 1.4, y), ("L", x + w - fold, y), ("L", x + w, y + fold),
            ("L", x + w, y + h - 1.4), ("Q", x + w, y + h, x + w - 1.4, y + h),
            ("L", x + 1.4, y + h), ("Q", x, y + h, x, y + h - 1.4),
            ("L", x, y + 1.4), ("Q", x, y, x + 1.4, y), ("Z",)]
    corner = [("M", x + w - fold, y), ("L", x + w - fold, y + fold),
              ("L", x + w, y + fold), ("Z",)]
    return page, corner


def text_glyph():
    cx, cy = c(BL)
    t = 2.6
    x1 = cx - 6.5
    return [round_line(x1, x1 + 13, cy - 4.8, t), round_line(x1, x1 + 13, cy, t),
            round_line(x1, x1 + 7.5, cy + 4.8, t)]


def spark_glyph():
    cx, cy = c(BR)
    return sparkle(cx, cy, 8.2), sparkle(cx + 5.6, cy - 5.6, 2.6, 0.2)


# ── layers ───────────────────────────────────────────────────────────────
# Each item: (cmds, paint) where paint = ('solid', color, alpha) |
# ('grad', stops, (x1,y1,x2,y2)) ; mono flag decides monochrome treatment.


def tile_grad(tile, stops):
    x, y = tile
    return ("grad", stops, (x, y, x + T, y + T))


def foreground():
    items = []
    for t in (TL, TR, BL, BR):
        items.append((rrect(t[0], t[1] + 1.6, T, T, R), ("solid", SHADOW, 0.35)))
    items.append((handle(), ("solid", "#FFFFFF", 1)))
    items.append((rrect(*TL, T, T, R), ("solid", "#FFFFFF", 1)))
    items.append((rrect(*TR, T, T, R), tile_grad(TR, ORANGE)))
    items.append((rrect(*BL, T, T, R), tile_grad(BL, CYAN)))
    items.append((rrect(*BR, T, T, R), ("solid", "#FFFFFF", 1)))
    o, i, d = qr_glyph()
    items.append((o, ("solid", INDIGO, 1)))
    items.append((i, ("solid", "#FFFFFF", 1)))
    items.append((d, ("solid", INDIGO, 1)))
    page, corner = doc_glyph()
    items.append((page, ("solid", "#FFFFFF", 1)))
    items.append((corner, ("solid", "#FFD0BE", 1)))
    for ln in text_glyph():
        items.append((ln, ("solid", "#FFFFFF", 1)))
    big, small = spark_glyph()
    items.append((big, ("solid", INDIGO, 1)))
    items.append((small, ("solid", "#7C6FFF", 1)))
    return items


def mono():
    """Single-colour silhouette: tiles filled, glyphs punched out (evenOdd)."""
    o, i, d = qr_glyph()
    page, corner = doc_glyph()
    big, small = spark_glyph()
    return [
        handle(),
        rrect(*TL, T, T, R) + o + i + d,
        rrect(*TR, T, T, R) + page,
        rrect(*BL, T, T, R) + sum(text_glyph(), []),
        rrect(*BR, T, T, R) + big + small,
    ]


# ── emitters ─────────────────────────────────────────────────────────────

def svg(mono_mode=False, with_bg=True):
    defs, body = [], []
    gid = 0
    if with_bg and not mono_mode:
        defs.append(
            '<linearGradient id="bg" x1="0" y1="0" x2="108" y2="108" gradientUnits="userSpaceOnUse">'
            + "".join(f'<stop offset="{o}" stop-color="{col}"/>' for o, col in BG_STOPS)
            + "</linearGradient>")
        body.append('<rect width="108" height="108" fill="url(#bg)"/>')
    g = []
    if mono_mode:
        for cmds in mono():
            g.append(f'<path fill="#FFFFFF" fill-rule="evenodd" d="{to_d(cmds)}"/>')
    else:
        for cmds, paint in foreground():
            if paint[0] == "solid":
                op = f' fill-opacity="{paint[2]}"' if paint[2] != 1 else ""
                g.append(f'<path fill="{paint[1]}"{op} d="{to_d(cmds)}"/>')
            else:
                gid += 1
                x1, y1, x2, y2 = paint[2]
                defs.append(
                    f'<linearGradient id="g{gid}" x1="{f(x1)}" y1="{f(y1)}" x2="{f(x2)}" y2="{f(y2)}" gradientUnits="userSpaceOnUse">'
                    + "".join(f'<stop offset="{o}" stop-color="{col}"/>' for o, col in paint[1])
                    + "</linearGradient>")
                g.append(f'<path fill="url(#g{gid})" d="{to_d(cmds)}"/>')
    px, py = PIVOT
    tr = f"translate({f(px)} {f(py)}) scale({SCALE}) translate({f(-px)} {f(-py)})"
    body.append(f'<g transform="{tr}">' + "".join(g) + "</g>")
    return ('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 108 108">'
            + (f"<defs>{''.join(defs)}</defs>" if defs else "") + "".join(body) + "</svg>")


def a_color(col, alpha=1):
    a = round(alpha * 255)
    return f"#{a:02X}{col[1:]}" if alpha != 1 else col


def vector(paths_xml, aapt=False):
    ns = ' xmlns:aapt="http://schemas.android.com/aapt"' if aapt else ""
    return ('<?xml version="1.0" encoding="utf-8"?>\n'
            '<!-- Generated by tool/logo/make_logo.py — edit the script, not this file. -->\n'
            f'<vector xmlns:android="http://schemas.android.com/apk/res/android"{ns}\n'
            '    android:width="108dp" android:height="108dp"\n'
            '    android:viewportWidth="108" android:viewportHeight="108">\n'
            + paths_xml + "</vector>\n")


def grad_xml(stops, x1, y1, x2, y2, indent="        "):
    items = "".join(f'{indent}        <item android:offset="{o}" android:color="{col}"/>\n' for o, col in stops)
    return (f'{indent}<aapt:attr name="android:fillColor">\n'
            f'{indent}    <gradient android:type="linear" android:startX="{f(x1)}" android:startY="{f(y1)}"'
            f' android:endX="{f(x2)}" android:endY="{f(y2)}">\n'
            + items + f"{indent}    </gradient>\n{indent}</aapt:attr>\n")


def android_group(inner):
    px, py = PIVOT
    return (f'    <group android:pivotX="{f(px)}" android:pivotY="{f(py)}"'
            f' android:scaleX="{SCALE}" android:scaleY="{SCALE}">\n' + inner + "    </group>\n")


def android_fg():
    out = []
    for cmds, paint in foreground():
        if paint[0] == "solid":
            out.append(f'        <path android:fillColor="{a_color(paint[1], paint[2])}"\n'
                       f'            android:pathData="{to_d(cmds)}"/>\n')
        else:
            out.append(f'        <path android:pathData="{to_d(cmds)}">\n'
                       + grad_xml(paint[1], *paint[2], indent="            ")
                       + "        </path>\n")
    return vector(android_group("".join(out)), aapt=True)


def android_bg():
    p = ('    <path android:pathData="M0,0h108v108h-108z">\n'
         + grad_xml(BG_STOPS, 0, 0, 108, 108) + "    </path>\n")
    return vector(p, aapt=True)


def android_mono():
    out = "".join(
        f'        <path android:fillColor="#FFFFFFFF" android:fillType="evenOdd"\n'
        f'            android:pathData="{to_d(cmds)}"/>\n' for cmds in mono())
    return vector(android_group(out))


def android_notification():
    """Status-bar icon: the silhouette cropped tight to the mark."""
    x0, y0, size = 22.5, 22.5, 63
    nl = "\n"
    paths = "".join(
        f'        <path android:fillColor="#FFFFFFFF" android:fillType="evenOdd"{nl}'
        f'            android:pathData="{to_d(cmds)}"/>{nl}' for cmds in mono())
    return (f'<?xml version="1.0" encoding="utf-8"?>{nl}'
            f'<!-- Generated by tool/logo/make_logo.py — edit the script, not this file. -->{nl}'
            f'<vector xmlns:android="http://schemas.android.com/apk/res/android"{nl}'
            f'    android:width="24dp" android:height="24dp"{nl}'
            f'    android:viewportWidth="{size}" android:viewportHeight="{size}">{nl}'
            f'    <group android:translateX="{f(-x0)}" android:translateY="{f(-y0)}">{nl}'
            + paths + f"    </group>{nl}</vector>{nl}")


def dart_path(cmds, name):
    lines = [f"    final {name} = Path()"]
    for cmd in cmds:
        a = [f(v) for v in cmd[1:]]
        if cmd[0] == "M":
            lines.append(f"      ..moveTo({a[0]}, {a[1]})")
        elif cmd[0] == "L":
            lines.append(f"      ..lineTo({a[0]}, {a[1]})")
        elif cmd[0] == "Q":
            lines.append(f"      ..quadraticBezierTo({', '.join(a)})")
        else:
            lines.append("      ..close()")
    return "\n".join(lines) + ";\n"


def dart_color(col, alpha=1):
    return f"Color(0x{round(alpha * 255):02X}{col[1:].upper()})"


def dart():
    body = []
    for n, (cmds, paint) in enumerate(foreground()):
        body.append(dart_path(cmds, f"p{n}"))
        if paint[0] == "solid":
            body.append(f"    canvas.drawPath(p{n}, Paint()..color = {dart_color(paint[1], paint[2])});\n")
        else:
            x1, y1, x2, y2 = paint[2]
            cols = ", ".join(dart_color(col) for _, col in paint[1])
            stops = ", ".join(str(float(o)) for o, _ in paint[1])
            body.append(
                f"    canvas.drawPath(p{n}, Paint()..shader = ui.Gradient.linear("
                f"const Offset({f(x1)}, {f(y1)}), const Offset({f(x2)}, {f(y2)}), const [{cols}], const [{stops}]));\n")
    bg_cols = ", ".join(dart_color(col) for _, col in BG_STOPS)
    bg_stops = ", ".join(str(float(o)) for o, _ in BG_STOPS)
    px, py = PIVOT
    return f"""// Generated by tool/logo/make_logo.py — edit the script, not this file.
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

/// The app's logo mark, drawn as vectors (no image asset).
///
/// [crop] shows the launcher-visible area (the middle 72 of 108 units), which
/// is what people recognise as "the icon". [background] = false draws only the
/// tiles, for use on an already-coloured surface.
class AppLogo extends StatelessWidget {{
  const AppLogo({{super.key, this.size = 48, this.background = true, this.radius}});

  final double size;
  final bool background;

  /// Corner radius as a fraction of [size]; defaults to a launcher squircle.
  final double? radius;

  @override
  Widget build(BuildContext context) {{
    final r = (radius ?? 0.26) * size;
    return Semantics(
      image: true,
      label: 'Utility Toolbox',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(background ? r : 0),
        child: CustomPaint(size: Size.square(size), painter: _LogoPainter(background)),
      ),
    );
  }}
}}

class _LogoPainter extends CustomPainter {{
  const _LogoPainter(this.background);

  final bool background;

  @override
  void paint(Canvas canvas, Size size) {{
    // Show the launcher-visible 72x72 window of the 108x108 icon grid.
    const view = 72.0, offset = 18.0;
    canvas.scale(size.width / view);
    canvas.translate(-offset, -offset);
    if (background) {{
      canvas.drawRect(
        const Rect.fromLTWH(0, 0, 108, 108),
        Paint()..shader = ui.Gradient.linear(const Offset(0, 0), const Offset(108, 108), const [{bg_cols}], const [{bg_stops}]),
      );
    }}
    canvas.translate({f(px)}, {f(py)});
    canvas.scale({SCALE});
    canvas.translate(-{f(px)}, -{f(py)});
{''.join(body)}  }}

  @override
  bool shouldRepaint(_LogoPainter old) => old.background != background;
}}
"""


def main():
    here = Path(__file__).parent
    (here / "logo.svg").write_text(svg(), encoding="utf-8")
    (here / "logo_fg.svg").write_text(svg(with_bg=False), encoding="utf-8")
    (here / "logo_mono.svg").write_text(svg(mono_mode=True), encoding="utf-8")
    (RES / "drawable/ic_launcher_foreground.xml").write_text(android_fg(), encoding="utf-8")
    (RES / "drawable/ic_launcher_background.xml").write_text(android_bg(), encoding="utf-8")
    (RES / "drawable/ic_launcher_monochrome.xml").write_text(android_mono(), encoding="utf-8")
    (RES / "drawable/ic_notification.xml").write_text(android_notification(), encoding="utf-8")
    (ROOT / "lib/core/widgets/app_logo.dart").write_text(dart(), encoding="utf-8")
    print("ok")


if __name__ == "__main__":
    main()
