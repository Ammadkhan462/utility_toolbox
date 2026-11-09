// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'Utility Toolbox';

  @override
  String get navTools => 'ٹولز';

  @override
  String get navFiles => 'میری فائلیں';

  @override
  String get settingsTooltip => 'سیٹنگز';

  @override
  String get searchHint => 'تلاش: pdf چھوٹی کریں، اسکین، jpg…';

  @override
  String get quickActions => 'فوری کام';

  @override
  String get favorites => 'پسندیدہ';

  @override
  String get recent => 'حالیہ';

  @override
  String searchNoResults(String query) {
    return '“$query” سے کوئی ٹول نہیں ملا';
  }

  @override
  String get toolMenuAddFavorite => 'پسندیدہ میں شامل کریں';

  @override
  String get toolMenuRemoveFavorite => 'پسندیدہ سے ہٹائیں';

  @override
  String get toolMenuPinShortcut => 'ہوم اسکرین پر لگائیں';

  @override
  String get pinShortcutRequested =>
      'ہوم اسکرین پر شارٹ کٹ لگانے کے لیے تصدیق کریں';

  @override
  String get pinShortcutUnsupported =>
      'آپ کی ہوم اسکرین ایپ شارٹ کٹ سپورٹ نہیں کرتی';

  @override
  String get newBadge => 'نیا';

  @override
  String get catScan => 'اسکین اور QR';

  @override
  String get catPdf => 'PDF';

  @override
  String get catImage => 'فوٹو اور تصویر';

  @override
  String get catText => 'ٹیکسٹ اور ترجمہ';

  @override
  String get catCalc => 'حساب اور کنورٹ';

  @override
  String get catNetwork => 'انٹرنیٹ';

  @override
  String get catDevice => 'ڈیوائس اور لوکیشن';

  @override
  String get catSecurity => 'سیکیورٹی';

  @override
  String get catMedia => 'ویڈیو اور آڈیو';

  @override
  String get toolDocScannerTitle => 'ڈاکیومنٹ اسکینر';

  @override
  String get toolDocScannerDesc => 'کاغذ اسکین کر کے PDF بنائیں';

  @override
  String get toolDocScannerKeywords =>
      'scan paper, camscanner, document, pdf scanner, receipt, اسکینر, دستاویز, ڈاکیومنٹ اسکین, کاغذ اسکین, رسید, scanner, document scan karna, kaghaz scan';

  @override
  String get toolQrScannerTitle => 'QR اور بارکوڈ اسکین';

  @override
  String get toolQrScannerDesc => 'کیمرے یا تصویر سے';

  @override
  String get toolQrScannerKeywords =>
      'qr reader, barcode, scan code, کیو آر کوڈ, QR اسکینر, بارکوڈ اسکینر, کوڈ اسکین, qr code scan karna, qr scanner';

  @override
  String get toolQrGeneratorTitle => 'QR کوڈ بنائیں';

  @override
  String get toolQrGeneratorDesc => 'لنک، ٹیکسٹ، کانٹیکٹ اور مزید';

  @override
  String get toolQrGeneratorKeywords =>
      'qr maker, generate qr, barcode generator, QR کوڈ بنائیں, کیو آر بنانا, qr code banaye, qr generator';

  @override
  String get toolOcrTitle => 'تصویر سے ٹیکسٹ';

  @override
  String get toolOcrDesc => 'کسی بھی تصویر سے ٹیکسٹ کاپی کریں (OCR)';

  @override
  String get toolOcrKeywords =>
      'ocr, text scanner, extract text, copy text from image, تصویر سے ٹیکسٹ, تصویر سے تحریر, لکھائی کاپی, tasveer se text, image to text';

  @override
  String get toolWifiQrTitle => 'WiFi QR کوڈ';

  @override
  String get toolWifiQrDesc => 'پاس ورڈ لکھے بغیر WiFi شیئر کریں';

  @override
  String get toolWifiQrKeywords =>
      'wifi password, share wifi, وائی فائی پاس ورڈ, وائی فائی شیئر, wifi password dekhen, wifi qr';

  @override
  String get toolImageToPdfTitle => 'تصویر سے PDF';

  @override
  String get toolImageToPdfDesc => 'تصویروں کو ایک PDF میں بدلیں';

  @override
  String get toolImageToPdfKeywords =>
      'jpg to pdf, photo to pdf, picture to pdf, تصویر سے pdf, فوٹو کو pdf بنائیں, image to pdf, photo ko pdf banana';

  @override
  String get toolMergePdfTitle => 'PDF جوڑیں';

  @override
  String get toolMergePdfDesc => 'کئی PDF کو ایک میں ملائیں';

  @override
  String get toolMergePdfKeywords =>
      'join pdf, combine pdf, merge pdf, pdf جوڑنا, pdf ملائیں, pdf jorna';

  @override
  String get toolCompressPdfTitle => 'PDF چھوٹی کریں';

  @override
  String get toolCompressPdfDesc => 'بھیجنے کے لیے PDF کا سائز کم کریں';

  @override
  String get toolCompressPdfKeywords =>
      'reduce pdf size, shrink pdf, compress pdf, pdf سائز کم, pdf چھوٹی کریں, pdf size kam karen, pdf kb kam';

  @override
  String get toolSplitPdfTitle => 'PDF الگ کریں';

  @override
  String get toolSplitPdfDesc => 'صفحے نکالیں یا ہٹائیں';

  @override
  String get toolSplitPdfKeywords =>
      'extract pages, delete pages, cut pdf, split pdf, pdf صفحے الگ, pdf صفحہ ہٹائیں, pdf page alag karen';

  @override
  String get toolPdfToImagesTitle => 'PDF سے JPG';

  @override
  String get toolPdfToImagesDesc => 'ہر صفحہ تصویر کے طور پر محفوظ کریں';

  @override
  String get toolPdfToImagesKeywords =>
      'pdf to image, pdf to png, pdf pages, pdf to jpg, pdf سے تصویر, pdf se tasveer';

  @override
  String get toolProtectPdfTitle => 'PDF لاک کریں';

  @override
  String get toolProtectPdfDesc => 'PDF پر پاس ورڈ لگائیں';

  @override
  String get toolProtectPdfKeywords =>
      'password pdf, encrypt pdf, secure pdf, pdf پاس ورڈ, pdf لاک, pdf par password lagayen';

  @override
  String get toolUnlockPdfTitle => 'PDF ان لاک کریں';

  @override
  String get toolUnlockPdfDesc => 'معلوم پاس ورڈ ہٹائیں';

  @override
  String get toolUnlockPdfKeywords =>
      'remove pdf password, decrypt pdf, unlock pdf, pdf پاس ورڈ ہٹائیں, pdf ka password hatayen';

  @override
  String get toolWordToPdfTitle => 'Word سے PDF';

  @override
  String get toolWordToPdfDesc => '.docx دستاویز کنورٹ کریں';

  @override
  String get toolWordToPdfKeywords =>
      'doc to pdf, docx, word, word to pdf, ورڈ سے pdf, word file ko pdf';

  @override
  String get toolImageCompressorTitle => 'تصویر چھوٹی کریں';

  @override
  String get toolImageCompressorDesc => 'چھوٹی فائل، ویسی ہی تصویر';

  @override
  String get toolImageCompressorKeywords =>
      'reduce image size, compress jpg, kb, تصویر کا سائز کم, فوٹو kb کم کریں, photo size kam karen, photo compress, 20kb, 50kb';

  @override
  String get toolImageResizerTitle => 'ری سائز اور کنورٹ';

  @override
  String get toolImageResizerDesc => 'درست سائز، JPG، PNG یا WEBP';

  @override
  String get toolImageResizerKeywords =>
      'resize image, jpg to png, png to jpg, webp, passport size, تصویر ری سائز, پاسپورٹ سائز تصویر, photo resize, shanakhti card photo, فارم کے لیے تصویر';

  @override
  String get toolImageEnhancerTitle => 'فوٹو ایڈیٹر';

  @override
  String get toolImageEnhancerDesc => 'فلٹر، کراپ، برائٹنس اور مزید';

  @override
  String get toolImageEnhancerKeywords =>
      'edit photo, filter, crop, rotate, فوٹو ایڈٹ, تصویر ایڈٹ, photo editor, photo edit karna';

  @override
  String get toolAiUpscalerTitle => 'AI اپ اسکیلر';

  @override
  String get toolAiUpscalerDesc => 'تصویر 4× تک بڑی اور صاف کریں';

  @override
  String get toolAiUpscalerKeywords =>
      'enhance, hd, increase resolution, blurry, دھندلی تصویر صاف, تصویر HD کریں, photo hd karen, photo clear karen';

  @override
  String get toolTranslationTitle => 'ترجمہ';

  @override
  String get toolTranslationDesc => 'آف لائن، بول کر اور سن کر';

  @override
  String get toolTranslationKeywords =>
      'translator, language, dictionary, ترجمہ, ٹرانسلیٹ, اردو سے انگلش, انگلش سے اردو, لغت, translate, urdu to english, tarjuma';

  @override
  String get toolTextUtilitiesTitle => 'ٹیکسٹ ٹولز';

  @override
  String get toolTextUtilitiesDesc => 'الفاظ گنیں، کیس بدلیں، Base64';

  @override
  String get toolTextUtilitiesKeywords =>
      'word counter, uppercase, lowercase, base64, الفاظ گنتی, word count, بڑے حروف, چھوٹے حروف';

  @override
  String get toolSmartClipboardTitle => 'کلپ بورڈ مینیجر';

  @override
  String get toolSmartClipboardDesc => 'کاپی ٹیکسٹ محفوظ، پن اور تلاش کریں';

  @override
  String get toolSmartClipboardKeywords =>
      'copy paste, notes, clipboard history, کاپی پیسٹ, نوٹس, کلپ بورڈ';

  @override
  String get toolCalculatorTitle => 'کیلکولیٹر';

  @override
  String get toolCalculatorDesc => 'ہسٹری کے ساتھ روزمرہ کیلکولیٹر';

  @override
  String get toolCalculatorKeywords =>
      'calc, math, percent, کیلکولیٹر, حساب, فیصد, hisab, percentage';

  @override
  String get toolAgeCalculatorTitle => 'عمر اور تاریخ';

  @override
  String get toolAgeCalculatorDesc => 'درست عمر اور تاریخوں کے درمیان دن';

  @override
  String get toolAgeCalculatorKeywords =>
      'birthday, date difference, days counter, age calculator, عمر, سالگرہ, عمر کیلکولیٹر, umar kitni hai, تاریخ فرق';

  @override
  String get toolUnitConverterTitle => 'یونٹ کنورٹر';

  @override
  String get toolUnitConverterDesc => 'لمبائی، وزن، درجہ حرارت اور مزید';

  @override
  String get toolUnitConverterKeywords =>
      'convert units, cm to inch, kg to lb, celsius, یونٹ بدلیں, فٹ سے میٹر, مرلہ, کنال, unit converter';

  @override
  String get toolLoanCalculatorTitle => 'قرض اور EMI';

  @override
  String get toolLoanCalculatorDesc => 'ماہانہ قسط اور کل سود';

  @override
  String get toolLoanCalculatorKeywords =>
      'emi, mortgage, interest, installment, قرض, قسط, سود, لون, emi calculator, qist calculator';

  @override
  String get toolTimezoneTitle => 'عالمی گھڑی';

  @override
  String get toolTimezoneDesc => 'کسی بھی شہر کا وقت، ویجیٹ کے ساتھ';

  @override
  String get toolTimezoneKeywords =>
      'time zone, clock, city time, world clock, گھڑی, وقت, دوسرے ملک کا وقت';

  @override
  String get toolColorPickerTitle => 'کلر پکر';

  @override
  String get toolColorPickerDesc => 'HEX، RGB، HSL اور CMYK';

  @override
  String get toolColorPickerKeywords =>
      'color code, hex, palette, رنگ, کلر کوڈ';

  @override
  String get toolSpeedTestTitle => 'انٹرنیٹ اسپیڈ ٹیسٹ';

  @override
  String get toolSpeedTestDesc => 'ڈاؤن لوڈ، اپ لوڈ اور پنگ';

  @override
  String get toolSpeedTestKeywords =>
      'wifi speed, internet speed, mbps, نیٹ اسپیڈ, انٹرنیٹ اسپیڈ, net speed check, speed test, 4g speed';

  @override
  String get toolIpPingTitle => 'IP اور پنگ';

  @override
  String get toolIpPingDesc => 'آپ کا IP ایڈریس اور ہوسٹ کی رسائی';

  @override
  String get toolIpPingKeywords => 'my ip, ping, network, میرا ip, نیٹ ورک';

  @override
  String get toolCompassTitle => 'قطب نما';

  @override
  String get toolCompassDesc => 'سمت اور زاویہ';

  @override
  String get toolCompassKeywords =>
      'direction, north, qibla, قبلہ, قبلہ رخ, سمت, شمال, کمپاس, qibla direction, qibla finder';

  @override
  String get toolLocationSaverTitle => 'لوکیشن محفوظ کریں';

  @override
  String get toolLocationSaverDesc => 'GPS جگہ یاد رکھیں اور شیئر کریں';

  @override
  String get toolLocationSaverKeywords =>
      'parking, gps, map, coordinates, لوکیشن, پارکنگ, نقشہ, location share';

  @override
  String get toolPasswordGeneratorTitle => 'پاس ورڈ جنریٹر';

  @override
  String get toolPasswordGeneratorDesc => 'مضبوط رینڈم پاس ورڈ';

  @override
  String get toolPasswordGeneratorKeywords =>
      'secure password, random, پاس ورڈ بنائیں, مضبوط پاس ورڈ, password generator';

  @override
  String get toolHashGeneratorTitle => 'ہیش جنریٹر';

  @override
  String get toolHashGeneratorDesc => 'ٹیکسٹ یا فائل کا MD5، SHA-1، SHA-256';

  @override
  String get toolHashGeneratorKeywords => 'checksum, md5, sha256, ہیش';

  @override
  String get toolVideoConverterTitle => 'ویڈیو کنورٹر';

  @override
  String get toolVideoConverterDesc => 'ویڈیو سے MP3، GIF، MP4 اور مزید';

  @override
  String get toolVideoConverterKeywords =>
      'video to mp3, gif maker, audio extract, ویڈیو سے گانا, ویڈیو سے mp3, video se audio, gif بنائیں';

  @override
  String get filesEmptyTitle => 'ابھی کوئی فائل نہیں';

  @override
  String get filesEmptyBody =>
      'آپ کی بنائی ہوئی PDF، تصویریں اور دوسری فائلیں یہاں نظر آئیں گی تاکہ آپ انہیں دوبارہ کھول یا شیئر کر سکیں۔';

  @override
  String get fileOpen => 'کھولیں';

  @override
  String get fileShare => 'شیئر کریں';

  @override
  String get fileRemoveFromList => 'فہرست سے ہٹائیں';

  @override
  String get fileOpenFailed =>
      'یہ فائل نہیں کھل سکی۔ شاید اسے منتقل یا ڈیلیٹ کر دیا گیا ہے۔';

  @override
  String get filesClearList => 'فہرست صاف کریں';

  @override
  String get filesClearConfirm =>
      'فہرست صاف کریں؟ آپ کی فائلیں فون میں ہی رہیں گی۔';

  @override
  String get incomingSheetTitle => 'آپ کیا کرنا چاہتے ہیں؟';

  @override
  String incomingImages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تصویریں',
      one: '1 تصویر',
    );
    return '$_temp0';
  }

  @override
  String incomingPdfs(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count PDF',
      one: '1 PDF',
    );
    return '$_temp0';
  }

  @override
  String get incomingText => 'شیئر کیا گیا ٹیکسٹ';

  @override
  String get incomingDocument => 'Word دستاویز';

  @override
  String get incomingVideo => 'ویڈیو';

  @override
  String get incomingUnsupported => 'یہ فائل ٹائپ ابھی سپورٹ نہیں ہے';

  @override
  String get incomingFailed => 'شیئر کی گئی فائل پڑھی نہیں جا سکی';

  @override
  String get settingsTitle => 'سیٹنگز';

  @override
  String get settingsAppearance => 'ظاہری شکل';

  @override
  String get settingsTheme => 'تھیم';

  @override
  String get themeSystem => 'آٹو';

  @override
  String get themeLight => 'لائٹ';

  @override
  String get themeDark => 'ڈارک';

  @override
  String get settingsLanguage => 'زبان';

  @override
  String get languageSystem => 'سسٹم کی زبان';

  @override
  String get settingsPurchases => 'خریداری';

  @override
  String get removeAdsTitle => 'اشتہارات ہٹائیں';

  @override
  String get removeAdsSubtitle => 'ایک بار کی خریداری، کوئی سبسکرپشن نہیں';

  @override
  String get restorePurchasesTitle => 'خریداری بحال کریں';

  @override
  String get restorePurchasesSubtitle =>
      'اس ڈیوائس پر پرانی خریداری واپس لائیں';

  @override
  String get settingsSupport => 'سپورٹ اور پرائیویسی';

  @override
  String get shareAppTitle => 'ایپ شیئر کریں';

  @override
  String get shareAppSubtitle => 'دوستوں کو Utility Toolbox کے بارے میں بتائیں';

  @override
  String shareAppMessage(String url) {
    return 'Utility Toolbox سے ڈاکیومنٹ اسکین، PDF ایڈٹ، QR کوڈ اسکین اور آف لائن ترجمہ — سب ایک ہی ایپ میں۔ مجھے یہ بہت کام کی لگی۔ مفت: $url';
  }

  @override
  String get rateAppTitle => 'ایپ کو ریٹ کریں';

  @override
  String get rateAppSubtitle => 'ایک مختصر ریویو بہت مدد کرتا ہے';

  @override
  String get privacyPolicyTitle => 'پرائیویسی پالیسی';

  @override
  String get privacyPolicySubtitle => 'ایپ کس چیز تک رسائی لیتی ہے اور کیوں';

  @override
  String get privacyChoicesTitle => 'اشتہارات کی پرائیویسی';

  @override
  String get privacyChoicesSubtitle =>
      'ذاتی نوعیت کے اشتہارات کی رضامندی بدلیں';

  @override
  String versionLabel(String version) {
    return 'ورژن $version';
  }

  @override
  String get onboardingSkip => 'چھوڑیں';

  @override
  String get onboardingNext => 'آگے';

  @override
  String get onboardingStart => 'شروع کریں';

  @override
  String get onboarding1Title => 'ہر ٹول،\nایک ایپ میں';

  @override
  String get onboarding1Body =>
      'ڈاکیومنٹ اسکین کریں، PDF ایڈٹ کریں، QR کوڈ پڑھیں، ترجمہ کریں اور تصویریں ری سائز کریں — دس ایپس انسٹال کیے بغیر۔';

  @override
  String get onboarding2Title => 'ہر ایپ سے\nکام کرے';

  @override
  String get onboarding2Body =>
      'کوئی تصویر یا PDF Utility Toolbox پر شیئر کریں، ترجمے کے لیے ٹیکسٹ منتخب کریں، یا شارٹ کٹس کے لیے ایپ آئیکن کو دبائے رکھیں۔';

  @override
  String get onboarding3Title => 'تیز، آف لائن\nاور محفوظ';

  @override
  String get onboarding3Body =>
      'تقریباً سب کچھ آپ کے فون پر ہی چلتا ہے۔ آپ کی فائلیں تب ہی اپ لوڈ ہوتی ہیں جب آپ خود کوئی کلاؤڈ آپشن آن کریں۔';

  @override
  String get commonCancel => 'منسوخ';

  @override
  String get commonClear => 'صاف کریں';
}
