import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/features/home/home_screen.dart';
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
import 'package:utility_toolbox/features/text_utilities/screens/text_utilities_screen.dart';
import 'package:utility_toolbox/features/translation/screens/translation_screen.dart';
import 'package:utility_toolbox/features/unit_converter/screens/unit_converter_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.qrBarcode,
        builder: (context, state) => const QrHomeScreen(),
        routes: [
          GoRoute(
            path: 'scanner',
            builder: (context, state) => const QrScannerScreen(),
          ),
          GoRoute(
            path: 'generator',
            builder: (context, state) => const QrGeneratorScreen(),
          ),
          GoRoute(
            path: 'history',
            builder: (context, state) => const ScanHistoryScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.unitConverter,
        builder: (context, state) => const UnitConverterScreen(),
      ),
      GoRoute(
        path: AppRoutes.pdfToolkit,
        builder: (context, state) => const PdfHomeScreen(),
        routes: [
          GoRoute(
            path: 'image-to-pdf',
            builder: (context, state) => const ImageToPdfScreen(),
          ),
          GoRoute(
            path: 'merge',
            builder: (context, state) => const MergePdfScreen(),
          ),
          GoRoute(
            path: 'compress',
            builder: (context, state) => const CompressPdfScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.textUtilities,
        builder: (context, state) => const TextUtilitiesScreen(),
      ),
      GoRoute(
        path: AppRoutes.ocr,
        builder: (context, state) => const OcrScreen(),
      ),
      GoRoute(
        path: AppRoutes.translation,
        builder: (context, state) => const TranslationScreen(),
      ),
    ],
  );
});
