import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:utility_toolbox/features/bg_remover/bg_remover_logic.dart';

void main() {
  group('sizing', () {
    test('fitLongSide caps the long side and keeps aspect', () {
      expect(fitLongSide(4000, 3000), (width: 2048, height: 1536));
      expect(fitLongSide(3000, 4000), (width: 1536, height: 2048));
      expect(fitLongSide(800, 600), (width: 800, height: 600));
    });

    test('sampleSizeFor keeps the short side ≥ target', () {
      expect(sampleSizeFor(8000, 6000), 2); // 6000/4 = 1500 < 1536
      expect(sampleSizeFor(16000, 12000), 4);
      expect(sampleSizeFor(1000, 800), 1);
    });
  });

  group('maskToAlpha', () {
    test('maps confidence through the smoothstep', () {
      final a = maskToAlpha([0, 0.2, 0.5, 0.8, 1], 5, 1, featherRadius: 0);
      expect(a, [0, 0, 128, 255, 255]);
    });

    test('feathers a hard edge into a monotonic ramp', () {
      const w = 12, h = 3;
      final mask = <double>[
        for (var y = 0; y < h; y++)
          for (var x = 0; x < w; x++) x < 6 ? 1.0 : 0.0,
      ];
      final a = maskToAlpha(mask, w, h, featherRadius: 2);
      final row = a.sublist(w, 2 * w);
      expect(row.first, 255);
      expect(row.last, 0);
      for (var x = 1; x < w; x++) {
        expect(row[x] <= row[x - 1], isTrue, reason: 'x=$x $row');
      }
      expect(row[5] > 0 && row[5] < 255, isTrue);
      expect(row[6] > 0 && row[6] < 255, isTrue);
    });

    test('rejects a mask of the wrong size', () {
      expect(() => maskToAlpha([1, 1, 1], 2, 2), throwsArgumentError);
    });
  });

  test('boxBlur keeps flat areas and the total roughly', () {
    final flat = Uint8List(25)..fillRange(0, 25, 200);
    expect(boxBlur(flat, 5, 5, 1), everyElement(200));
  });

  test('subject detection by coverage', () {
    final none = Uint8List(10000);
    expect(hasSubject(none), isFalse);
    final some = Uint8List(10000)..fillRange(0, 500, 255);
    expect(subjectCoverage(some), closeTo(0.05, 1e-9));
    expect(hasSubject(some), isTrue);
  });

  group('composite', () {
    final src = img.Image(width: 2, height: 1);
    src.setPixelRgb(0, 0, 200, 100, 50);
    src.setPixelRgb(1, 0, 200, 100, 50);
    final alpha = Uint8List.fromList([255, 0]);

    test('transparent keeps colour and writes alpha', () {
      final out = composite(src, alpha, const TransparentFill());
      expect(out.numChannels, 4);
      final p0 = out.getPixel(0, 0), p1 = out.getPixel(1, 0);
      expect([p0.r, p0.g, p0.b, p0.a], [200, 100, 50, 255]);
      expect(p1.a, 0);
    });

    test('colour fills the background and blends edges', () {
      final out = composite(src, Uint8List.fromList([255, 0]), const ColorFill(0xFFFFFFFF));
      expect(out.numChannels, 3);
      final p0 = out.getPixel(0, 0), p1 = out.getPixel(1, 0);
      expect([p0.r, p0.g, p0.b], [200, 100, 50]);
      expect([p1.r, p1.g, p1.b], [255, 255, 255]);

      final half = composite(src, Uint8List.fromList([128, 128]), const ColorFill(0xFF000000));
      expect(half.getPixel(0, 0).r, closeTo(100, 1));
    });

    test('blur background keeps size', () {
      final big = img.Image(width: 300, height: 200);
      final out = composite(big, Uint8List(300 * 200), const BlurFill());
      expect(out.width, 300);
      expect(out.height, 200);
    });

    test('premultiplied preview scales colour by alpha', () {
      final rgba = premultipliedRgba(src, Uint8List.fromList([255, 0]));
      expect(rgba, [200, 100, 50, 255, 0, 0, 0, 0]);
    });

    test('file type follows the background', () {
      expect(const TransparentFill().extension, 'png');
      expect(const ColorFill(0xFFFFFFFF).mimeType, 'image/jpeg');
      expect(const BlurFill().extension, 'jpg');
    });
  });
}
