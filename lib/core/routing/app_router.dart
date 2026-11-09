import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/features/home/home_screen.dart';
import 'package:utility_toolbox/features/onboarding/onboarding_screen.dart';
import 'package:utility_toolbox/features/ocr/screens/ocr_screen.dart';
import 'package:utility_toolbox/features/pdf_toolkit/screens/compress_pdf_screen.dart';
import 'package:utility_toolbox/features/pdf_toolkit/screens/image_to_pdf_screen.dart';
import 'package:utility_toolbox/features/pdf_toolkit/screens/merge_pdf_screen.dart';
import 'package:utility_toolbox/features/pdf_toolkit/screens/pdf_home_screen.dart';
import 'package:utility_toolbox/features/qr_barcode/screens/qr_generator_screen.dart';
import 'package:utility_toolbox/features/qr_barcode/screens/qr_home_screen.dart';
import 'package:utility_toolbox/features/qr_barcode/screens/qr_scanner_screen.dart';
import 'package:utility_toolbox/features/qr_barcode/screens/scan_history_screen.dart';
import 'package:utility_toolbox/features/settings/screens/settings_screen.dart';
import 'package:utility_toolbox/features/splash/splash_screen.dart';
import 'package:utility_toolbox/features/text_utilities/screens/text_utilities_screen.dart';
import 'package:utility_toolbox/features/translation/screens/translation_screen.dart';
import 'package:utility_toolbox/features/unit_converter/screens/unit_converter_screen.dart';
import 'package:utility_toolbox/features/password_generator/screens/password_generator_screen.dart';
import 'package:utility_toolbox/features/image_compressor/screens/image_compressor_screen.dart';
import 'package:utility_toolbox/features/hash_generator/screens/hash_generator_screen.dart';
import 'package:utility_toolbox/features/color_picker/screens/color_picker_screen.dart';
import 'package:utility_toolbox/features/loan_calculator/screens/loan_calculator_screen.dart';
import 'package:utility_toolbox/features/wifi_qr/screens/wifi_qr_screen.dart';
import 'package:utility_toolbox/features/wifi_speed_test/screens/wifi_speed_test_screen.dart';
import 'package:utility_toolbox/features/ip_ping/screens/ip_ping_screen.dart';
import 'package:utility_toolbox/features/timezone/screens/timezone_screen.dart';
import 'package:utility_toolbox/features/compass/screens/compass_screen.dart';
import 'package:utility_toolbox/features/location_saver/screens/location_saver_screen.dart';
import 'package:utility_toolbox/features/word_to_pdf/screens/word_to_pdf_screen.dart';
import 'package:utility_toolbox/features/video_converter/screens/video_converter_screen.dart';
import 'package:utility_toolbox/features/image_enhancer/screens/image_enhancer_screen.dart';
import 'package:utility_toolbox/features/smart_clipboard/screens/smart_clipboard_screen.dart';
import 'package:utility_toolbox/features/ai_upscaler/screens/ai_upscaler_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    // Every cold start now boots into the splash screen first. SplashScreen
    // itself decides — once its animation finishes — whether to route on to
    // Onboarding (first-ever launch) or Home (returning user), based on
    // StorageService.getHasSeenOnboarding().
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(path: AppRoutes.home, builder: (_, __) => const HomeScreen()),
      GoRoute(
        path: AppRoutes.settings,
        builder: (_, __) => const SettingsScreen(),
      ),
      GoRoute(path: AppRoutes.splash, builder: (_, __) => const SplashScreen()),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (_, __) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.qrBarcode,
        builder: (_, __) => const QrHomeScreen(),
        routes: [
          GoRoute(path: 'scanner', builder: (_, __) => const QrScannerScreen()),
          GoRoute(
            path: 'generator',
            builder: (_, __) => const QrGeneratorScreen(),
          ),
          GoRoute(
            path: 'history',
            builder: (_, __) => const ScanHistoryScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.unitConverter,
        builder: (_, __) => const UnitConverterScreen(),
      ),
      GoRoute(
        path: AppRoutes.pdfToolkit,
        builder: (_, __) => const PdfHomeScreen(),
        routes: [
          GoRoute(
            path: 'image-to-pdf',
            builder: (_, __) => const ImageToPdfScreen(),
          ),
          GoRoute(path: 'merge', builder: (_, __) => const MergePdfScreen()),
          GoRoute(
            path: 'compress',
            builder: (_, __) => const CompressPdfScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.textUtilities,
        builder: (_, __) => const TextUtilitiesScreen(),
      ),
      GoRoute(path: AppRoutes.ocr, builder: (_, __) => const OcrScreen()),
      GoRoute(
        path: AppRoutes.translation,
        builder: (_, __) => const TranslationScreen(),
      ),
      GoRoute(
        path: AppRoutes.passwordGenerator,
        builder: (_, __) => const PasswordGeneratorScreen(),
      ),
      GoRoute(
        path: AppRoutes.imageCompressor,
        builder: (_, __) => const ImageCompressorScreen(),
      ),
      GoRoute(
        path: AppRoutes.hashGenerator,
        builder: (_, __) => const HashGeneratorScreen(),
      ),
      GoRoute(
        path: AppRoutes.colorPicker,
        builder: (_, __) => const ColorPickerScreen(),
      ),
      GoRoute(
        path: AppRoutes.loanCalculator,
        builder: (_, __) => const LoanCalculatorScreen(),
      ),
      GoRoute(path: AppRoutes.wifiQr, builder: (_, __) => const WifiQrScreen()),
      GoRoute(
        path: AppRoutes.wifiSpeedTest,
        builder: (_, __) => const WifiSpeedTestScreen(),
      ),
      GoRoute(path: AppRoutes.ipPing, builder: (_, __) => const IpPingScreen()),
      GoRoute(
        path: AppRoutes.timezone,
        builder: (_, __) => const TimezoneScreen(),
      ),
      GoRoute(
        path: AppRoutes.compass,
        builder: (_, __) => const CompassScreen(),
      ),
      GoRoute(
        path: AppRoutes.locationSaver,
        builder: (_, __) => const LocationSaverScreen(),
      ),
      GoRoute(
        path: AppRoutes.wordToPdf,
        builder: (_, __) => const WordToPdfScreen(),
      ),
      GoRoute(
        path: AppRoutes.videoConverter,
        builder: (_, __) => const VideoConverterScreen(),
      ),
      GoRoute(
        path: AppRoutes.imageEnhancer,
        builder: (_, __) => const ImageEnhancerScreen(),
      ),
      GoRoute(
        path: AppRoutes.smartClipboard,
        builder: (_, __) => const SmartClipboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.aiUpscaler,
        builder: (_, __) => const AiUpscalerScreen(),
      ),
    ],
  );
});
