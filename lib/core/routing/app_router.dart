import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/routing/seed_input.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/core/tools/tool_input.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/features/pdf_edit/sign_pdf_screen.dart';
import 'package:utility_toolbox/features/pdf_edit/organize_pdf_screen.dart';
import 'package:utility_toolbox/features/pdf_edit/watermark_pdf_screen.dart';
import 'package:utility_toolbox/features/pdf_edit/pdf_to_text_screen.dart';
import 'package:utility_toolbox/features/bg_remover/bg_remover_screen.dart';
import 'package:utility_toolbox/features/currency_converter/currency_converter_screen.dart';
import 'package:utility_toolbox/features/percentage_calculator/percentage_calculator_screen.dart';
import 'package:utility_toolbox/features/bmi_calculator/bmi_calculator_screen.dart';
import 'package:utility_toolbox/features/direct_chat/direct_chat_screen.dart';
import 'package:utility_toolbox/features/flashlight/flashlight_screen.dart';
import 'package:utility_toolbox/features/bubble_level/bubble_level_screen.dart';
import 'package:utility_toolbox/features/stopwatch/stopwatch_screen.dart';
import 'package:utility_toolbox/features/age_calculator/age_calculator_screen.dart';
import 'package:utility_toolbox/features/ai_upscaler/providers/ai_upscaler_notifier.dart';
import 'package:utility_toolbox/features/ai_upscaler/screens/ai_upscaler_screen.dart';
import 'package:utility_toolbox/features/calculator/calculator_screen.dart';
import 'package:utility_toolbox/features/color_picker/screens/color_picker_screen.dart';
import 'package:utility_toolbox/features/compass/screens/compass_screen.dart';
import 'package:utility_toolbox/features/doc_scanner/doc_scanner_screen.dart';
import 'package:utility_toolbox/features/hash_generator/screens/hash_generator_screen.dart';
import 'package:utility_toolbox/features/home/home_shell.dart';
import 'package:utility_toolbox/features/image_compressor/providers/image_compressor_providers.dart';
import 'package:utility_toolbox/features/image_compressor/screens/image_compressor_screen.dart';
import 'package:utility_toolbox/features/image_enhancer/providers/image_enhancer_providers.dart';
import 'package:utility_toolbox/features/image_enhancer/screens/image_enhancer_screen.dart';
import 'package:utility_toolbox/features/image_resizer/image_resizer_screen.dart';
import 'package:utility_toolbox/features/ip_ping/screens/ip_ping_screen.dart';
import 'package:utility_toolbox/features/loan_calculator/screens/loan_calculator_screen.dart';
import 'package:utility_toolbox/features/location_saver/screens/location_saver_screen.dart';
import 'package:utility_toolbox/features/ocr/screens/ocr_screen.dart';
import 'package:utility_toolbox/features/onboarding/onboarding_screen.dart';
import 'package:utility_toolbox/features/password_generator/screens/password_generator_screen.dart';
import 'package:utility_toolbox/features/pdf_toolkit/providers/pdf_providers.dart';
import 'package:utility_toolbox/features/pdf_toolkit/screens/compress_pdf_screen.dart';
import 'package:utility_toolbox/features/pdf_toolkit/screens/image_to_pdf_screen.dart';
import 'package:utility_toolbox/features/pdf_toolkit/screens/merge_pdf_screen.dart';
import 'package:utility_toolbox/features/pdf_toolkit/screens/pdf_home_screen.dart';
import 'package:utility_toolbox/features/pdf_toolkit/screens/pdf_password_screen.dart';
import 'package:utility_toolbox/features/pdf_toolkit/screens/pdf_to_images_screen.dart';
import 'package:utility_toolbox/features/pdf_toolkit/screens/split_pdf_screen.dart';
import 'package:utility_toolbox/features/qr_barcode/screens/qr_generator_screen.dart';
import 'package:utility_toolbox/features/qr_barcode/screens/qr_home_screen.dart';
import 'package:utility_toolbox/features/qr_barcode/screens/qr_scanner_screen.dart';
import 'package:utility_toolbox/features/qr_barcode/screens/scan_history_screen.dart';
import 'package:utility_toolbox/features/settings/screens/settings_screen.dart';
import 'package:utility_toolbox/features/smart_clipboard/screens/smart_clipboard_screen.dart';
import 'package:utility_toolbox/features/text_utilities/screens/text_utilities_screen.dart';
import 'package:utility_toolbox/features/timezone/screens/timezone_screen.dart';
import 'package:utility_toolbox/features/translation/screens/translation_screen.dart';
import 'package:utility_toolbox/features/unit_converter/screens/unit_converter_screen.dart';
import 'package:utility_toolbox/features/video_converter/providers/video_converter_providers.dart';
import 'package:utility_toolbox/features/video_converter/screens/video_converter_screen.dart';
import 'package:utility_toolbox/features/wifi_qr/screens/wifi_qr_screen.dart';
import 'package:utility_toolbox/features/wifi_speed_test/screens/wifi_speed_test_screen.dart';
import 'package:utility_toolbox/features/word_to_pdf/screens/word_to_pdf_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRoute _route(String path, Widget Function(ToolInput? input) build) => GoRoute(
  path: path,
  builder: (_, state) => build(ToolInput.of(state.extra)),
);

final appRouterProvider = Provider<GoRouter>((ref) {
  // No Flutter splash: the native (Android 12+) splash covers engine start
  // and the app opens straight on the Tools tab. First-ever launch goes to
  // onboarding, unless main() saw a share/shortcut intent and skipped it.
  final seenOnboarding = ref.read(storageServiceProvider).getHasSeenOnboarding();

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: seenOnboarding ? AppRoutes.home : AppRoutes.onboarding,
    routes: [
      GoRoute(path: AppRoutes.home, builder: (_, __) => const HomeShell()),
      GoRoute(path: AppRoutes.settings, builder: (_, __) => const SettingsScreen()),
      GoRoute(path: AppRoutes.onboarding, builder: (_, __) => const OnboardingScreen()),

      // ── Scan & QR ──────────────────────────────────────────────────────
      _route(AppRoutes.docScanner, (_) => const DocScannerScreen()),
      GoRoute(
        path: AppRoutes.qrBarcode,
        builder: (_, __) => const QrHomeScreen(),
        routes: [
          GoRoute(
            path: 'scanner',
            builder: (_, s) =>
                QrScannerScreen(initialImagePath: ToolInput.of(s.extra)?.firstPath),
          ),
          GoRoute(
            path: 'generator',
            builder: (_, s) => QrGeneratorScreen(initialText: ToolInput.of(s.extra)?.text),
          ),
          GoRoute(path: 'history', builder: (_, __) => const ScanHistoryScreen()),
        ],
      ),
      _route(AppRoutes.ocr, (i) => OcrScreen(initialImagePath: i?.firstPath)),
      _route(AppRoutes.wifiQr, (_) => const WifiQrScreen()),

      // ── PDF ────────────────────────────────────────────────────────────
      GoRoute(
        path: AppRoutes.pdfToolkit,
        builder: (_, __) => const PdfHomeScreen(),
        routes: [
          GoRoute(
            path: 'image-to-pdf',
            builder: (_, s) => SeedInput(
              input: ToolInput.of(s.extra),
              seed: (ref, input) {
                ref.read(pdfJobStateProvider.notifier).state = const Idle();
                ref.read(selectedImagesProvider.notifier).state = input.files;
              },
              child: const ImageToPdfScreen(),
            ),
          ),
          GoRoute(
            path: 'merge',
            builder: (_, s) => SeedInput(
              input: ToolInput.of(s.extra),
              seed: (ref, input) {
                ref.read(pdfJobStateProvider.notifier).state = const Idle();
                ref.read(selectedPdfsProvider.notifier).state = input.files;
              },
              child: const MergePdfScreen(),
            ),
          ),
          GoRoute(
            path: 'compress',
            builder: (_, s) => SeedInput(
              input: ToolInput.of(s.extra),
              seed: (ref, input) {
                ref.read(pdfJobStateProvider.notifier).state = const Idle();
                ref.read(selectedSinglePdfProvider.notifier).state = input.firstFile;
              },
              child: const CompressPdfScreen(),
            ),
          ),
          GoRoute(
            path: 'split',
            builder: (_, s) => SplitPdfScreen(initialPath: ToolInput.of(s.extra)?.firstPath),
          ),
          GoRoute(
            path: 'to-images',
            builder: (_, s) => PdfToImagesScreen(initialPath: ToolInput.of(s.extra)?.firstPath),
          ),
          GoRoute(
            path: 'protect',
            builder: (_, s) =>
                PdfPasswordScreen(lock: true, initialPath: ToolInput.of(s.extra)?.firstPath),
          ),
          GoRoute(
            path: 'unlock',
            builder: (_, s) =>
                PdfPasswordScreen(lock: false, initialPath: ToolInput.of(s.extra)?.firstPath),
          ),
          GoRoute(
            path: 'sign',
            builder: (_, s) => SignPdfScreen(initialPath: ToolInput.of(s.extra)?.firstPath),
          ),
          GoRoute(
            path: 'organize',
            builder: (_, s) => OrganizePdfScreen(initialPath: ToolInput.of(s.extra)?.firstPath),
          ),
          GoRoute(
            path: 'watermark',
            builder: (_, s) => WatermarkPdfScreen(initialPath: ToolInput.of(s.extra)?.firstPath),
          ),
          GoRoute(
            path: 'to-text',
            builder: (_, s) => PdfToTextScreen(initialPath: ToolInput.of(s.extra)?.firstPath),
          ),
        ],
      ),
      _route(AppRoutes.wordToPdf, (i) => WordToPdfScreen.withInput(i?.firstPath)),

      // ── Photo & image ──────────────────────────────────────────────────
      _route(
        AppRoutes.imageCompressor,
        (i) => SeedInput(
          input: i,
          seed: (ref, input) {
            ref.read(compressionResultProvider.notifier).state = const Idle();
            ref.read(selectedImageProvider.notifier).state = input.firstFile;
          },
          child: const ImageCompressorScreen(),
        ),
      ),
      _route(AppRoutes.imageResizer, (i) => ImageResizerScreen(initialPaths: i?.paths ?? const [])),
      _route(
        AppRoutes.imageEnhancer,
        (i) => SeedInput(
          input: i,
          seed: (ref, input) {
            final file = input.firstFile;
            if (file == null) return;
            ref.read(enhancerSettingsProvider.notifier).state = const EnhancementSettings();
            ref.read(enhancerResultProvider.notifier).state = const Idle();
            ref.read(sourceImageProvider.notifier).state = file;
          },
          child: const ImageEnhancerScreen(),
        ),
      ),
      _route(
        AppRoutes.aiUpscaler,
        (i) => SeedInput(
          input: i,
          seed: (ref, input) {
            final file = input.firstFile;
            if (file != null) ref.read(aiUpscalerProvider.notifier).setSource(file);
          },
          child: const AiUpscalerScreen(),
        ),
      ),
      _route(AppRoutes.bgRemover, (i) => BgRemoverScreen(initialPath: i?.firstPath)),

      // ── Text & translate ───────────────────────────────────────────────
      _route(AppRoutes.translation, (i) => TranslationScreen(initialText: i?.text)),
      _route(AppRoutes.textUtilities, (i) => TextUtilitiesScreen(initialText: i?.text)),
      _route(AppRoutes.smartClipboard, (_) => const SmartClipboardScreen()),
      _route(AppRoutes.directChat, (i) => DirectChatScreen(initialText: i?.text)),

      // ── Calculate & convert ────────────────────────────────────────────
      _route(AppRoutes.calculator, (_) => const CalculatorScreen()),
      _route(AppRoutes.ageCalculator, (_) => const AgeCalculatorScreen()),
      _route(AppRoutes.unitConverter, (_) => const UnitConverterScreen()),
      _route(AppRoutes.loanCalculator, (_) => const LoanCalculatorScreen()),
      _route(AppRoutes.timezone, (_) => const TimezoneScreen()),
      _route(AppRoutes.colorPicker, (_) => const ColorPickerScreen()),
      _route(AppRoutes.currencyConverter, (_) => const CurrencyConverterScreen()),
      _route(AppRoutes.percentageCalculator, (_) => const PercentageCalculatorScreen()),
      _route(AppRoutes.bmiCalculator, (_) => const BmiCalculatorScreen()),

      // ── Internet ───────────────────────────────────────────────────────
      _route(AppRoutes.wifiSpeedTest, (_) => const WifiSpeedTestScreen()),
      _route(AppRoutes.ipPing, (_) => const IpPingScreen()),

      // ── Device & location ──────────────────────────────────────────────
      _route(AppRoutes.compass, (_) => const CompassScreen()),
      _route(AppRoutes.locationSaver, (_) => const LocationSaverScreen()),
      _route(AppRoutes.flashlight, (_) => const FlashlightScreen()),
      _route(AppRoutes.bubbleLevel, (_) => const BubbleLevelScreen()),
      _route(AppRoutes.stopwatchTimer, (_) => const StopwatchScreen()),

      // ── Security ───────────────────────────────────────────────────────
      _route(AppRoutes.passwordGenerator, (_) => const PasswordGeneratorScreen()),
      _route(AppRoutes.hashGenerator, (_) => const HashGeneratorScreen()),

      // ── Video & audio ──────────────────────────────────────────────────
      _route(
        AppRoutes.videoConverter,
        (i) => SeedInput(
          input: i,
          seed: (ref, input) {
            final path = input.firstPath;
            if (path != null) ref.read(videoConverterProvider.notifier).loadFile(path);
          },
          child: const VideoConverterScreen(),
        ),
      ),
    ],
  );
});
