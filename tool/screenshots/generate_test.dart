// Google Play marketing screenshot generator.
//
// Renders the app's real widgets headlessly (no device needed) inside a
// marketing frame and writes opaque 24-bit PNGs to store_listing/screenshots/.
//
//   flutter test tool/screenshots/generate_test.dart
//
// Lives outside test/ so it never runs with the normal suite.
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image/image.dart' as img;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/app.dart';
import 'package:utility_toolbox/core/routing/app_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/core/widgets/app_logo.dart';
import 'package:utility_toolbox/features/home/tools_tab.dart';

const _outDir = 'store_listing/screenshots';
const _fontDir = 'tool/screenshots/fonts';

// Canvas (physical px == logical px) and the phone screen inside it.
const _canvas = Size(1080, 1920);
const _screen = Size(412, 840); // logical size the app is laid out at
const _scale = 1.7; // logical → canvas px
const _statusBar = 30.0;

const _brand = [Color(0xFF6E5BFF), Color(0xFF3AA8FF)];

final _frameKey = GlobalKey();

// ── Fonts ────────────────────────────────────────────────────────────────────

Directory _materialFontsDir() {
  final candidates = <String>[
    if (Platform.environment['FLUTTER_ROOT'] case final root?)
      '$root/bin/cache/artifacts/material_fonts',
    // flutter_tester lives in <flutter>/bin/cache/artifacts/engine/<platform>/
    '${File(Platform.resolvedExecutable).parent.parent.parent.path}/material_fonts',
  ];
  for (final c in candidates) {
    if (File('$c/MaterialIcons-Regular.otf').existsSync()) return Directory(c);
  }
  throw StateError('Material fonts not found in $candidates');
}

Future<void> _loadFamily(String family, List<String> paths) async {
  final loader = FontLoader(family);
  for (final p in paths) {
    final bytes = File(p).readAsBytesSync();
    loader.addFont(Future.value(ByteData.sublistView(bytes)));
  }
  await loader.load();
}

Future<void> _loadFonts() async {
  final material = _materialFontsDir().path;
  await _loadFamily('MaterialIcons', ['$material/MaterialIcons-Regular.otf']);
  final roboto = Directory(material)
      .listSync()
      .whereType<File>()
      .map((f) => f.path)
      .where((p) => RegExp(r'[\\/]roboto-[a-z]+\.ttf$').hasMatch(p))
      .toList();
  await _loadFamily('Roboto', roboto);

  // google_fonts asks the engine for "<Family>_<variant>" (e.g.
  // PlusJakartaSans_regular, PlusJakartaSans_700). Register every weight
  // under each of those names so copyWith(fontWeight: …) picks the real cut.
  const weights = [
    'ExtraLight', 'Light', 'Regular', 'Medium', 'SemiBold', 'Bold', 'ExtraBold',
  ];
  final jakarta = [for (final w in weights) '$_fontDir/PlusJakartaSans-$w.ttf'];
  const variants = ['regular', '100', '200', '300', '500', '600', '700', '800', '900'];
  await _loadFamily('PlusJakartaSans', jakarta);
  for (final v in variants) {
    await _loadFamily('PlusJakartaSans_$v', jakarta);
  }
}

/// google_fonts looks for "<Family>-<Weight>.ttf" in the asset manifest
/// before trying the network (which tests forbid). Serve the downloaded
/// Plus Jakarta Sans files as if they were bundled assets, and pass every
/// other key through to the normal unit-test asset folder.
void _mockGoogleFontsAssets() {
  final assetDir = Platform.environment['UNIT_TEST_ASSETS'] ?? 'build/unit_test_assets';
  const weights = [
    'ExtraLight', 'Light', 'Regular', 'Medium', 'SemiBold', 'Bold', 'ExtraBold',
  ];
  final fontKeys = <String, String>{
    for (final w in weights) 'google_fonts/PlusJakartaSans-$w.ttf': '$_fontDir/PlusJakartaSans-$w.ttf',
    // No italic cuts downloaded; upright stands in if one is ever asked for.
    for (final w in weights)
      'google_fonts/PlusJakartaSans-${w == 'Regular' ? '' : w}Italic.ttf':
          '$_fontDir/PlusJakartaSans-$w.ttf',
  };
  const codec = StandardMessageCodec();

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMessageHandler('flutter/assets', (message) async {
    final key = utf8.decode(message!.buffer.asUint8List());
    if (fontKeys[key] case final path?) {
      return ByteData.sublistView(File(path).readAsBytesSync());
    }
    final file = File('$assetDir/$key');
    if (!file.existsSync()) return null;
    final bytes = ByteData.sublistView(file.readAsBytesSync());
    if (key == 'AssetManifest.bin') {
      final manifest = Map<Object?, Object?>.of(codec.decodeMessage(bytes) as Map);
      for (final k in fontKeys.keys) {
        manifest[k] = [
          {'asset': k},
        ];
      }
      return codec.encodeMessage(manifest);
    }
    return bytes;
  });
}

// ── Seed data ────────────────────────────────────────────────────────────────

Map<String, Object> _prefs({bool files = false}) {
  final now = DateTime(2026, 11, 10, 17, 42);
  Map<String, Object?> rec(
    String id,
    String name,
    String mime,
    String tool,
    Duration ago,
    int size,
  ) => {
    'id': id,
    'name': name,
    'location': '/storage/emulated/0/Download/$name',
    'mimeType': mime,
    'toolId': tool,
    'createdAt': now.subtract(ago).millisecondsSinceEpoch,
    'sizeBytes': size,
  };

  return {
    'has_seen_onboarding': true,
    'favorite_tools': ['doc_scanner', 'translation', 'image_resizer', 'compress_pdf', 'qr_generator'],
    'recent_tools': ['merge_pdf', 'calculator', 'ocr', 'unit_converter', 'wifi_qr'],
    if (files)
      'output_records_v1': jsonEncode([
        rec('1', 'Scan_Receipt_Nov.pdf', 'application/pdf', 'doc_scanner', Duration.zero, 412300),
        rec('2', 'merged_contract.pdf', 'application/pdf', 'merge_pdf', const Duration(hours: 3, minutes: 12), 1873400),
        rec('3', 'passport_413x531.jpg', 'image/jpeg', 'image_resizer', const Duration(hours: 26), 86200),
        rec('4', 'qr_wifi_home.png', 'image/png', 'wifi_qr', const Duration(days: 1, hours: 5), 14800),
        rec('5', 'lecture_notes_compressed.pdf', 'application/pdf', 'compress_pdf', const Duration(days: 2, hours: 1), 2405100),
        rec('6', 'invoice_october.pdf', 'application/pdf', 'image_to_pdf', const Duration(days: 3, hours: 7), 642900),
        rec('7', 'profile_photo_small.jpg', 'image/jpeg', 'image_compressor', const Duration(days: 4, hours: 2), 152700),
        rec('8', 'id_card_front.pdf', 'application/pdf', 'doc_scanner', const Duration(days: 6), 318400),
        rec('9', 'thesis_pages_1-12.pdf', 'application/pdf', 'split_pdf', const Duration(days: 8, hours: 3), 3120500),
      ]),
  };
}

// ── Frame widgets ────────────────────────────────────────────────────────────

class _StatusBar extends StatelessWidget {
  const _StatusBar();

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF1B1B2F);
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        children: [
          Text(
            '9:41',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          Spacer(),
          Icon(Icons.signal_cellular_alt_rounded, size: 16, color: color),
          SizedBox(width: 4),
          Icon(Icons.wifi_rounded, size: 16, color: color),
          SizedBox(width: 4),
          Icon(Icons.battery_full_rounded, size: 16, color: color),
        ],
      ),
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone({required this.child});

  final Widget child;

  static const bezel = 14.0;
  static const radius = 76.0;

  @override
  Widget build(BuildContext context) {
    final w = _screen.width * _scale;
    final h = _screen.height * _scale;
    return Container(
      width: w + bezel * 2,
      height: h + bezel * 2,
      padding: const EdgeInsets.all(bezel),
      decoration: BoxDecoration(
        color: const Color(0xFF12122A),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: const Color(0xFF3A3A5C), width: 3),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius - bezel),
        child: SizedBox(
          width: w,
          height: h,
          child: FittedBox(
            child: SizedBox.fromSize(
              size: _screen,
              child: MediaQuery(
                data: const MediaQueryData(
                  size: _screen,
                  devicePixelRatio: 2.0,
                  padding: EdgeInsets.only(top: _statusBar),
                  viewPadding: EdgeInsets.only(top: _statusBar),
                  textScaler: TextScaler.noScaling,
                ),
                child: Stack(
                  children: [
                    Positioned.fill(child: child),
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: _statusBar,
                      child: _StatusBar(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Backdrop extends StatelessWidget {
  const _Backdrop({required this.colors, required this.child});

  final List<Color> colors;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget orb(double size, double alpha) => Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: alpha),
      ),
    );
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(top: -220, right: -180, child: orb(620, 0.08)),
          Positioned(bottom: -260, left: -220, child: orb(700, 0.07)),
          Positioned(top: 300, left: -90, child: orb(220, 0.06)),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}

class _MarketingFrame extends StatelessWidget {
  const _MarketingFrame({required this.caption, required this.app});

  final String caption;
  final Widget app;

  static const captionHeight = 408.0;

  @override
  Widget build(BuildContext context) {
    final phoneWidth = _screen.width * _scale + _Phone.bezel * 2;
    return RepaintBoundary(
      key: _frameKey,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: SizedBox.fromSize(
          size: _canvas,
          child: _Backdrop(
            colors: _brand,
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  height: captionHeight - 40,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Text(
                        caption,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 86,
                          fontWeight: FontWeight.w800,
                          height: 1.12,
                          letterSpacing: -1.6,
                          color: Colors.white,
                          shadows: [
                            Shadow(color: Color(0x40140A50), blurRadius: 24, offset: Offset(0, 6)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: captionHeight,
                  left: (_canvas.width - phoneWidth) / 2,
                  child: _Phone(child: app),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureGraphic extends StatelessWidget {
  const _FeatureGraphic();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _frameKey,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: SizedBox(
          width: 1024,
          height: 500,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: _brand,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -160,
                  right: -120,
                  child: Container(
                    width: 460,
                    height: 460,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -200,
                  left: 180,
                  child: Container(
                    width: 380,
                    height: 380,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.06),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 72),
                  child: Row(
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(58),
                          boxShadow: const [
                            BoxShadow(color: Color(0x55100840), blurRadius: 40, offset: Offset(0, 18)),
                          ],
                        ),
                        child: const AppLogo(size: 250, radius: 58 / 250),
                      ),
                      const SizedBox(width: 60),
                      const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Scan. Convert.\nTranslate.',
                              style: TextStyle(
                                fontFamily: 'PlusJakartaSans',
                                fontSize: 66,
                                fontWeight: FontWeight.w800,
                                height: 1.08,
                                letterSpacing: -0.6,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 22),
                            Text(
                              'Offline · Private · 45 tools',
                              style: TextStyle(
                                fontFamily: 'PlusJakartaSans',
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Color(0xE6FFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Helpers ──────────────────────────────────────────────────────────────────

void _setView(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);
}

/// Decodes every on-screen image for real (fake async never finishes it).
Future<void> _precacheImages(WidgetTester tester) async {
  final elements = find.byType(Image).evaluate().toList();
  await tester.runAsync(() async {
    for (final e in elements) {
      await precacheImage((e.widget as Image).image, e);
    }
  });
  await tester.pumpAndSettle();
}

Future<void> _capture(WidgetTester tester, String name) async {
  await _precacheImages(tester);
  final boundary = tester.renderObject<RenderRepaintBoundary>(find.byKey(_frameKey));
  await tester.runAsync(() async {
    final image = await boundary.toImage();
    final data = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
    final rgba = img.Image.fromBytes(
      width: image.width,
      height: image.height,
      bytes: data!.buffer,
      numChannels: 4,
      order: img.ChannelOrder.rgba,
    );
    // Play rejects alpha channels: flatten to 24-bit RGB.
    final rgb = rgba.convert(numChannels: 3);
    Directory(_outDir).createSync(recursive: true);
    File('$_outDir/$name').writeAsBytesSync(img.encodePng(rgb));
    image.dispose();
  });
}

Future<ProviderContainer> _pumpApp(
  WidgetTester tester,
  String caption, {
  bool files = false,
}) async {
  _setView(tester, _canvas);
  SharedPreferences.setMockInitialValues(_prefs(files: files));
  final storage = StorageService(await SharedPreferences.getInstance());
  final container = ProviderContainer(
    overrides: [storageServiceProvider.overrideWithValue(storage)],
  );
  addTearDown(container.dispose);
  await tester.pumpWidget(
    _MarketingFrame(
      caption: caption,
      app: UncontrolledProviderScope(
        container: container,
        child: const UtilityToolboxApp(),
      ),
    ),
  );
  await tester.pumpAndSettle(const Duration(seconds: 1));
  return container;
}

Finder get _toolsScroll => find
    .descendant(of: find.byType(ToolsTab), matching: find.byType(Scrollable))
    .first;

/// Scrolls the Tools tab so the section titled [title] sits near the top.
Future<void> _scrollToSection(WidgetTester tester, String title, {double nudge = 0}) async {
  final target = find.text(title);
  await tester.scrollUntilVisible(target, 200, scrollable: _toolsScroll);
  await tester.pumpAndSettle();
  final position = tester.state<ScrollableState>(_toolsScroll).position;
  final y = tester.getTopLeft(target).dy;
  final top = tester.getTopLeft(_toolsScroll).dy;
  // Screen coords are scaled by the frame; convert back to logical.
  final delta = (y - top) / _scale - 18 + nudge;
  position.jumpTo((position.pixels + delta).clamp(0, position.maxScrollExtent));
  await tester.pumpAndSettle();
}

// ── Shots ────────────────────────────────────────────────────────────────────

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    GoogleFonts.config.allowRuntimeFetching = false;
    _mockGoogleFontsAssets();
    await _loadFonts();
  });

  testWidgets('phone_1 – Tools tab', (tester) async {
    await _pumpApp(tester, '45 tools in one\nsmall app');
    await _capture(tester, 'phone_1.png');
  });

  testWidgets('phone_2 – PDF tools', (tester) async {
    await _pumpApp(tester, 'Sign, edit &\nconvert PDFs');
    await _scrollToSection(tester, 'PDF');
    await _capture(tester, 'phone_2.png');
  });

  testWidgets('phone_3 – photo tools', (tester) async {
    await _pumpApp(tester, 'Remove backgrounds,\nresize & compress');
    await _scrollToSection(tester, 'Photo & image');
    await _capture(tester, 'phone_3.png');
  });

  testWidgets('phone_4 – percentage', (tester) async {
    final container = await _pumpApp(tester, 'Discounts, tips\n& tax in a tap');
    container.read(appRouterProvider).push(AppRoutes.percentageCalculator);
    await tester.pumpAndSettle();
    final fields = find.byType(TextField);
    if (fields.evaluate().length >= 2) {
      await tester.enterText(fields.at(0), '15');
      await tester.enterText(fields.at(1), '2499');
    }
    await tester.pumpAndSettle();
    await _capture(tester, 'phone_4.png');
  });

  testWidgets('phone_5 – everyday tools', (tester) async {
    await _pumpApp(tester, 'Torch, level,\ntimer & more');
    await _scrollToSection(tester, 'Device & location');
    await _capture(tester, 'phone_5.png');
  });

  testWidgets('phone_6 – search', (tester) async {
    await _pumpApp(tester, 'Find any tool\nin seconds');
    await tester.enterText(find.byType(TextField), 'pdf');
    await tester.pumpAndSettle();
    await _capture(tester, 'phone_6.png');
  });

  testWidgets('phone_7 – My Files', (tester) async {
    await _pumpApp(tester, 'Open & share\nall your files', files: true);
    await tester.tap(find.text('My Files'));
    await tester.pumpAndSettle();
    await _capture(tester, 'phone_7.png');
  });

  testWidgets('phone_8 – calculate & convert', (tester) async {
    await _pumpApp(tester, 'Currency, BMI,\nunits & more');
    await _scrollToSection(tester, 'Calculate & convert');
    await _capture(tester, 'phone_8.png');
  });

  testWidgets('feature_graphic', (tester) async {
    _setView(tester, const Size(1024, 500));
    await tester.pumpWidget(const _FeatureGraphic());
    await tester.pumpAndSettle();
    await _capture(tester, 'feature_graphic.png');
  });
}
