import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedColorProvider = StateProvider<Color>(
  (ref) => const Color(0xFF6366F1),
);

class ColorFormats {
  ColorFormats(Color c)
    : r = (c.r * 255).round(),
      g = (c.g * 255).round(),
      b = (c.b * 255).round(),
      a = (c.a * 255).round();

  final int r, g, b, a;

  String get hex =>
      '#${r.toRadixString(16).padLeft(2, '0')}'
              '${g.toRadixString(16).padLeft(2, '0')}'
              '${b.toRadixString(16).padLeft(2, '0')}'
          .toUpperCase();

  String get rgb => 'rgb($r, $g, $b)';

  String get hsl {
    final rf = r / 255, gf = g / 255, bf = b / 255;
    final mx = [rf, gf, bf].reduce((a, b) => a > b ? a : b);
    final mn = [rf, gf, bf].reduce((a, b) => a < b ? a : b);
    final l = (mx + mn) / 2;
    double h = 0, s = 0;
    if (mx != mn) {
      final d = mx - mn;
      s = l > 0.5 ? d / (2 - mx - mn) : d / (mx + mn);
      if (mx == rf) {
        h = (gf - bf) / d + (gf < bf ? 6 : 0);
      } else if (mx == gf) {
        h = (bf - rf) / d + 2;
      } else {
        h = (rf - gf) / d + 4;
      }
      h /= 6;
    }
    return 'hsl(${(h * 360).round()}, ${(s * 100).round()}%, ${(l * 100).round()}%)';
  }

  String get cmyk {
    final rf = r / 255, gf = g / 255, bf = b / 255;
    final k = 1 - [rf, gf, bf].reduce((a, b) => a > b ? a : b);
    if (k == 1) return 'cmyk(0%, 0%, 0%, 100%)';
    final c2 = ((1 - rf - k) / (1 - k) * 100).round();
    final m = ((1 - gf - k) / (1 - k) * 100).round();
    final y = ((1 - bf - k) / (1 - k) * 100).round();
    return 'cmyk($c2%, $m%, $y%, ${(k * 100).round()}%)';
  }
}

final colorFormatsProvider = Provider<ColorFormats>((ref) {
  return ColorFormats(ref.watch(selectedColorProvider));
});
