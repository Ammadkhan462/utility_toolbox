import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('ur'),
  ];

  /// App name shown in headers. Keep the brand name untranslated.
  ///
  /// In en, this message translates to:
  /// **'Utility Toolbox'**
  String get appName;

  /// Bottom navigation tab: list of tools
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get navTools;

  /// Bottom navigation tab: files the app created
  ///
  /// In en, this message translates to:
  /// **'My Files'**
  String get navFiles;

  /// Tooltip for the settings button
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTooltip;

  /// Hint in the tool search field. Use common search words in your language.
  ///
  /// In en, this message translates to:
  /// **'Search: compress pdf, scan, jpg…'**
  String get searchHint;

  /// Section header for the 4 most-used tools
  ///
  /// In en, this message translates to:
  /// **'Quick actions'**
  String get quickActions;

  /// Section header for tools the user starred
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// Section header for recently used tools
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// Shown when search finds nothing
  ///
  /// In en, this message translates to:
  /// **'No tools match “{query}”'**
  String searchNoResults(String query);

  /// Long-press menu action
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get toolMenuAddFavorite;

  /// Long-press menu action
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get toolMenuRemoveFavorite;

  /// Long-press menu action: pin a shortcut to this tool on the launcher
  ///
  /// In en, this message translates to:
  /// **'Add to home screen'**
  String get toolMenuPinShortcut;

  /// Snackbar after requesting a pinned shortcut
  ///
  /// In en, this message translates to:
  /// **'Confirm to add the shortcut to your home screen'**
  String get pinShortcutRequested;

  /// Snackbar when the launcher can't pin shortcuts
  ///
  /// In en, this message translates to:
  /// **'Your home screen app doesn’t support shortcuts'**
  String get pinShortcutUnsupported;

  /// Small badge on newly added tools. Keep very short.
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get newBadge;

  /// Tool category header
  ///
  /// In en, this message translates to:
  /// **'Scan & QR'**
  String get catScan;

  /// Tool category header
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get catPdf;

  /// Tool category header
  ///
  /// In en, this message translates to:
  /// **'Photo & image'**
  String get catImage;

  /// Tool category header
  ///
  /// In en, this message translates to:
  /// **'Text & translate'**
  String get catText;

  /// Tool category header
  ///
  /// In en, this message translates to:
  /// **'Calculate & convert'**
  String get catCalc;

  /// Tool category header
  ///
  /// In en, this message translates to:
  /// **'Internet'**
  String get catNetwork;

  /// Tool category header
  ///
  /// In en, this message translates to:
  /// **'Device & location'**
  String get catDevice;

  /// Tool category header
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get catSecurity;

  /// Tool category header
  ///
  /// In en, this message translates to:
  /// **'Video & audio'**
  String get catMedia;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Document Scanner'**
  String get toolDocScannerTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Scan paper to PDF with auto edges'**
  String get toolDocScannerDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'scan paper, camscanner, document, pdf scanner, receipt'**
  String get toolDocScannerKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Scan QR & Barcode'**
  String get toolQrScannerTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'From camera or a photo'**
  String get toolQrScannerDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'qr reader, barcode, scan code'**
  String get toolQrScannerKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Create QR Code'**
  String get toolQrGeneratorTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Links, text, contacts and more'**
  String get toolQrGeneratorDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'qr maker, generate qr, barcode generator'**
  String get toolQrGeneratorKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Image to Text'**
  String get toolOcrTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Copy text from any photo (OCR)'**
  String get toolOcrDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'ocr, text scanner, extract text, copy text from image'**
  String get toolOcrKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'WiFi QR Code'**
  String get toolWifiQrTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Share WiFi without typing the password'**
  String get toolWifiQrDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'wifi password, share wifi'**
  String get toolWifiQrKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Image to PDF'**
  String get toolImageToPdfTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Turn photos into one PDF'**
  String get toolImageToPdfDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'jpg to pdf, photo to pdf, picture to pdf'**
  String get toolImageToPdfKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Merge PDF'**
  String get toolMergePdfTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Combine several PDFs into one'**
  String get toolMergePdfDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'join pdf, combine pdf'**
  String get toolMergePdfKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Compress PDF'**
  String get toolCompressPdfTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Make a PDF smaller to send'**
  String get toolCompressPdfDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'reduce pdf size, shrink pdf'**
  String get toolCompressPdfKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Split PDF'**
  String get toolSplitPdfTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Extract or remove pages'**
  String get toolSplitPdfDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'extract pages, delete pages, cut pdf'**
  String get toolSplitPdfKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'PDF to JPG'**
  String get toolPdfToImagesTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Save every page as an image'**
  String get toolPdfToImagesDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'pdf to image, pdf to png, pdf pages'**
  String get toolPdfToImagesKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Lock PDF'**
  String get toolProtectPdfTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Add a password to a PDF'**
  String get toolProtectPdfDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'password pdf, encrypt pdf, secure pdf'**
  String get toolProtectPdfKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Unlock PDF'**
  String get toolUnlockPdfTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Remove a password you know'**
  String get toolUnlockPdfDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'remove pdf password, decrypt pdf'**
  String get toolUnlockPdfKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Word to PDF'**
  String get toolWordToPdfTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Convert .docx documents'**
  String get toolWordToPdfDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'doc to pdf, docx, word'**
  String get toolWordToPdfKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Compress Photo'**
  String get toolImageCompressorTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Smaller file, same look'**
  String get toolImageCompressorDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'reduce image size, compress jpg, kb'**
  String get toolImageCompressorKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Resize & Convert'**
  String get toolImageResizerTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Exact size, JPG, PNG or WEBP'**
  String get toolImageResizerDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'resize image, jpg to png, png to jpg, webp, passport size'**
  String get toolImageResizerKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Photo Editor'**
  String get toolImageEnhancerTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Filters, crop, brightness and more'**
  String get toolImageEnhancerDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'edit photo, filter, crop, rotate'**
  String get toolImageEnhancerKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'AI Upscaler'**
  String get toolAiUpscalerTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Enlarge photos up to 4× sharper'**
  String get toolAiUpscalerDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'enhance, hd, increase resolution, blurry'**
  String get toolAiUpscalerKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Translate'**
  String get toolTranslationTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Offline, with voice and speech'**
  String get toolTranslationDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'translator, language, dictionary'**
  String get toolTranslationKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Text Tools'**
  String get toolTextUtilitiesTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Count words, change case, Base64'**
  String get toolTextUtilitiesDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'word counter, uppercase, lowercase, base64'**
  String get toolTextUtilitiesKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Clipboard Manager'**
  String get toolSmartClipboardTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Save, pin and search copied text'**
  String get toolSmartClipboardDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'copy paste, notes, clipboard history'**
  String get toolSmartClipboardKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Calculator'**
  String get toolCalculatorTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Everyday calculator with history'**
  String get toolCalculatorDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'calc, math, percent'**
  String get toolCalculatorKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Age & Date'**
  String get toolAgeCalculatorTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Exact age and days between dates'**
  String get toolAgeCalculatorDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'birthday, date difference, days counter'**
  String get toolAgeCalculatorKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Unit Converter'**
  String get toolUnitConverterTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Length, weight, temperature and more'**
  String get toolUnitConverterDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'convert units, cm to inch, kg to lb, celsius'**
  String get toolUnitConverterKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Loan & EMI'**
  String get toolLoanCalculatorTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Monthly payment and total interest'**
  String get toolLoanCalculatorDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'emi, mortgage, interest, installment'**
  String get toolLoanCalculatorKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'World Clock'**
  String get toolTimezoneTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Time in any city, with a widget'**
  String get toolTimezoneDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'time zone, clock, city time'**
  String get toolTimezoneKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Color Picker'**
  String get toolColorPickerTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'HEX, RGB, HSL and CMYK'**
  String get toolColorPickerDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'color code, hex, palette'**
  String get toolColorPickerKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Internet Speed Test'**
  String get toolSpeedTestTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Download, upload and ping'**
  String get toolSpeedTestDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'wifi speed, internet speed, mbps'**
  String get toolSpeedTestKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'IP & Ping'**
  String get toolIpPingTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Your IP address and host reachability'**
  String get toolIpPingDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'my ip, ping, network'**
  String get toolIpPingKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Compass'**
  String get toolCompassTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Heading and bearing'**
  String get toolCompassDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'direction, north, qibla'**
  String get toolCompassKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Save Location'**
  String get toolLocationSaverTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Remember and share GPS spots'**
  String get toolLocationSaverDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'parking, gps, map, coordinates'**
  String get toolLocationSaverKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Password Generator'**
  String get toolPasswordGeneratorTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Strong random passwords'**
  String get toolPasswordGeneratorDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'secure password, random'**
  String get toolPasswordGeneratorKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Hash Generator'**
  String get toolHashGeneratorTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'MD5, SHA-1, SHA-256 of text or files'**
  String get toolHashGeneratorDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'checksum, md5, sha256'**
  String get toolHashGeneratorKeywords;

  /// Tool name (short, about 20 characters max)
  ///
  /// In en, this message translates to:
  /// **'Video Converter'**
  String get toolVideoConverterTitle;

  /// One-line tool description (about 40 characters max)
  ///
  /// In en, this message translates to:
  /// **'Video to MP3, GIF, MP4 and more'**
  String get toolVideoConverterDesc;

  /// Comma-separated search words people in your language would type to find this tool. Not shown in the UI. Add local synonyms freely; keep the English words too.
  ///
  /// In en, this message translates to:
  /// **'video to mp3, gif maker, audio extract'**
  String get toolVideoConverterKeywords;

  /// My Files empty state title
  ///
  /// In en, this message translates to:
  /// **'No files yet'**
  String get filesEmptyTitle;

  /// My Files empty state body
  ///
  /// In en, this message translates to:
  /// **'PDFs, images and other files you create will appear here so you can open or share them again.'**
  String get filesEmptyBody;

  /// Action
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get fileOpen;

  /// Action
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get fileShare;

  /// Action: removes the entry, not the file
  ///
  /// In en, this message translates to:
  /// **'Remove from list'**
  String get fileRemoveFromList;

  /// Error snackbar
  ///
  /// In en, this message translates to:
  /// **'Couldn’t open this file. It may have been moved or deleted.'**
  String get fileOpenFailed;

  /// Action to clear the My Files list
  ///
  /// In en, this message translates to:
  /// **'Clear list'**
  String get filesClearList;

  /// Confirmation dialog body
  ///
  /// In en, this message translates to:
  /// **'Clear the list? Your files stay on the device.'**
  String get filesClearConfirm;

  /// Title of the sheet shown when a file or text is shared into the app
  ///
  /// In en, this message translates to:
  /// **'What do you want to do?'**
  String get incomingSheetTitle;

  /// Subtitle of the share sheet
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 image} other{{count} images}}'**
  String incomingImages(int count);

  /// Subtitle of the share sheet
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 PDF} other{{count} PDFs}}'**
  String incomingPdfs(int count);

  /// Subtitle of the share sheet
  ///
  /// In en, this message translates to:
  /// **'Shared text'**
  String get incomingText;

  /// Subtitle of the share sheet
  ///
  /// In en, this message translates to:
  /// **'Word document'**
  String get incomingDocument;

  /// Subtitle of the share sheet
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get incomingVideo;

  /// Snackbar for unsupported shares
  ///
  /// In en, this message translates to:
  /// **'This file type isn’t supported yet'**
  String get incomingUnsupported;

  /// Snackbar when copying a shared file fails
  ///
  /// In en, this message translates to:
  /// **'Couldn’t read the shared file'**
  String get incomingFailed;

  /// Screen title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Section header
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// Label
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// Theme option following the system
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get themeSystem;

  /// Theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// Theme option
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// Label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// Language option following the device language
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get languageSystem;

  /// Section header
  ///
  /// In en, this message translates to:
  /// **'Purchases'**
  String get settingsPurchases;

  /// Purchase tile title
  ///
  /// In en, this message translates to:
  /// **'Remove ads'**
  String get removeAdsTitle;

  /// Purchase tile subtitle
  ///
  /// In en, this message translates to:
  /// **'One-time purchase, no subscription'**
  String get removeAdsSubtitle;

  /// Tile title
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get restorePurchasesTitle;

  /// Tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Recover a purchase on this device'**
  String get restorePurchasesSubtitle;

  /// Section header
  ///
  /// In en, this message translates to:
  /// **'Support & privacy'**
  String get settingsSupport;

  /// Tile title
  ///
  /// In en, this message translates to:
  /// **'Share app'**
  String get shareAppTitle;

  /// Tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Tell a friend about Utility Toolbox'**
  String get shareAppSubtitle;

  /// Text shared when the user taps Share app
  ///
  /// In en, this message translates to:
  /// **'I use Utility Toolbox to scan documents, edit PDFs, read QR codes and translate offline. Free: {url}'**
  String shareAppMessage(String url);

  /// Tile title
  ///
  /// In en, this message translates to:
  /// **'Rate the app'**
  String get rateAppTitle;

  /// Tile subtitle
  ///
  /// In en, this message translates to:
  /// **'A quick review helps a lot'**
  String get rateAppSubtitle;

  /// Tile title
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicyTitle;

  /// Tile subtitle
  ///
  /// In en, this message translates to:
  /// **'What the app accesses and why'**
  String get privacyPolicySubtitle;

  /// Tile title opening the consent form
  ///
  /// In en, this message translates to:
  /// **'Ad privacy choices'**
  String get privacyChoicesTitle;

  /// Tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Change your consent for personalised ads'**
  String get privacyChoicesSubtitle;

  /// Footer
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String versionLabel(String version);

  /// Button
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// Button
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// Button on last page
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingStart;

  /// Onboarding page 1 title (two short lines)
  ///
  /// In en, this message translates to:
  /// **'Every tool,\none app'**
  String get onboarding1Title;

  /// Onboarding page 1 body
  ///
  /// In en, this message translates to:
  /// **'Scan documents, edit PDFs, read QR codes, translate and resize photos — without installing ten apps.'**
  String get onboarding1Body;

  /// Onboarding page 2 title (two short lines)
  ///
  /// In en, this message translates to:
  /// **'Works from\nany app'**
  String get onboarding2Title;

  /// Onboarding page 2 body
  ///
  /// In en, this message translates to:
  /// **'Share a photo or PDF to Utility Toolbox, select text to translate it, or long-press the app icon for shortcuts.'**
  String get onboarding2Body;

  /// Onboarding page 3 title (two short lines)
  ///
  /// In en, this message translates to:
  /// **'Fast, offline\nand private'**
  String get onboarding3Title;

  /// Onboarding page 3 body
  ///
  /// In en, this message translates to:
  /// **'Almost everything runs on your phone. Your files are never uploaded unless you turn on a cloud option yourself.'**
  String get onboarding3Body;

  /// Button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// Button
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get commonClear;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'id',
    'pt',
    'ru',
    'tr',
    'ur',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
