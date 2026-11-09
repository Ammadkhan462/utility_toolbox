// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Utility Toolbox';

  @override
  String get navTools => 'Tools';

  @override
  String get navFiles => 'My Files';

  @override
  String get settingsTooltip => 'Settings';

  @override
  String get searchHint => 'Search: compress pdf, scan, jpg…';

  @override
  String get quickActions => 'Quick actions';

  @override
  String get favorites => 'Favorites';

  @override
  String get recent => 'Recent';

  @override
  String searchNoResults(String query) {
    return 'No tools match “$query”';
  }

  @override
  String get toolMenuAddFavorite => 'Add to favorites';

  @override
  String get toolMenuRemoveFavorite => 'Remove from favorites';

  @override
  String get toolMenuPinShortcut => 'Add to home screen';

  @override
  String get pinShortcutRequested =>
      'Confirm to add the shortcut to your home screen';

  @override
  String get pinShortcutUnsupported =>
      'Your home screen app doesn’t support shortcuts';

  @override
  String get newBadge => 'NEW';

  @override
  String get catScan => 'Scan & QR';

  @override
  String get catPdf => 'PDF';

  @override
  String get catImage => 'Photo & image';

  @override
  String get catText => 'Text & translate';

  @override
  String get catCalc => 'Calculate & convert';

  @override
  String get catNetwork => 'Internet';

  @override
  String get catDevice => 'Device & location';

  @override
  String get catSecurity => 'Security';

  @override
  String get catMedia => 'Video & audio';

  @override
  String get toolDocScannerTitle => 'Document Scanner';

  @override
  String get toolDocScannerDesc => 'Scan paper to PDF with auto edges';

  @override
  String get toolDocScannerKeywords =>
      'scan paper, camscanner, document, pdf scanner, receipt';

  @override
  String get toolQrScannerTitle => 'Scan QR & Barcode';

  @override
  String get toolQrScannerDesc => 'From camera or a photo';

  @override
  String get toolQrScannerKeywords => 'qr reader, barcode, scan code';

  @override
  String get toolQrGeneratorTitle => 'Create QR Code';

  @override
  String get toolQrGeneratorDesc => 'Links, text, contacts and more';

  @override
  String get toolQrGeneratorKeywords =>
      'qr maker, generate qr, barcode generator';

  @override
  String get toolOcrTitle => 'Image to Text';

  @override
  String get toolOcrDesc => 'Copy text from any photo (OCR)';

  @override
  String get toolOcrKeywords =>
      'ocr, text scanner, extract text, copy text from image';

  @override
  String get toolWifiQrTitle => 'WiFi QR Code';

  @override
  String get toolWifiQrDesc => 'Share WiFi without typing the password';

  @override
  String get toolWifiQrKeywords => 'wifi password, share wifi';

  @override
  String get toolImageToPdfTitle => 'Image to PDF';

  @override
  String get toolImageToPdfDesc => 'Turn photos into one PDF';

  @override
  String get toolImageToPdfKeywords =>
      'jpg to pdf, photo to pdf, picture to pdf';

  @override
  String get toolMergePdfTitle => 'Merge PDF';

  @override
  String get toolMergePdfDesc => 'Combine several PDFs into one';

  @override
  String get toolMergePdfKeywords => 'join pdf, combine pdf';

  @override
  String get toolCompressPdfTitle => 'Compress PDF';

  @override
  String get toolCompressPdfDesc => 'Make a PDF smaller to send';

  @override
  String get toolCompressPdfKeywords => 'reduce pdf size, shrink pdf';

  @override
  String get toolSplitPdfTitle => 'Split PDF';

  @override
  String get toolSplitPdfDesc => 'Extract or remove pages';

  @override
  String get toolSplitPdfKeywords => 'extract pages, delete pages, cut pdf';

  @override
  String get toolPdfToImagesTitle => 'PDF to JPG';

  @override
  String get toolPdfToImagesDesc => 'Save every page as an image';

  @override
  String get toolPdfToImagesKeywords => 'pdf to image, pdf to png, pdf pages';

  @override
  String get toolProtectPdfTitle => 'Lock PDF';

  @override
  String get toolProtectPdfDesc => 'Add a password to a PDF';

  @override
  String get toolProtectPdfKeywords => 'password pdf, encrypt pdf, secure pdf';

  @override
  String get toolUnlockPdfTitle => 'Unlock PDF';

  @override
  String get toolUnlockPdfDesc => 'Remove a password you know';

  @override
  String get toolUnlockPdfKeywords => 'remove pdf password, decrypt pdf';

  @override
  String get toolWordToPdfTitle => 'Word to PDF';

  @override
  String get toolWordToPdfDesc => 'Convert .docx documents';

  @override
  String get toolWordToPdfKeywords => 'doc to pdf, docx, word';

  @override
  String get toolImageCompressorTitle => 'Compress Photo';

  @override
  String get toolImageCompressorDesc => 'Smaller file, same look';

  @override
  String get toolImageCompressorKeywords =>
      'reduce image size, compress jpg, kb';

  @override
  String get toolImageResizerTitle => 'Resize & Convert';

  @override
  String get toolImageResizerDesc => 'Exact size, JPG, PNG or WEBP';

  @override
  String get toolImageResizerKeywords =>
      'resize image, jpg to png, png to jpg, webp, passport size';

  @override
  String get toolImageEnhancerTitle => 'Photo Editor';

  @override
  String get toolImageEnhancerDesc => 'Filters, crop, brightness and more';

  @override
  String get toolImageEnhancerKeywords => 'edit photo, filter, crop, rotate';

  @override
  String get toolAiUpscalerTitle => 'AI Upscaler';

  @override
  String get toolAiUpscalerDesc => 'Enlarge photos up to 4× sharper';

  @override
  String get toolAiUpscalerKeywords =>
      'enhance, hd, increase resolution, blurry';

  @override
  String get toolTranslationTitle => 'Translate';

  @override
  String get toolTranslationDesc => 'Offline, with voice and speech';

  @override
  String get toolTranslationKeywords => 'translator, language, dictionary';

  @override
  String get toolTextUtilitiesTitle => 'Text Tools';

  @override
  String get toolTextUtilitiesDesc => 'Count words, change case, Base64';

  @override
  String get toolTextUtilitiesKeywords =>
      'word counter, uppercase, lowercase, base64';

  @override
  String get toolSmartClipboardTitle => 'Clipboard Manager';

  @override
  String get toolSmartClipboardDesc => 'Save, pin and search copied text';

  @override
  String get toolSmartClipboardKeywords =>
      'copy paste, notes, clipboard history';

  @override
  String get toolCalculatorTitle => 'Calculator';

  @override
  String get toolCalculatorDesc => 'Everyday calculator with history';

  @override
  String get toolCalculatorKeywords => 'calc, math, percent';

  @override
  String get toolAgeCalculatorTitle => 'Age & Date';

  @override
  String get toolAgeCalculatorDesc => 'Exact age and days between dates';

  @override
  String get toolAgeCalculatorKeywords =>
      'birthday, date difference, days counter';

  @override
  String get toolUnitConverterTitle => 'Unit Converter';

  @override
  String get toolUnitConverterDesc => 'Length, weight, temperature and more';

  @override
  String get toolUnitConverterKeywords =>
      'convert units, cm to inch, kg to lb, celsius';

  @override
  String get toolLoanCalculatorTitle => 'Loan & EMI';

  @override
  String get toolLoanCalculatorDesc => 'Monthly payment and total interest';

  @override
  String get toolLoanCalculatorKeywords =>
      'emi, mortgage, interest, installment';

  @override
  String get toolTimezoneTitle => 'World Clock';

  @override
  String get toolTimezoneDesc => 'Time in any city, with a widget';

  @override
  String get toolTimezoneKeywords => 'time zone, clock, city time';

  @override
  String get toolColorPickerTitle => 'Color Picker';

  @override
  String get toolColorPickerDesc => 'HEX, RGB, HSL and CMYK';

  @override
  String get toolColorPickerKeywords => 'color code, hex, palette';

  @override
  String get toolSpeedTestTitle => 'Internet Speed Test';

  @override
  String get toolSpeedTestDesc => 'Download, upload and ping';

  @override
  String get toolSpeedTestKeywords => 'wifi speed, internet speed, mbps';

  @override
  String get toolIpPingTitle => 'IP & Ping';

  @override
  String get toolIpPingDesc => 'Your IP address and host reachability';

  @override
  String get toolIpPingKeywords => 'my ip, ping, network';

  @override
  String get toolCompassTitle => 'Compass';

  @override
  String get toolCompassDesc => 'Heading and bearing';

  @override
  String get toolCompassKeywords => 'direction, north, qibla';

  @override
  String get toolLocationSaverTitle => 'Save Location';

  @override
  String get toolLocationSaverDesc => 'Remember and share GPS spots';

  @override
  String get toolLocationSaverKeywords => 'parking, gps, map, coordinates';

  @override
  String get toolPasswordGeneratorTitle => 'Password Generator';

  @override
  String get toolPasswordGeneratorDesc => 'Strong random passwords';

  @override
  String get toolPasswordGeneratorKeywords => 'secure password, random';

  @override
  String get toolHashGeneratorTitle => 'Hash Generator';

  @override
  String get toolHashGeneratorDesc => 'MD5, SHA-1, SHA-256 of text or files';

  @override
  String get toolHashGeneratorKeywords => 'checksum, md5, sha256';

  @override
  String get toolVideoConverterTitle => 'Video Converter';

  @override
  String get toolVideoConverterDesc => 'Video to MP3, GIF, MP4 and more';

  @override
  String get toolVideoConverterKeywords =>
      'video to mp3, gif maker, audio extract';

  @override
  String get filesEmptyTitle => 'No files yet';

  @override
  String get filesEmptyBody =>
      'PDFs, images and other files you create will appear here so you can open or share them again.';

  @override
  String get fileOpen => 'Open';

  @override
  String get fileShare => 'Share';

  @override
  String get fileRemoveFromList => 'Remove from list';

  @override
  String get fileOpenFailed =>
      'Couldn’t open this file. It may have been moved or deleted.';

  @override
  String get filesClearList => 'Clear list';

  @override
  String get filesClearConfirm =>
      'Clear the list? Your files stay on the device.';

  @override
  String get incomingSheetTitle => 'What do you want to do?';

  @override
  String incomingImages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count images',
      one: '1 image',
    );
    return '$_temp0';
  }

  @override
  String incomingPdfs(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count PDFs',
      one: '1 PDF',
    );
    return '$_temp0';
  }

  @override
  String get incomingText => 'Shared text';

  @override
  String get incomingDocument => 'Word document';

  @override
  String get incomingVideo => 'Video';

  @override
  String get incomingUnsupported => 'This file type isn’t supported yet';

  @override
  String get incomingFailed => 'Couldn’t read the shared file';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get themeSystem => 'Auto';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get languageSystem => 'System default';

  @override
  String get settingsPurchases => 'Purchases';

  @override
  String get removeAdsTitle => 'Remove ads';

  @override
  String get removeAdsSubtitle => 'One-time purchase, no subscription';

  @override
  String get restorePurchasesTitle => 'Restore purchases';

  @override
  String get restorePurchasesSubtitle => 'Recover a purchase on this device';

  @override
  String get settingsSupport => 'Support & privacy';

  @override
  String get shareAppTitle => 'Share app';

  @override
  String get shareAppSubtitle => 'Tell a friend about Utility Toolbox';

  @override
  String shareAppMessage(String url) {
    return 'I use Utility Toolbox to scan documents, edit PDFs, read QR codes and translate offline. Free: $url';
  }

  @override
  String get rateAppTitle => 'Rate the app';

  @override
  String get rateAppSubtitle => 'A quick review helps a lot';

  @override
  String get privacyPolicyTitle => 'Privacy policy';

  @override
  String get privacyPolicySubtitle => 'What the app accesses and why';

  @override
  String get privacyChoicesTitle => 'Ad privacy choices';

  @override
  String get privacyChoicesSubtitle =>
      'Change your consent for personalised ads';

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingStart => 'Get started';

  @override
  String get onboarding1Title => 'Every tool,\none app';

  @override
  String get onboarding1Body =>
      'Scan documents, edit PDFs, read QR codes, translate and resize photos — without installing ten apps.';

  @override
  String get onboarding2Title => 'Works from\nany app';

  @override
  String get onboarding2Body =>
      'Share a photo or PDF to Utility Toolbox, select text to translate it, or long-press the app icon for shortcuts.';

  @override
  String get onboarding3Title => 'Fast, offline\nand private';

  @override
  String get onboarding3Body =>
      'Almost everything runs on your phone. Your files are never uploaded unless you turn on a cloud option yourself.';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonClear => 'Clear';
}
