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

  /// No description provided for @toolBgRemoverTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove Background'**
  String get toolBgRemoverTitle;

  /// No description provided for @toolBgRemoverDesc.
  ///
  /// In en, this message translates to:
  /// **'Cut out people and objects in one tap'**
  String get toolBgRemoverDesc;

  /// No description provided for @toolBgRemoverKeywords.
  ///
  /// In en, this message translates to:
  /// **'remove background, background eraser, remove bg, cutout, transparent, png, sticker, passport photo, white background'**
  String get toolBgRemoverKeywords;

  /// No description provided for @toolBmiTitle.
  ///
  /// In en, this message translates to:
  /// **'BMI Calculator'**
  String get toolBmiTitle;

  /// No description provided for @toolBmiDesc.
  ///
  /// In en, this message translates to:
  /// **'Check your body mass index and healthy weight'**
  String get toolBmiDesc;

  /// No description provided for @toolBmiKeywords.
  ///
  /// In en, this message translates to:
  /// **'bmi, body mass index, weight, height, health, fitness, ideal weight, obesity'**
  String get toolBmiKeywords;

  /// No description provided for @toolBubbleLevelTitle.
  ///
  /// In en, this message translates to:
  /// **'Bubble Level'**
  String get toolBubbleLevelTitle;

  /// No description provided for @toolBubbleLevelDesc.
  ///
  /// In en, this message translates to:
  /// **'Check that shelves and frames are straight'**
  String get toolBubbleLevelDesc;

  /// No description provided for @toolBubbleLevelKeywords.
  ///
  /// In en, this message translates to:
  /// **'level, spirit level, bubble level, straight, angle, inclinometer, tilt, ruler'**
  String get toolBubbleLevelKeywords;

  /// No description provided for @toolCurrencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Currency Converter'**
  String get toolCurrencyTitle;

  /// No description provided for @toolCurrencyDesc.
  ///
  /// In en, this message translates to:
  /// **'Live exchange rates for 150+ currencies'**
  String get toolCurrencyDesc;

  /// No description provided for @toolCurrencyKeywords.
  ///
  /// In en, this message translates to:
  /// **'currency, exchange rate, money, convert, dollar, euro, rupee, riyal, forex'**
  String get toolCurrencyKeywords;

  /// No description provided for @toolDirectChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Direct Chat'**
  String get toolDirectChatTitle;

  /// No description provided for @toolDirectChatDesc.
  ///
  /// In en, this message translates to:
  /// **'Message a number on WhatsApp without saving it'**
  String get toolDirectChatDesc;

  /// No description provided for @toolDirectChatKeywords.
  ///
  /// In en, this message translates to:
  /// **'whatsapp, direct chat, message, unsaved number, click to chat, wa.me, send message, chat'**
  String get toolDirectChatKeywords;

  /// No description provided for @toolFlashlightTitle.
  ///
  /// In en, this message translates to:
  /// **'Flashlight'**
  String get toolFlashlightTitle;

  /// No description provided for @toolFlashlightDesc.
  ///
  /// In en, this message translates to:
  /// **'Bright torch with SOS and strobe'**
  String get toolFlashlightDesc;

  /// No description provided for @toolFlashlightKeywords.
  ///
  /// In en, this message translates to:
  /// **'flashlight, torch, light, led, sos, strobe, lamp, flash'**
  String get toolFlashlightKeywords;

  /// No description provided for @toolOrganizePdfTitle.
  ///
  /// In en, this message translates to:
  /// **'Organize PDF'**
  String get toolOrganizePdfTitle;

  /// No description provided for @toolOrganizePdfDesc.
  ///
  /// In en, this message translates to:
  /// **'Reorder, rotate or delete pages'**
  String get toolOrganizePdfDesc;

  /// No description provided for @toolOrganizePdfKeywords.
  ///
  /// In en, this message translates to:
  /// **'organize, organise, reorder, rotate, delete pages, remove pages, arrange, sort, pdf'**
  String get toolOrganizePdfKeywords;

  /// No description provided for @toolPdfToTextTitle.
  ///
  /// In en, this message translates to:
  /// **'PDF to Text'**
  String get toolPdfToTextTitle;

  /// No description provided for @toolPdfToTextDesc.
  ///
  /// In en, this message translates to:
  /// **'Copy all the text out of a PDF'**
  String get toolPdfToTextDesc;

  /// No description provided for @toolPdfToTextKeywords.
  ///
  /// In en, this message translates to:
  /// **'pdf to text, extract text, copy text, txt, read pdf, convert, pdf to word'**
  String get toolPdfToTextKeywords;

  /// No description provided for @toolPercentageTitle.
  ///
  /// In en, this message translates to:
  /// **'Percentage & Discount'**
  String get toolPercentageTitle;

  /// No description provided for @toolPercentageDesc.
  ///
  /// In en, this message translates to:
  /// **'Percent, discount, tip split and tax in seconds'**
  String get toolPercentageDesc;

  /// No description provided for @toolPercentageKeywords.
  ///
  /// In en, this message translates to:
  /// **'percentage, percent, discount, sale price, tip, split bill, tax, gst, vat, margin, increase, decrease'**
  String get toolPercentageKeywords;

  /// No description provided for @toolSignPdfTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign PDF'**
  String get toolSignPdfTitle;

  /// No description provided for @toolSignPdfDesc.
  ///
  /// In en, this message translates to:
  /// **'Draw your signature and place it on any page'**
  String get toolSignPdfDesc;

  /// No description provided for @toolSignPdfKeywords.
  ///
  /// In en, this message translates to:
  /// **'sign, signature, e-sign, esign, fill and sign, autograph, pdf'**
  String get toolSignPdfKeywords;

  /// No description provided for @toolStopwatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Stopwatch & Timer'**
  String get toolStopwatchTitle;

  /// No description provided for @toolStopwatchDesc.
  ///
  /// In en, this message translates to:
  /// **'Lap stopwatch and countdown timer'**
  String get toolStopwatchDesc;

  /// No description provided for @toolStopwatchKeywords.
  ///
  /// In en, this message translates to:
  /// **'stopwatch, timer, countdown, lap, alarm, clock, kitchen timer, workout'**
  String get toolStopwatchKeywords;

  /// No description provided for @toolWatermarkPdfTitle.
  ///
  /// In en, this message translates to:
  /// **'Watermark & Page Numbers'**
  String get toolWatermarkPdfTitle;

  /// No description provided for @toolWatermarkPdfDesc.
  ///
  /// In en, this message translates to:
  /// **'Stamp text or page numbers on every page'**
  String get toolWatermarkPdfDesc;

  /// No description provided for @toolWatermarkPdfKeywords.
  ///
  /// In en, this message translates to:
  /// **'watermark, stamp, page numbers, number pages, confidential, draft, footer, header, pdf'**
  String get toolWatermarkPdfKeywords;

  /// Unit system toggle
  ///
  /// In en, this message translates to:
  /// **'Metric (cm, kg)'**
  String get bmiMetric;

  /// Unit system toggle
  ///
  /// In en, this message translates to:
  /// **'Imperial (ft, lb)'**
  String get bmiImperial;

  /// Card title and input label
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get bmiHeight;

  /// Card title and input label
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get bmiWeight;

  /// Input label: height in feet
  ///
  /// In en, this message translates to:
  /// **'Feet'**
  String get bmiFeet;

  /// Input label: extra inches of height
  ///
  /// In en, this message translates to:
  /// **'Inches'**
  String get bmiInches;

  /// Unit abbreviation: centimetres
  ///
  /// In en, this message translates to:
  /// **'cm'**
  String get bmiUnitCm;

  /// Unit abbreviation: kilograms
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get bmiUnitKg;

  /// Unit abbreviation: pounds
  ///
  /// In en, this message translates to:
  /// **'lb'**
  String get bmiUnitLb;

  /// Unit abbreviation: feet
  ///
  /// In en, this message translates to:
  /// **'ft'**
  String get bmiUnitFt;

  /// Unit abbreviation: inches
  ///
  /// In en, this message translates to:
  /// **'in'**
  String get bmiUnitIn;

  /// Input label
  ///
  /// In en, this message translates to:
  /// **'Age (optional)'**
  String get bmiAge;

  /// Label above the male/female choice
  ///
  /// In en, this message translates to:
  /// **'Sex (optional)'**
  String get bmiSex;

  /// Sex option
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get bmiMale;

  /// Sex option
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get bmiFemale;

  /// Label above the BMI value
  ///
  /// In en, this message translates to:
  /// **'Your BMI'**
  String get bmiYourBmi;

  /// BMI category below 18.5
  ///
  /// In en, this message translates to:
  /// **'Underweight'**
  String get bmiUnderweight;

  /// BMI category 18.5 to 24.9
  ///
  /// In en, this message translates to:
  /// **'Healthy weight'**
  String get bmiNormal;

  /// BMI category 25 to 29.9
  ///
  /// In en, this message translates to:
  /// **'Overweight'**
  String get bmiOverweight;

  /// BMI category 30 and above
  ///
  /// In en, this message translates to:
  /// **'Obese'**
  String get bmiObese;

  /// Weight range for a BMI of 18.5–24.9
  ///
  /// In en, this message translates to:
  /// **'Healthy weight for your height: {min} – {max}'**
  String bmiHealthyRange(String min, String max);

  /// How far the weight is above the healthy range
  ///
  /// In en, this message translates to:
  /// **'About {amount} above the healthy range'**
  String bmiToLose(String amount);

  /// How far the weight is below the healthy range
  ///
  /// In en, this message translates to:
  /// **'About {amount} below the healthy range'**
  String bmiToGain(String amount);

  /// Ideal body weight from the Devine formula
  ///
  /// In en, this message translates to:
  /// **'Estimated ideal weight: {weight}'**
  String bmiIdealWeight(String weight);

  /// Shown when the age entered is under 18
  ///
  /// In en, this message translates to:
  /// **'For children and teens under 18, BMI is read with age-based growth charts. These results use adult ranges.'**
  String get bmiChildNote;

  /// One-line disclaimer
  ///
  /// In en, this message translates to:
  /// **'BMI is a general guide, not a medical diagnosis.'**
  String get bmiDisclaimer;

  /// Placeholder before the inputs are filled
  ///
  /// In en, this message translates to:
  /// **'Enter your height and weight'**
  String get bmiEnterValues;

  /// Currency converter: label of the amount field
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get currencyAmount;

  /// Currency converter: card title for the currency you convert from
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get currencyFrom;

  /// Currency converter: card title for the currency you convert to
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get currencyTo;

  /// Currency converter: accessibility label of the swap button
  ///
  /// In en, this message translates to:
  /// **'Swap currencies'**
  String get currencySwap;

  /// Currency converter: accessibility label of the currency picker button
  ///
  /// In en, this message translates to:
  /// **'Choose currency'**
  String get currencyChoose;

  /// Currency picker search hint
  ///
  /// In en, this message translates to:
  /// **'Search currency or code'**
  String get currencySearchHint;

  /// Currency picker section header
  ///
  /// In en, this message translates to:
  /// **'All currencies'**
  String get currencyAll;

  /// Shows the date of the exchange rates in use
  ///
  /// In en, this message translates to:
  /// **'Rates from {date}'**
  String currencyRatesFrom(String date);

  /// Currency converter: tooltip of the refresh button
  ///
  /// In en, this message translates to:
  /// **'Refresh rates'**
  String get currencyRefresh;

  /// Shown while exchange rates download
  ///
  /// In en, this message translates to:
  /// **'Updating rates…'**
  String get currencyUpdating;

  /// Banner when the rate download failed but older rates are available
  ///
  /// In en, this message translates to:
  /// **'Couldn’t update. Showing saved rates.'**
  String get currencyOfflineCached;

  /// Empty state title when there is no internet and no saved rates
  ///
  /// In en, this message translates to:
  /// **'Rates not downloaded yet'**
  String get currencyNoRatesTitle;

  /// Empty state body when there is no internet and no saved rates
  ///
  /// In en, this message translates to:
  /// **'Connect to the internet once to download exchange rates. After that, the converter also works offline.'**
  String get currencyNoRatesBody;

  /// Button to retry downloading rates
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get currencyRetry;

  /// Section header: the amount converted into the user's favourite currencies
  ///
  /// In en, this message translates to:
  /// **'Your favorite currencies'**
  String get currencyOtherFavorites;

  /// Shown when the user has no other favourite currencies
  ///
  /// In en, this message translates to:
  /// **'Tap ☆ next to a currency in the list to add it here.'**
  String get currencyFavoritesHint;

  /// Tooltip of the copy button
  ///
  /// In en, this message translates to:
  /// **'Copy result'**
  String get currencyCopy;

  /// Snackbar after copying the result
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get currencyCopied;

  /// Currency picker: search found nothing
  ///
  /// In en, this message translates to:
  /// **'No currency found'**
  String get currencyNoMatch;

  /// Small print under the converter
  ///
  /// In en, this message translates to:
  /// **'Rates are for reference only and may differ from your bank’s rate.'**
  String get currencyDisclaimer;

  /// Input label
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get directChatPhone;

  /// Accessibility label of the country calling-code button
  ///
  /// In en, this message translates to:
  /// **'Country code'**
  String get directChatCountryCode;

  /// Country picker search hint
  ///
  /// In en, this message translates to:
  /// **'Search country or code'**
  String get directChatSearchCountry;

  /// Country picker: search found nothing
  ///
  /// In en, this message translates to:
  /// **'No country found'**
  String get directChatNoCountry;

  /// Input label: text to pre-fill in the chat
  ///
  /// In en, this message translates to:
  /// **'Message (optional)'**
  String get directChatMessage;

  /// Main button. Keep the name WhatsApp unchanged.
  ///
  /// In en, this message translates to:
  /// **'Open in WhatsApp'**
  String get directChatOpen;

  /// Tooltip of the paste button
  ///
  /// In en, this message translates to:
  /// **'Paste number'**
  String get directChatPaste;

  /// Snackbar
  ///
  /// In en, this message translates to:
  /// **'No phone number found in the clipboard'**
  String get directChatPasteNone;

  /// Validation error
  ///
  /// In en, this message translates to:
  /// **'This number looks too short'**
  String get directChatTooShort;

  /// Validation error
  ///
  /// In en, this message translates to:
  /// **'This number looks too long'**
  String get directChatTooLong;

  /// Preview of the number the chat will open with
  ///
  /// In en, this message translates to:
  /// **'Chat with {number}'**
  String directChatWillOpen(String number);

  /// Snackbar when the chat link could not be opened. Keep the name WhatsApp unchanged.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t open the chat. Is WhatsApp installed?'**
  String get directChatOpenFailed;

  /// Intro line at the top of the screen
  ///
  /// In en, this message translates to:
  /// **'Send a message to any number without saving it to your contacts.'**
  String get directChatHint;

  /// Small print. Keep the names WhatsApp and Meta unchanged.
  ///
  /// In en, this message translates to:
  /// **'Independent tool. Not affiliated with WhatsApp or Meta.'**
  String get directChatNotAffiliated;

  /// Percentage tool tab
  ///
  /// In en, this message translates to:
  /// **'Percent'**
  String get percentageTabPercent;

  /// Percentage tool tab
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get percentageTabDiscount;

  /// Percentage tool tab: restaurant tip and splitting the bill
  ///
  /// In en, this message translates to:
  /// **'Tip & split'**
  String get percentageTabTip;

  /// Percentage tool tab: sales tax, GST or VAT
  ///
  /// In en, this message translates to:
  /// **'Tax / VAT'**
  String get percentageTabTax;

  /// Card title: e.g. what is 15% of 200
  ///
  /// In en, this message translates to:
  /// **'Percentage of a number'**
  String get percentageOfTitle;

  /// Input label
  ///
  /// In en, this message translates to:
  /// **'Percentage'**
  String get percentageFieldPercent;

  /// Input label
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get percentageFieldNumber;

  /// Result label, e.g. '15% of 200' (the answer is shown next to it)
  ///
  /// In en, this message translates to:
  /// **'{percent} of {number}'**
  String percentageOfResult(String percent, String number);

  /// Card title: e.g. 30 is what percent of 200
  ///
  /// In en, this message translates to:
  /// **'What percent is it?'**
  String get percentageWhatTitle;

  /// Input label: the part
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get percentageFieldPart;

  /// Input label: the whole
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get percentageFieldTotal;

  /// Result label, e.g. '30 out of 200' (the percent is shown next to it)
  ///
  /// In en, this message translates to:
  /// **'{part} out of {total}'**
  String percentageWhatResult(String part, String total);

  /// Card title: percent increase or decrease between two values
  ///
  /// In en, this message translates to:
  /// **'Percentage change'**
  String get percentageChangeTitle;

  /// Input label
  ///
  /// In en, this message translates to:
  /// **'Old value'**
  String get percentageFieldOld;

  /// Input label
  ///
  /// In en, this message translates to:
  /// **'New value'**
  String get percentageFieldNew;

  /// Result
  ///
  /// In en, this message translates to:
  /// **'Increase of {percent}'**
  String percentageIncrease(String percent);

  /// Result
  ///
  /// In en, this message translates to:
  /// **'Decrease of {percent}'**
  String percentageDecrease(String percent);

  /// Result when both values are equal
  ///
  /// In en, this message translates to:
  /// **'No change'**
  String get percentageNoChange;

  /// Result label: new value minus old value
  ///
  /// In en, this message translates to:
  /// **'Difference'**
  String get percentageDifference;

  /// Input label: price before discount
  ///
  /// In en, this message translates to:
  /// **'Original price'**
  String get percentagePrice;

  /// Input label: discount percent
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get percentageDiscount;

  /// Input label: a second discount applied on top
  ///
  /// In en, this message translates to:
  /// **'Extra discount (optional)'**
  String get percentageExtraDiscount;

  /// Result label: final price
  ///
  /// In en, this message translates to:
  /// **'You pay'**
  String get percentageYouPay;

  /// Result label: money saved
  ///
  /// In en, this message translates to:
  /// **'You save'**
  String get percentageYouSave;

  /// Result label: combined discount percent
  ///
  /// In en, this message translates to:
  /// **'Total discount'**
  String get percentageTotalDiscount;

  /// Input label: restaurant bill
  ///
  /// In en, this message translates to:
  /// **'Bill amount'**
  String get percentageBill;

  /// Label: tip percent
  ///
  /// In en, this message translates to:
  /// **'Tip'**
  String get percentageTip;

  /// Chip: enter your own tip percent
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get percentageCustom;

  /// Label: how many people share the bill
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get percentagePeople;

  /// Accessibility label of the + button
  ///
  /// In en, this message translates to:
  /// **'Add a person'**
  String get percentageAddPerson;

  /// Accessibility label of the - button
  ///
  /// In en, this message translates to:
  /// **'Remove a person'**
  String get percentageRemovePerson;

  /// Result label
  ///
  /// In en, this message translates to:
  /// **'Tip amount'**
  String get percentageTipAmount;

  /// Result label: bill plus tip
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get percentageTotal;

  /// Result label
  ///
  /// In en, this message translates to:
  /// **'Each person pays'**
  String get percentagePerPerson;

  /// Input label: tax percent
  ///
  /// In en, this message translates to:
  /// **'Tax rate'**
  String get percentageTaxRate;

  /// Mode: add tax to a price
  ///
  /// In en, this message translates to:
  /// **'Add tax'**
  String get percentageAddTax;

  /// Mode: take tax out of a tax-inclusive price
  ///
  /// In en, this message translates to:
  /// **'Remove tax'**
  String get percentageRemoveTax;

  /// Input label
  ///
  /// In en, this message translates to:
  /// **'Price without tax'**
  String get percentagePriceExclTax;

  /// Input label
  ///
  /// In en, this message translates to:
  /// **'Price including tax'**
  String get percentagePriceInclTax;

  /// Result label: net amount
  ///
  /// In en, this message translates to:
  /// **'Before tax'**
  String get percentageBeforeTax;

  /// Result label: tax amount
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get percentageTaxAmount;

  /// Result label: gross amount
  ///
  /// In en, this message translates to:
  /// **'Total with tax'**
  String get percentageAfterTax;

  /// Placeholder before the inputs are filled
  ///
  /// In en, this message translates to:
  /// **'Enter numbers to see the result'**
  String get percentageEnterValues;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get commonShare;

  /// No description provided for @commonCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get commonCopy;

  /// No description provided for @commonCopied.
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get commonCopied;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @commonDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get commonDone;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// No description provided for @commonUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get commonUndo;

  /// No description provided for @commonOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get commonOpen;

  /// No description provided for @commonReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get commonReset;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @commonOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get commonOpenSettings;

  /// No description provided for @commonChoosePhoto.
  ///
  /// In en, this message translates to:
  /// **'Choose photo'**
  String get commonChoosePhoto;

  /// No description provided for @commonChooseFile.
  ///
  /// In en, this message translates to:
  /// **'Choose file'**
  String get commonChooseFile;

  /// No description provided for @commonCamera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get commonCamera;

  /// No description provided for @commonGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get commonGallery;

  /// No description provided for @commonWorking.
  ///
  /// In en, this message translates to:
  /// **'Working…'**
  String get commonWorking;

  /// No description provided for @commonSavedToGallery.
  ///
  /// In en, this message translates to:
  /// **'Saved to gallery'**
  String get commonSavedToGallery;

  /// No description provided for @commonSavedToDownloads.
  ///
  /// In en, this message translates to:
  /// **'Saved to Downloads'**
  String get commonSavedToDownloads;

  /// No description provided for @commonSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save the file'**
  String get commonSaveFailed;

  /// No description provided for @commonErrorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get commonErrorGeneric;

  /// No description provided for @commonErrorOffline.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get commonErrorOffline;

  /// No description provided for @commonErrorTimeout.
  ///
  /// In en, this message translates to:
  /// **'The request timed out. Please try again.'**
  String get commonErrorTimeout;

  /// No description provided for @commonPermissionNeeded.
  ///
  /// In en, this message translates to:
  /// **'Permission needed. Allow it in Settings.'**
  String get commonPermissionNeeded;

  /// No description provided for @commonResult.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get commonResult;

  /// No description provided for @commonStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get commonStart;

  /// No description provided for @commonStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get commonStop;

  /// No description provided for @commonClearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get commonClearAll;

  /// No description provided for @commonPaste.
  ///
  /// In en, this message translates to:
  /// **'Paste'**
  String get commonPaste;

  /// No description provided for @commonSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get commonSearch;

  /// No description provided for @organizePdfHint.
  ///
  /// In en, this message translates to:
  /// **'Tap pages to select them. Press and hold a page, then drag to move it.'**
  String get organizePdfHint;

  /// No description provided for @organizePdfSelected.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String organizePdfSelected(int count);

  /// No description provided for @organizePdfRotateLeft.
  ///
  /// In en, this message translates to:
  /// **'Rotate left'**
  String get organizePdfRotateLeft;

  /// No description provided for @organizePdfRotateRight.
  ///
  /// In en, this message translates to:
  /// **'Rotate right'**
  String get organizePdfRotateRight;

  /// No description provided for @organizePdfDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get organizePdfDelete;

  /// No description provided for @organizePdfSelectAll.
  ///
  /// In en, this message translates to:
  /// **'Select all'**
  String get organizePdfSelectAll;

  /// No description provided for @organizePdfClearSelection.
  ///
  /// In en, this message translates to:
  /// **'Clear selection'**
  String get organizePdfClearSelection;

  /// No description provided for @organizePdfDeleted.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 page deleted} other{{count} pages deleted}}'**
  String organizePdfDeleted(int count);

  /// No description provided for @organizePdfUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get organizePdfUndo;

  /// No description provided for @organizePdfKeepOne.
  ///
  /// In en, this message translates to:
  /// **'A PDF needs at least one page.'**
  String get organizePdfKeepOne;

  /// No description provided for @organizePdfNoChanges.
  ///
  /// In en, this message translates to:
  /// **'No changes yet — move, rotate or delete pages first.'**
  String get organizePdfNoChanges;

  /// No description provided for @organizePdfReset.
  ///
  /// In en, this message translates to:
  /// **'Undo all changes'**
  String get organizePdfReset;

  /// No description provided for @organizePdfMoveEarlier.
  ///
  /// In en, this message translates to:
  /// **'Move earlier'**
  String get organizePdfMoveEarlier;

  /// No description provided for @organizePdfMoveLater.
  ///
  /// In en, this message translates to:
  /// **'Move later'**
  String get organizePdfMoveLater;

  /// No description provided for @organizePdfSave.
  ///
  /// In en, this message translates to:
  /// **'Save PDF'**
  String get organizePdfSave;

  /// No description provided for @organizePdfFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t save this PDF.'**
  String get organizePdfFailed;

  /// No description provided for @organizePdfResult.
  ///
  /// In en, this message translates to:
  /// **'Your organized PDF is ready'**
  String get organizePdfResult;

  /// No description provided for @pdfToTextReading.
  ///
  /// In en, this message translates to:
  /// **'Reading page {current} of {total}…'**
  String pdfToTextReading(int current, int total);

  /// No description provided for @pdfToTextWords.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 word} other{{count} words}}'**
  String pdfToTextWords(int count);

  /// No description provided for @pdfToTextCopyAll.
  ///
  /// In en, this message translates to:
  /// **'Copy all'**
  String get pdfToTextCopyAll;

  /// No description provided for @pdfToTextCopied.
  ///
  /// In en, this message translates to:
  /// **'Text copied'**
  String get pdfToTextCopied;

  /// No description provided for @pdfToTextSaveTxt.
  ///
  /// In en, this message translates to:
  /// **'Save as .txt'**
  String get pdfToTextSaveTxt;

  /// No description provided for @pdfToTextEmptyPage.
  ///
  /// In en, this message translates to:
  /// **'No text on this page'**
  String get pdfToTextEmptyPage;

  /// No description provided for @pdfToTextScannedTitle.
  ///
  /// In en, this message translates to:
  /// **'No text found'**
  String get pdfToTextScannedTitle;

  /// No description provided for @pdfToTextScannedBody.
  ///
  /// In en, this message translates to:
  /// **'This PDF looks like a scan or photos, so there is no text to copy. We can read the words on page 1 from the image instead.'**
  String get pdfToTextScannedBody;

  /// No description provided for @pdfToTextOpenOcr.
  ///
  /// In en, this message translates to:
  /// **'Read page 1 with {tool}'**
  String pdfToTextOpenOcr(String tool);

  /// No description provided for @pdfToTextFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t read the text in this PDF.'**
  String get pdfToTextFailed;

  /// No description provided for @pdfToTextPartlyScanned.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 page has no text (it may be scanned).} other{{count} pages have no text (they may be scanned).}}'**
  String pdfToTextPartlyScanned(int count);

  /// No description provided for @pdfEditChoosePdf.
  ///
  /// In en, this message translates to:
  /// **'Choose a PDF'**
  String get pdfEditChoosePdf;

  /// No description provided for @pdfEditChooseHint.
  ///
  /// In en, this message translates to:
  /// **'Or share a PDF to Utility Toolbox from any app'**
  String get pdfEditChooseHint;

  /// No description provided for @pdfEditChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get pdfEditChange;

  /// No description provided for @pdfEditReading.
  ///
  /// In en, this message translates to:
  /// **'Reading…'**
  String get pdfEditReading;

  /// No description provided for @pdfEditPageCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 page} other{{count} pages}}'**
  String pdfEditPageCount(int count);

  /// No description provided for @pdfEditPageN.
  ///
  /// In en, this message translates to:
  /// **'Page {number}'**
  String pdfEditPageN(int number);

  /// No description provided for @pdfEditInvalidPdf.
  ///
  /// In en, this message translates to:
  /// **'This file doesn’t look like a valid PDF.'**
  String get pdfEditInvalidPdf;

  /// No description provided for @pdfEditLocked.
  ///
  /// In en, this message translates to:
  /// **'This PDF is password protected. Remove the password first, then try again.'**
  String get pdfEditLocked;

  /// No description provided for @pdfEditLockedShort.
  ///
  /// In en, this message translates to:
  /// **'Password protected'**
  String get pdfEditLockedShort;

  /// No description provided for @pdfEditPreviewFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t show this page.'**
  String get pdfEditPreviewFailed;

  /// No description provided for @pdfEditResultReady.
  ///
  /// In en, this message translates to:
  /// **'Your PDF is ready'**
  String get pdfEditResultReady;

  /// No description provided for @pdfEditSaveDownloads.
  ///
  /// In en, this message translates to:
  /// **'Save to Downloads'**
  String get pdfEditSaveDownloads;

  /// No description provided for @pdfEditShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get pdfEditShare;

  /// No description provided for @pdfEditStartOver.
  ///
  /// In en, this message translates to:
  /// **'Start over'**
  String get pdfEditStartOver;

  /// No description provided for @pdfEditSavedToDownloads.
  ///
  /// In en, this message translates to:
  /// **'Saved to Downloads — find it in My Files'**
  String get pdfEditSavedToDownloads;

  /// No description provided for @pdfEditSharedInstead.
  ///
  /// In en, this message translates to:
  /// **'Opened the share sheet instead'**
  String get pdfEditSharedInstead;

  /// No description provided for @pdfEditSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t create the file. Please try again.'**
  String get pdfEditSaveFailed;

  /// No description provided for @signPdfStepPdf.
  ///
  /// In en, this message translates to:
  /// **'Choose your PDF'**
  String get signPdfStepPdf;

  /// No description provided for @signPdfStepSignature.
  ///
  /// In en, this message translates to:
  /// **'Create your signature'**
  String get signPdfStepSignature;

  /// No description provided for @signPdfStepPlace.
  ///
  /// In en, this message translates to:
  /// **'Tap a page to place your signature'**
  String get signPdfStepPlace;

  /// No description provided for @signPdfDraw.
  ///
  /// In en, this message translates to:
  /// **'Draw signature'**
  String get signPdfDraw;

  /// No description provided for @signPdfDrawAgain.
  ///
  /// In en, this message translates to:
  /// **'Draw again'**
  String get signPdfDrawAgain;

  /// No description provided for @signPdfUseSaved.
  ///
  /// In en, this message translates to:
  /// **'Use saved signature'**
  String get signPdfUseSaved;

  /// No description provided for @signPdfDeleteSaved.
  ///
  /// In en, this message translates to:
  /// **'Delete saved signature'**
  String get signPdfDeleteSaved;

  /// No description provided for @signPdfSavedDeleted.
  ///
  /// In en, this message translates to:
  /// **'Saved signature deleted'**
  String get signPdfSavedDeleted;

  /// No description provided for @signPdfDrawTitle.
  ///
  /// In en, this message translates to:
  /// **'Draw your signature'**
  String get signPdfDrawTitle;

  /// No description provided for @signPdfDrawHint.
  ///
  /// In en, this message translates to:
  /// **'Sign here with your finger'**
  String get signPdfDrawHint;

  /// No description provided for @signPdfUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get signPdfUndo;

  /// No description provided for @signPdfInkBlack.
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get signPdfInkBlack;

  /// No description provided for @signPdfInkBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get signPdfInkBlue;

  /// No description provided for @signPdfRemember.
  ///
  /// In en, this message translates to:
  /// **'Save signature for next time'**
  String get signPdfRemember;

  /// No description provided for @signPdfDone.
  ///
  /// In en, this message translates to:
  /// **'Use this signature'**
  String get signPdfDone;

  /// No description provided for @signPdfEmpty.
  ///
  /// In en, this message translates to:
  /// **'Draw your signature first.'**
  String get signPdfEmpty;

  /// No description provided for @signPdfSignatureLabel.
  ///
  /// In en, this message translates to:
  /// **'Your signature'**
  String get signPdfSignatureLabel;

  /// No description provided for @signPdfPlaceHint.
  ///
  /// In en, this message translates to:
  /// **'Drag to move, pinch or use the slider to resize. Tap the page to move the signature there.'**
  String get signPdfPlaceHint;

  /// No description provided for @signPdfSize.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get signPdfSize;

  /// No description provided for @signPdfPlaceConfirm.
  ///
  /// In en, this message translates to:
  /// **'Place here'**
  String get signPdfPlaceConfirm;

  /// No description provided for @signPdfRemoveFromPage.
  ///
  /// In en, this message translates to:
  /// **'Remove from this page'**
  String get signPdfRemoveFromPage;

  /// No description provided for @signPdfAllPages.
  ///
  /// In en, this message translates to:
  /// **'Add to all pages'**
  String get signPdfAllPages;

  /// No description provided for @signPdfAllPagesDone.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Signature added to 1 page} other{Signature added to all {count} pages}}'**
  String signPdfAllPagesDone(int count);

  /// No description provided for @signPdfClearAll.
  ///
  /// In en, this message translates to:
  /// **'Remove all'**
  String get signPdfClearAll;

  /// No description provided for @signPdfPlacedCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No pages signed yet} =1{Signed on 1 page} other{Signed on {count} pages}}'**
  String signPdfPlacedCount(int count);

  /// No description provided for @signPdfSave.
  ///
  /// In en, this message translates to:
  /// **'Save signed PDF'**
  String get signPdfSave;

  /// No description provided for @signPdfNoPlacement.
  ///
  /// In en, this message translates to:
  /// **'Tap a page to place your signature first.'**
  String get signPdfNoPlacement;

  /// No description provided for @signPdfFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t sign this PDF.'**
  String get signPdfFailed;

  /// No description provided for @signPdfResult.
  ///
  /// In en, this message translates to:
  /// **'Your signed PDF is ready'**
  String get signPdfResult;

  /// No description provided for @watermarkPdfModeText.
  ///
  /// In en, this message translates to:
  /// **'Text watermark'**
  String get watermarkPdfModeText;

  /// No description provided for @watermarkPdfModeNumbers.
  ///
  /// In en, this message translates to:
  /// **'Page numbers'**
  String get watermarkPdfModeNumbers;

  /// No description provided for @watermarkPdfText.
  ///
  /// In en, this message translates to:
  /// **'Watermark text'**
  String get watermarkPdfText;

  /// No description provided for @watermarkPdfDefaultText.
  ///
  /// In en, this message translates to:
  /// **'CONFIDENTIAL'**
  String get watermarkPdfDefaultText;

  /// No description provided for @watermarkPdfTextEmpty.
  ///
  /// In en, this message translates to:
  /// **'Type the watermark text first.'**
  String get watermarkPdfTextEmpty;

  /// No description provided for @watermarkPdfSize.
  ///
  /// In en, this message translates to:
  /// **'Text size'**
  String get watermarkPdfSize;

  /// No description provided for @watermarkPdfOpacity.
  ///
  /// In en, this message translates to:
  /// **'Opacity'**
  String get watermarkPdfOpacity;

  /// No description provided for @watermarkPdfLayout.
  ///
  /// In en, this message translates to:
  /// **'Layout'**
  String get watermarkPdfLayout;

  /// No description provided for @watermarkPdfDiagonal.
  ///
  /// In en, this message translates to:
  /// **'Diagonal'**
  String get watermarkPdfDiagonal;

  /// No description provided for @watermarkPdfCenter.
  ///
  /// In en, this message translates to:
  /// **'Centre'**
  String get watermarkPdfCenter;

  /// No description provided for @watermarkPdfTiled.
  ///
  /// In en, this message translates to:
  /// **'Tiled'**
  String get watermarkPdfTiled;

  /// No description provided for @watermarkPdfColor.
  ///
  /// In en, this message translates to:
  /// **'Colour'**
  String get watermarkPdfColor;

  /// No description provided for @watermarkPdfColorGrey.
  ///
  /// In en, this message translates to:
  /// **'Grey'**
  String get watermarkPdfColorGrey;

  /// No description provided for @watermarkPdfColorRed.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get watermarkPdfColorRed;

  /// No description provided for @watermarkPdfColorBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get watermarkPdfColorBlue;

  /// No description provided for @watermarkPdfColorBlack.
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get watermarkPdfColorBlack;

  /// No description provided for @watermarkPdfColorGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get watermarkPdfColorGreen;

  /// No description provided for @watermarkPdfFormat.
  ///
  /// In en, this message translates to:
  /// **'Format'**
  String get watermarkPdfFormat;

  /// No description provided for @watermarkPdfPageLabel.
  ///
  /// In en, this message translates to:
  /// **'Page {number}'**
  String watermarkPdfPageLabel(String number);

  /// No description provided for @watermarkPdfPosition.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get watermarkPdfPosition;

  /// No description provided for @watermarkPdfBottomCenter.
  ///
  /// In en, this message translates to:
  /// **'Bottom centre'**
  String get watermarkPdfBottomCenter;

  /// No description provided for @watermarkPdfBottomRight.
  ///
  /// In en, this message translates to:
  /// **'Bottom right'**
  String get watermarkPdfBottomRight;

  /// No description provided for @watermarkPdfTopRight.
  ///
  /// In en, this message translates to:
  /// **'Top right'**
  String get watermarkPdfTopRight;

  /// No description provided for @watermarkPdfStartAt.
  ///
  /// In en, this message translates to:
  /// **'Start at'**
  String get watermarkPdfStartAt;

  /// No description provided for @watermarkPdfDecrease.
  ///
  /// In en, this message translates to:
  /// **'Decrease'**
  String get watermarkPdfDecrease;

  /// No description provided for @watermarkPdfIncrease.
  ///
  /// In en, this message translates to:
  /// **'Increase'**
  String get watermarkPdfIncrease;

  /// No description provided for @watermarkPdfPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview (page 1)'**
  String get watermarkPdfPreview;

  /// No description provided for @watermarkPdfApplyText.
  ///
  /// In en, this message translates to:
  /// **'Add watermark'**
  String get watermarkPdfApplyText;

  /// No description provided for @watermarkPdfApplyNumbers.
  ///
  /// In en, this message translates to:
  /// **'Add page numbers'**
  String get watermarkPdfApplyNumbers;

  /// No description provided for @watermarkPdfFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t update this PDF.'**
  String get watermarkPdfFailed;

  /// No description provided for @bgRemoverPickTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a photo'**
  String get bgRemoverPickTitle;

  /// No description provided for @bgRemoverPickBody.
  ///
  /// In en, this message translates to:
  /// **'Works best with people, pets and objects. Your photo is processed on your phone.'**
  String get bgRemoverPickBody;

  /// No description provided for @bgRemoverGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get bgRemoverGallery;

  /// No description provided for @bgRemoverCamera.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get bgRemoverCamera;

  /// No description provided for @bgRemoverPreparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing photo…'**
  String get bgRemoverPreparing;

  /// No description provided for @bgRemoverWorking.
  ///
  /// In en, this message translates to:
  /// **'Removing background…'**
  String get bgRemoverWorking;

  /// No description provided for @bgRemoverDownloading.
  ///
  /// In en, this message translates to:
  /// **'Getting the background remover ready. This happens only once and needs an internet connection…'**
  String get bgRemoverDownloading;

  /// No description provided for @bgRemoverDownloadFailed.
  ///
  /// In en, this message translates to:
  /// **'The background remover isn’t ready yet. Google Play services is still downloading it. Check your internet connection and try again in a minute.'**
  String get bgRemoverDownloadFailed;

  /// No description provided for @bgRemoverNoSubject.
  ///
  /// In en, this message translates to:
  /// **'No person or object was found in this photo. Try a photo with a clear subject.'**
  String get bgRemoverNoSubject;

  /// No description provided for @bgRemoverOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'This photo couldn’t be opened. Try another one.'**
  String get bgRemoverOpenFailed;

  /// No description provided for @bgRemoverFailed.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while removing the background. Please try again.'**
  String get bgRemoverFailed;

  /// No description provided for @bgRemoverRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get bgRemoverRetry;

  /// No description provided for @bgRemoverAnotherPhoto.
  ///
  /// In en, this message translates to:
  /// **'Choose another photo'**
  String get bgRemoverAnotherPhoto;

  /// No description provided for @bgRemoverNewPhoto.
  ///
  /// In en, this message translates to:
  /// **'New photo'**
  String get bgRemoverNewPhoto;

  /// No description provided for @bgRemoverBefore.
  ///
  /// In en, this message translates to:
  /// **'Before'**
  String get bgRemoverBefore;

  /// No description provided for @bgRemoverAfter.
  ///
  /// In en, this message translates to:
  /// **'After'**
  String get bgRemoverAfter;

  /// No description provided for @bgRemoverCompare.
  ///
  /// In en, this message translates to:
  /// **'Compare before and after'**
  String get bgRemoverCompare;

  /// No description provided for @bgRemoverCompareHint.
  ///
  /// In en, this message translates to:
  /// **'Drag the slider to compare'**
  String get bgRemoverCompareHint;

  /// No description provided for @bgRemoverBgTransparent.
  ///
  /// In en, this message translates to:
  /// **'Transparent'**
  String get bgRemoverBgTransparent;

  /// No description provided for @bgRemoverBgWhite.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get bgRemoverBgWhite;

  /// No description provided for @bgRemoverBgBlack.
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get bgRemoverBgBlack;

  /// No description provided for @bgRemoverBgBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get bgRemoverBgBlue;

  /// No description provided for @bgRemoverBgRed.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get bgRemoverBgRed;

  /// No description provided for @bgRemoverBgYellow.
  ///
  /// In en, this message translates to:
  /// **'Yellow'**
  String get bgRemoverBgYellow;

  /// No description provided for @bgRemoverBgBlur.
  ///
  /// In en, this message translates to:
  /// **'Blur'**
  String get bgRemoverBgBlur;

  /// No description provided for @bgRemoverSave.
  ///
  /// In en, this message translates to:
  /// **'Save to gallery'**
  String get bgRemoverSave;

  /// No description provided for @bgRemoverSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved to your gallery'**
  String get bgRemoverSaved;

  /// No description provided for @bgRemoverSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t save the image. Please try again.'**
  String get bgRemoverSaveFailed;

  /// No description provided for @bgRemoverPngHint.
  ///
  /// In en, this message translates to:
  /// **'PNG with a transparent background'**
  String get bgRemoverPngHint;

  /// No description provided for @bgRemoverJpgHint.
  ///
  /// In en, this message translates to:
  /// **'JPG with the chosen background'**
  String get bgRemoverJpgHint;

  /// No description provided for @bubbleLevelSurfaceHint.
  ///
  /// In en, this message translates to:
  /// **'Lay the phone flat on the surface'**
  String get bubbleLevelSurfaceHint;

  /// No description provided for @bubbleLevelUprightHint.
  ///
  /// In en, this message translates to:
  /// **'Hold the phone’s edge against the surface'**
  String get bubbleLevelUprightHint;

  /// No description provided for @bubbleLevelLevel.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get bubbleLevelLevel;

  /// No description provided for @bubbleLevelAngleLabel.
  ///
  /// In en, this message translates to:
  /// **'Tilt {angle} degrees'**
  String bubbleLevelAngleLabel(String angle);

  /// No description provided for @bubbleLevelAxes.
  ///
  /// In en, this message translates to:
  /// **'Left–right {x}° · Front–back {y}°'**
  String bubbleLevelAxes(String x, String y);

  /// No description provided for @bubbleLevelCalibrate.
  ///
  /// In en, this message translates to:
  /// **'Calibrate'**
  String get bubbleLevelCalibrate;

  /// No description provided for @bubbleLevelReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get bubbleLevelReset;

  /// No description provided for @bubbleLevelCalibrateTitle.
  ///
  /// In en, this message translates to:
  /// **'Calibrate the level?'**
  String get bubbleLevelCalibrateTitle;

  /// No description provided for @bubbleLevelCalibrateBody.
  ///
  /// In en, this message translates to:
  /// **'Place the phone on a surface you know is level (or hold it against a straight edge), then tap Calibrate. The current position will read 0°.'**
  String get bubbleLevelCalibrateBody;

  /// No description provided for @bubbleLevelCalibrated.
  ///
  /// In en, this message translates to:
  /// **'Calibrated. This position now reads 0°.'**
  String get bubbleLevelCalibrated;

  /// No description provided for @bubbleLevelResetDone.
  ///
  /// In en, this message translates to:
  /// **'Calibration cleared'**
  String get bubbleLevelResetDone;

  /// No description provided for @bubbleLevelUnavailable.
  ///
  /// In en, this message translates to:
  /// **'This phone has no motion sensor, so the level can’t work here.'**
  String get bubbleLevelUnavailable;

  /// No description provided for @flashlightOn.
  ///
  /// In en, this message translates to:
  /// **'Light is on'**
  String get flashlightOn;

  /// No description provided for @flashlightOff.
  ///
  /// In en, this message translates to:
  /// **'Light is off'**
  String get flashlightOff;

  /// No description provided for @flashlightTurnOn.
  ///
  /// In en, this message translates to:
  /// **'Turn the light on'**
  String get flashlightTurnOn;

  /// No description provided for @flashlightTurnOff.
  ///
  /// In en, this message translates to:
  /// **'Turn the light off'**
  String get flashlightTurnOff;

  /// No description provided for @flashlightModeSteady.
  ///
  /// In en, this message translates to:
  /// **'Steady'**
  String get flashlightModeSteady;

  /// No description provided for @flashlightModeSos.
  ///
  /// In en, this message translates to:
  /// **'SOS'**
  String get flashlightModeSos;

  /// No description provided for @flashlightModeStrobe.
  ///
  /// In en, this message translates to:
  /// **'Strobe'**
  String get flashlightModeStrobe;

  /// No description provided for @flashlightSosHint.
  ///
  /// In en, this message translates to:
  /// **'Flashes the distress signal ··· ––– ··· again and again'**
  String get flashlightSosHint;

  /// No description provided for @flashlightStrobeSpeed.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 flash per second} other{{count} flashes per second}}'**
  String flashlightStrobeSpeed(int count);

  /// No description provided for @flashlightUseScreen.
  ///
  /// In en, this message translates to:
  /// **'Use screen light'**
  String get flashlightUseScreen;

  /// No description provided for @flashlightUseScreenHint.
  ///
  /// In en, this message translates to:
  /// **'Light up the screen instead of the flash'**
  String get flashlightUseScreenHint;

  /// No description provided for @flashlightNoTorch.
  ///
  /// In en, this message translates to:
  /// **'No flash found on this phone, so the screen lights up instead.'**
  String get flashlightNoTorch;

  /// No description provided for @flashlightTorchBusy.
  ///
  /// In en, this message translates to:
  /// **'The flash is busy (another app may be using the camera), so the screen lights up instead.'**
  String get flashlightTorchBusy;

  /// No description provided for @flashlightScreenColor.
  ///
  /// In en, this message translates to:
  /// **'Screen light color'**
  String get flashlightScreenColor;

  /// No description provided for @flashlightColorWhite.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get flashlightColorWhite;

  /// No description provided for @flashlightColorWarm.
  ///
  /// In en, this message translates to:
  /// **'Warm white'**
  String get flashlightColorWarm;

  /// No description provided for @flashlightColorRed.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get flashlightColorRed;

  /// No description provided for @flashlightColorGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get flashlightColorGreen;

  /// No description provided for @flashlightColorBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get flashlightColorBlue;

  /// No description provided for @flashlightTapToTurnOff.
  ///
  /// In en, this message translates to:
  /// **'Tap anywhere to turn off'**
  String get flashlightTapToTurnOff;

  /// No description provided for @stopwatchTabStopwatch.
  ///
  /// In en, this message translates to:
  /// **'Stopwatch'**
  String get stopwatchTabStopwatch;

  /// No description provided for @stopwatchTabTimer.
  ///
  /// In en, this message translates to:
  /// **'Timer'**
  String get stopwatchTabTimer;

  /// No description provided for @stopwatchStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get stopwatchStart;

  /// No description provided for @stopwatchPause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get stopwatchPause;

  /// No description provided for @stopwatchResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get stopwatchResume;

  /// No description provided for @stopwatchLap.
  ///
  /// In en, this message translates to:
  /// **'Lap'**
  String get stopwatchLap;

  /// No description provided for @stopwatchReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get stopwatchReset;

  /// No description provided for @stopwatchLapNumber.
  ///
  /// In en, this message translates to:
  /// **'Lap {number}'**
  String stopwatchLapNumber(int number);

  /// No description provided for @stopwatchCurrentLap.
  ///
  /// In en, this message translates to:
  /// **'Lap {number}: {time}'**
  String stopwatchCurrentLap(int number, String time);

  /// No description provided for @stopwatchBest.
  ///
  /// In en, this message translates to:
  /// **'Fastest'**
  String get stopwatchBest;

  /// No description provided for @stopwatchWorst.
  ///
  /// In en, this message translates to:
  /// **'Slowest'**
  String get stopwatchWorst;

  /// No description provided for @stopwatchNoLaps.
  ///
  /// In en, this message translates to:
  /// **'Tap Lap while the stopwatch runs to record lap times.'**
  String get stopwatchNoLaps;

  /// No description provided for @stopwatchTimerQuickStart.
  ///
  /// In en, this message translates to:
  /// **'Quick start'**
  String get stopwatchTimerQuickStart;

  /// No description provided for @stopwatchTimerMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String stopwatchTimerMinutes(int minutes);

  /// No description provided for @stopwatchTimerCustom.
  ///
  /// In en, this message translates to:
  /// **'Set your own time'**
  String get stopwatchTimerCustom;

  /// No description provided for @stopwatchTimerPickTitle.
  ///
  /// In en, this message translates to:
  /// **'Set timer'**
  String get stopwatchTimerPickTitle;

  /// No description provided for @stopwatchTimerHours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get stopwatchTimerHours;

  /// No description provided for @stopwatchTimerMinutesUnit.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get stopwatchTimerMinutesUnit;

  /// No description provided for @stopwatchTimerSeconds.
  ///
  /// In en, this message translates to:
  /// **'sec'**
  String get stopwatchTimerSeconds;

  /// No description provided for @stopwatchTimerAddMinute.
  ///
  /// In en, this message translates to:
  /// **'+1 min'**
  String get stopwatchTimerAddMinute;

  /// No description provided for @stopwatchTimerPaused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get stopwatchTimerPaused;

  /// No description provided for @stopwatchTimerRemaining.
  ///
  /// In en, this message translates to:
  /// **'{time} left'**
  String stopwatchTimerRemaining(String time);

  /// No description provided for @stopwatchTimerTimesUp.
  ///
  /// In en, this message translates to:
  /// **'Time’s up!'**
  String get stopwatchTimerTimesUp;

  /// No description provided for @stopwatchTimerFinishedBody.
  ///
  /// In en, this message translates to:
  /// **'Your {duration} timer has finished.'**
  String stopwatchTimerFinishedBody(String duration);

  /// No description provided for @stopwatchTimerRestart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get stopwatchTimerRestart;

  /// No description provided for @stopwatchTimerDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get stopwatchTimerDone;

  /// No description provided for @stopwatchTimerKeepOpen.
  ///
  /// In en, this message translates to:
  /// **'Keep this screen open: the phone vibrates when the time is up.'**
  String get stopwatchTimerKeepOpen;

  /// Translation screen header
  ///
  /// In en, this message translates to:
  /// **'Speak or type to translate'**
  String get translateHeroTitle;

  /// Feature badge
  ///
  /// In en, this message translates to:
  /// **'On-device AI'**
  String get translateBadgeOnDevice;

  /// Feature badge
  ///
  /// In en, this message translates to:
  /// **'Works offline'**
  String get translateBadgeOffline;

  /// Source language dropdown label
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get translateFrom;

  /// Target language dropdown label
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get translateTo;

  /// Tooltip of the swap-languages button
  ///
  /// In en, this message translates to:
  /// **'Swap languages'**
  String get translateSwap;

  /// Input hint (in the app language, whatever the source language)
  ///
  /// In en, this message translates to:
  /// **'Enter text or tap the mic to speak…'**
  String get translateHint;

  /// Input hint while the mic is listening
  ///
  /// In en, this message translates to:
  /// **'Listening… speak naturally, tap the mic to stop'**
  String get translateHintListening;

  /// Status under the input while listening; language = localized language name
  ///
  /// In en, this message translates to:
  /// **'Listening in {language}… tap the mic to stop and translate.'**
  String translateListeningIn(String language);

  /// No description provided for @translateSameLanguage.
  ///
  /// In en, this message translates to:
  /// **'Source and target languages must be different.'**
  String get translateSameLanguage;

  /// Main button
  ///
  /// In en, this message translates to:
  /// **'Translate'**
  String get translateButton;

  /// No description provided for @translateTranslating.
  ///
  /// In en, this message translates to:
  /// **'Translating…'**
  String get translateTranslating;

  /// No description provided for @translateStopAndTranslate.
  ///
  /// In en, this message translates to:
  /// **'Stop & translate'**
  String get translateStopAndTranslate;

  /// No description provided for @translateDownloadingModel.
  ///
  /// In en, this message translates to:
  /// **'Downloading language model…'**
  String get translateDownloadingModel;

  /// Heading of the result card
  ///
  /// In en, this message translates to:
  /// **'Translation'**
  String get translateResultLabel;

  /// No description provided for @translatePlayAudio.
  ///
  /// In en, this message translates to:
  /// **'Play audio'**
  String get translatePlayAudio;

  /// No description provided for @translateGenerating.
  ///
  /// In en, this message translates to:
  /// **'Generating…'**
  String get translateGenerating;

  /// No description provided for @translateShareAudio.
  ///
  /// In en, this message translates to:
  /// **'Share audio file'**
  String get translateShareAudio;

  /// No description provided for @translateGenerateAudio.
  ///
  /// In en, this message translates to:
  /// **'Generate audio file'**
  String get translateGenerateAudio;

  /// No description provided for @translateAudioReady.
  ///
  /// In en, this message translates to:
  /// **'Audio file ready — share it to send or save it.'**
  String get translateAudioReady;

  /// Mic button tooltip while listening
  ///
  /// In en, this message translates to:
  /// **'Stop listening & translate'**
  String get translateMicStop;

  /// Mic button tooltip
  ///
  /// In en, this message translates to:
  /// **'Speak to translate'**
  String get translateMicStart;

  /// No description provided for @translateMicBlocked.
  ///
  /// In en, this message translates to:
  /// **'Microphone access is blocked. Enable it in Settings to use voice input.'**
  String get translateMicBlocked;

  /// No description provided for @translateMicNeeded.
  ///
  /// In en, this message translates to:
  /// **'Microphone permission is needed for voice input.'**
  String get translateMicNeeded;

  /// No description provided for @translateSpeechUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Speech recognition isn’t available on this device.'**
  String get translateSpeechUnavailable;

  /// No description provided for @translateNoSpeech.
  ///
  /// In en, this message translates to:
  /// **'Didn’t catch that. Please try speaking again.'**
  String get translateNoSpeech;

  /// No description provided for @translateVoiceFailed.
  ///
  /// In en, this message translates to:
  /// **'Voice input stopped. Please try again.'**
  String get translateVoiceFailed;

  /// No description provided for @translateDownloadFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t download the language models. Check your internet connection.'**
  String get translateDownloadFailed;

  /// No description provided for @translateFailed.
  ///
  /// In en, this message translates to:
  /// **'Translation failed. Please try again.'**
  String get translateFailed;

  /// No description provided for @translateAudioFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t create an audio file on this device.'**
  String get translateAudioFailed;

  /// Name of a translation language, selected by its ML Kit BCP-47 code
  ///
  /// In en, this message translates to:
  /// **'{code, select, af{Afrikaans} sq{Albanian} ar{Arabic} be{Belarusian} bn{Bengali} bg{Bulgarian} ca{Catalan} zh{Chinese (Simplified)} hr{Croatian} cs{Czech} da{Danish} nl{Dutch} en{English} eo{Esperanto} et{Estonian} fi{Finnish} fr{French} gl{Galician} ka{Georgian} de{German} el{Greek} gu{Gujarati} ht{Haitian Creole} he{Hebrew} hi{Hindi} hu{Hungarian} is{Icelandic} id{Indonesian} ga{Irish} it{Italian} ja{Japanese} kn{Kannada} ko{Korean} lv{Latvian} lt{Lithuanian} mk{Macedonian} ms{Malay} mt{Maltese} mr{Marathi} no{Norwegian} fa{Persian (Farsi)} pl{Polish} pt{Portuguese} ro{Romanian} ru{Russian} sk{Slovak} sl{Slovenian} es{Spanish} sw{Swahili} sv{Swedish} tl{Tagalog (Filipino)} ta{Tamil} te{Telugu} th{Thai} tr{Turkish} uk{Ukrainian} ur{Urdu} vi{Vietnamese} cy{Welsh} other{{code}}}'**
  String translateLanguageName(String code);

  /// No description provided for @textUtilMode.
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get textUtilMode;

  /// Mode chip
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get textUtilModeText;

  /// No description provided for @textUtilHint.
  ///
  /// In en, this message translates to:
  /// **'Enter text here…'**
  String get textUtilHint;

  /// No description provided for @textUtilHintBase64.
  ///
  /// In en, this message translates to:
  /// **'Enter text or Base64 to convert…'**
  String get textUtilHintBase64;

  /// Label under the word count (the number is shown separately above it)
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{word} other{words}}'**
  String textUtilWords(int count);

  /// Label under the character count (number shown separately)
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{character} other{characters}}'**
  String textUtilCharacters(int count);

  /// Label under the character count that excludes spaces
  ///
  /// In en, this message translates to:
  /// **'without spaces'**
  String get textUtilNoSpaces;

  /// Case converter option (styled in that case where the script has letter case)
  ///
  /// In en, this message translates to:
  /// **'UPPERCASE'**
  String get textUtilUpper;

  /// Case converter option
  ///
  /// In en, this message translates to:
  /// **'lowercase'**
  String get textUtilLower;

  /// Case converter option: capitalise every word
  ///
  /// In en, this message translates to:
  /// **'Title Case'**
  String get textUtilTitle;

  /// Case converter option: capitalise the first letter of each sentence
  ///
  /// In en, this message translates to:
  /// **'Sentence case'**
  String get textUtilSentence;

  /// Base64 encode button
  ///
  /// In en, this message translates to:
  /// **'Encode'**
  String get textUtilEncode;

  /// Base64 decode button
  ///
  /// In en, this message translates to:
  /// **'Decode'**
  String get textUtilDecode;

  /// No description provided for @textUtilOutput.
  ///
  /// In en, this message translates to:
  /// **'Output'**
  String get textUtilOutput;

  /// No description provided for @textUtilInvalidBase64.
  ///
  /// In en, this message translates to:
  /// **'That isn’t valid Base64.'**
  String get textUtilInvalidBase64;

  /// No description provided for @clipEmptyClipboard.
  ///
  /// In en, this message translates to:
  /// **'Your clipboard is empty or has no text.'**
  String get clipEmptyClipboard;

  /// Snackbar after saving a clip; text = start of the clip
  ///
  /// In en, this message translates to:
  /// **'Saved: {text}'**
  String clipSaved(String text);

  /// No description provided for @clipAddManualTitle.
  ///
  /// In en, this message translates to:
  /// **'Add text manually'**
  String get clipAddManualTitle;

  /// No description provided for @clipAddHint.
  ///
  /// In en, this message translates to:
  /// **'Type or paste text here…'**
  String get clipAddHint;

  /// Tooltip of the clear button
  ///
  /// In en, this message translates to:
  /// **'Clear unpinned'**
  String get clipClearUnpinned;

  /// No description provided for @clipClearHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear history?'**
  String get clipClearHistoryTitle;

  /// No description provided for @clipClearHistoryBody.
  ///
  /// In en, this message translates to:
  /// **'Remove all unpinned items? Pinned items are kept.'**
  String get clipClearHistoryBody;

  /// No description provided for @clipSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search clips…'**
  String get clipSearchHint;

  /// Filter chip
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get clipFilterAll;

  /// Filter chip
  ///
  /// In en, this message translates to:
  /// **'Pinned'**
  String get clipFilterPinned;

  /// Filter chip
  ///
  /// In en, this message translates to:
  /// **'Links'**
  String get clipFilterLinks;

  /// Filter chip
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get clipFilterText;

  /// Filter chip
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get clipFilterCode;

  /// Stats bar
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{{count} saved}}'**
  String clipSavedCount(int count);

  /// Stats bar
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{{count} pinned}}'**
  String clipPinnedCount(int count);

  /// No description provided for @clipAddText.
  ///
  /// In en, this message translates to:
  /// **'Add text'**
  String get clipAddText;

  /// Action button on a clip
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get clipLabel;

  /// No description provided for @clipAddLabelTitle.
  ///
  /// In en, this message translates to:
  /// **'Add label'**
  String get clipAddLabelTitle;

  /// No description provided for @clipLabelHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Work email'**
  String get clipLabelHint;

  /// No description provided for @clipEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No clips yet'**
  String get clipEmptyTitle;

  /// No description provided for @clipEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Copy any text on your phone, then tap Paste to save it here permanently.'**
  String get clipEmptyMessage;

  /// No description provided for @clipPasteFromClipboard.
  ///
  /// In en, this message translates to:
  /// **'Paste from clipboard'**
  String get clipPasteFromClipboard;

  /// Clip type badge
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get clipTypeLink;

  /// Clip type badge
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get clipTypeEmail;

  /// Clip type badge
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get clipTypePhone;

  /// Clip type badge
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get clipTypeCode;

  /// Clip type badge
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get clipTypeText;

  /// No description provided for @clipJustNow.
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get clipJustNow;

  /// No description provided for @clipMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 min ago} other{{count} min ago}}'**
  String clipMinutesAgo(int count);

  /// No description provided for @clipHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{{count} h ago}}'**
  String clipHoursAgo(int count);

  /// No description provided for @clipDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day ago} other{{count} days ago}}'**
  String clipDaysAgo(int count);

  /// Tooltip
  ///
  /// In en, this message translates to:
  /// **'Pin'**
  String get clipPin;

  /// Tooltip
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get clipUnpin;

  /// No description provided for @calcDivideByZero.
  ///
  /// In en, this message translates to:
  /// **'Can’t divide by zero'**
  String get calcDivideByZero;

  /// No description provided for @calcCheckExpression.
  ///
  /// In en, this message translates to:
  /// **'Check the expression'**
  String get calcCheckExpression;

  /// Tooltip of the copy button
  ///
  /// In en, this message translates to:
  /// **'Copy result'**
  String get calcCopyResult;

  /// Screen-reader label of the + key
  ///
  /// In en, this message translates to:
  /// **'Plus'**
  String get calcPlus;

  /// Screen-reader label of the − key
  ///
  /// In en, this message translates to:
  /// **'Minus'**
  String get calcMinus;

  /// Screen-reader label of the × key
  ///
  /// In en, this message translates to:
  /// **'Multiply'**
  String get calcTimes;

  /// Screen-reader label of the ÷ key
  ///
  /// In en, this message translates to:
  /// **'Divide'**
  String get calcDivide;

  /// Screen-reader label of the % key
  ///
  /// In en, this message translates to:
  /// **'Percent'**
  String get calcPercent;

  /// Screen-reader label of the () key
  ///
  /// In en, this message translates to:
  /// **'Parentheses'**
  String get calcParentheses;

  /// Screen-reader label of the = key
  ///
  /// In en, this message translates to:
  /// **'Equals'**
  String get calcEquals;

  /// Screen-reader label of the . key
  ///
  /// In en, this message translates to:
  /// **'Decimal point'**
  String get calcDecimalPoint;

  /// No description provided for @ageTabAge.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get ageTabAge;

  /// No description provided for @ageTabBetween.
  ///
  /// In en, this message translates to:
  /// **'Between dates'**
  String get ageTabBetween;

  /// No description provided for @ageDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get ageDateOfBirth;

  /// Start date field
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get ageFrom;

  /// End date field
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get ageTo;

  /// No description provided for @ageFutureDate.
  ///
  /// In en, this message translates to:
  /// **'That date is in the future.'**
  String get ageFutureDate;

  /// Unit shown next to the big age number (number shown separately)
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{year} other{years}}'**
  String ageYearsUnit(int count);

  /// Unit shown next to the big day count (number shown separately)
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{day} other{days}}'**
  String ageDaysUnit(int count);

  /// No description provided for @ageYears.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 year} other{{count} years}}'**
  String ageYears(int count);

  /// No description provided for @ageMonths.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 month} other{{count} months}}'**
  String ageMonths(int count);

  /// No description provided for @ageDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day} other{{count} days}}'**
  String ageDays(int count);

  /// No description provided for @ageWeeks.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 week} other{{count} weeks}}'**
  String ageWeeks(int count);

  /// Time until the next birthday
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{in 1 day} other{in {count} days}}'**
  String ageInDays(int count);

  /// Joins two durations, e.g. '3 months, 2 days'
  ///
  /// In en, this message translates to:
  /// **'{first}, {second}'**
  String ageList2(String first, String second);

  /// Joins three durations, e.g. '1 year, 3 months, 2 days'
  ///
  /// In en, this message translates to:
  /// **'{first}, {second}, {third}'**
  String ageList3(String first, String second, String third);

  /// No description provided for @ageNextBirthday.
  ///
  /// In en, this message translates to:
  /// **'Next birthday'**
  String get ageNextBirthday;

  /// No description provided for @ageBirthdayToday.
  ///
  /// In en, this message translates to:
  /// **'Today 🎉'**
  String get ageBirthdayToday;

  /// No description provided for @ageTotalMonths.
  ///
  /// In en, this message translates to:
  /// **'Total months'**
  String get ageTotalMonths;

  /// No description provided for @ageTotalWeeks.
  ///
  /// In en, this message translates to:
  /// **'Total weeks'**
  String get ageTotalWeeks;

  /// No description provided for @ageTotalDays.
  ///
  /// In en, this message translates to:
  /// **'Total days'**
  String get ageTotalDays;

  /// Stat label
  ///
  /// In en, this message translates to:
  /// **'Weeks'**
  String get ageWeeksLabel;

  /// Stat label; counts Monday to Friday
  ///
  /// In en, this message translates to:
  /// **'Weekdays (Mon–Fri)'**
  String get ageWeekdays;

  /// Stat label
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get ageHours;

  /// Stat label: day count when the end date is counted too
  ///
  /// In en, this message translates to:
  /// **'Including end date'**
  String get ageIncludingEnd;

  /// Card label: unit to convert from
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get unitFrom;

  /// Card label: unit to convert to
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get unitTo;

  /// No description provided for @unitEnterValue.
  ///
  /// In en, this message translates to:
  /// **'Enter value'**
  String get unitEnterValue;

  /// Tooltip of the swap button
  ///
  /// In en, this message translates to:
  /// **'Swap units'**
  String get unitSwap;

  /// Unit category chip, selected by category id
  ///
  /// In en, this message translates to:
  /// **'{id, select, length{Length} weight{Weight} temperature{Temperature} area{Area} volume{Volume} other{{id}}}'**
  String unitCategoryName(String id);

  /// Unit name, selected by unit id (the symbol is shown separately)
  ///
  /// In en, this message translates to:
  /// **'{id, select, millimeter{Millimeter} centimeter{Centimeter} meter{Meter} kilometer{Kilometer} inch{Inch} foot{Foot} mile{Mile} gram{Gram} kilogram{Kilogram} ounce{Ounce} pound{Pound} celsius{Celsius} fahrenheit{Fahrenheit} kelvin{Kelvin} squareMeter{Square meter} squareFoot{Square foot} acre{Acre} hectare{Hectare} milliliter{Milliliter} liter{Liter} gallonUs{Gallon (US)} fluidOunce{Fluid ounce} other{{id}}}'**
  String unitName(String id);

  /// No description provided for @loanAmount.
  ///
  /// In en, this message translates to:
  /// **'Loan amount'**
  String get loanAmount;

  /// No description provided for @loanInterestRate.
  ///
  /// In en, this message translates to:
  /// **'Annual interest rate'**
  String get loanInterestRate;

  /// No description provided for @loanTenure.
  ///
  /// In en, this message translates to:
  /// **'Tenure'**
  String get loanTenure;

  /// No description provided for @loanTenureMonths.
  ///
  /// In en, this message translates to:
  /// **'Tenure (months)'**
  String get loanTenureMonths;

  /// No description provided for @loanTenureYears.
  ///
  /// In en, this message translates to:
  /// **'Tenure (years)'**
  String get loanTenureYears;

  /// Tenure unit toggle
  ///
  /// In en, this message translates to:
  /// **'Months'**
  String get loanToggleMonths;

  /// Tenure unit toggle
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get loanToggleYears;

  /// No description provided for @loanEmpty.
  ///
  /// In en, this message translates to:
  /// **'Enter valid loan details above to calculate your EMI'**
  String get loanEmpty;

  /// No description provided for @loanMonthlyEmi.
  ///
  /// In en, this message translates to:
  /// **'Monthly EMI'**
  String get loanMonthlyEmi;

  /// No description provided for @loanPrincipal.
  ///
  /// In en, this message translates to:
  /// **'Principal'**
  String get loanPrincipal;

  /// No description provided for @loanTotalInterest.
  ///
  /// In en, this message translates to:
  /// **'Total interest'**
  String get loanTotalInterest;

  /// No description provided for @loanTotalPayment.
  ///
  /// In en, this message translates to:
  /// **'Total payment'**
  String get loanTotalPayment;

  /// No description provided for @loanBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Breakdown'**
  String get loanBreakdown;

  /// No description provided for @loanInterest.
  ///
  /// In en, this message translates to:
  /// **'Interest'**
  String get loanInterest;

  /// Share of the total that is interest; percent is already formatted, e.g. '12.5%'
  ///
  /// In en, this message translates to:
  /// **'{percent} interest'**
  String loanInterestShare(String percent);

  /// No description provided for @loanSchedule.
  ///
  /// In en, this message translates to:
  /// **'Amortization schedule'**
  String get loanSchedule;

  /// No description provided for @loanMonths.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 month} other{{count} months}}'**
  String loanMonths(int count);

  /// Short table header: month number
  ///
  /// In en, this message translates to:
  /// **'Mo.'**
  String get loanColMonth;

  /// Table header: remaining balance
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get loanColBalance;

  /// No description provided for @loanShowAll.
  ///
  /// In en, this message translates to:
  /// **'Show all months'**
  String get loanShowAll;

  /// No description provided for @loanShowLess.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get loanShowLess;

  /// No description provided for @clockSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search city or country…'**
  String get clockSearchHint;

  /// Section header
  ///
  /// In en, this message translates to:
  /// **'Pinned'**
  String get clockPinned;

  /// Section header
  ///
  /// In en, this message translates to:
  /// **'All cities'**
  String get clockAllCities;

  /// How many pinned cities the home-screen widget shows
  ///
  /// In en, this message translates to:
  /// **'On widget: {shown} of {total}'**
  String clockOnWidget(int shown, int total);

  /// No description provided for @clockOnWidgetMore.
  ///
  /// In en, this message translates to:
  /// **'On widget: {shown} of up to {max} (resize to show more)'**
  String clockOnWidgetMore(int shown, int max);

  /// No description provided for @clockWidgetHint.
  ///
  /// In en, this message translates to:
  /// **'The home-screen widget shows the first {defaultRows} by default — drag its bottom edge down to show up to {maxRows}.'**
  String clockWidgetHint(int defaultRows, int maxRows);

  /// Tooltip
  ///
  /// In en, this message translates to:
  /// **'Pin'**
  String get clockPin;

  /// Tooltip
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get clockUnpin;

  /// No description provided for @clockNoResults.
  ///
  /// In en, this message translates to:
  /// **'No matching cities'**
  String get clockNoResults;

  /// No description provided for @speedSelectingServer.
  ///
  /// In en, this message translates to:
  /// **'Selecting server…'**
  String get speedSelectingServer;

  /// Speed test phase; animated dots are appended
  ///
  /// In en, this message translates to:
  /// **'Measuring ping'**
  String get speedPhasePing;

  /// No description provided for @speedPhaseDownload.
  ///
  /// In en, this message translates to:
  /// **'Testing download speed'**
  String get speedPhaseDownload;

  /// No description provided for @speedPhaseUpload.
  ///
  /// In en, this message translates to:
  /// **'Testing upload speed'**
  String get speedPhaseUpload;

  /// No description provided for @speedDownloadSpeed.
  ///
  /// In en, this message translates to:
  /// **'Download speed'**
  String get speedDownloadSpeed;

  /// No description provided for @speedUploadSpeed.
  ///
  /// In en, this message translates to:
  /// **'Upload speed'**
  String get speedUploadSpeed;

  /// Short label inside the round start button
  ///
  /// In en, this message translates to:
  /// **'Run again'**
  String get speedRunAgain;

  /// Very short label inside the round start button
  ///
  /// In en, this message translates to:
  /// **'GO'**
  String get speedGo;

  /// No description provided for @speedMeasuredVia.
  ///
  /// In en, this message translates to:
  /// **'Measured via {server}'**
  String speedMeasuredVia(String server);

  /// No description provided for @speedPoweredBy.
  ///
  /// In en, this message translates to:
  /// **'Uses Cloudflare speed test servers'**
  String get speedPoweredBy;

  /// No description provided for @speedIdleHint.
  ///
  /// In en, this message translates to:
  /// **'Tap the button to measure ping, download and upload speed.'**
  String get speedIdleHint;

  /// Latency result label (value in ms follows)
  ///
  /// In en, this message translates to:
  /// **'Ping'**
  String get speedPing;

  /// No description provided for @speedResultsTitle.
  ///
  /// In en, this message translates to:
  /// **'Speed test results'**
  String get speedResultsTitle;

  /// Short result column label
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get speedDownload;

  /// Short result column label
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get speedUpload;

  /// No description provided for @speedConnectedIp.
  ///
  /// In en, this message translates to:
  /// **'Your IP: {ip}'**
  String speedConnectedIp(String ip);

  /// No description provided for @speedErrorOffline.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Check your Wi-Fi or mobile data.'**
  String get speedErrorOffline;

  /// No description provided for @speedErrorTimeout.
  ///
  /// In en, this message translates to:
  /// **'The test timed out. Your connection may be unstable.'**
  String get speedErrorTimeout;

  /// No description provided for @speedErrorFailed.
  ///
  /// In en, this message translates to:
  /// **'The test failed. Please try again.'**
  String get speedErrorFailed;

  /// No description provided for @pingErrorHostNotFound.
  ///
  /// In en, this message translates to:
  /// **'Host not found. Check the address and your internet connection.'**
  String get pingErrorHostNotFound;

  /// No description provided for @pingErrorNoData.
  ///
  /// In en, this message translates to:
  /// **'No information is available for this address.'**
  String get pingErrorNoData;

  /// Tab label
  ///
  /// In en, this message translates to:
  /// **'My IP'**
  String get pingTabMyIp;

  /// Tab label: look up info about an IP address or host
  ///
  /// In en, this message translates to:
  /// **'Lookup'**
  String get pingTabLookup;

  /// Tab label
  ///
  /// In en, this message translates to:
  /// **'Ping'**
  String get pingTabPing;

  /// No description provided for @pingYourPublicIp.
  ///
  /// In en, this message translates to:
  /// **'Your public IP address'**
  String get pingYourPublicIp;

  /// No description provided for @pingFieldCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get pingFieldCity;

  /// No description provided for @pingFieldRegion.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get pingFieldRegion;

  /// No description provided for @pingFieldCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get pingFieldCountry;

  /// Internet provider or organization that owns the IP
  ///
  /// In en, this message translates to:
  /// **'ISP / Org'**
  String get pingFieldIsp;

  /// No description provided for @pingFieldTimezone.
  ///
  /// In en, this message translates to:
  /// **'Time zone'**
  String get pingFieldTimezone;

  /// No description provided for @pingFieldLocation.
  ///
  /// In en, this message translates to:
  /// **'Coordinates'**
  String get pingFieldLocation;

  /// No description provided for @pingFieldIp.
  ///
  /// In en, this message translates to:
  /// **'IP address'**
  String get pingFieldIp;

  /// No description provided for @pingIpCopied.
  ///
  /// In en, this message translates to:
  /// **'IP address copied'**
  String get pingIpCopied;

  /// No description provided for @pingCopyIp.
  ///
  /// In en, this message translates to:
  /// **'Copy IP'**
  String get pingCopyIp;

  /// No description provided for @pingLookupHint.
  ///
  /// In en, this message translates to:
  /// **'IP address or hostname'**
  String get pingLookupHint;

  /// Button
  ///
  /// In en, this message translates to:
  /// **'Look up'**
  String get pingLookupButton;

  /// No description provided for @pingHostHint.
  ///
  /// In en, this message translates to:
  /// **'Hostname (e.g. google.com)'**
  String get pingHostHint;

  /// Button that starts pinging (verb)
  ///
  /// In en, this message translates to:
  /// **'Ping'**
  String get pingStartButton;

  /// No description provided for @pingHeader.
  ///
  /// In en, this message translates to:
  /// **'Ping {host} ({ip}) via TCP port 443'**
  String pingHeader(String host, String ip);

  /// Average round-trip time
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get pingStatAvg;

  /// Packet loss percentage
  ///
  /// In en, this message translates to:
  /// **'Loss'**
  String get pingStatLoss;

  /// Number of pings sent
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get pingStatSent;

  /// A ping that got no reply
  ///
  /// In en, this message translates to:
  /// **'Timeout'**
  String get pingTimeout;

  /// Compass abbreviation (1–3 letters; must fit a small badge)
  ///
  /// In en, this message translates to:
  /// **'N'**
  String get compassN;

  /// Compass abbreviation (1–3 letters; must fit a small badge)
  ///
  /// In en, this message translates to:
  /// **'NE'**
  String get compassNE;

  /// Compass abbreviation (1–3 letters; must fit a small badge)
  ///
  /// In en, this message translates to:
  /// **'E'**
  String get compassE;

  /// Compass abbreviation (1–3 letters; must fit a small badge)
  ///
  /// In en, this message translates to:
  /// **'SE'**
  String get compassSE;

  /// Compass abbreviation (1–3 letters; must fit a small badge)
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get compassS;

  /// Compass abbreviation (1–3 letters; must fit a small badge)
  ///
  /// In en, this message translates to:
  /// **'SW'**
  String get compassSW;

  /// Compass abbreviation (1–3 letters; must fit a small badge)
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get compassW;

  /// Compass abbreviation (1–3 letters; must fit a small badge)
  ///
  /// In en, this message translates to:
  /// **'NW'**
  String get compassNW;

  /// Compass direction, read aloud by screen readers
  ///
  /// In en, this message translates to:
  /// **'North'**
  String get compassNorth;

  /// Compass direction, read aloud by screen readers
  ///
  /// In en, this message translates to:
  /// **'Northeast'**
  String get compassNortheast;

  /// Compass direction, read aloud by screen readers
  ///
  /// In en, this message translates to:
  /// **'East'**
  String get compassEast;

  /// Compass direction, read aloud by screen readers
  ///
  /// In en, this message translates to:
  /// **'Southeast'**
  String get compassSoutheast;

  /// Compass direction, read aloud by screen readers
  ///
  /// In en, this message translates to:
  /// **'South'**
  String get compassSouth;

  /// Compass direction, read aloud by screen readers
  ///
  /// In en, this message translates to:
  /// **'Southwest'**
  String get compassSouthwest;

  /// Compass direction, read aloud by screen readers
  ///
  /// In en, this message translates to:
  /// **'West'**
  String get compassWest;

  /// Compass direction, read aloud by screen readers
  ///
  /// In en, this message translates to:
  /// **'Northwest'**
  String get compassNorthwest;

  /// Screen-reader label for the compass dial
  ///
  /// In en, this message translates to:
  /// **'Heading {degrees}°, {direction}'**
  String compassSemantics(String degrees, String direction);

  /// No description provided for @compassHeadingMagnetic.
  ///
  /// In en, this message translates to:
  /// **'Magnetic heading'**
  String get compassHeadingMagnetic;

  /// No description provided for @compassUnavailable.
  ///
  /// In en, this message translates to:
  /// **'This device has no magnetometer, so the compass can\'t work.'**
  String get compassUnavailable;

  /// No description provided for @locationSavedHeader.
  ///
  /// In en, this message translates to:
  /// **'Saved locations'**
  String get locationSavedHeader;

  /// Count shown next to the Saved locations header
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{None yet} =1{1 saved} other{{count} saved}}'**
  String locationSavedCount(int count);

  /// {save} is the Save button label
  ///
  /// In en, this message translates to:
  /// **'No saved locations yet.\nTap {save} to bookmark where you are.'**
  String locationEmpty(String save);

  /// Snackbar with an Undo action
  ///
  /// In en, this message translates to:
  /// **'“{name}” deleted'**
  String locationDeleted(String name);

  /// No description provided for @locationSaveDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Save location'**
  String get locationSaveDialogTitle;

  /// No description provided for @locationNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get locationNameLabel;

  /// No description provided for @locationNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Home, Office…'**
  String get locationNameHint;

  /// No description provided for @locationNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Note (optional)'**
  String get locationNoteLabel;

  /// No description provided for @locationCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current location'**
  String get locationCurrent;

  /// Tooltip
  ///
  /// In en, this message translates to:
  /// **'Update location'**
  String get locationRefresh;

  /// No description provided for @locationLocating.
  ///
  /// In en, this message translates to:
  /// **'Finding your location…'**
  String get locationLocating;

  /// No description provided for @locationServicesOff.
  ///
  /// In en, this message translates to:
  /// **'Location is turned off. Turn it on to see where you are.'**
  String get locationServicesOff;

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Allow location access to see where you are.'**
  String get locationPermissionDenied;

  /// No description provided for @locationPermissionDeniedForever.
  ///
  /// In en, this message translates to:
  /// **'Location access is blocked. Allow it in Settings to use this tool.'**
  String get locationPermissionDeniedForever;

  /// No description provided for @locationErrorTimeout.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t get a GPS fix. Move near a window or outside and try again.'**
  String get locationErrorTimeout;

  /// Button that asks for the location permission again
  ///
  /// In en, this message translates to:
  /// **'Allow access'**
  String get locationAllow;

  /// {meters} is an already formatted number
  ///
  /// In en, this message translates to:
  /// **'Accuracy: ±{meters} m'**
  String locationAccuracy(String meters);

  /// No description provided for @locationCoordsCopied.
  ///
  /// In en, this message translates to:
  /// **'Coordinates copied'**
  String get locationCoordsCopied;

  /// Tooltip
  ///
  /// In en, this message translates to:
  /// **'Copy coordinates'**
  String get locationCopyCoords;

  /// Tooltip
  ///
  /// In en, this message translates to:
  /// **'Open in Maps'**
  String get locationOpenInMaps;

  /// No description provided for @passwordYours.
  ///
  /// In en, this message translates to:
  /// **'Your password'**
  String get passwordYours;

  /// No description provided for @passwordSelectType.
  ///
  /// In en, this message translates to:
  /// **'Select at least one character type'**
  String get passwordSelectType;

  /// No description provided for @passwordStrength.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get passwordStrength;

  /// Password strength
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get passwordWeak;

  /// Password strength
  ///
  /// In en, this message translates to:
  /// **'Fair'**
  String get passwordFair;

  /// Password strength
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get passwordGood;

  /// Password strength
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get passwordStrong;

  /// No description provided for @passwordLength.
  ///
  /// In en, this message translates to:
  /// **'Length'**
  String get passwordLength;

  /// Password length
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 character} other{{count} characters}}'**
  String passwordChars(int count);

  /// Header above the character-type toggles
  ///
  /// In en, this message translates to:
  /// **'Include'**
  String get passwordInclude;

  /// No description provided for @passwordUppercase.
  ///
  /// In en, this message translates to:
  /// **'Uppercase'**
  String get passwordUppercase;

  /// No description provided for @passwordLowercase.
  ///
  /// In en, this message translates to:
  /// **'Lowercase'**
  String get passwordLowercase;

  /// No description provided for @passwordNumbers.
  ///
  /// In en, this message translates to:
  /// **'Numbers'**
  String get passwordNumbers;

  /// No description provided for @passwordSymbols.
  ///
  /// In en, this message translates to:
  /// **'Symbols'**
  String get passwordSymbols;

  /// No description provided for @passwordCopied.
  ///
  /// In en, this message translates to:
  /// **'Password copied'**
  String get passwordCopied;

  /// Button: create another password
  ///
  /// In en, this message translates to:
  /// **'Generate new'**
  String get passwordGenerate;

  /// No description provided for @hashModeText.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get hashModeText;

  /// No description provided for @hashModeFile.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get hashModeFile;

  /// No description provided for @hashAlgorithm.
  ///
  /// In en, this message translates to:
  /// **'Algorithm'**
  String get hashAlgorithm;

  /// No description provided for @hashInputHint.
  ///
  /// In en, this message translates to:
  /// **'Enter text to hash…'**
  String get hashInputHint;

  /// No description provided for @hashPickFile.
  ///
  /// In en, this message translates to:
  /// **'Tap to choose a file'**
  String get hashPickFile;

  /// Button: pick a different file
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get hashChange;

  /// No description provided for @hashHashing.
  ///
  /// In en, this message translates to:
  /// **'Calculating…'**
  String get hashHashing;

  /// No description provided for @hashGenerate.
  ///
  /// In en, this message translates to:
  /// **'Generate hash'**
  String get hashGenerate;

  /// No description provided for @hashFileError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t read this file. Try another one.'**
  String get hashFileError;

  /// No description provided for @hashCopied.
  ///
  /// In en, this message translates to:
  /// **'Hash copied'**
  String get hashCopied;

  /// Tooltip
  ///
  /// In en, this message translates to:
  /// **'Copy hash'**
  String get hashCopy;

  /// Tool screen string (colorPickerFormats)
  ///
  /// In en, this message translates to:
  /// **'Color formats'**
  String get colorPickerFormats;

  /// Tool screen string (colorPickerHexLabel)
  ///
  /// In en, this message translates to:
  /// **'HEX color'**
  String get colorPickerHexLabel;

  /// Tool screen string (colorPickerHexInvalid)
  ///
  /// In en, this message translates to:
  /// **'Enter 6 hex digits (0–9, A–F)'**
  String get colorPickerHexInvalid;

  /// Tool screen string (colorPickerApply)
  ///
  /// In en, this message translates to:
  /// **'Apply color'**
  String get colorPickerApply;

  /// Tool screen string (colorPickerCopied)
  ///
  /// In en, this message translates to:
  /// **'{format} copied'**
  String colorPickerCopied(String format);

  /// Tool screen string (colorPickerPalette)
  ///
  /// In en, this message translates to:
  /// **'Quick palette'**
  String get colorPickerPalette;

  /// Tool screen string (colorPickerSwatch)
  ///
  /// In en, this message translates to:
  /// **'Color {hex}'**
  String colorPickerSwatch(String hex);

  /// Tool screen string (imgCompressPickHint)
  ///
  /// In en, this message translates to:
  /// **'Tap to choose or take a photo'**
  String get imgCompressPickHint;

  /// Tool screen string (imgCompressSupported)
  ///
  /// In en, this message translates to:
  /// **'Supports {formats}'**
  String imgCompressSupported(String formats);

  /// Tool screen string (imgCompressChange)
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get imgCompressChange;

  /// Tool screen string (imgCompressModeQuality)
  ///
  /// In en, this message translates to:
  /// **'By quality'**
  String get imgCompressModeQuality;

  /// Tool screen string (imgCompressModeTarget)
  ///
  /// In en, this message translates to:
  /// **'Target size'**
  String get imgCompressModeTarget;

  /// Tool screen string (imgCompressQuality)
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get imgCompressQuality;

  /// Tool screen string (imgCompressSmallest)
  ///
  /// In en, this message translates to:
  /// **'Smallest file'**
  String get imgCompressSmallest;

  /// Tool screen string (imgCompressBestQuality)
  ///
  /// In en, this message translates to:
  /// **'Best quality'**
  String get imgCompressBestQuality;

  /// Tool screen string (imgCompressQualityNote)
  ///
  /// In en, this message translates to:
  /// **'Large photos are also resized to about 1920×1080.'**
  String get imgCompressQualityNote;

  /// Tool screen string (imgCompressTargetUnder)
  ///
  /// In en, this message translates to:
  /// **'Under {size}'**
  String imgCompressTargetUnder(String size);

  /// Tool screen string (imgCompressTargetHint)
  ///
  /// In en, this message translates to:
  /// **'Keeps the best quality that fits the limit — handy for job and government form uploads.'**
  String get imgCompressTargetHint;

  /// Tool screen string (imgCompressButton)
  ///
  /// In en, this message translates to:
  /// **'Compress photo'**
  String get imgCompressButton;

  /// Tool screen string (imgCompressCompressing)
  ///
  /// In en, this message translates to:
  /// **'Compressing…'**
  String get imgCompressCompressing;

  /// Tool screen string (imgCompressSuccess)
  ///
  /// In en, this message translates to:
  /// **'Compressed successfully!'**
  String get imgCompressSuccess;

  /// Tool screen string (imgCompressFitsTarget)
  ///
  /// In en, this message translates to:
  /// **'Done — fits under {size}'**
  String imgCompressFitsTarget(String size);

  /// Tool screen string (imgCompressMissedTarget)
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t get under {size}. This is the smallest version we could make.'**
  String imgCompressMissedTarget(String size);

  /// Tool screen string (imgCompressStatOriginal)
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get imgCompressStatOriginal;

  /// Tool screen string (imgCompressStatCompressed)
  ///
  /// In en, this message translates to:
  /// **'Compressed'**
  String get imgCompressStatCompressed;

  /// Tool screen string (imgCompressStatSaved)
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get imgCompressStatSaved;

  /// Tool screen string (imgCompressFailed)
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t compress this photo. Try another one.'**
  String get imgCompressFailed;

  /// Tool screen string (imgResizePresetPassport)
  ///
  /// In en, this message translates to:
  /// **'Passport 35×45 mm'**
  String get imgResizePresetPassport;

  /// Tool screen string (imgResizePresetSquare)
  ///
  /// In en, this message translates to:
  /// **'Square {size}'**
  String imgResizePresetSquare(String size);

  /// Tool screen string (imgResizePresetStory)
  ///
  /// In en, this message translates to:
  /// **'Story {size}'**
  String imgResizePresetStory(String size);

  /// Tool screen string (imgResizePresetMax)
  ///
  /// In en, this message translates to:
  /// **'{name} (max {px})'**
  String imgResizePresetMax(String name, String px);

  /// Tool screen string (imgResizeChoosePhotos)
  ///
  /// In en, this message translates to:
  /// **'Choose photos'**
  String get imgResizeChoosePhotos;

  /// Tool screen string (imgResizeSelected)
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 photo selected} other{{count} photos selected}}'**
  String imgResizeSelected(int count);

  /// Tool screen string (imgResizePickHint)
  ///
  /// In en, this message translates to:
  /// **'Pick one or many — or share them to the app'**
  String get imgResizePickHint;

  /// Tool screen string (imgResizeChoose)
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get imgResizeChoose;

  /// Tool screen string (imgResizeChange)
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get imgResizeChange;

  /// Tool screen string (imgResizePresets)
  ///
  /// In en, this message translates to:
  /// **'Presets'**
  String get imgResizePresets;

  /// Tool screen string (imgResizeModePercent)
  ///
  /// In en, this message translates to:
  /// **'Percent'**
  String get imgResizeModePercent;

  /// Tool screen string (imgResizeModeMaxSide)
  ///
  /// In en, this message translates to:
  /// **'Max side'**
  String get imgResizeModeMaxSide;

  /// Tool screen string (imgResizeModeExact)
  ///
  /// In en, this message translates to:
  /// **'Exact'**
  String get imgResizeModeExact;

  /// Tool screen string (imgResizeWidth)
  ///
  /// In en, this message translates to:
  /// **'Width (px)'**
  String get imgResizeWidth;

  /// Tool screen string (imgResizeHeight)
  ///
  /// In en, this message translates to:
  /// **'Height (px)'**
  String get imgResizeHeight;

  /// Tool screen string (imgResizeCrop)
  ///
  /// In en, this message translates to:
  /// **'Crop to fit (no stretching)'**
  String get imgResizeCrop;

  /// Tool screen string (imgResizeFormat)
  ///
  /// In en, this message translates to:
  /// **'Format'**
  String get imgResizeFormat;

  /// Tool screen string (imgResizeQuality)
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get imgResizeQuality;

  /// Tool screen string (imgResizeButton)
  ///
  /// In en, this message translates to:
  /// **'Resize'**
  String get imgResizeButton;

  /// Tool screen string (imgResizeSaveAll)
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Save 1 photo to gallery} other{Save {count} photos to gallery}}'**
  String imgResizeSaveAll(int count);

  /// Tool screen string (imgResizeChangeSettings)
  ///
  /// In en, this message translates to:
  /// **'Change settings'**
  String get imgResizeChangeSettings;

  /// Tool screen string (imgResizeInvalidSize)
  ///
  /// In en, this message translates to:
  /// **'Enter a width and height between {min} and {max}.'**
  String imgResizeInvalidSize(int min, int max);

  /// Tool screen string (imgResizeFailedCount)
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 photo couldn\'t be read.} other{{count} photos couldn\'t be read.}}'**
  String imgResizeFailedCount(int count);

  /// Tool screen string (imgResizeSavedCount)
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Saved 1 photo to your gallery} other{Saved {count} photos to your gallery}}'**
  String imgResizeSavedCount(int count);

  /// Tool screen string (imgEnhanceEmptyTitle)
  ///
  /// In en, this message translates to:
  /// **'Edit your photos'**
  String get imgEnhanceEmptyTitle;

  /// Tool screen string (imgEnhanceEmptyBody)
  ///
  /// In en, this message translates to:
  /// **'Adjust brightness, contrast, saturation and sharpness, apply presets, rotate and flip — all on your device.'**
  String get imgEnhanceEmptyBody;

  /// Tool screen string (imgEnhanceFineControls)
  ///
  /// In en, this message translates to:
  /// **'Fine controls'**
  String get imgEnhanceFineControls;

  /// Tool screen string (imgEnhanceApplying)
  ///
  /// In en, this message translates to:
  /// **'Applying…'**
  String get imgEnhanceApplying;

  /// Tool screen string (imgEnhanceChange)
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get imgEnhanceChange;

  /// Tool screen string (imgEnhancePresets)
  ///
  /// In en, this message translates to:
  /// **'Presets'**
  String get imgEnhancePresets;

  /// Tool screen string (imgEnhanceTransform)
  ///
  /// In en, this message translates to:
  /// **'Transform'**
  String get imgEnhanceTransform;

  /// Tool screen string (imgEnhanceAdjustments)
  ///
  /// In en, this message translates to:
  /// **'Adjustments'**
  String get imgEnhanceAdjustments;

  /// Tool screen string (imgEnhanceRotate)
  ///
  /// In en, this message translates to:
  /// **'Rotate'**
  String get imgEnhanceRotate;

  /// Tool screen string (imgEnhanceFlipH)
  ///
  /// In en, this message translates to:
  /// **'Flip horizontal'**
  String get imgEnhanceFlipH;

  /// Tool screen string (imgEnhanceFlipV)
  ///
  /// In en, this message translates to:
  /// **'Flip vertical'**
  String get imgEnhanceFlipV;

  /// Tool screen string (imgEnhanceBrightness)
  ///
  /// In en, this message translates to:
  /// **'Brightness'**
  String get imgEnhanceBrightness;

  /// Tool screen string (imgEnhanceContrast)
  ///
  /// In en, this message translates to:
  /// **'Contrast'**
  String get imgEnhanceContrast;

  /// Tool screen string (imgEnhanceSaturation)
  ///
  /// In en, this message translates to:
  /// **'Saturation'**
  String get imgEnhanceSaturation;

  /// Tool screen string (imgEnhanceSharpen)
  ///
  /// In en, this message translates to:
  /// **'Sharpen'**
  String get imgEnhanceSharpen;

  /// Tool screen string (imgEnhanceBlur)
  ///
  /// In en, this message translates to:
  /// **'Blur'**
  String get imgEnhanceBlur;

  /// Tool screen string (imgEnhanceQuality)
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get imgEnhanceQuality;

  /// Tool screen string (imgEnhanceApply)
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get imgEnhanceApply;

  /// Tool screen string (imgEnhanceFailed)
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t apply the edits. Try another photo.'**
  String get imgEnhanceFailed;

  /// Tool screen string (imgEnhanceResult)
  ///
  /// In en, this message translates to:
  /// **'Done! {before} → {after} ({change})'**
  String imgEnhanceResult(String before, String after, String change);

  /// Tool screen string (imgEnhancePresetOriginal)
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get imgEnhancePresetOriginal;

  /// Tool screen string (imgEnhancePresetVivid)
  ///
  /// In en, this message translates to:
  /// **'Vivid'**
  String get imgEnhancePresetVivid;

  /// Tool screen string (imgEnhancePresetCool)
  ///
  /// In en, this message translates to:
  /// **'Cool'**
  String get imgEnhancePresetCool;

  /// Tool screen string (imgEnhancePresetWarm)
  ///
  /// In en, this message translates to:
  /// **'Warm'**
  String get imgEnhancePresetWarm;

  /// Tool screen string (imgEnhancePresetDramatic)
  ///
  /// In en, this message translates to:
  /// **'Dramatic'**
  String get imgEnhancePresetDramatic;

  /// Tool screen string (imgEnhancePresetFade)
  ///
  /// In en, this message translates to:
  /// **'Fade'**
  String get imgEnhancePresetFade;

  /// Tool screen string (imgEnhancePresetVintage)
  ///
  /// In en, this message translates to:
  /// **'Vintage'**
  String get imgEnhancePresetVintage;

  /// Tool screen string (imgEnhancePresetNoir)
  ///
  /// In en, this message translates to:
  /// **'Noir'**
  String get imgEnhancePresetNoir;

  /// Tool screen string (upscalerNewImage)
  ///
  /// In en, this message translates to:
  /// **'New photo'**
  String get upscalerNewImage;

  /// Tool screen string (upscalerIntro)
  ///
  /// In en, this message translates to:
  /// **'Enlarge photos up to 4× with on-device AI. Works offline after a one-time model download — optional cloud mode for faces.'**
  String get upscalerIntro;

  /// Tool screen string (upscalerBadgeOnDevice)
  ///
  /// In en, this message translates to:
  /// **'On-device AI'**
  String get upscalerBadgeOnDevice;

  /// Tool screen string (upscalerBadgeOffline)
  ///
  /// In en, this message translates to:
  /// **'Works offline'**
  String get upscalerBadgeOffline;

  /// Tool screen string (upscalerBadgeUpTo4x)
  ///
  /// In en, this message translates to:
  /// **'Up to 4× bigger'**
  String get upscalerBadgeUpTo4x;

  /// Tool screen string (upscalerBadgeGpu)
  ///
  /// In en, this message translates to:
  /// **'GPU accelerated'**
  String get upscalerBadgeGpu;

  /// Tool screen string (upscalerBestResults)
  ///
  /// In en, this message translates to:
  /// **'Best results: low-res photos, old scans, thumbnails and compressed JPEGs.'**
  String get upscalerBestResults;

  /// Tool screen string (upscalerChangeImage)
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get upscalerChangeImage;

  /// Tool screen string (upscalerTabOriginal)
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get upscalerTabOriginal;

  /// Tool screen string (upscalerTabUpscaled)
  ///
  /// In en, this message translates to:
  /// **'AI upscaled'**
  String get upscalerTabUpscaled;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Starting…'**
  String get upscalerStageStarting;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Connecting to the AI server…'**
  String get upscalerStageConnecting;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Processing on this device…'**
  String get upscalerStageOnDevice;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Cloud unavailable — processing on this device…'**
  String get upscalerStageCloudUnavailable;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Uploading photo…'**
  String get upscalerStageUploading;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'AI is restoring faces and detail…'**
  String get upscalerStageRestoringFaces;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Preparing photo…'**
  String get upscalerStagePreparing;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Loading AI model…'**
  String get upscalerStageLoadingModel;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Downloading AI model (one time)…'**
  String get upscalerStageDownloadingModel;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Using standard upscaling…'**
  String get upscalerStageFallback;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Reading photo…'**
  String get upscalerStageDecoding;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Resizing input ({from} → {to})…'**
  String upscalerStageResizing(String from, String to);

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Reducing noise…'**
  String get upscalerStageDenoising;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Upscaling ({factor}×)…'**
  String upscalerStageUpscaling(String factor);

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'AI upscaling… ({done}/{total})'**
  String upscalerStageAiTiles(String done, String total);

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Sharpening…'**
  String get upscalerStageSharpening;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Adjusting colours…'**
  String get upscalerStageColour;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get upscalerStageSaving;

  /// Tool screen string (upscaler)
  ///
  /// In en, this message translates to:
  /// **'Done!'**
  String get upscalerStageDone;

  /// Tool screen string (upscalerLoadingModelHint)
  ///
  /// In en, this message translates to:
  /// **'Loading the AI model (first time only)'**
  String get upscalerLoadingModelHint;

  /// Tool screen string (upscalerTime4x)
  ///
  /// In en, this message translates to:
  /// **'4× upscaling can take 15–60 s depending on photo size.'**
  String get upscalerTime4x;

  /// Tool screen string (upscalerTime2x)
  ///
  /// In en, this message translates to:
  /// **'2× upscaling usually takes 5–20 s.'**
  String get upscalerTime2x;

  /// Tool screen string (upscalerDoneIn)
  ///
  /// In en, this message translates to:
  /// **'Upscaled in {seconds} s'**
  String upscalerDoneIn(String seconds);

  /// Tool screen string (upscalerStatResolution)
  ///
  /// In en, this message translates to:
  /// **'Resolution'**
  String get upscalerStatResolution;

  /// Tool screen string (upscalerStatFileSize)
  ///
  /// In en, this message translates to:
  /// **'File size'**
  String get upscalerStatFileSize;

  /// Tool screen string (upscalerStatScale)
  ///
  /// In en, this message translates to:
  /// **'Scale'**
  String get upscalerStatScale;

  /// Tool screen string (upscalerShareSubject)
  ///
  /// In en, this message translates to:
  /// **'AI upscaled photo'**
  String get upscalerShareSubject;

  /// Tool screen string (upscalerFallbackModelUnavailable)
  ///
  /// In en, this message translates to:
  /// **'AI model needs internet once — used standard upscaling'**
  String get upscalerFallbackModelUnavailable;

  /// Tool screen string (upscalerFallbackModelFailed)
  ///
  /// In en, this message translates to:
  /// **'The AI model couldn\'t run on this device — used standard upscaling'**
  String get upscalerFallbackModelFailed;

  /// Tool screen string (upscalerFallbackCloud)
  ///
  /// In en, this message translates to:
  /// **'Cloud server unavailable — processed on this device'**
  String get upscalerFallbackCloud;

  /// Tool screen string (upscalerSettings)
  ///
  /// In en, this message translates to:
  /// **'AI settings'**
  String get upscalerSettings;

  /// Tool screen string (upscalerFactorLabel)
  ///
  /// In en, this message translates to:
  /// **'Upscale factor'**
  String get upscalerFactorLabel;

  /// Tool screen string (upscalerFactor2xDesc)
  ///
  /// In en, this message translates to:
  /// **'Fast — great for most photos'**
  String get upscalerFactor2xDesc;

  /// Tool screen string (upscalerFactor4xDesc)
  ///
  /// In en, this message translates to:
  /// **'Best quality — slower'**
  String get upscalerFactor4xDesc;

  /// Tool screen string (upscalerOptimiseFor)
  ///
  /// In en, this message translates to:
  /// **'Optimise for'**
  String get upscalerOptimiseFor;

  /// Tool screen string (upscalerModeAuto)
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get upscalerModeAuto;

  /// Tool screen string (upscalerModePhoto)
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get upscalerModePhoto;

  /// Tool screen string (upscalerModeIllustration)
  ///
  /// In en, this message translates to:
  /// **'Illustration'**
  String get upscalerModeIllustration;

  /// Tool screen string (upscalerModeFace)
  ///
  /// In en, this message translates to:
  /// **'Face detail'**
  String get upscalerModeFace;

  /// Tool screen string (upscalerDenoise)
  ///
  /// In en, this message translates to:
  /// **'Pre-denoise'**
  String get upscalerDenoise;

  /// Tool screen string (upscalerDenoiseTip)
  ///
  /// In en, this message translates to:
  /// **'Reduces JPEG noise before upscaling'**
  String get upscalerDenoiseTip;

  /// Tool screen string (upscalerSharpen)
  ///
  /// In en, this message translates to:
  /// **'Post-sharpen'**
  String get upscalerSharpen;

  /// Tool screen string (upscalerSharpenTip)
  ///
  /// In en, this message translates to:
  /// **'Adds crispness after upscaling'**
  String get upscalerSharpenTip;

  /// Tool screen string (upscalerCloudTitle)
  ///
  /// In en, this message translates to:
  /// **'Cloud face enhancement'**
  String get upscalerCloudTitle;

  /// Tool screen string (upscalerCloudOn)
  ///
  /// In en, this message translates to:
  /// **'Your photo is uploaded to our server for processing.'**
  String get upscalerCloudOn;

  /// Tool screen string (upscalerCloudOff)
  ///
  /// In en, this message translates to:
  /// **'Off — photos stay on this device.'**
  String get upscalerCloudOff;

  /// Tool screen string (upscalerCloudDialogTitle)
  ///
  /// In en, this message translates to:
  /// **'Send photos to the cloud?'**
  String get upscalerCloudDialogTitle;

  /// Tool screen string (upscalerCloudDialogBody)
  ///
  /// In en, this message translates to:
  /// **'Cloud mode uploads the photo you selected to our upscaling server over an encrypted connection so it can be processed with a larger AI model (GFPGAN + Real-ESRGAN).\n\n• Only the photo you choose to upscale is sent.\n• The photo is processed in memory and is not kept after the result is returned.\n• No account or personal details are sent with it.\n\nYou can turn this off at any time. On-device mode works fully offline.'**
  String get upscalerCloudDialogBody;

  /// Tool screen string (upscalerCloudKeepLocal)
  ///
  /// In en, this message translates to:
  /// **'Keep on-device'**
  String get upscalerCloudKeepLocal;

  /// Tool screen string (upscalerCloudEnable)
  ///
  /// In en, this message translates to:
  /// **'Enable cloud'**
  String get upscalerCloudEnable;

  /// Tool screen string (upscalerUpscale)
  ///
  /// In en, this message translates to:
  /// **'Upscale with AI'**
  String get upscalerUpscale;

  /// Tool screen string (upscalerUpscaleAgain)
  ///
  /// In en, this message translates to:
  /// **'Upscale again with new settings'**
  String get upscalerUpscaleAgain;

  /// Tool screen string (upscalerFailed)
  ///
  /// In en, this message translates to:
  /// **'Upscale failed'**
  String get upscalerFailed;

  /// Tool screen string (upscalerErrorTooLarge)
  ///
  /// In en, this message translates to:
  /// **'The photo is too large. Try a smaller photo or 2× upscaling.'**
  String get upscalerErrorTooLarge;

  /// Tool screen string (upscalerErrorUnreadable)
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t read this photo. Use a JPG or PNG file.'**
  String get upscalerErrorUnreadable;

  /// Tool screen string (upscalerErrorNetwork)
  ///
  /// In en, this message translates to:
  /// **'Network timeout. Check your connection or turn off cloud mode.'**
  String get upscalerErrorNetwork;

  /// Tool screen string (videoPickHint)
  ///
  /// In en, this message translates to:
  /// **'Tap to pick a video'**
  String get videoPickHint;

  /// Tool screen string (videoProbeInfo)
  ///
  /// In en, this message translates to:
  /// **'Format: {format} · Duration: {duration}'**
  String videoProbeInfo(String format, String duration);

  /// Tool screen string (videoOutputFormat)
  ///
  /// In en, this message translates to:
  /// **'Output format'**
  String get videoOutputFormat;

  /// Tool screen string (videoFmtMostCompatible)
  ///
  /// In en, this message translates to:
  /// **'Most compatible'**
  String get videoFmtMostCompatible;

  /// Tool screen string (videoFmtApple)
  ///
  /// In en, this message translates to:
  /// **'Apple / QuickTime'**
  String get videoFmtApple;

  /// Tool screen string (videoFmtFlexible)
  ///
  /// In en, this message translates to:
  /// **'Flexible container'**
  String get videoFmtFlexible;

  /// Tool screen string (videoFmtLegacy)
  ///
  /// In en, this message translates to:
  /// **'Older format'**
  String get videoFmtLegacy;

  /// Tool screen string (videoFmtGif)
  ///
  /// In en, this message translates to:
  /// **'Animated (no audio)'**
  String get videoFmtGif;

  /// Tool screen string (videoFmtAudioOnly)
  ///
  /// In en, this message translates to:
  /// **'Audio only'**
  String get videoFmtAudioOnly;

  /// Tool screen string (videoFmtAudioAac)
  ///
  /// In en, this message translates to:
  /// **'Audio only (AAC)'**
  String get videoFmtAudioAac;

  /// Tool screen string (videoFmtAudioRaw)
  ///
  /// In en, this message translates to:
  /// **'Audio only (raw)'**
  String get videoFmtAudioRaw;

  /// Tool screen string (videoFmtWav)
  ///
  /// In en, this message translates to:
  /// **'Uncompressed audio'**
  String get videoFmtWav;

  /// Tool screen string (videoConvertingPercent)
  ///
  /// In en, this message translates to:
  /// **'Converting… {percent}%'**
  String videoConvertingPercent(int percent);

  /// Tool screen string (videoConvertingWait)
  ///
  /// In en, this message translates to:
  /// **'Converting… this may take a while'**
  String get videoConvertingWait;

  /// Tool screen string (videoDone)
  ///
  /// In en, this message translates to:
  /// **'Conversion complete!'**
  String get videoDone;

  /// Tool screen string (videoErrorUnsupported)
  ///
  /// In en, this message translates to:
  /// **'Conversion failed. This format may not be supported on your device.'**
  String get videoErrorUnsupported;

  /// Tool screen string (videoConvertAnother)
  ///
  /// In en, this message translates to:
  /// **'Convert another'**
  String get videoConvertAnother;

  /// Tool screen string (videoPickButton)
  ///
  /// In en, this message translates to:
  /// **'Pick video file'**
  String get videoPickButton;

  /// Tool screen string (videoConvertTo)
  ///
  /// In en, this message translates to:
  /// **'Convert to {format}'**
  String videoConvertTo(String format);

  /// No description provided for @docScanAndroidOnly.
  ///
  /// In en, this message translates to:
  /// **'The document scanner is available on Android.'**
  String get docScanAndroidOnly;

  /// No description provided for @docScanNeedsPlayServices.
  ///
  /// In en, this message translates to:
  /// **'The scanner couldn’t start. It needs Google Play services — make sure they are up to date. ({details})'**
  String docScanNeedsPlayServices(String details);

  /// No description provided for @docScanStartFailed.
  ///
  /// In en, this message translates to:
  /// **'The scanner couldn’t start. Please try again.'**
  String get docScanStartFailed;

  /// No description provided for @docScanPdfSaved.
  ///
  /// In en, this message translates to:
  /// **'PDF saved to Downloads — find it in My Files'**
  String get docScanPdfSaved;

  /// No description provided for @docScanPagesSaved.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Saved 1 page to your gallery} other{Saved {count} pages to your gallery}}'**
  String docScanPagesSaved(int count);

  /// No description provided for @docScanHeadline.
  ///
  /// In en, this message translates to:
  /// **'Scan paper into a clean PDF'**
  String get docScanHeadline;

  /// No description provided for @docScanIntro.
  ///
  /// In en, this message translates to:
  /// **'Edges are found automatically. Add as many pages as you like, crop, rotate and apply filters before saving.'**
  String get docScanIntro;

  /// No description provided for @docScanScanning.
  ///
  /// In en, this message translates to:
  /// **'Scanning…'**
  String get docScanScanning;

  /// No description provided for @docScanStart.
  ///
  /// In en, this message translates to:
  /// **'Start scanning'**
  String get docScanStart;

  /// No description provided for @docScanScannedPages.
  ///
  /// In en, this message translates to:
  /// **'Scanned pages'**
  String get docScanScannedPages;

  /// No description provided for @docScanPageCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 page} other{{count} pages}}'**
  String docScanPageCount(int count);

  /// No description provided for @docScanSavePdf.
  ///
  /// In en, this message translates to:
  /// **'Save PDF'**
  String get docScanSavePdf;

  /// No description provided for @docScanSharePdf.
  ///
  /// In en, this message translates to:
  /// **'Share PDF'**
  String get docScanSharePdf;

  /// No description provided for @docScanCopyText.
  ///
  /// In en, this message translates to:
  /// **'Copy text'**
  String get docScanCopyText;

  /// No description provided for @docScanSaveJpg.
  ///
  /// In en, this message translates to:
  /// **'Save as JPG'**
  String get docScanSaveJpg;

  /// No description provided for @docScanAnother.
  ///
  /// In en, this message translates to:
  /// **'Scan another document'**
  String get docScanAnother;

  /// No description provided for @pdfToolsChoosePdf.
  ///
  /// In en, this message translates to:
  /// **'Choose a PDF'**
  String get pdfToolsChoosePdf;

  /// No description provided for @pdfToolsChooseHint.
  ///
  /// In en, this message translates to:
  /// **'Or share a PDF to Utility Toolbox from any app'**
  String get pdfToolsChooseHint;

  /// No description provided for @pdfToolsReading.
  ///
  /// In en, this message translates to:
  /// **'Reading…'**
  String get pdfToolsReading;

  /// No description provided for @pdfToolsLockedShort.
  ///
  /// In en, this message translates to:
  /// **'Password protected'**
  String get pdfToolsLockedShort;

  /// No description provided for @pdfToolsPageCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 page} other{{count} pages}}'**
  String pdfToolsPageCount(int count);

  /// No description provided for @pdfToolsChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get pdfToolsChange;

  /// No description provided for @pdfToolsResultReady.
  ///
  /// In en, this message translates to:
  /// **'Your PDF is ready'**
  String get pdfToolsResultReady;

  /// No description provided for @pdfToolsSaveDownloads.
  ///
  /// In en, this message translates to:
  /// **'Save to Downloads'**
  String get pdfToolsSaveDownloads;

  /// No description provided for @pdfToolsStartOver.
  ///
  /// In en, this message translates to:
  /// **'Start over'**
  String get pdfToolsStartOver;

  /// No description provided for @pdfToolsSavedToDownloads.
  ///
  /// In en, this message translates to:
  /// **'Saved to Downloads — find it in My Files'**
  String get pdfToolsSavedToDownloads;

  /// No description provided for @pdfToolsSharedInstead.
  ///
  /// In en, this message translates to:
  /// **'Opened the share sheet instead'**
  String get pdfToolsSharedInstead;

  /// No description provided for @pdfToolsRangeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Enter at least one page.'**
  String get pdfToolsRangeEmpty;

  /// No description provided for @pdfToolsRangeInvalid.
  ///
  /// In en, this message translates to:
  /// **'“{part}” isn’t a page or range (e.g. 1-3, 5).'**
  String pdfToolsRangeInvalid(String part);

  /// No description provided for @pdfToolsRangeOutside.
  ///
  /// In en, this message translates to:
  /// **'“{part}” is outside 1–{count}.'**
  String pdfToolsRangeOutside(String part, int count);

  /// No description provided for @pdfToolsInvalidPdf.
  ///
  /// In en, this message translates to:
  /// **'This file doesn’t look like a valid PDF.'**
  String get pdfToolsInvalidPdf;

  /// No description provided for @pdfToolsLockedUnlockFirst.
  ///
  /// In en, this message translates to:
  /// **'This PDF is password protected. Unlock it first with {tool}.'**
  String pdfToolsLockedUnlockFirst(String tool);

  /// No description provided for @pdfToolsPagesLabel.
  ///
  /// In en, this message translates to:
  /// **'Pages (1–{count})'**
  String pdfToolsPagesLabel(int count);

  /// No description provided for @pdfToolsPagesHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. {example}'**
  String pdfToolsPagesHint(String example);

  /// No description provided for @pdfToolsPageN.
  ///
  /// In en, this message translates to:
  /// **'Page {number}'**
  String pdfToolsPageN(int number);

  /// No description provided for @pdfToolsDownload.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get pdfToolsDownload;

  /// No description provided for @pdfToolsSavedNotification.
  ///
  /// In en, this message translates to:
  /// **'Saved to Downloads — check your notification to open it.'**
  String get pdfToolsSavedNotification;

  /// No description provided for @pdfToolsShareToSave.
  ///
  /// In en, this message translates to:
  /// **'Opened share sheet — choose where to save the file.'**
  String get pdfToolsShareToSave;

  /// No description provided for @pdfToolsSelectedFile.
  ///
  /// In en, this message translates to:
  /// **'Selected: {name}'**
  String pdfToolsSelectedFile(String name);

  /// No description provided for @pdfToolsSize.
  ///
  /// In en, this message translates to:
  /// **'Size: {size}'**
  String pdfToolsSize(String size);

  /// No description provided for @pdfToolsDragToReorder.
  ///
  /// In en, this message translates to:
  /// **'Drag to reorder'**
  String get pdfToolsDragToReorder;

  /// No description provided for @pdfHomeTitle.
  ///
  /// In en, this message translates to:
  /// **'PDF Toolkit'**
  String get pdfHomeTitle;

  /// No description provided for @pdfHomeSection.
  ///
  /// In en, this message translates to:
  /// **'PDF Tools'**
  String get pdfHomeSection;

  /// No description provided for @pdfHomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create, combine, and optimize your documents'**
  String get pdfHomeSubtitle;

  /// No description provided for @pdfPasswordEnter.
  ///
  /// In en, this message translates to:
  /// **'Enter a password.'**
  String get pdfPasswordEnter;

  /// No description provided for @pdfPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Use at least {count} characters.'**
  String pdfPasswordTooShort(int count);

  /// No description provided for @pdfPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'The passwords don’t match.'**
  String get pdfPasswordMismatch;

  /// No description provided for @pdfPasswordWrong.
  ///
  /// In en, this message translates to:
  /// **'That password is not correct.'**
  String get pdfPasswordWrong;

  /// No description provided for @pdfPasswordLockFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t lock this PDF.'**
  String get pdfPasswordLockFailed;

  /// No description provided for @pdfPasswordUnlockFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t unlock this PDF.'**
  String get pdfPasswordUnlockFailed;

  /// No description provided for @pdfPasswordLockedDone.
  ///
  /// In en, this message translates to:
  /// **'Your PDF is locked'**
  String get pdfPasswordLockedDone;

  /// No description provided for @pdfPasswordRemovedDone.
  ///
  /// In en, this message translates to:
  /// **'Password removed'**
  String get pdfPasswordRemovedDone;

  /// No description provided for @pdfPasswordAlreadyLocked.
  ///
  /// In en, this message translates to:
  /// **'This PDF already has a password. Unlock it first.'**
  String get pdfPasswordAlreadyLocked;

  /// No description provided for @pdfPasswordNotLocked.
  ///
  /// In en, this message translates to:
  /// **'This PDF has no password — nothing to unlock.'**
  String get pdfPasswordNotLocked;

  /// No description provided for @pdfPasswordNew.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get pdfPasswordNew;

  /// No description provided for @pdfPasswordCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get pdfPasswordCurrent;

  /// No description provided for @pdfPasswordRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat password'**
  String get pdfPasswordRepeat;

  /// No description provided for @pdfPasswordShow.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get pdfPasswordShow;

  /// No description provided for @pdfPasswordHide.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get pdfPasswordHide;

  /// No description provided for @pdfPasswordWarning.
  ///
  /// In en, this message translates to:
  /// **'Keep this password safe — it can’t be recovered. Encrypted with AES-256.'**
  String get pdfPasswordWarning;

  /// No description provided for @pdfSplitExtract.
  ///
  /// In en, this message translates to:
  /// **'Extract pages'**
  String get pdfSplitExtract;

  /// No description provided for @pdfSplitRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove pages'**
  String get pdfSplitRemove;

  /// No description provided for @pdfSplitPagesHelp.
  ///
  /// In en, this message translates to:
  /// **'Use commas and ranges. “8-” means page 8 to the end.'**
  String get pdfSplitPagesHelp;

  /// No description provided for @pdfSplitRemovesAll.
  ///
  /// In en, this message translates to:
  /// **'That would remove every page.'**
  String get pdfSplitRemovesAll;

  /// No description provided for @pdfSplitFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t split this PDF.'**
  String get pdfSplitFailed;

  /// No description provided for @pdfToImagesFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t render this PDF.'**
  String get pdfToImagesFailed;

  /// No description provided for @pdfToImagesSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved {saved} of {total} images to your gallery'**
  String pdfToImagesSaved(int saved, int total);

  /// No description provided for @pdfToImagesAllPages.
  ///
  /// In en, this message translates to:
  /// **'All pages'**
  String get pdfToImagesAllPages;

  /// No description provided for @pdfToImagesConvert.
  ///
  /// In en, this message translates to:
  /// **'Convert to JPG'**
  String get pdfToImagesConvert;

  /// No description provided for @pdfToImagesRendered.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Rendered 1 page…} other{Rendered {count} pages…}}'**
  String pdfToImagesRendered(int count);

  /// No description provided for @pdfToImagesRenderedOf.
  ///
  /// In en, this message translates to:
  /// **'Rendered {count} of {total} pages…'**
  String pdfToImagesRenderedOf(int count, int total);

  /// No description provided for @pdfToImagesSaveAll.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Save 1 image to gallery} other{Save {count} images to gallery}}'**
  String pdfToImagesSaveAll(int count);

  /// No description provided for @pdfCompressButton.
  ///
  /// In en, this message translates to:
  /// **'Compress'**
  String get pdfCompressButton;

  /// No description provided for @pdfCompressWorking.
  ///
  /// In en, this message translates to:
  /// **'Compressing PDF…'**
  String get pdfCompressWorking;

  /// No description provided for @pdfCompressOriginalSize.
  ///
  /// In en, this message translates to:
  /// **'Original size: {size}'**
  String pdfCompressOriginalSize(String size);

  /// No description provided for @pdfCompressIntro.
  ///
  /// In en, this message translates to:
  /// **'Choose a PDF file. Compression works best on image-heavy documents.'**
  String get pdfCompressIntro;

  /// No description provided for @pdfCompressLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get pdfCompressLow;

  /// No description provided for @pdfCompressMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get pdfCompressMedium;

  /// No description provided for @pdfCompressHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get pdfCompressHigh;

  /// No description provided for @pdfCompressFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not compress this PDF.'**
  String get pdfCompressFailed;

  /// No description provided for @pdfCompressBefore.
  ///
  /// In en, this message translates to:
  /// **'Before: {size}'**
  String pdfCompressBefore(String size);

  /// No description provided for @pdfCompressAfter.
  ///
  /// In en, this message translates to:
  /// **'After: {size}'**
  String pdfCompressAfter(String size);

  /// No description provided for @pdfMergeButton.
  ///
  /// In en, this message translates to:
  /// **'Merge'**
  String get pdfMergeButton;

  /// No description provided for @pdfMergeWorking.
  ///
  /// In en, this message translates to:
  /// **'Merging PDFs…'**
  String get pdfMergeWorking;

  /// No description provided for @pdfMergePick.
  ///
  /// In en, this message translates to:
  /// **'Pick PDF files'**
  String get pdfMergePick;

  /// No description provided for @pdfMergeIntro.
  ///
  /// In en, this message translates to:
  /// **'Select at least two PDF files to merge.'**
  String get pdfMergeIntro;

  /// No description provided for @pdfMergeFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not merge PDFs. One of the files may be unreadable.'**
  String get pdfMergeFailed;

  /// No description provided for @pdfMergeResult.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Merged PDF (1 page)} other{Merged PDF ({count} pages)}}'**
  String pdfMergeResult(int count);

  /// No description provided for @imageToPdfCreate.
  ///
  /// In en, this message translates to:
  /// **'Create PDF'**
  String get imageToPdfCreate;

  /// No description provided for @imageToPdfWorking.
  ///
  /// In en, this message translates to:
  /// **'Creating PDF…'**
  String get imageToPdfWorking;

  /// No description provided for @imageToPdfPick.
  ///
  /// In en, this message translates to:
  /// **'Pick images'**
  String get imageToPdfPick;

  /// No description provided for @imageToPdfIntro.
  ///
  /// In en, this message translates to:
  /// **'Select one or more images to convert.'**
  String get imageToPdfIntro;

  /// No description provided for @imageToPdfFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not create PDF. Please try different images.'**
  String get imageToPdfFailed;

  /// No description provided for @imageToPdfReady.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{PDF ready (1 page)} other{PDF ready ({count} pages)}}'**
  String imageToPdfReady(int count);

  /// No description provided for @qrScanNoCodeInPhoto.
  ///
  /// In en, this message translates to:
  /// **'No QR code or barcode found in this photo.'**
  String get qrScanNoCodeInPhoto;

  /// No description provided for @qrScanPhotoFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t read this photo.'**
  String get qrScanPhotoFailed;

  /// No description provided for @qrScanResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Scanned ({type})'**
  String qrScanResultTitle(String type);

  /// No description provided for @qrScanFromPhoto.
  ///
  /// In en, this message translates to:
  /// **'Scan from photo'**
  String get qrScanFromPhoto;

  /// No description provided for @qrScanCameraNeeded.
  ///
  /// In en, this message translates to:
  /// **'Camera access is needed to scan QR codes and barcodes.'**
  String get qrScanCameraNeeded;

  /// No description provided for @qrScanCameraError.
  ///
  /// In en, this message translates to:
  /// **'The camera couldn’t start. Close other camera apps and try again.'**
  String get qrScanCameraError;

  /// No description provided for @qrScanTorchOn.
  ///
  /// In en, this message translates to:
  /// **'Turn on flashlight'**
  String get qrScanTorchOn;

  /// No description provided for @qrScanTorchOff.
  ///
  /// In en, this message translates to:
  /// **'Turn off flashlight'**
  String get qrScanTorchOff;

  /// No description provided for @qrScanTypeLink.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get qrScanTypeLink;

  /// No description provided for @qrScanTypeWifi.
  ///
  /// In en, this message translates to:
  /// **'Wi‑Fi'**
  String get qrScanTypeWifi;

  /// No description provided for @qrScanTypeContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get qrScanTypeContact;

  /// No description provided for @qrScanTypeText.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get qrScanTypeText;

  /// No description provided for @qrGenInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Text or URL'**
  String get qrGenInputLabel;

  /// No description provided for @qrGenInputHint.
  ///
  /// In en, this message translates to:
  /// **'Enter content to encode'**
  String get qrGenInputHint;

  /// No description provided for @qrGenPreviewLabel.
  ///
  /// In en, this message translates to:
  /// **'QR code preview'**
  String get qrGenPreviewLabel;

  /// No description provided for @qrGenEmpty.
  ///
  /// In en, this message translates to:
  /// **'Enter text above to preview your QR code.'**
  String get qrGenEmpty;

  /// No description provided for @qrGenSaveGallery.
  ///
  /// In en, this message translates to:
  /// **'Save to Gallery'**
  String get qrGenSaveGallery;

  /// No description provided for @qrHomeTitle.
  ///
  /// In en, this message translates to:
  /// **'QR & Barcode'**
  String get qrHomeTitle;

  /// No description provided for @qrHomeTabScan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get qrHomeTabScan;

  /// No description provided for @qrHomeTabCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get qrHomeTabCreate;

  /// No description provided for @qrHomeScanTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan a code'**
  String get qrHomeScanTitle;

  /// No description provided for @qrHomeScanBody.
  ///
  /// In en, this message translates to:
  /// **'Point your camera at a QR code or barcode to scan it instantly.'**
  String get qrHomeScanBody;

  /// No description provided for @qrHomeBadgeInstant.
  ///
  /// In en, this message translates to:
  /// **'Instant'**
  String get qrHomeBadgeInstant;

  /// No description provided for @qrHomeBadgeHistory.
  ///
  /// In en, this message translates to:
  /// **'Saved history'**
  String get qrHomeBadgeHistory;

  /// No description provided for @qrHomeStartScan.
  ///
  /// In en, this message translates to:
  /// **'Start scanning'**
  String get qrHomeStartScan;

  /// No description provided for @qrHomeCreateTitle.
  ///
  /// In en, this message translates to:
  /// **'Create a code'**
  String get qrHomeCreateTitle;

  /// No description provided for @qrHomeCreateBody.
  ///
  /// In en, this message translates to:
  /// **'Create a QR code from text or a URL, then save or share it.'**
  String get qrHomeCreateBody;

  /// No description provided for @qrHomeBadgeShare.
  ///
  /// In en, this message translates to:
  /// **'Share anywhere'**
  String get qrHomeBadgeShare;

  /// No description provided for @qrHomeBadgeImage.
  ///
  /// In en, this message translates to:
  /// **'Save as image'**
  String get qrHomeBadgeImage;

  /// No description provided for @qrHomeOpenGenerator.
  ///
  /// In en, this message translates to:
  /// **'Open generator'**
  String get qrHomeOpenGenerator;

  /// No description provided for @qrHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan history'**
  String get qrHistoryTitle;

  /// No description provided for @qrHistoryMore.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get qrHistoryMore;

  /// No description provided for @qrHistoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'Scanned codes will appear here.'**
  String get qrHistoryEmpty;

  /// No description provided for @wifiQrPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Enter WiFi details\nto generate QR'**
  String get wifiQrPlaceholder;

  /// No description provided for @wifiQrPreviewLabel.
  ///
  /// In en, this message translates to:
  /// **'WiFi QR code'**
  String get wifiQrPreviewLabel;

  /// No description provided for @wifiQrNetworkDetails.
  ///
  /// In en, this message translates to:
  /// **'Network details'**
  String get wifiQrNetworkDetails;

  /// No description provided for @wifiQrSsidLabel.
  ///
  /// In en, this message translates to:
  /// **'Network name (SSID)'**
  String get wifiQrSsidLabel;

  /// No description provided for @wifiQrSsidHint.
  ///
  /// In en, this message translates to:
  /// **'My Home WiFi'**
  String get wifiQrSsidHint;

  /// No description provided for @wifiQrPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get wifiQrPasswordLabel;

  /// No description provided for @wifiQrPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get wifiQrPasswordHint;

  /// No description provided for @wifiQrShowPassword.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get wifiQrShowPassword;

  /// No description provided for @wifiQrHidePassword.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get wifiQrHidePassword;

  /// No description provided for @wifiQrSecurity.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get wifiQrSecurity;

  /// No description provided for @wifiQrSecurityNone.
  ///
  /// In en, this message translates to:
  /// **'None (open)'**
  String get wifiQrSecurityNone;

  /// No description provided for @wifiQrHidden.
  ///
  /// In en, this message translates to:
  /// **'Hidden network'**
  String get wifiQrHidden;

  /// No description provided for @wifiQrHiddenHint.
  ///
  /// In en, this message translates to:
  /// **'Turn on if the network name isn’t broadcast'**
  String get wifiQrHiddenHint;

  /// No description provided for @wifiQrSaveImage.
  ///
  /// In en, this message translates to:
  /// **'Save image'**
  String get wifiQrSaveImage;

  /// No description provided for @wifiQrInfo.
  ///
  /// In en, this message translates to:
  /// **'Anyone who scans this QR code will automatically connect to your WiFi network.'**
  String get wifiQrInfo;

  /// No description provided for @wifiQrShareText.
  ///
  /// In en, this message translates to:
  /// **'Scan this QR code to connect to my WiFi!'**
  String get wifiQrShareText;

  /// No description provided for @ocrCameraDenied.
  ///
  /// In en, this message translates to:
  /// **'Camera permission denied. Open Settings to allow access.'**
  String get ocrCameraDenied;

  /// No description provided for @ocrCameraRequired.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required to take a photo.'**
  String get ocrCameraRequired;

  /// No description provided for @ocrTimeout.
  ///
  /// In en, this message translates to:
  /// **'Reading took too long — the text model may still be downloading. Connect to Wi‑Fi once, or try again.'**
  String get ocrTimeout;

  /// No description provided for @ocrFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not read text from this image. Try a clearer photo.'**
  String get ocrFailed;

  /// No description provided for @ocrPreparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing image…'**
  String get ocrPreparing;

  /// No description provided for @ocrScanning.
  ///
  /// In en, this message translates to:
  /// **'Reading text…'**
  String get ocrScanning;

  /// No description provided for @ocrScriptLabel.
  ///
  /// In en, this message translates to:
  /// **'Text script'**
  String get ocrScriptLabel;

  /// No description provided for @ocrScriptHint.
  ///
  /// In en, this message translates to:
  /// **'Pick the alphabet your text is written in. Arabic, Urdu and Bengali can’t be read yet.'**
  String get ocrScriptHint;

  /// No description provided for @ocrScriptLatin.
  ///
  /// In en, this message translates to:
  /// **'Latin (English, Spanish…)'**
  String get ocrScriptLatin;

  /// No description provided for @ocrScriptDevanagari.
  ///
  /// In en, this message translates to:
  /// **'Devanagari (Hindi, Marathi…)'**
  String get ocrScriptDevanagari;

  /// No description provided for @ocrScriptChinese.
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get ocrScriptChinese;

  /// No description provided for @ocrScriptJapanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get ocrScriptJapanese;

  /// No description provided for @ocrScriptKorean.
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get ocrScriptKorean;

  /// No description provided for @ocrIdleTitle.
  ///
  /// In en, this message translates to:
  /// **'Extract text from any image'**
  String get ocrIdleTitle;

  /// No description provided for @ocrIdleBody.
  ///
  /// In en, this message translates to:
  /// **'Point your camera or choose a photo — text is extracted instantly, on-device.'**
  String get ocrIdleBody;

  /// No description provided for @ocrBadgeOnDevice.
  ///
  /// In en, this message translates to:
  /// **'On-device AI'**
  String get ocrBadgeOnDevice;

  /// No description provided for @ocrBadgeLocal.
  ///
  /// In en, this message translates to:
  /// **'Processed locally'**
  String get ocrBadgeLocal;

  /// No description provided for @ocrBadgeBlocks.
  ///
  /// In en, this message translates to:
  /// **'Block-level copy'**
  String get ocrBadgeBlocks;

  /// No description provided for @ocrUseCamera.
  ///
  /// In en, this message translates to:
  /// **'Use camera'**
  String get ocrUseCamera;

  /// No description provided for @ocrChooseGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get ocrChooseGallery;

  /// No description provided for @ocrOnDeviceNote.
  ///
  /// In en, this message translates to:
  /// **'On-device · no upload needed'**
  String get ocrOnDeviceNote;

  /// No description provided for @ocrTabImage.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get ocrTabImage;

  /// No description provided for @ocrTabText.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get ocrTabText;

  /// No description provided for @ocrTapBlockHint.
  ///
  /// In en, this message translates to:
  /// **'Tap a highlighted block to copy it'**
  String get ocrTapBlockHint;

  /// No description provided for @ocrBlockTitle.
  ///
  /// In en, this message translates to:
  /// **'Block text'**
  String get ocrBlockTitle;

  /// No description provided for @ocrBlockLines.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 line · tap to copy} other{{count} lines · tap to copy}}'**
  String ocrBlockLines(int count);

  /// No description provided for @ocrCopyBlock.
  ///
  /// In en, this message translates to:
  /// **'Copy block'**
  String get ocrCopyBlock;

  /// No description provided for @ocrBlockCopied.
  ///
  /// In en, this message translates to:
  /// **'Block copied'**
  String get ocrBlockCopied;

  /// No description provided for @ocrCopyEntireBlock.
  ///
  /// In en, this message translates to:
  /// **'Copy entire block'**
  String get ocrCopyEntireBlock;

  /// No description provided for @ocrCopyLine.
  ///
  /// In en, this message translates to:
  /// **'Copy line'**
  String get ocrCopyLine;

  /// No description provided for @ocrNoText.
  ///
  /// In en, this message translates to:
  /// **'No text detected — try a clearer photo.'**
  String get ocrNoText;

  /// No description provided for @ocrQuickCopy.
  ///
  /// In en, this message translates to:
  /// **'Quick copy by section'**
  String get ocrQuickCopy;

  /// No description provided for @ocrBlockNCopied.
  ///
  /// In en, this message translates to:
  /// **'Copied block {number}'**
  String ocrBlockNCopied(int number);

  /// No description provided for @ocrDoneEditing.
  ///
  /// In en, this message translates to:
  /// **'Done editing'**
  String get ocrDoneEditing;

  /// No description provided for @ocrEditText.
  ///
  /// In en, this message translates to:
  /// **'Edit text'**
  String get ocrEditText;

  /// No description provided for @ocrAllCopied.
  ///
  /// In en, this message translates to:
  /// **'All text copied'**
  String get ocrAllCopied;

  /// No description provided for @ocrCopyAll.
  ///
  /// In en, this message translates to:
  /// **'Copy all'**
  String get ocrCopyAll;

  /// No description provided for @ocrScanAgain.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get ocrScanAgain;

  /// No description provided for @ocrStatLines.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 line} other{{count} lines}}'**
  String ocrStatLines(int count);

  /// No description provided for @ocrStatWords.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 word} other{{count} words}}'**
  String ocrStatWords(int count);

  /// No description provided for @ocrStatChars.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 character} other{{count} characters}}'**
  String ocrStatChars(int count);

  /// No description provided for @wordPdfNoText.
  ///
  /// In en, this message translates to:
  /// **'No extractable text found in this document.'**
  String get wordPdfNoText;

  /// No description provided for @wordPdfInfo.
  ///
  /// In en, this message translates to:
  /// **'Converts .docx files to PDF. The text is kept; complex layouts (tables, images) may look different.'**
  String get wordPdfInfo;

  /// No description provided for @wordPdfOpeningPicker.
  ///
  /// In en, this message translates to:
  /// **'Opening file picker…'**
  String get wordPdfOpeningPicker;

  /// No description provided for @wordPdfConverting.
  ///
  /// In en, this message translates to:
  /// **'Converting… {percent}%'**
  String wordPdfConverting(int percent);

  /// No description provided for @wordPdfDone.
  ///
  /// In en, this message translates to:
  /// **'Conversion complete'**
  String get wordPdfDone;

  /// No description provided for @wordPdfTapToPick.
  ///
  /// In en, this message translates to:
  /// **'Tap to pick a .docx file'**
  String get wordPdfTapToPick;

  /// No description provided for @wordPdfSupports.
  ///
  /// In en, this message translates to:
  /// **'Supports .docx format'**
  String get wordPdfSupports;

  /// No description provided for @wordPdfFailed.
  ///
  /// In en, this message translates to:
  /// **'Conversion failed. The file may be damaged or not a .docx document.'**
  String get wordPdfFailed;

  /// No description provided for @wordPdfFontsOffline.
  ///
  /// In en, this message translates to:
  /// **'Some text (e.g. Arabic, Urdu, Hindi, Bengali or Cyrillic) is missing from this PDF. Its font is downloaded once — connect to the internet and convert again.'**
  String get wordPdfFontsOffline;

  /// No description provided for @wordPdfConvertAnother.
  ///
  /// In en, this message translates to:
  /// **'Convert another'**
  String get wordPdfConvertAnother;

  /// No description provided for @wordPdfPick.
  ///
  /// In en, this message translates to:
  /// **'Pick .docx file'**
  String get wordPdfPick;

  /// No description provided for @wordPdfStep1Title.
  ///
  /// In en, this message translates to:
  /// **'Pick your Word file'**
  String get wordPdfStep1Title;

  /// No description provided for @wordPdfStep1Desc.
  ///
  /// In en, this message translates to:
  /// **'Select a .docx file from your device storage.'**
  String get wordPdfStep1Desc;

  /// No description provided for @wordPdfStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Automatic conversion'**
  String get wordPdfStep2Title;

  /// No description provided for @wordPdfStep2Desc.
  ///
  /// In en, this message translates to:
  /// **'Text is extracted and laid out as A4 PDF pages.'**
  String get wordPdfStep2Desc;

  /// No description provided for @wordPdfStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Share or save'**
  String get wordPdfStep3Title;

  /// No description provided for @wordPdfStep3Desc.
  ///
  /// In en, this message translates to:
  /// **'Share the PDF to any app, email, or cloud storage.'**
  String get wordPdfStep3Desc;

  /// No description provided for @wordPdfReady.
  ///
  /// In en, this message translates to:
  /// **'PDF ready'**
  String get wordPdfReady;
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
