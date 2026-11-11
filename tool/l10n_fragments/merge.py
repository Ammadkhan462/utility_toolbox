"""Merge per-tool translation fragments into lib/l10n/app_<locale>.arb.

Each tool/l10n_fragments/<tool>.json looks like
  {"en": {"key": "text", "@key": {...}}, "es": {"key": "texto"}, ...}
Keys are added (or overwritten) in place; new keys go at the end. Idempotent,
so it is safe to run repeatedly. Then run `flutter gen-l10n`.

  python tool/l10n_fragments/merge.py
"""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ARB = ROOT / "lib/l10n"
LOCALES = ["en", "ar", "bn", "de", "es", "fr", "hi", "id", "pt", "ru", "tr", "ur"]

merged = {loc: {} for loc in LOCALES}
for frag in sorted(Path(__file__).parent.glob("*.json")):
    data = json.loads(frag.read_text(encoding="utf-8"))
    for loc, entries in data.items():
        if loc not in merged:
            raise SystemExit(f"{frag.name}: unknown locale {loc}")
        merged[loc].update(entries)

for loc in LOCALES:
    path = ARB / f"app_{loc}.arb"
    arb = json.loads(path.read_text(encoding="utf-8"))
    entries = merged[loc] if loc == "en" else {k: v for k, v in merged[loc].items() if not k.startswith("@")}
    arb.update(entries)
    path.write_text(json.dumps(arb, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
print("merged", sum(len(v) for v in merged.values()), "entries")
