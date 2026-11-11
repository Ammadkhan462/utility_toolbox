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

  @override
  String get toolBgRemoverTitle => 'بیک گراؤنڈ ہٹائیں';

  @override
  String get toolBgRemoverDesc => 'ایک ٹیپ میں لوگوں اور چیزوں کو الگ کریں';

  @override
  String get toolBgRemoverKeywords =>
      'بیک گراؤنڈ ہٹائیں, پس منظر ہٹائیں, کٹ آؤٹ, شفاف, اسٹیکر, پاسپورٹ تصویر, سفید بیک گراؤنڈ, remove background, remove bg, cutout, png';

  @override
  String get toolBmiTitle => 'BMI کیلکولیٹر';

  @override
  String get toolBmiDesc => 'اپنا BMI اور صحت مند وزن جانیں';

  @override
  String get toolBmiKeywords =>
      'بی ایم آئی, باڈی ماس انڈیکس, وزن, قد, مثالی وزن, موٹاپا, صحت, bmi, body mass index, weight, height, health, fitness, ideal weight, obesity';

  @override
  String get toolBubbleLevelTitle => 'اسپرٹ لیول';

  @override
  String get toolBubbleLevelDesc => 'دیکھیں کہ شیلف اور فریم سیدھے ہیں';

  @override
  String get toolBubbleLevelKeywords =>
      'لیول, اسپرٹ لیول, سیدھا, زاویہ, جھکاؤ, level, spirit level, bubble level, angle, tilt';

  @override
  String get toolCurrencyTitle => 'کرنسی کنورٹر';

  @override
  String get toolCurrencyDesc => '150 سے زائد کرنسیوں کے تازہ ریٹ';

  @override
  String get toolCurrencyKeywords =>
      'کرنسی, ریٹ, زر مبادلہ, روپیہ, ڈالر, ریال, درہم, پیسہ, تبادلہ, currency, exchange rate, money, convert, dollar, rupee, riyal, forex';

  @override
  String get toolDirectChatTitle => 'ڈائریکٹ چیٹ';

  @override
  String get toolDirectChatDesc => 'نمبر محفوظ کیے بغیر WhatsApp پر میسج کریں';

  @override
  String get toolDirectChatKeywords =>
      'واٹس ایپ, ڈائریکٹ چیٹ, میسج, پیغام, نمبر محفوظ کیے بغیر, whatsapp, direct chat, message, unsaved number, click to chat, wa.me, send message, chat';

  @override
  String get toolFlashlightTitle => 'ٹارچ';

  @override
  String get toolFlashlightDesc => 'SOS اور اسٹروب کے ساتھ تیز ٹارچ';

  @override
  String get toolFlashlightKeywords =>
      'ٹارچ, روشنی, بتی, فلیش, لائٹ, flashlight, torch, light, led, sos, strobe, flash';

  @override
  String get toolOrganizePdfTitle => 'PDF ترتیب دیں';

  @override
  String get toolOrganizePdfDesc => 'صفحات کی ترتیب بدلیں، گھمائیں یا حذف کریں';

  @override
  String get toolOrganizePdfKeywords =>
      'ترتیب, گھمائیں, صفحات حذف, صفحہ ہٹائیں, organize, organise, reorder, rotate, delete pages, remove pages, arrange, sort, pdf';

  @override
  String get toolPdfToTextTitle => 'PDF سے متن';

  @override
  String get toolPdfToTextDesc => 'PDF سے سارا متن کاپی کریں';

  @override
  String get toolPdfToTextKeywords =>
      'متن نکالیں, متن کاپی, PDF سے متن, تبدیل کریں, pdf to text, extract text, copy text, txt, read pdf, convert, pdf to word';

  @override
  String get toolPercentageTitle => 'فیصد اور ڈسکاؤنٹ';

  @override
  String get toolPercentageDesc => 'فیصد، ڈسکاؤنٹ، ٹپ کی تقسیم اور ٹیکس فوراً';

  @override
  String get toolPercentageKeywords =>
      'فیصد, پرسنٹ, ڈسکاؤنٹ, رعایت, سیل, ٹپ, بل تقسیم, جی ایس ٹی, ٹیکس, percentage, percent, discount, sale price, tip, split bill, tax, gst, vat';

  @override
  String get toolSignPdfTitle => 'PDF پر دستخط';

  @override
  String get toolSignPdfDesc => 'اپنا دستخط بنائیں اور کسی بھی صفحے پر لگائیں';

  @override
  String get toolSignPdfKeywords =>
      'دستخط, سائن, ای سائن, sign, signature, e-sign, esign, fill and sign, autograph, pdf';

  @override
  String get toolStopwatchTitle => 'اسٹاپ واچ اور ٹائمر';

  @override
  String get toolStopwatchDesc => 'لیپ والی اسٹاپ واچ اور الٹی گنتی کا ٹائمر';

  @override
  String get toolStopwatchKeywords =>
      'اسٹاپ واچ, ٹائمر, الٹی گنتی, لیپ, الارم, گھڑی, کچن ٹائمر, ورزش, stopwatch, timer, countdown, lap, alarm';

  @override
  String get toolWatermarkPdfTitle => 'واٹرمارک اور صفحہ نمبر';

  @override
  String get toolWatermarkPdfDesc => 'ہر صفحے پر متن یا صفحہ نمبر لگائیں';

  @override
  String get toolWatermarkPdfKeywords =>
      'واٹرمارک, مہر, صفحہ نمبر, نمبر لگائیں, خفیہ, مسودہ, watermark, stamp, page numbers, number pages, confidential, draft, footer, header, pdf';

  @override
  String get bmiMetric => 'میٹرک (سم، کلو)';

  @override
  String get bmiImperial => 'امپیریل (فٹ، پاؤنڈ)';

  @override
  String get bmiHeight => 'قد';

  @override
  String get bmiWeight => 'وزن';

  @override
  String get bmiFeet => 'فٹ';

  @override
  String get bmiInches => 'انچ';

  @override
  String get bmiUnitCm => 'سم';

  @override
  String get bmiUnitKg => 'کلو';

  @override
  String get bmiUnitLb => 'پاؤنڈ';

  @override
  String get bmiUnitFt => 'فٹ';

  @override
  String get bmiUnitIn => 'انچ';

  @override
  String get bmiAge => 'عمر (اختیاری)';

  @override
  String get bmiSex => 'جنس (اختیاری)';

  @override
  String get bmiMale => 'مرد';

  @override
  String get bmiFemale => 'عورت';

  @override
  String get bmiYourBmi => 'آپ کا BMI';

  @override
  String get bmiUnderweight => 'کم وزن';

  @override
  String get bmiNormal => 'صحت مند وزن';

  @override
  String get bmiOverweight => 'زیادہ وزن';

  @override
  String get bmiObese => 'موٹاپا';

  @override
  String bmiHealthyRange(String min, String max) {
    return 'آپ کے قد کے لیے صحت مند وزن: $min – $max';
  }

  @override
  String bmiToLose(String amount) {
    return 'صحت مند حد سے تقریباً $amount زیادہ';
  }

  @override
  String bmiToGain(String amount) {
    return 'صحت مند حد سے تقریباً $amount کم';
  }

  @override
  String bmiIdealWeight(String weight) {
    return 'اندازاً مثالی وزن: $weight';
  }

  @override
  String get bmiChildNote =>
      '18 سال سے کم عمر بچوں کا BMI عمر کے لحاظ سے گروتھ چارٹ سے دیکھا جاتا ہے۔ یہ نتائج بالغوں کی حدود پر مبنی ہیں۔';

  @override
  String get bmiDisclaimer => 'BMI ایک عمومی اندازہ ہے، طبی تشخیص نہیں۔';

  @override
  String get bmiEnterValues => 'اپنا قد اور وزن لکھیں';

  @override
  String get currencyAmount => 'رقم';

  @override
  String get currencyFrom => 'اس کرنسی سے';

  @override
  String get currencyTo => 'اس کرنسی میں';

  @override
  String get currencySwap => 'کرنسیاں آپس میں بدلیں';

  @override
  String get currencyChoose => 'کرنسی منتخب کریں';

  @override
  String get currencySearchHint => 'کرنسی یا کوڈ تلاش کریں';

  @override
  String get currencyAll => 'تمام کرنسیاں';

  @override
  String currencyRatesFrom(String date) {
    return '$date کے ریٹ';
  }

  @override
  String get currencyRefresh => 'ریٹ تازہ کریں';

  @override
  String get currencyUpdating => 'ریٹ اپ ڈیٹ ہو رہے ہیں…';

  @override
  String get currencyOfflineCached =>
      'اپ ڈیٹ نہیں ہو سکا۔ محفوظ ریٹ دکھائے جا رہے ہیں۔';

  @override
  String get currencyNoRatesTitle => 'ریٹ ابھی ڈاؤن لوڈ نہیں ہوئے';

  @override
  String get currencyNoRatesBody =>
      'ریٹ ڈاؤن لوڈ کرنے کے لیے ایک بار انٹرنیٹ سے جڑیں۔ اس کے بعد یہ انٹرنیٹ کے بغیر بھی کام کرے گا۔';

  @override
  String get currencyRetry => 'دوبارہ کوشش کریں';

  @override
  String get currencyOtherFavorites => 'آپ کی پسندیدہ کرنسیاں';

  @override
  String get currencyFavoritesHint =>
      'فہرست میں کسی کرنسی کے ساتھ ☆ دبائیں، وہ یہاں شامل ہو جائے گی۔';

  @override
  String get currencyCopy => 'نتیجہ کاپی کریں';

  @override
  String get currencyCopied => 'کاپی ہو گیا';

  @override
  String get currencyNoMatch => 'کوئی کرنسی نہیں ملی';

  @override
  String get currencyDisclaimer =>
      'ریٹ صرف اندازے کے لیے ہیں اور آپ کے بینک کے ریٹ سے مختلف ہو سکتے ہیں۔';

  @override
  String get directChatPhone => 'فون نمبر';

  @override
  String get directChatCountryCode => 'ملک کا کوڈ';

  @override
  String get directChatSearchCountry => 'ملک یا کوڈ تلاش کریں';

  @override
  String get directChatNoCountry => 'کوئی ملک نہیں ملا';

  @override
  String get directChatMessage => 'پیغام (اختیاری)';

  @override
  String get directChatOpen => 'WhatsApp میں کھولیں';

  @override
  String get directChatPaste => 'نمبر پیسٹ کریں';

  @override
  String get directChatPasteNone => 'کلپ بورڈ میں کوئی فون نمبر نہیں ملا';

  @override
  String get directChatTooShort => 'یہ نمبر بہت چھوٹا لگ رہا ہے';

  @override
  String get directChatTooLong => 'یہ نمبر بہت لمبا لگ رہا ہے';

  @override
  String directChatWillOpen(String number) {
    return '$number سے چیٹ';
  }

  @override
  String get directChatOpenFailed =>
      'چیٹ نہیں کھل سکی۔ کیا WhatsApp انسٹال ہے؟';

  @override
  String get directChatHint =>
      'کسی بھی نمبر کو کانٹیکٹس میں محفوظ کیے بغیر پیغام بھیجیں۔';

  @override
  String get directChatNotAffiliated =>
      'آزاد ٹول۔ WhatsApp یا Meta سے کوئی تعلق نہیں۔';

  @override
  String get percentageTabPercent => 'فیصد';

  @override
  String get percentageTabDiscount => 'ڈسکاؤنٹ';

  @override
  String get percentageTabTip => 'ٹپ اور تقسیم';

  @override
  String get percentageTabTax => 'ٹیکس / GST';

  @override
  String get percentageOfTitle => 'کسی عدد کا فیصد';

  @override
  String get percentageFieldPercent => 'فیصد';

  @override
  String get percentageFieldNumber => 'عدد';

  @override
  String percentageOfResult(String percent, String number) {
    return '$number کا $percent';
  }

  @override
  String get percentageWhatTitle => 'یہ کتنے فیصد ہے؟';

  @override
  String get percentageFieldPart => 'قدر';

  @override
  String get percentageFieldTotal => 'کل';

  @override
  String percentageWhatResult(String part, String total) {
    return '$total میں سے $part';
  }

  @override
  String get percentageChangeTitle => 'فیصد تبدیلی';

  @override
  String get percentageFieldOld => 'پرانی قدر';

  @override
  String get percentageFieldNew => 'نئی قدر';

  @override
  String percentageIncrease(String percent) {
    return '$percent اضافہ';
  }

  @override
  String percentageDecrease(String percent) {
    return '$percent کمی';
  }

  @override
  String get percentageNoChange => 'کوئی تبدیلی نہیں';

  @override
  String get percentageDifference => 'فرق';

  @override
  String get percentagePrice => 'اصل قیمت';

  @override
  String get percentageDiscount => 'ڈسکاؤنٹ';

  @override
  String get percentageExtraDiscount => 'اضافی ڈسکاؤنٹ (اختیاری)';

  @override
  String get percentageYouPay => 'آپ ادا کریں گے';

  @override
  String get percentageYouSave => 'آپ کی بچت';

  @override
  String get percentageTotalDiscount => 'کل ڈسکاؤنٹ';

  @override
  String get percentageBill => 'بل کی رقم';

  @override
  String get percentageTip => 'ٹپ';

  @override
  String get percentageCustom => 'اپنی مرضی';

  @override
  String get percentagePeople => 'افراد';

  @override
  String get percentageAddPerson => 'ایک فرد شامل کریں';

  @override
  String get percentageRemovePerson => 'ایک فرد کم کریں';

  @override
  String get percentageTipAmount => 'ٹپ کی رقم';

  @override
  String get percentageTotal => 'کل';

  @override
  String get percentagePerPerson => 'ہر فرد ادا کرے گا';

  @override
  String get percentageTaxRate => 'ٹیکس کی شرح';

  @override
  String get percentageAddTax => 'ٹیکس شامل کریں';

  @override
  String get percentageRemoveTax => 'ٹیکس نکالیں';

  @override
  String get percentagePriceExclTax => 'ٹیکس کے بغیر قیمت';

  @override
  String get percentagePriceInclTax => 'ٹیکس سمیت قیمت';

  @override
  String get percentageBeforeTax => 'ٹیکس سے پہلے';

  @override
  String get percentageTaxAmount => 'ٹیکس';

  @override
  String get percentageAfterTax => 'ٹیکس سمیت کل';

  @override
  String get percentageEnterValues => 'نتیجہ دیکھنے کے لیے اعداد لکھیں';

  @override
  String get commonSave => 'محفوظ کریں';

  @override
  String get commonShare => 'شیئر کریں';

  @override
  String get commonCopy => 'کاپی کریں';

  @override
  String get commonCopied => 'کاپی ہو گیا';

  @override
  String get commonRetry => 'دوبارہ کوشش کریں';

  @override
  String get commonDone => 'ہو گیا';

  @override
  String get commonDelete => 'حذف کریں';

  @override
  String get commonUndo => 'واپس کریں';

  @override
  String get commonOpen => 'کھولیں';

  @override
  String get commonReset => 'ری سیٹ کریں';

  @override
  String get commonClose => 'بند کریں';

  @override
  String get commonOpenSettings => 'سیٹنگز کھولیں';

  @override
  String get commonChoosePhoto => 'تصویر منتخب کریں';

  @override
  String get commonChooseFile => 'فائل منتخب کریں';

  @override
  String get commonCamera => 'کیمرا';

  @override
  String get commonGallery => 'گیلری';

  @override
  String get commonWorking => 'کام جاری ہے…';

  @override
  String get commonSavedToGallery => 'گیلری میں محفوظ ہو گیا';

  @override
  String get commonSavedToDownloads => 'ڈاؤن لوڈز میں محفوظ ہو گیا';

  @override
  String get commonSaveFailed => 'فائل محفوظ نہیں ہو سکی';

  @override
  String get commonErrorGeneric => 'کچھ غلط ہو گیا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get commonErrorOffline => 'انٹرنیٹ کنکشن نہیں ہے';

  @override
  String get commonErrorTimeout => 'وقت ختم ہو گیا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get commonPermissionNeeded => 'اجازت درکار ہے۔ سیٹنگز میں اجازت دیں۔';

  @override
  String get commonResult => 'نتیجہ';

  @override
  String get commonStart => 'شروع کریں';

  @override
  String get commonStop => 'روکیں';

  @override
  String get commonClearAll => 'سب صاف کریں';

  @override
  String get commonPaste => 'پیسٹ کریں';

  @override
  String get commonSearch => 'تلاش کریں';

  @override
  String get organizePdfHint =>
      'منتخب کرنے کے لیے صفحات پر ٹیپ کریں۔ صفحہ دبا کر رکھیں، پھر ہٹانے کے لیے گھسیٹیں۔';

  @override
  String organizePdfSelected(int count) {
    return '$count منتخب';
  }

  @override
  String get organizePdfRotateLeft => 'بائیں گھمائیں';

  @override
  String get organizePdfRotateRight => 'دائیں گھمائیں';

  @override
  String get organizePdfDelete => 'حذف کریں';

  @override
  String get organizePdfSelectAll => 'سب منتخب کریں';

  @override
  String get organizePdfClearSelection => 'انتخاب ختم کریں';

  @override
  String organizePdfDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات حذف ہو گئے',
      one: '1 صفحہ حذف ہو گیا',
    );
    return '$_temp0';
  }

  @override
  String get organizePdfUndo => 'واپس لائیں';

  @override
  String get organizePdfKeepOne => 'PDF میں کم از کم ایک صفحہ ہونا ضروری ہے۔';

  @override
  String get organizePdfNoChanges =>
      'ابھی کوئی تبدیلی نہیں — پہلے صفحات ہٹائیں، گھمائیں یا حذف کریں۔';

  @override
  String get organizePdfReset => 'تمام تبدیلیاں واپس لیں';

  @override
  String get organizePdfMoveEarlier => 'پہلے لے جائیں';

  @override
  String get organizePdfMoveLater => 'بعد میں لے جائیں';

  @override
  String get organizePdfSave => 'PDF محفوظ کریں';

  @override
  String get organizePdfFailed => 'یہ PDF محفوظ نہیں ہو سکی۔';

  @override
  String get organizePdfResult => 'آپ کی ترتیب شدہ PDF تیار ہے';

  @override
  String pdfToTextReading(int current, int total) {
    return '$total میں سے صفحہ $current پڑھا جا رہا ہے…';
  }

  @override
  String pdfToTextWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count الفاظ',
      one: '1 لفظ',
    );
    return '$_temp0';
  }

  @override
  String get pdfToTextCopyAll => 'سب کاپی کریں';

  @override
  String get pdfToTextCopied => 'متن کاپی ہو گیا';

  @override
  String get pdfToTextSaveTxt => '‎.txt کے طور پر محفوظ کریں';

  @override
  String get pdfToTextEmptyPage => 'اس صفحے پر کوئی متن نہیں';

  @override
  String get pdfToTextScannedTitle => 'کوئی متن نہیں ملا';

  @override
  String get pdfToTextScannedBody =>
      'یہ PDF اسکین یا تصاویر لگتی ہے، اس لیے اس میں کاپی کرنے کے لیے متن نہیں ہے۔ اس کے بجائے ہم صفحہ 1 کی تصویر سے الفاظ پڑھ سکتے ہیں۔';

  @override
  String pdfToTextOpenOcr(String tool) {
    return '$tool سے صفحہ 1 پڑھیں';
  }

  @override
  String get pdfToTextFailed => 'اس PDF کا متن پڑھا نہیں جا سکا۔';

  @override
  String pdfToTextPartlyScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات پر کوئی متن نہیں (شاید اسکین شدہ ہیں)۔',
      one: '1 صفحے پر کوئی متن نہیں (شاید اسکین شدہ ہے)۔',
    );
    return '$_temp0';
  }

  @override
  String get pdfEditChoosePdf => 'PDF منتخب کریں';

  @override
  String get pdfEditChooseHint =>
      'یا کسی بھی ایپ سے PDF کو Utility Toolbox پر شیئر کریں';

  @override
  String get pdfEditChange => 'تبدیل کریں';

  @override
  String get pdfEditReading => 'پڑھا جا رہا ہے…';

  @override
  String pdfEditPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات',
      one: '1 صفحہ',
    );
    return '$_temp0';
  }

  @override
  String pdfEditPageN(int number) {
    return 'صفحہ $number';
  }

  @override
  String get pdfEditInvalidPdf => 'یہ فائل درست PDF نہیں لگتی۔';

  @override
  String get pdfEditLocked =>
      'یہ PDF پاس ورڈ سے محفوظ ہے۔ پہلے پاس ورڈ ہٹائیں، پھر دوبارہ کوشش کریں۔';

  @override
  String get pdfEditLockedShort => 'پاس ورڈ سے محفوظ';

  @override
  String get pdfEditPreviewFailed => 'یہ صفحہ دکھایا نہیں جا سکا۔';

  @override
  String get pdfEditResultReady => 'آپ کی PDF تیار ہے';

  @override
  String get pdfEditSaveDownloads => 'ڈاؤن لوڈز میں محفوظ کریں';

  @override
  String get pdfEditShare => 'شیئر کریں';

  @override
  String get pdfEditStartOver => 'دوبارہ شروع کریں';

  @override
  String get pdfEditSavedToDownloads =>
      'ڈاؤن لوڈز میں محفوظ ہو گیا — میری فائلیں میں دیکھیں';

  @override
  String get pdfEditSharedInstead => 'اس کے بجائے شیئر مینو کھول دیا گیا';

  @override
  String get pdfEditSaveFailed =>
      'فائل نہیں بن سکی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get signPdfStepPdf => 'اپنی PDF منتخب کریں';

  @override
  String get signPdfStepSignature => 'اپنا دستخط بنائیں';

  @override
  String get signPdfStepPlace => 'دستخط لگانے کے لیے کسی صفحے پر ٹیپ کریں';

  @override
  String get signPdfDraw => 'دستخط بنائیں';

  @override
  String get signPdfDrawAgain => 'دوبارہ بنائیں';

  @override
  String get signPdfUseSaved => 'محفوظ دستخط استعمال کریں';

  @override
  String get signPdfDeleteSaved => 'محفوظ دستخط حذف کریں';

  @override
  String get signPdfSavedDeleted => 'محفوظ دستخط حذف ہو گیا';

  @override
  String get signPdfDrawTitle => 'اپنا دستخط بنائیں';

  @override
  String get signPdfDrawHint => 'یہاں انگلی سے دستخط کریں';

  @override
  String get signPdfUndo => 'واپس کریں';

  @override
  String get signPdfInkBlack => 'سیاہ';

  @override
  String get signPdfInkBlue => 'نیلا';

  @override
  String get signPdfRemember => 'اگلی بار کے لیے دستخط محفوظ کریں';

  @override
  String get signPdfDone => 'یہ دستخط استعمال کریں';

  @override
  String get signPdfEmpty => 'پہلے اپنا دستخط بنائیں۔';

  @override
  String get signPdfSignatureLabel => 'آپ کا دستخط';

  @override
  String get signPdfPlaceHint =>
      'ہٹانے کے لیے گھسیٹیں، سائز بدلنے کے لیے دو انگلیاں یا سلائیڈر استعمال کریں۔ صفحے پر ٹیپ کریں تو دستخط وہاں آ جائے گا۔';

  @override
  String get signPdfSize => 'سائز';

  @override
  String get signPdfPlaceConfirm => 'یہاں لگائیں';

  @override
  String get signPdfRemoveFromPage => 'اس صفحے سے ہٹائیں';

  @override
  String get signPdfAllPages => 'تمام صفحات پر لگائیں';

  @override
  String signPdfAllPagesDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'دستخط تمام $count صفحات پر لگ گیا',
      one: 'دستخط 1 صفحے پر لگ گیا',
    );
    return '$_temp0';
  }

  @override
  String get signPdfClearAll => 'سب ہٹائیں';

  @override
  String signPdfPlacedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات پر دستخط ہو گئے',
      one: '1 صفحے پر دستخط ہو گئے',
      zero: 'ابھی تک کسی صفحے پر دستخط نہیں',
    );
    return '$_temp0';
  }

  @override
  String get signPdfSave => 'دستخط شدہ PDF محفوظ کریں';

  @override
  String get signPdfNoPlacement => 'پہلے کسی صفحے پر ٹیپ کر کے دستخط لگائیں۔';

  @override
  String get signPdfFailed => 'اس PDF پر دستخط نہیں ہو سکے۔';

  @override
  String get signPdfResult => 'آپ کی دستخط شدہ PDF تیار ہے';

  @override
  String get watermarkPdfModeText => 'متن واٹرمارک';

  @override
  String get watermarkPdfModeNumbers => 'صفحہ نمبر';

  @override
  String get watermarkPdfText => 'واٹرمارک کا متن';

  @override
  String get watermarkPdfDefaultText => 'خفیہ';

  @override
  String get watermarkPdfTextEmpty => 'پہلے واٹرمارک کا متن لکھیں۔';

  @override
  String get watermarkPdfSize => 'متن کا سائز';

  @override
  String get watermarkPdfOpacity => 'دھندلاپن';

  @override
  String get watermarkPdfLayout => 'ترتیب';

  @override
  String get watermarkPdfDiagonal => 'ترچھا';

  @override
  String get watermarkPdfCenter => 'درمیان';

  @override
  String get watermarkPdfTiled => 'بار بار';

  @override
  String get watermarkPdfColor => 'رنگ';

  @override
  String get watermarkPdfColorGrey => 'سرمئی';

  @override
  String get watermarkPdfColorRed => 'سرخ';

  @override
  String get watermarkPdfColorBlue => 'نیلا';

  @override
  String get watermarkPdfColorBlack => 'سیاہ';

  @override
  String get watermarkPdfColorGreen => 'سبز';

  @override
  String get watermarkPdfFormat => 'انداز';

  @override
  String watermarkPdfPageLabel(String number) {
    return 'صفحہ $number';
  }

  @override
  String get watermarkPdfPosition => 'جگہ';

  @override
  String get watermarkPdfBottomCenter => 'نیچے درمیان';

  @override
  String get watermarkPdfBottomRight => 'نیچے دائیں';

  @override
  String get watermarkPdfTopRight => 'اوپر دائیں';

  @override
  String get watermarkPdfStartAt => 'شروع نمبر';

  @override
  String get watermarkPdfDecrease => 'کم کریں';

  @override
  String get watermarkPdfIncrease => 'بڑھائیں';

  @override
  String get watermarkPdfPreview => 'پیش نظارہ (صفحہ 1)';

  @override
  String get watermarkPdfApplyText => 'واٹرمارک لگائیں';

  @override
  String get watermarkPdfApplyNumbers => 'صفحہ نمبر لگائیں';

  @override
  String get watermarkPdfFailed => 'یہ PDF اپ ڈیٹ نہیں ہو سکی۔';

  @override
  String get bgRemoverPickTitle => 'ایک تصویر منتخب کریں';

  @override
  String get bgRemoverPickBody =>
      'لوگوں، پالتو جانوروں اور چیزوں کے ساتھ بہترین کام کرتا ہے۔ آپ کی تصویر آپ کے فون پر ہی پروسیس ہوتی ہے۔';

  @override
  String get bgRemoverGallery => 'گیلری سے منتخب کریں';

  @override
  String get bgRemoverCamera => 'تصویر لیں';

  @override
  String get bgRemoverPreparing => 'تصویر تیار ہو رہی ہے…';

  @override
  String get bgRemoverWorking => 'بیک گراؤنڈ ہٹایا جا رہا ہے…';

  @override
  String get bgRemoverDownloading =>
      'بیک گراؤنڈ ہٹانے کا ٹول تیار ہو رہا ہے۔ یہ صرف ایک بار ہوتا ہے اور انٹرنیٹ درکار ہے…';

  @override
  String get bgRemoverDownloadFailed =>
      'بیک گراؤنڈ ہٹانے کا ٹول ابھی تیار نہیں۔ Google Play سروسز اسے ابھی ڈاؤن لوڈ کر رہی ہیں۔ انٹرنیٹ کنکشن چیک کریں اور ایک منٹ بعد دوبارہ کوشش کریں۔';

  @override
  String get bgRemoverNoSubject =>
      'اس تصویر میں کوئی شخص یا چیز نہیں ملی۔ واضح موضوع والی تصویر آزمائیں۔';

  @override
  String get bgRemoverOpenFailed => 'یہ تصویر نہیں کھل سکی۔ کوئی اور آزمائیں۔';

  @override
  String get bgRemoverFailed =>
      'بیک گراؤنڈ ہٹاتے وقت کچھ غلط ہو گیا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get bgRemoverRetry => 'دوبارہ کوشش کریں';

  @override
  String get bgRemoverAnotherPhoto => 'دوسری تصویر منتخب کریں';

  @override
  String get bgRemoverNewPhoto => 'نئی تصویر';

  @override
  String get bgRemoverBefore => 'پہلے';

  @override
  String get bgRemoverAfter => 'بعد میں';

  @override
  String get bgRemoverCompare => 'پہلے اور بعد کا موازنہ کریں';

  @override
  String get bgRemoverCompareHint => 'موازنے کے لیے سلائیڈر کھینچیں';

  @override
  String get bgRemoverBgTransparent => 'شفاف';

  @override
  String get bgRemoverBgWhite => 'سفید';

  @override
  String get bgRemoverBgBlack => 'سیاہ';

  @override
  String get bgRemoverBgBlue => 'نیلا';

  @override
  String get bgRemoverBgRed => 'سرخ';

  @override
  String get bgRemoverBgYellow => 'پیلا';

  @override
  String get bgRemoverBgBlur => 'دھندلا';

  @override
  String get bgRemoverSave => 'گیلری میں محفوظ کریں';

  @override
  String get bgRemoverSaved => 'آپ کی گیلری میں محفوظ ہو گئی';

  @override
  String get bgRemoverSaveFailed =>
      'تصویر محفوظ نہیں ہو سکی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get bgRemoverPngHint => 'شفاف بیک گراؤنڈ والی PNG';

  @override
  String get bgRemoverJpgHint => 'منتخب بیک گراؤنڈ والی JPG';

  @override
  String get bubbleLevelSurfaceHint => 'فون کو سطح پر سیدھا لٹائیں';

  @override
  String get bubbleLevelUprightHint => 'فون کا کنارہ سطح سے لگا کر رکھیں';

  @override
  String get bubbleLevelLevel => 'ہموار';

  @override
  String bubbleLevelAngleLabel(String angle) {
    return 'جھکاؤ $angle ڈگری';
  }

  @override
  String bubbleLevelAxes(String x, String y) {
    return 'دائیں–بائیں $x° · آگے–پیچھے $y°';
  }

  @override
  String get bubbleLevelCalibrate => 'کیلیبریٹ کریں';

  @override
  String get bubbleLevelReset => 'ری سیٹ کریں';

  @override
  String get bubbleLevelCalibrateTitle => 'لیول کیلیبریٹ کریں؟';

  @override
  String get bubbleLevelCalibrateBody =>
      'فون کو ایسی سطح پر رکھیں جو یقینی طور پر ہموار ہو (یا کسی سیدھے کنارے سے لگائیں)، پھر کیلیبریٹ کریں پر ٹیپ کریں۔ موجودہ حالت 0° دکھائے گی۔';

  @override
  String get bubbleLevelCalibrated =>
      'کیلیبریٹ ہو گیا۔ یہ حالت اب 0° دکھاتی ہے۔';

  @override
  String get bubbleLevelResetDone => 'کیلیبریشن ختم کر دی گئی';

  @override
  String get bubbleLevelUnavailable =>
      'اس فون میں موشن سینسر نہیں ہے، اس لیے لیول یہاں کام نہیں کر سکتا۔';

  @override
  String get flashlightOn => 'روشنی آن ہے';

  @override
  String get flashlightOff => 'روشنی بند ہے';

  @override
  String get flashlightTurnOn => 'روشنی آن کریں';

  @override
  String get flashlightTurnOff => 'روشنی بند کریں';

  @override
  String get flashlightModeSteady => 'مسلسل';

  @override
  String get flashlightModeSos => 'SOS';

  @override
  String get flashlightModeStrobe => 'اسٹروب';

  @override
  String get flashlightSosHint => 'مدد کا اشارہ ··· ––– ··· بار بار چمکاتا ہے';

  @override
  String flashlightStrobeSpeed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'فی سیکنڈ $count فلیش',
      one: 'فی سیکنڈ 1 فلیش',
    );
    return '$_temp0';
  }

  @override
  String get flashlightUseScreen => 'اسکرین کی روشنی استعمال کریں';

  @override
  String get flashlightUseScreenHint => 'فلیش کی بجائے اسکرین روشن کریں';

  @override
  String get flashlightNoTorch =>
      'اس فون میں فلیش نہیں ہے، اس لیے اسکرین روشن ہوگی۔';

  @override
  String get flashlightTorchBusy =>
      'فلیش مصروف ہے (شاید کوئی اور ایپ کیمرا استعمال کر رہی ہے)، اس لیے اسکرین روشن ہوگی۔';

  @override
  String get flashlightScreenColor => 'اسکرین کی روشنی کا رنگ';

  @override
  String get flashlightColorWhite => 'سفید';

  @override
  String get flashlightColorWarm => 'گرم سفید';

  @override
  String get flashlightColorRed => 'سرخ';

  @override
  String get flashlightColorGreen => 'سبز';

  @override
  String get flashlightColorBlue => 'نیلا';

  @override
  String get flashlightTapToTurnOff => 'بند کرنے کے لیے کہیں بھی ٹیپ کریں';

  @override
  String get stopwatchTabStopwatch => 'اسٹاپ واچ';

  @override
  String get stopwatchTabTimer => 'ٹائمر';

  @override
  String get stopwatchStart => 'شروع کریں';

  @override
  String get stopwatchPause => 'روکیں';

  @override
  String get stopwatchResume => 'جاری رکھیں';

  @override
  String get stopwatchLap => 'لیپ';

  @override
  String get stopwatchReset => 'ری سیٹ کریں';

  @override
  String stopwatchLapNumber(int number) {
    return 'لیپ $number';
  }

  @override
  String stopwatchCurrentLap(int number, String time) {
    return 'لیپ $number: $time';
  }

  @override
  String get stopwatchBest => 'سب سے تیز';

  @override
  String get stopwatchWorst => 'سب سے سست';

  @override
  String get stopwatchNoLaps =>
      'اسٹاپ واچ چلتے وقت لیپ دبائیں تاکہ لیپ کا وقت محفوظ ہو۔';

  @override
  String get stopwatchTimerQuickStart => 'فوری آغاز';

  @override
  String stopwatchTimerMinutes(int minutes) {
    return '$minutes منٹ';
  }

  @override
  String get stopwatchTimerCustom => 'اپنا وقت مقرر کریں';

  @override
  String get stopwatchTimerPickTitle => 'ٹائمر سیٹ کریں';

  @override
  String get stopwatchTimerHours => 'گھنٹے';

  @override
  String get stopwatchTimerMinutesUnit => 'منٹ';

  @override
  String get stopwatchTimerSeconds => 'سیکنڈ';

  @override
  String get stopwatchTimerAddMinute => '+1 منٹ';

  @override
  String get stopwatchTimerPaused => 'رکا ہوا';

  @override
  String stopwatchTimerRemaining(String time) {
    return '$time باقی';
  }

  @override
  String get stopwatchTimerTimesUp => 'وقت ختم!';

  @override
  String stopwatchTimerFinishedBody(String duration) {
    return 'آپ کا $duration کا ٹائمر مکمل ہو گیا۔';
  }

  @override
  String get stopwatchTimerRestart => 'دوبارہ شروع کریں';

  @override
  String get stopwatchTimerDone => 'ٹھیک ہے';

  @override
  String get stopwatchTimerKeepOpen =>
      'یہ اسکرین کھلی رکھیں: وقت ختم ہونے پر فون وائبریٹ کرے گا۔';

  @override
  String get translateHeroTitle => 'ترجمے کے لیے بولیں یا لکھیں';

  @override
  String get translateBadgeOnDevice => 'ڈیوائس پر AI';

  @override
  String get translateBadgeOffline => 'آف لائن کام کرتا ہے';

  @override
  String get translateFrom => 'ماخذ زبان';

  @override
  String get translateTo => 'ہدف زبان';

  @override
  String get translateSwap => 'زبانیں بدلیں';

  @override
  String get translateHint => 'متن درج کریں یا بولنے کے لیے مائیک دبائیں…';

  @override
  String get translateHintListening =>
      'سن رہا ہے… عام انداز میں بولیں، روکنے کے لیے مائیک دبائیں';

  @override
  String translateListeningIn(String language) {
    return '$language میں سن رہا ہے… روک کر ترجمہ کرنے کے لیے مائیک دبائیں۔';
  }

  @override
  String get translateSameLanguage => 'ماخذ اور ہدف زبان مختلف ہونی چاہیے۔';

  @override
  String get translateButton => 'ترجمہ کریں';

  @override
  String get translateTranslating => 'ترجمہ ہو رہا ہے…';

  @override
  String get translateStopAndTranslate => 'روکیں اور ترجمہ کریں';

  @override
  String get translateDownloadingModel => 'زبان کا ماڈل ڈاؤن لوڈ ہو رہا ہے…';

  @override
  String get translateResultLabel => 'ترجمہ';

  @override
  String get translatePlayAudio => 'آڈیو چلائیں';

  @override
  String get translateGenerating => 'بن رہا ہے…';

  @override
  String get translateShareAudio => 'آڈیو فائل شیئر کریں';

  @override
  String get translateGenerateAudio => 'آڈیو فائل بنائیں';

  @override
  String get translateAudioReady =>
      'آڈیو فائل تیار ہے — بھیجنے یا محفوظ کرنے کے لیے شیئر کریں۔';

  @override
  String get translateMicStop => 'سننا روکیں اور ترجمہ کریں';

  @override
  String get translateMicStart => 'ترجمے کے لیے بولیں';

  @override
  String get translateMicBlocked =>
      'مائیکروفون کی اجازت بند ہے۔ آواز سے لکھنے کے لیے اسے سیٹنگز میں آن کریں۔';

  @override
  String get translateMicNeeded =>
      'آواز سے لکھنے کے لیے مائیکروفون کی اجازت درکار ہے۔';

  @override
  String get translateSpeechUnavailable =>
      'اس ڈیوائس پر آواز کی شناخت دستیاب نہیں ہے۔';

  @override
  String get translateNoSpeech => 'کچھ سنائی نہیں دیا۔ براہِ کرم دوبارہ بولیں۔';

  @override
  String get translateVoiceFailed =>
      'آواز سے لکھنا رک گیا۔ براہِ کرم دوبارہ کوشش کریں۔';

  @override
  String get translateDownloadFailed =>
      'زبان کے ماڈل ڈاؤن لوڈ نہیں ہو سکے۔ اپنا انٹرنیٹ کنکشن چیک کریں۔';

  @override
  String get translateFailed =>
      'ترجمہ نہیں ہو سکا۔ براہِ کرم دوبارہ کوشش کریں۔';

  @override
  String get translateAudioFailed => 'اس ڈیوائس پر آڈیو فائل نہیں بن سکی۔';

  @override
  String translateLanguageName(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'af': 'افریقانز',
      'sq': 'البانوی',
      'ar': 'عربی',
      'be': 'بیلاروسی',
      'bn': 'بنگالی',
      'bg': 'بلغاری',
      'ca': 'کیٹالان',
      'zh': 'چینی (آسان)',
      'hr': 'کروشیائی',
      'cs': 'چیک',
      'da': 'ڈینش',
      'nl': 'ڈچ',
      'en': 'انگریزی',
      'eo': 'ایسپرانٹو',
      'et': 'اسٹونین',
      'fi': 'فنش',
      'fr': 'فرانسیسی',
      'gl': 'گالیشیائی',
      'ka': 'جارجیائی',
      'de': 'جرمن',
      'el': 'یونانی',
      'gu': 'گجراتی',
      'ht': 'ہیتی کریول',
      'he': 'عبرانی',
      'hi': 'ہندی',
      'hu': 'ہنگیرین',
      'is': 'آئس لینڈک',
      'id': 'انڈونیشیائی',
      'ga': 'آئرش',
      'it': 'اطالوی',
      'ja': 'جاپانی',
      'kn': 'کنڑ',
      'ko': 'کوریائی',
      'lv': 'لیٹوین',
      'lt': 'لتھوینین',
      'mk': 'مقدونیائی',
      'ms': 'مالے',
      'mt': 'مالٹی',
      'mr': 'مراٹھی',
      'no': 'نارویجین',
      'fa': 'فارسی',
      'pl': 'پولش',
      'pt': 'پرتگالی',
      'ro': 'رومانیائی',
      'ru': 'روسی',
      'sk': 'سلوواک',
      'sl': 'سلووینیائی',
      'es': 'ہسپانوی',
      'sw': 'سواحلی',
      'sv': 'سویڈش',
      'tl': 'ٹیگالوگ (فلپینو)',
      'ta': 'تمل',
      'te': 'تیلگو',
      'th': 'تھائی',
      'tr': 'ترکی',
      'uk': 'یوکرینی',
      'ur': 'اردو',
      'vi': 'ویتنامی',
      'cy': 'ویلش',
      'other': '$code',
    });
    return '$_temp0';
  }

  @override
  String get textUtilMode => 'موڈ';

  @override
  String get textUtilModeText => 'متن';

  @override
  String get textUtilHint => 'یہاں متن لکھیں…';

  @override
  String get textUtilHintBase64 => 'تبدیل کرنے کے لیے متن یا Base64 لکھیں…';

  @override
  String textUtilWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'الفاظ',
    );
    return '$_temp0';
  }

  @override
  String textUtilCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حروف',
    );
    return '$_temp0';
  }

  @override
  String get textUtilNoSpaces => 'خالی جگہ کے بغیر';

  @override
  String get textUtilUpper => 'بڑے حروف';

  @override
  String get textUtilLower => 'چھوٹے حروف';

  @override
  String get textUtilTitle => 'ہر لفظ کا پہلا حرف بڑا';

  @override
  String get textUtilSentence => 'جملے کا پہلا حرف بڑا';

  @override
  String get textUtilEncode => 'انکوڈ کریں';

  @override
  String get textUtilDecode => 'ڈی کوڈ کریں';

  @override
  String get textUtilOutput => 'نتیجہ';

  @override
  String get textUtilInvalidBase64 => 'یہ درست Base64 نہیں ہے۔';

  @override
  String get clipEmptyClipboard => 'کلپ بورڈ خالی ہے یا اس میں کوئی متن نہیں۔';

  @override
  String clipSaved(String text) {
    return 'محفوظ ہو گیا: $text';
  }

  @override
  String get clipAddManualTitle => 'متن خود شامل کریں';

  @override
  String get clipAddHint => 'یہاں لکھیں یا پیسٹ کریں…';

  @override
  String get clipClearUnpinned => 'غیر پن شدہ صاف کریں';

  @override
  String get clipClearHistoryTitle => 'ہسٹری صاف کریں؟';

  @override
  String get clipClearHistoryBody =>
      'تمام غیر پن شدہ آئٹمز ہٹا دیں؟ پن شدہ آئٹمز رہیں گے۔';

  @override
  String get clipSearchHint => 'کلپس تلاش کریں…';

  @override
  String get clipFilterAll => 'سب';

  @override
  String get clipFilterPinned => 'پن شدہ';

  @override
  String get clipFilterLinks => 'لنکس';

  @override
  String get clipFilterText => 'متن';

  @override
  String get clipFilterCode => 'کوڈ';

  @override
  String clipSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString محفوظ',
    );
    return '$_temp0';
  }

  @override
  String clipPinnedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString پن شدہ',
    );
    return '$_temp0';
  }

  @override
  String get clipAddText => 'متن شامل کریں';

  @override
  String get clipLabel => 'لیبل';

  @override
  String get clipAddLabelTitle => 'لیبل شامل کریں';

  @override
  String get clipLabelHint => 'مثلاً: دفتر کی ای میل';

  @override
  String get clipEmptyTitle => 'ابھی کوئی کلپ نہیں';

  @override
  String get clipEmptyMessage =>
      'فون پر کوئی بھی متن کاپی کریں، پھر اسے یہاں مستقل محفوظ کرنے کے لیے پیسٹ دبائیں۔';

  @override
  String get clipPasteFromClipboard => 'کلپ بورڈ سے پیسٹ کریں';

  @override
  String get clipTypeLink => 'لنک';

  @override
  String get clipTypeEmail => 'ای میل';

  @override
  String get clipTypePhone => 'فون';

  @override
  String get clipTypeCode => 'کوڈ';

  @override
  String get clipTypeText => 'متن';

  @override
  String get clipJustNow => 'ابھی ابھی';

  @override
  String clipMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count منٹ پہلے',
    );
    return '$_temp0';
  }

  @override
  String clipHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count گھنٹے پہلے',
    );
    return '$_temp0';
  }

  @override
  String clipDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دن پہلے',
      one: '1 دن پہلے',
    );
    return '$_temp0';
  }

  @override
  String get clipPin => 'پن کریں';

  @override
  String get clipUnpin => 'ان پن کریں';

  @override
  String get calcDivideByZero => 'صفر سے تقسیم نہیں ہو سکتی';

  @override
  String get calcCheckExpression => 'حساب چیک کریں';

  @override
  String get calcCopyResult => 'نتیجہ کاپی کریں';

  @override
  String get calcPlus => 'جمع';

  @override
  String get calcMinus => 'منفی';

  @override
  String get calcTimes => 'ضرب';

  @override
  String get calcDivide => 'تقسیم';

  @override
  String get calcPercent => 'فیصد';

  @override
  String get calcParentheses => 'قوسین';

  @override
  String get calcEquals => 'برابر';

  @override
  String get calcDecimalPoint => 'اعشاریہ';

  @override
  String get ageTabAge => 'عمر';

  @override
  String get ageTabBetween => 'دو تاریخوں کے درمیان';

  @override
  String get ageDateOfBirth => 'تاریخِ پیدائش';

  @override
  String get ageFrom => 'ابتدائی تاریخ';

  @override
  String get ageTo => 'آخری تاریخ';

  @override
  String get ageFutureDate => 'یہ تاریخ مستقبل کی ہے۔';

  @override
  String ageYearsUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'سال',
    );
    return '$_temp0';
  }

  @override
  String ageDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'دن',
    );
    return '$_temp0';
  }

  @override
  String ageYears(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString سال',
    );
    return '$_temp0';
  }

  @override
  String ageMonths(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString مہینے',
      one: '1 مہینہ',
    );
    return '$_temp0';
  }

  @override
  String ageDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString دن',
    );
    return '$_temp0';
  }

  @override
  String ageWeeks(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ہفتے',
      one: '1 ہفتہ',
    );
    return '$_temp0';
  }

  @override
  String ageInDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString دن میں',
    );
    return '$_temp0';
  }

  @override
  String ageList2(String first, String second) {
    return '$first، $second';
  }

  @override
  String ageList3(String first, String second, String third) {
    return '$first، $second، $third';
  }

  @override
  String get ageNextBirthday => 'اگلی سالگرہ';

  @override
  String get ageBirthdayToday => 'آج 🎉';

  @override
  String get ageTotalMonths => 'کل مہینے';

  @override
  String get ageTotalWeeks => 'کل ہفتے';

  @override
  String get ageTotalDays => 'کل دن';

  @override
  String get ageWeeksLabel => 'ہفتے';

  @override
  String get ageWeekdays => 'کام کے دن (پیر–جمعہ)';

  @override
  String get ageHours => 'گھنٹے';

  @override
  String get ageIncludingEnd => 'آخری دن سمیت';

  @override
  String get unitFrom => 'اصل اکائی';

  @override
  String get unitTo => 'مطلوبہ اکائی';

  @override
  String get unitEnterValue => 'قدر درج کریں';

  @override
  String get unitSwap => 'اکائیاں بدلیں';

  @override
  String unitCategoryName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'length': 'لمبائی',
      'weight': 'وزن',
      'temperature': 'درجۂ حرارت',
      'area': 'رقبہ',
      'volume': 'حجم',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String unitName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'millimeter': 'ملی میٹر',
      'centimeter': 'سینٹی میٹر',
      'meter': 'میٹر',
      'kilometer': 'کلومیٹر',
      'inch': 'انچ',
      'foot': 'فٹ',
      'mile': 'میل',
      'gram': 'گرام',
      'kilogram': 'کلوگرام',
      'ounce': 'اونس',
      'pound': 'پاؤنڈ',
      'celsius': 'سیلسیس',
      'fahrenheit': 'فارن ہائیٹ',
      'kelvin': 'کیلون',
      'squareMeter': 'مربع میٹر',
      'squareFoot': 'مربع فٹ',
      'acre': 'ایکڑ',
      'hectare': 'ہیکٹر',
      'milliliter': 'ملی لیٹر',
      'liter': 'لیٹر',
      'gallonUs': 'گیلن (امریکی)',
      'fluidOunce': 'مائع اونس',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String get loanAmount => 'قرض کی رقم';

  @override
  String get loanInterestRate => 'سالانہ شرحِ سود';

  @override
  String get loanTenure => 'مدت';

  @override
  String get loanTenureMonths => 'مدت (مہینے)';

  @override
  String get loanTenureYears => 'مدت (سال)';

  @override
  String get loanToggleMonths => 'مہینے';

  @override
  String get loanToggleYears => 'سال';

  @override
  String get loanEmpty =>
      'ماہانہ قسط معلوم کرنے کے لیے اوپر درست قرض کی تفصیل درج کریں';

  @override
  String get loanMonthlyEmi => 'ماہانہ قسط';

  @override
  String get loanPrincipal => 'اصل رقم';

  @override
  String get loanTotalInterest => 'کل سود';

  @override
  String get loanTotalPayment => 'کل ادائیگی';

  @override
  String get loanBreakdown => 'تفصیل';

  @override
  String get loanInterest => 'سود';

  @override
  String loanInterestShare(String percent) {
    return '$percent سود';
  }

  @override
  String get loanSchedule => 'ادائیگی کا شیڈول';

  @override
  String loanMonths(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString مہینے',
      one: '1 مہینہ',
    );
    return '$_temp0';
  }

  @override
  String get loanColMonth => 'ماہ';

  @override
  String get loanColBalance => 'باقی';

  @override
  String get loanShowAll => 'تمام مہینے دکھائیں';

  @override
  String get loanShowLess => 'کم دکھائیں';

  @override
  String get clockSearchHint => 'شہر یا ملک تلاش کریں…';

  @override
  String get clockPinned => 'پن شدہ';

  @override
  String get clockAllCities => 'تمام شہر';

  @override
  String clockOnWidget(int shown, int total) {
    final intl.NumberFormat shownNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String shownString = shownNumberFormat.format(shown);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'ویجیٹ پر: $totalString میں سے $shownString';
  }

  @override
  String clockOnWidgetMore(int shown, int max) {
    final intl.NumberFormat shownNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String shownString = shownNumberFormat.format(shown);
    final intl.NumberFormat maxNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String maxString = maxNumberFormat.format(max);

    return 'ویجیٹ پر: زیادہ سے زیادہ $maxString میں سے $shownString (مزید دیکھنے کے لیے سائز بڑھائیں)';
  }

  @override
  String clockWidgetHint(int defaultRows, int maxRows) {
    final intl.NumberFormat defaultRowsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String defaultRowsString = defaultRowsNumberFormat.format(
      defaultRows,
    );
    final intl.NumberFormat maxRowsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String maxRowsString = maxRowsNumberFormat.format(maxRows);

    return 'ہوم اسکرین ویجیٹ شروع میں پہلے $defaultRowsString دکھاتا ہے — نیچے کا کنارہ کھینچ کر بڑا کریں تو $maxRowsString تک نظر آئیں گے۔';
  }

  @override
  String get clockPin => 'پن کریں';

  @override
  String get clockUnpin => 'ان پن کریں';

  @override
  String get clockNoResults => 'کوئی مماثل شہر نہیں';

  @override
  String get speedSelectingServer => 'سرور منتخب کیا جا رہا ہے…';

  @override
  String get speedPhasePing => 'پنگ کی پیمائش ہو رہی ہے';

  @override
  String get speedPhaseDownload => 'ڈاؤن لوڈ اسپیڈ چیک ہو رہی ہے';

  @override
  String get speedPhaseUpload => 'اپ لوڈ اسپیڈ چیک ہو رہی ہے';

  @override
  String get speedDownloadSpeed => 'ڈاؤن لوڈ اسپیڈ';

  @override
  String get speedUploadSpeed => 'اپ لوڈ اسپیڈ';

  @override
  String get speedRunAgain => 'دوبارہ';

  @override
  String get speedGo => 'شروع';

  @override
  String speedMeasuredVia(String server) {
    return '$server کے ذریعے ناپا گیا';
  }

  @override
  String get speedPoweredBy => 'Cloudflare کے اسپیڈ ٹیسٹ سرورز استعمال کرتا ہے';

  @override
  String get speedIdleHint =>
      'پنگ، ڈاؤن لوڈ اور اپ لوڈ اسپیڈ ناپنے کے لیے بٹن دبائیں۔';

  @override
  String get speedPing => 'پنگ';

  @override
  String get speedResultsTitle => 'اسپیڈ ٹیسٹ کے نتائج';

  @override
  String get speedDownload => 'ڈاؤن لوڈ';

  @override
  String get speedUpload => 'اپ لوڈ';

  @override
  String speedConnectedIp(String ip) {
    return 'آپ کا IP: $ip';
  }

  @override
  String get speedErrorOffline =>
      'انٹرنیٹ کنکشن نہیں ہے۔ اپنا Wi-Fi یا موبائل ڈیٹا چیک کریں۔';

  @override
  String get speedErrorTimeout =>
      'ٹیسٹ کا وقت ختم ہو گیا۔ ہو سکتا ہے آپ کا کنکشن غیر مستحکم ہو۔';

  @override
  String get speedErrorFailed =>
      'ٹیسٹ ناکام ہو گیا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get pingErrorHostNotFound =>
      'ہوسٹ نہیں ملا۔ پتا اور اپنا انٹرنیٹ کنکشن چیک کریں۔';

  @override
  String get pingErrorNoData => 'اس پتے کے لیے کوئی معلومات دستیاب نہیں۔';

  @override
  String get pingTabMyIp => 'میرا IP';

  @override
  String get pingTabLookup => 'تلاش';

  @override
  String get pingTabPing => 'پنگ';

  @override
  String get pingYourPublicIp => 'آپ کا پبلک IP';

  @override
  String get pingFieldCity => 'شہر';

  @override
  String get pingFieldRegion => 'علاقہ';

  @override
  String get pingFieldCountry => 'ملک';

  @override
  String get pingFieldIsp => 'ISP / ادارہ';

  @override
  String get pingFieldTimezone => 'ٹائم زون';

  @override
  String get pingFieldLocation => 'کوآرڈینیٹس';

  @override
  String get pingFieldIp => 'IP ایڈریس';

  @override
  String get pingIpCopied => 'IP ایڈریس کاپی ہو گیا';

  @override
  String get pingCopyIp => 'IP کاپی کریں';

  @override
  String get pingLookupHint => 'IP ایڈریس یا ہوسٹ نیم';

  @override
  String get pingLookupButton => 'تلاش کریں';

  @override
  String get pingHostHint => 'ہوسٹ نیم (مثلاً google.com)';

  @override
  String get pingStartButton => 'پنگ کریں';

  @override
  String pingHeader(String host, String ip) {
    return '$host ($ip) – TCP پورٹ 443 کے ذریعے پنگ';
  }

  @override
  String get pingStatAvg => 'اوسط';

  @override
  String get pingStatLoss => 'لاس';

  @override
  String get pingStatSent => 'بھیجے گئے';

  @override
  String get pingTimeout => 'ٹائم آؤٹ';

  @override
  String get compassN => 'ش';

  @override
  String get compassNE => 'ش ق';

  @override
  String get compassE => 'ق';

  @override
  String get compassSE => 'ج ق';

  @override
  String get compassS => 'ج';

  @override
  String get compassSW => 'ج غ';

  @override
  String get compassW => 'غ';

  @override
  String get compassNW => 'ش غ';

  @override
  String get compassNorth => 'شمال';

  @override
  String get compassNortheast => 'شمال مشرق';

  @override
  String get compassEast => 'مشرق';

  @override
  String get compassSoutheast => 'جنوب مشرق';

  @override
  String get compassSouth => 'جنوب';

  @override
  String get compassSouthwest => 'جنوب مغرب';

  @override
  String get compassWest => 'مغرب';

  @override
  String get compassNorthwest => 'شمال مغرب';

  @override
  String compassSemantics(String degrees, String direction) {
    return 'سمت $degrees°، $direction';
  }

  @override
  String get compassHeadingMagnetic => 'مقناطیسی سمت';

  @override
  String get compassUnavailable =>
      'اس ڈیوائس میں میگنیٹومیٹر نہیں ہے، اس لیے قطب نما کام نہیں کر سکتا۔';

  @override
  String get locationSavedHeader => 'محفوظ لوکیشنز';

  @override
  String locationSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString محفوظ',
      one: '1 محفوظ',
      zero: 'ابھی کوئی نہیں',
    );
    return '$_temp0';
  }

  @override
  String locationEmpty(String save) {
    return 'ابھی کوئی لوکیشن محفوظ نہیں۔\nاپنی موجودہ جگہ محفوظ کرنے کے لیے “$save” دبائیں۔';
  }

  @override
  String locationDeleted(String name) {
    return '“$name” حذف ہو گیا';
  }

  @override
  String get locationSaveDialogTitle => 'لوکیشن محفوظ کریں';

  @override
  String get locationNameLabel => 'نام';

  @override
  String get locationNameHint => 'مثلاً گھر، دفتر…';

  @override
  String get locationNoteLabel => 'نوٹ (اختیاری)';

  @override
  String get locationCurrent => 'موجودہ لوکیشن';

  @override
  String get locationRefresh => 'لوکیشن اپ ڈیٹ کریں';

  @override
  String get locationLocating => 'آپ کی لوکیشن تلاش ہو رہی ہے…';

  @override
  String get locationServicesOff =>
      'لوکیشن بند ہے۔ اپنی جگہ دیکھنے کے لیے اسے آن کریں۔';

  @override
  String get locationPermissionDenied =>
      'اپنی جگہ دیکھنے کے لیے لوکیشن تک رسائی کی اجازت دیں۔';

  @override
  String get locationPermissionDeniedForever =>
      'لوکیشن تک رسائی بند ہے۔ یہ ٹول استعمال کرنے کے لیے سیٹنگز میں اجازت دیں۔';

  @override
  String get locationErrorTimeout =>
      'GPS سگنل نہیں ملا۔ کھڑکی کے پاس یا باہر جا کر دوبارہ کوشش کریں۔';

  @override
  String get locationAllow => 'اجازت دیں';

  @override
  String locationAccuracy(String meters) {
    return 'درستگی: ±$meters میٹر';
  }

  @override
  String get locationCoordsCopied => 'کوآرڈینیٹس کاپی ہو گئے';

  @override
  String get locationCopyCoords => 'کوآرڈینیٹس کاپی کریں';

  @override
  String get locationOpenInMaps => 'میپ میں کھولیں';

  @override
  String get passwordYours => 'آپ کا پاس ورڈ';

  @override
  String get passwordSelectType => 'کم از کم ایک قسم کے حروف منتخب کریں';

  @override
  String get passwordStrength => 'مضبوطی';

  @override
  String get passwordWeak => 'کمزور';

  @override
  String get passwordFair => 'درمیانہ';

  @override
  String get passwordGood => 'اچھا';

  @override
  String get passwordStrong => 'مضبوط';

  @override
  String get passwordLength => 'لمبائی';

  @override
  String passwordChars(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString حروف',
      one: '1 حرف',
    );
    return '$_temp0';
  }

  @override
  String get passwordInclude => 'شامل کریں';

  @override
  String get passwordUppercase => 'بڑے حروف';

  @override
  String get passwordLowercase => 'چھوٹے حروف';

  @override
  String get passwordNumbers => 'اعداد';

  @override
  String get passwordSymbols => 'علامات';

  @override
  String get passwordCopied => 'پاس ورڈ کاپی ہو گیا';

  @override
  String get passwordGenerate => 'نیا بنائیں';

  @override
  String get hashModeText => 'متن';

  @override
  String get hashModeFile => 'فائل';

  @override
  String get hashAlgorithm => 'الگورتھم';

  @override
  String get hashInputHint => 'ہیش کرنے کے لیے متن لکھیں…';

  @override
  String get hashPickFile => 'فائل منتخب کرنے کے لیے ٹیپ کریں';

  @override
  String get hashChange => 'تبدیل کریں';

  @override
  String get hashHashing => 'حساب ہو رہا ہے…';

  @override
  String get hashGenerate => 'ہیش بنائیں';

  @override
  String get hashFileError =>
      'یہ فائل پڑھی نہیں جا سکی۔ کوئی اور فائل آزمائیں۔';

  @override
  String get hashCopied => 'ہیش کاپی ہو گیا';

  @override
  String get hashCopy => 'ہیش کاپی کریں';

  @override
  String get colorPickerFormats => 'رنگ کے فارمیٹ';

  @override
  String get colorPickerHexLabel => 'HEX رنگ';

  @override
  String get colorPickerHexInvalid => '6 ہیکس ہندسے درج کریں (0–9، A–F)';

  @override
  String get colorPickerApply => 'رنگ لگائیں';

  @override
  String colorPickerCopied(String format) {
    return '$format کاپی ہو گیا';
  }

  @override
  String get colorPickerPalette => 'فوری پیلیٹ';

  @override
  String colorPickerSwatch(String hex) {
    return 'رنگ $hex';
  }

  @override
  String get imgCompressPickHint =>
      'تصویر منتخب کرنے یا کھینچنے کے لیے ٹیپ کریں';

  @override
  String imgCompressSupported(String formats) {
    return '$formats سپورٹڈ ہیں';
  }

  @override
  String get imgCompressChange => 'تصویر بدلیں';

  @override
  String get imgCompressModeQuality => 'کوالٹی کے لحاظ سے';

  @override
  String get imgCompressModeTarget => 'مقررہ سائز';

  @override
  String get imgCompressQuality => 'کوالٹی';

  @override
  String get imgCompressSmallest => 'سب سے چھوٹی فائل';

  @override
  String get imgCompressBestQuality => 'بہترین کوالٹی';

  @override
  String get imgCompressQualityNote =>
      'بڑی تصاویر کا سائز بھی تقریباً 1920×1080 تک کم کیا جاتا ہے۔';

  @override
  String imgCompressTargetUnder(String size) {
    return '$size سے کم';
  }

  @override
  String get imgCompressTargetHint =>
      'حد کے اندر بہترین کوالٹی برقرار رکھتا ہے — نوکری اور سرکاری فارم میں تصویر اپ لوڈ کرنے کے لیے مفید۔';

  @override
  String get imgCompressButton => 'تصویر کمپریس کریں';

  @override
  String get imgCompressCompressing => 'کمپریس ہو رہی ہے…';

  @override
  String get imgCompressSuccess => 'کامیابی سے کمپریس ہو گئی!';

  @override
  String imgCompressFitsTarget(String size) {
    return 'ہو گیا — سائز $size سے کم ہے';
  }

  @override
  String imgCompressMissedTarget(String size) {
    return '$size سے کم نہیں ہو سکی۔ یہ سب سے چھوٹا ورژن ہے جو ہم بنا سکے۔';
  }

  @override
  String get imgCompressStatOriginal => 'اصل';

  @override
  String get imgCompressStatCompressed => 'کمپریس شدہ';

  @override
  String get imgCompressStatSaved => 'بچت';

  @override
  String get imgCompressFailed =>
      'یہ تصویر کمپریس نہیں ہو سکی۔ کوئی دوسری آزمائیں۔';

  @override
  String get imgResizePresetPassport => 'پاسپورٹ 35×45 mm';

  @override
  String imgResizePresetSquare(String size) {
    return 'مربع $size';
  }

  @override
  String imgResizePresetStory(String size) {
    return 'اسٹوری $size';
  }

  @override
  String imgResizePresetMax(String name, String px) {
    return '$name (زیادہ سے زیادہ $px)';
  }

  @override
  String get imgResizeChoosePhotos => 'تصاویر منتخب کریں';

  @override
  String imgResizeSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تصاویر منتخب',
      one: '1 تصویر منتخب',
    );
    return '$_temp0';
  }

  @override
  String get imgResizePickHint =>
      'ایک یا کئی منتخب کریں — یا انہیں ایپ میں شیئر کریں';

  @override
  String get imgResizeChoose => 'منتخب کریں';

  @override
  String get imgResizeChange => 'بدلیں';

  @override
  String get imgResizePresets => 'پری سیٹس';

  @override
  String get imgResizeModePercent => 'فیصد';

  @override
  String get imgResizeModeMaxSide => 'بڑی سائیڈ';

  @override
  String get imgResizeModeExact => 'بالکل درست';

  @override
  String get imgResizeWidth => 'چوڑائی (px)';

  @override
  String get imgResizeHeight => 'اونچائی (px)';

  @override
  String get imgResizeCrop => 'فٹ کرنے کے لیے کراپ کریں (بغیر کھنچاؤ)';

  @override
  String get imgResizeFormat => 'فارمیٹ';

  @override
  String get imgResizeQuality => 'کوالٹی';

  @override
  String get imgResizeButton => 'سائز بدلیں';

  @override
  String imgResizeSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تصاویر گیلری میں محفوظ کریں',
      one: '1 تصویر گیلری میں محفوظ کریں',
    );
    return '$_temp0';
  }

  @override
  String get imgResizeChangeSettings => 'سیٹنگز بدلیں';

  @override
  String imgResizeInvalidSize(int min, int max) {
    return '$min اور $max کے درمیان چوڑائی اور اونچائی درج کریں۔';
  }

  @override
  String imgResizeFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تصاویر پڑھی نہیں جا سکیں۔',
      one: '1 تصویر پڑھی نہیں جا سکی۔',
    );
    return '$_temp0';
  }

  @override
  String imgResizeSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تصاویر آپ کی گیلری میں محفوظ ہو گئیں',
      one: '1 تصویر آپ کی گیلری میں محفوظ ہو گئی',
    );
    return '$_temp0';
  }

  @override
  String get imgEnhanceEmptyTitle => 'اپنی تصاویر ایڈٹ کریں';

  @override
  String get imgEnhanceEmptyBody =>
      'برائٹنس، کنٹراسٹ، سیچوریشن اور شارپنس ایڈجسٹ کریں، پری سیٹس لگائیں، گھمائیں اور پلٹیں — سب کچھ آپ کے ڈیوائس پر۔';

  @override
  String get imgEnhanceFineControls => 'باریک کنٹرولز';

  @override
  String get imgEnhanceApplying => 'لاگو ہو رہا ہے…';

  @override
  String get imgEnhanceChange => 'بدلیں';

  @override
  String get imgEnhancePresets => 'پری سیٹس';

  @override
  String get imgEnhanceTransform => 'ٹرانسفارم';

  @override
  String get imgEnhanceAdjustments => 'ایڈجسٹمنٹس';

  @override
  String get imgEnhanceRotate => 'گھمائیں';

  @override
  String get imgEnhanceFlipH => 'افقی پلٹیں';

  @override
  String get imgEnhanceFlipV => 'عمودی پلٹیں';

  @override
  String get imgEnhanceBrightness => 'برائٹنس';

  @override
  String get imgEnhanceContrast => 'کنٹراسٹ';

  @override
  String get imgEnhanceSaturation => 'سیچوریشن';

  @override
  String get imgEnhanceSharpen => 'شارپ';

  @override
  String get imgEnhanceBlur => 'دھندلا';

  @override
  String get imgEnhanceQuality => 'کوالٹی';

  @override
  String get imgEnhanceApply => 'لاگو کریں';

  @override
  String get imgEnhanceFailed =>
      'تبدیلیاں لاگو نہیں ہو سکیں۔ کوئی دوسری تصویر آزمائیں۔';

  @override
  String imgEnhanceResult(String before, String after, String change) {
    return 'ہو گیا! $before ← $after ($change)';
  }

  @override
  String get imgEnhancePresetOriginal => 'اصل';

  @override
  String get imgEnhancePresetVivid => 'شوخ';

  @override
  String get imgEnhancePresetCool => 'ٹھنڈا';

  @override
  String get imgEnhancePresetWarm => 'گرم';

  @override
  String get imgEnhancePresetDramatic => 'ڈرامائی';

  @override
  String get imgEnhancePresetFade => 'مدھم';

  @override
  String get imgEnhancePresetVintage => 'پرانا انداز';

  @override
  String get imgEnhancePresetNoir => 'بلیک اینڈ وائٹ';

  @override
  String get upscalerNewImage => 'نئی تصویر';

  @override
  String get upscalerIntro =>
      'ڈیوائس پر AI کے ذریعے تصاویر کو 4× تک بڑا کریں۔ ماڈل ایک بار ڈاؤن لوڈ ہونے کے بعد آف لائن کام کرتا ہے — چہروں کے لیے اختیاری کلاؤڈ موڈ۔';

  @override
  String get upscalerBadgeOnDevice => 'ڈیوائس پر AI';

  @override
  String get upscalerBadgeOffline => 'آف لائن کام کرتا ہے';

  @override
  String get upscalerBadgeUpTo4x => '4× تک بڑا';

  @override
  String get upscalerBadgeGpu => 'GPU سے تیز';

  @override
  String get upscalerBestResults =>
      'بہترین نتائج: کم ریزولوشن تصاویر، پرانے اسکین، تھمب نیلز اور کمپریس شدہ JPEG۔';

  @override
  String get upscalerChangeImage => 'تصویر بدلیں';

  @override
  String get upscalerTabOriginal => 'اصل';

  @override
  String get upscalerTabUpscaled => 'AI سے بڑی';

  @override
  String get upscalerStageStarting => 'شروع ہو رہا ہے…';

  @override
  String get upscalerStageConnecting => 'AI سرور سے رابطہ ہو رہا ہے…';

  @override
  String get upscalerStageOnDevice => 'اسی ڈیوائس پر پروسیسنگ ہو رہی ہے…';

  @override
  String get upscalerStageCloudUnavailable =>
      'کلاؤڈ دستیاب نہیں — اسی ڈیوائس پر پروسیسنگ ہو رہی ہے…';

  @override
  String get upscalerStageUploading => 'تصویر اپ لوڈ ہو رہی ہے…';

  @override
  String get upscalerStageRestoringFaces =>
      'AI چہرے اور تفصیلات بحال کر رہا ہے…';

  @override
  String get upscalerStagePreparing => 'تصویر تیار ہو رہی ہے…';

  @override
  String get upscalerStageLoadingModel => 'AI ماڈل لوڈ ہو رہا ہے…';

  @override
  String get upscalerStageDownloadingModel =>
      'AI ماڈل ڈاؤن لوڈ ہو رہا ہے (صرف ایک بار)…';

  @override
  String get upscalerStageFallback => 'عام اپ اسکیلنگ استعمال ہو رہی ہے…';

  @override
  String get upscalerStageDecoding => 'تصویر پڑھی جا رہی ہے…';

  @override
  String upscalerStageResizing(String from, String to) {
    return 'ان پٹ کا سائز بدلا جا رہا ہے ($from ← $to)…';
  }

  @override
  String get upscalerStageDenoising => 'شور کم کیا جا رہا ہے…';

  @override
  String upscalerStageUpscaling(String factor) {
    return 'بڑا کیا جا رہا ہے ($factor×)…';
  }

  @override
  String upscalerStageAiTiles(String done, String total) {
    return 'AI سے بڑا کیا جا رہا ہے… ($done/$total)';
  }

  @override
  String get upscalerStageSharpening => 'شارپ کیا جا رہا ہے…';

  @override
  String get upscalerStageColour => 'رنگ ایڈجسٹ ہو رہے ہیں…';

  @override
  String get upscalerStageSaving => 'محفوظ ہو رہا ہے…';

  @override
  String get upscalerStageDone => 'ہو گیا!';

  @override
  String get upscalerLoadingModelHint => 'AI ماڈل لوڈ ہو رہا ہے (صرف پہلی بار)';

  @override
  String get upscalerTime4x =>
      'تصویر کے سائز کے حساب سے 4× میں 15–60 s لگ سکتے ہیں۔';

  @override
  String get upscalerTime2x => '2× میں عموماً 5–20 s لگتے ہیں۔';

  @override
  String upscalerDoneIn(String seconds) {
    return '$seconds s میں بڑی ہو گئی';
  }

  @override
  String get upscalerStatResolution => 'ریزولوشن';

  @override
  String get upscalerStatFileSize => 'فائل سائز';

  @override
  String get upscalerStatScale => 'اسکیل';

  @override
  String get upscalerShareSubject => 'AI سے بڑی کی گئی تصویر';

  @override
  String get upscalerFallbackModelUnavailable =>
      'AI ماڈل کو ایک بار انٹرنیٹ چاہیے — عام اپ اسکیلنگ استعمال کی گئی';

  @override
  String get upscalerFallbackModelFailed =>
      'AI ماڈل اس ڈیوائس پر نہیں چل سکا — عام اپ اسکیلنگ استعمال کی گئی';

  @override
  String get upscalerFallbackCloud =>
      'کلاؤڈ سرور دستیاب نہیں — اسی ڈیوائس پر پروسیس کیا گیا';

  @override
  String get upscalerSettings => 'AI سیٹنگز';

  @override
  String get upscalerFactorLabel => 'بڑا کرنے کا تناسب';

  @override
  String get upscalerFactor2xDesc => 'تیز — زیادہ تر تصاویر کے لیے بہترین';

  @override
  String get upscalerFactor4xDesc => 'بہترین کوالٹی — سست';

  @override
  String get upscalerOptimiseFor => 'کس کے لیے بہتر بنائیں';

  @override
  String get upscalerModeAuto => 'خودکار';

  @override
  String get upscalerModePhoto => 'تصویر';

  @override
  String get upscalerModeIllustration => 'خاکہ / آرٹ';

  @override
  String get upscalerModeFace => 'چہرے کی تفصیل';

  @override
  String get upscalerDenoise => 'پہلے شور کم کریں';

  @override
  String get upscalerDenoiseTip => 'بڑا کرنے سے پہلے JPEG کا شور کم کرتا ہے';

  @override
  String get upscalerSharpen => 'بعد میں شارپ کریں';

  @override
  String get upscalerSharpenTip => 'بڑا کرنے کے بعد وضاحت بڑھاتا ہے';

  @override
  String get upscalerCloudTitle => 'کلاؤڈ سے چہرے بہتر بنائیں';

  @override
  String get upscalerCloudOn =>
      'آپ کی تصویر پروسیسنگ کے لیے ہمارے سرور پر اپ لوڈ ہوتی ہے۔';

  @override
  String get upscalerCloudOff => 'بند — تصاویر اسی ڈیوائس پر رہتی ہیں۔';

  @override
  String get upscalerCloudDialogTitle => 'تصاویر کلاؤڈ پر بھیجیں؟';

  @override
  String get upscalerCloudDialogBody =>
      'کلاؤڈ موڈ آپ کی منتخب کردہ تصویر کو انکرپٹڈ کنکشن کے ذریعے ہمارے اپ اسکیلنگ سرور پر اپ لوڈ کرتا ہے تاکہ اسے بڑے AI ماڈل (GFPGAN + Real-ESRGAN) سے پروسیس کیا جا سکے۔\n\n• صرف وہی تصویر بھیجی جاتی ہے جسے آپ بڑا کرنا چاہتے ہیں۔\n• تصویر میموری میں پروسیس ہوتی ہے اور نتیجہ واپس آنے کے بعد محفوظ نہیں رکھی جاتی۔\n• اس کے ساتھ کوئی اکاؤنٹ یا ذاتی معلومات نہیں بھیجی جاتیں۔\n\nآپ اسے کسی بھی وقت بند کر سکتے ہیں۔ ڈیوائس موڈ مکمل طور پر آف لائن کام کرتا ہے۔';

  @override
  String get upscalerCloudKeepLocal => 'ڈیوائس پر ہی رکھیں';

  @override
  String get upscalerCloudEnable => 'کلاؤڈ آن کریں';

  @override
  String get upscalerUpscale => 'AI سے بڑا کریں';

  @override
  String get upscalerUpscaleAgain => 'نئی سیٹنگز کے ساتھ دوبارہ بڑا کریں';

  @override
  String get upscalerFailed => 'بڑا نہیں ہو سکا';

  @override
  String get upscalerErrorTooLarge =>
      'تصویر بہت بڑی ہے۔ چھوٹی تصویر یا 2× آزمائیں۔';

  @override
  String get upscalerErrorUnreadable =>
      'یہ تصویر پڑھی نہیں جا سکی۔ JPG یا PNG فائل استعمال کریں۔';

  @override
  String get upscalerErrorNetwork =>
      'نیٹ ورک ٹائم آؤٹ۔ کنکشن چیک کریں یا کلاؤڈ موڈ بند کریں۔';

  @override
  String get videoPickHint => 'ویڈیو منتخب کرنے کے لیے ٹیپ کریں';

  @override
  String videoProbeInfo(String format, String duration) {
    return 'فارمیٹ: $format · دورانیہ: $duration';
  }

  @override
  String get videoOutputFormat => 'آؤٹ پٹ فارمیٹ';

  @override
  String get videoFmtMostCompatible => 'سب سے زیادہ موافق';

  @override
  String get videoFmtApple => 'Apple / QuickTime';

  @override
  String get videoFmtFlexible => 'لچکدار کنٹینر';

  @override
  String get videoFmtLegacy => 'پرانا فارمیٹ';

  @override
  String get videoFmtGif => 'متحرک (بغیر آواز)';

  @override
  String get videoFmtAudioOnly => 'صرف آڈیو';

  @override
  String get videoFmtAudioAac => 'صرف آڈیو (AAC)';

  @override
  String get videoFmtAudioRaw => 'صرف آڈیو (خام)';

  @override
  String get videoFmtWav => 'غیر کمپریس شدہ آڈیو';

  @override
  String videoConvertingPercent(int percent) {
    return 'تبدیل ہو رہی ہے… $percent%';
  }

  @override
  String get videoConvertingWait =>
      'تبدیل ہو رہی ہے… اس میں کچھ وقت لگ سکتا ہے';

  @override
  String get videoDone => 'تبدیلی مکمل!';

  @override
  String get videoErrorUnsupported =>
      'تبدیلی ناکام۔ ہو سکتا ہے یہ فارمیٹ آپ کے ڈیوائس پر سپورٹ نہ ہو۔';

  @override
  String get videoConvertAnother => 'ایک اور تبدیل کریں';

  @override
  String get videoPickButton => 'ویڈیو فائل منتخب کریں';

  @override
  String videoConvertTo(String format) {
    return '$format میں تبدیل کریں';
  }

  @override
  String get docScanAndroidOnly => 'دستاویز اسکینر صرف Android پر دستیاب ہے۔';

  @override
  String docScanNeedsPlayServices(String details) {
    return 'اسکینر شروع نہیں ہو سکا۔ اس کے لیے Google Play سروسز درکار ہیں — یقینی بنائیں کہ وہ اپ ڈیٹ ہیں۔ ($details)';
  }

  @override
  String get docScanStartFailed =>
      'اسکینر شروع نہیں ہو سکا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get docScanPdfSaved =>
      'PDF ڈاؤن لوڈز میں محفوظ ہو گئی — اسے میری فائلیں میں دیکھیں';

  @override
  String docScanPagesSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات گیلری میں محفوظ ہو گئے',
      one: '1 صفحہ گیلری میں محفوظ ہو گیا',
    );
    return '$_temp0';
  }

  @override
  String get docScanHeadline => 'کاغذ کو صاف PDF میں اسکین کریں';

  @override
  String get docScanIntro =>
      'کنارے خود بخود پہچانے جاتے ہیں۔ جتنے چاہیں صفحات شامل کریں، محفوظ کرنے سے پہلے کراپ کریں، گھمائیں اور فلٹر لگائیں۔';

  @override
  String get docScanScanning => 'اسکین ہو رہا ہے…';

  @override
  String get docScanStart => 'اسکین شروع کریں';

  @override
  String get docScanScannedPages => 'اسکین شدہ صفحات';

  @override
  String docScanPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات',
      one: '1 صفحہ',
    );
    return '$_temp0';
  }

  @override
  String get docScanSavePdf => 'PDF محفوظ کریں';

  @override
  String get docScanSharePdf => 'PDF شیئر کریں';

  @override
  String get docScanCopyText => 'متن کاپی کریں';

  @override
  String get docScanSaveJpg => 'JPG کے طور پر محفوظ کریں';

  @override
  String get docScanAnother => 'ایک اور دستاویز اسکین کریں';

  @override
  String get pdfToolsChoosePdf => 'PDF منتخب کریں';

  @override
  String get pdfToolsChooseHint =>
      'یا کسی بھی ایپ سے Utility Toolbox میں PDF شیئر کریں';

  @override
  String get pdfToolsReading => 'پڑھا جا رہا ہے…';

  @override
  String get pdfToolsLockedShort => 'پاس ورڈ سے محفوظ';

  @override
  String pdfToolsPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات',
      one: '1 صفحہ',
    );
    return '$_temp0';
  }

  @override
  String get pdfToolsChange => 'تبدیل کریں';

  @override
  String get pdfToolsResultReady => 'آپ کی PDF تیار ہے';

  @override
  String get pdfToolsSaveDownloads => 'ڈاؤن لوڈز میں محفوظ کریں';

  @override
  String get pdfToolsStartOver => 'دوبارہ شروع کریں';

  @override
  String get pdfToolsSavedToDownloads =>
      'ڈاؤن لوڈز میں محفوظ ہو گیا — اسے میری فائلیں میں دیکھیں';

  @override
  String get pdfToolsSharedInstead => 'اس کے بجائے شیئر مینو کھول دیا گیا';

  @override
  String get pdfToolsRangeEmpty => 'کم از کم ایک صفحہ درج کریں۔';

  @override
  String pdfToolsRangeInvalid(String part) {
    return '“$part” کوئی صفحہ یا رینج نہیں ہے (مثلاً 1-3، 5)۔';
  }

  @override
  String pdfToolsRangeOutside(String part, int count) {
    return '“$part” 1–$count سے باہر ہے۔';
  }

  @override
  String get pdfToolsInvalidPdf => 'یہ فائل درست PDF نہیں لگتی۔';

  @override
  String pdfToolsLockedUnlockFirst(String tool) {
    return 'یہ PDF پاس ورڈ سے محفوظ ہے۔ پہلے $tool سے اسے ان لاک کریں۔';
  }

  @override
  String pdfToolsPagesLabel(int count) {
    return 'صفحات (1–$count)';
  }

  @override
  String pdfToolsPagesHint(String example) {
    return 'مثلاً $example';
  }

  @override
  String pdfToolsPageN(int number) {
    return 'صفحہ $number';
  }

  @override
  String get pdfToolsDownload => 'ڈاؤن لوڈ';

  @override
  String get pdfToolsSavedNotification =>
      'ڈاؤن لوڈز میں محفوظ ہو گیا — کھولنے کے لیے نوٹیفکیشن دیکھیں۔';

  @override
  String get pdfToolsShareToSave =>
      'شیئر مینو کھل گیا — منتخب کریں کہ فائل کہاں محفوظ کرنی ہے۔';

  @override
  String pdfToolsSelectedFile(String name) {
    return 'منتخب: $name';
  }

  @override
  String pdfToolsSize(String size) {
    return 'سائز: $size';
  }

  @override
  String get pdfToolsDragToReorder => 'ترتیب بدلنے کے لیے گھسیٹیں';

  @override
  String get pdfHomeTitle => 'PDF ٹول کٹ';

  @override
  String get pdfHomeSection => 'PDF ٹولز';

  @override
  String get pdfHomeSubtitle => 'اپنی دستاویزات بنائیں، جوڑیں اور بہتر کریں';

  @override
  String get pdfPasswordEnter => 'پاس ورڈ درج کریں۔';

  @override
  String pdfPasswordTooShort(int count) {
    return 'کم از کم $count حروف استعمال کریں۔';
  }

  @override
  String get pdfPasswordMismatch => 'پاس ورڈ آپس میں نہیں ملتے۔';

  @override
  String get pdfPasswordWrong => 'یہ پاس ورڈ درست نہیں ہے۔';

  @override
  String get pdfPasswordLockFailed => 'یہ PDF لاک نہیں ہو سکی۔';

  @override
  String get pdfPasswordUnlockFailed => 'یہ PDF ان لاک نہیں ہو سکی۔';

  @override
  String get pdfPasswordLockedDone => 'آپ کی PDF لاک ہو گئی';

  @override
  String get pdfPasswordRemovedDone => 'پاس ورڈ ہٹا دیا گیا';

  @override
  String get pdfPasswordAlreadyLocked =>
      'اس PDF پر پہلے سے پاس ورڈ ہے۔ پہلے اسے ان لاک کریں۔';

  @override
  String get pdfPasswordNotLocked =>
      'اس PDF پر کوئی پاس ورڈ نہیں — ان لاک کرنے کو کچھ نہیں۔';

  @override
  String get pdfPasswordNew => 'نیا پاس ورڈ';

  @override
  String get pdfPasswordCurrent => 'موجودہ پاس ورڈ';

  @override
  String get pdfPasswordRepeat => 'پاس ورڈ دوبارہ درج کریں';

  @override
  String get pdfPasswordShow => 'پاس ورڈ دکھائیں';

  @override
  String get pdfPasswordHide => 'پاس ورڈ چھپائیں';

  @override
  String get pdfPasswordWarning =>
      'یہ پاس ورڈ سنبھال کر رکھیں — اسے واپس حاصل نہیں کیا جا سکتا۔ AES-256 سے انکرپٹڈ۔';

  @override
  String get pdfSplitExtract => 'صفحات نکالیں';

  @override
  String get pdfSplitRemove => 'صفحات ہٹائیں';

  @override
  String get pdfSplitPagesHelp =>
      'کاما اور رینج استعمال کریں۔ “8-” کا مطلب صفحہ 8 سے آخر تک۔';

  @override
  String get pdfSplitRemovesAll => 'اس سے تمام صفحات ہٹ جائیں گے۔';

  @override
  String get pdfSplitFailed => 'یہ PDF تقسیم نہیں ہو سکی۔';

  @override
  String get pdfToImagesFailed => 'یہ PDF رینڈر نہیں ہو سکی۔';

  @override
  String pdfToImagesSaved(int saved, int total) {
    return '$total میں سے $saved تصاویر گیلری میں محفوظ ہو گئیں';
  }

  @override
  String get pdfToImagesAllPages => 'تمام صفحات';

  @override
  String get pdfToImagesConvert => 'JPG میں تبدیل کریں';

  @override
  String pdfToImagesRendered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحات تیار…',
      one: '1 صفحہ تیار…',
    );
    return '$_temp0';
  }

  @override
  String pdfToImagesRenderedOf(int count, int total) {
    return '$total میں سے $count صفحات تیار…';
  }

  @override
  String pdfToImagesSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تصاویر گیلری میں محفوظ کریں',
      one: '1 تصویر گیلری میں محفوظ کریں',
    );
    return '$_temp0';
  }

  @override
  String get pdfCompressButton => 'کمپریس کریں';

  @override
  String get pdfCompressWorking => 'PDF کمپریس ہو رہی ہے…';

  @override
  String pdfCompressOriginalSize(String size) {
    return 'اصل سائز: $size';
  }

  @override
  String get pdfCompressIntro =>
      'ایک PDF فائل منتخب کریں۔ تصاویر والی دستاویزات پر کمپریشن سب سے بہتر کام کرتا ہے۔';

  @override
  String get pdfCompressLow => 'کم';

  @override
  String get pdfCompressMedium => 'درمیانہ';

  @override
  String get pdfCompressHigh => 'زیادہ';

  @override
  String get pdfCompressFailed => 'یہ PDF کمپریس نہیں ہو سکی۔';

  @override
  String pdfCompressBefore(String size) {
    return 'پہلے: $size';
  }

  @override
  String pdfCompressAfter(String size) {
    return 'بعد میں: $size';
  }

  @override
  String get pdfMergeButton => 'جوڑیں';

  @override
  String get pdfMergeWorking => 'PDF جوڑی جا رہی ہیں…';

  @override
  String get pdfMergePick => 'PDF فائلیں منتخب کریں';

  @override
  String get pdfMergeIntro => 'جوڑنے کے لیے کم از کم دو PDF فائلیں منتخب کریں۔';

  @override
  String get pdfMergeFailed =>
      'PDF جوڑی نہیں جا سکیں۔ ہو سکتا ہے کوئی فائل پڑھی نہ جا سکے۔';

  @override
  String pdfMergeResult(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'جوڑی گئی PDF ($count صفحات)',
      one: 'جوڑی گئی PDF (1 صفحہ)',
    );
    return '$_temp0';
  }

  @override
  String get imageToPdfCreate => 'PDF بنائیں';

  @override
  String get imageToPdfWorking => 'PDF بن رہی ہے…';

  @override
  String get imageToPdfPick => 'تصاویر منتخب کریں';

  @override
  String get imageToPdfIntro =>
      'تبدیل کرنے کے لیے ایک یا زیادہ تصاویر منتخب کریں۔';

  @override
  String get imageToPdfFailed =>
      'PDF نہیں بن سکی۔ براہ کرم دوسری تصاویر آزمائیں۔';

  @override
  String imageToPdfReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF تیار ($count صفحات)',
      one: 'PDF تیار (1 صفحہ)',
    );
    return '$_temp0';
  }

  @override
  String get qrScanNoCodeInPhoto =>
      'اس تصویر میں کوئی QR کوڈ یا بارکوڈ نہیں ملا۔';

  @override
  String get qrScanPhotoFailed => 'یہ تصویر پڑھی نہیں جا سکی۔';

  @override
  String qrScanResultTitle(String type) {
    return 'اسکین ہو گیا ($type)';
  }

  @override
  String get qrScanFromPhoto => 'تصویر سے اسکین کریں';

  @override
  String get qrScanCameraNeeded =>
      'QR کوڈ اور بارکوڈ اسکین کرنے کے لیے کیمرے تک رسائی درکار ہے۔';

  @override
  String get qrScanCameraError =>
      'کیمرہ شروع نہیں ہو سکا۔ دوسری کیمرہ ایپس بند کر کے دوبارہ کوشش کریں۔';

  @override
  String get qrScanTorchOn => 'ٹارچ آن کریں';

  @override
  String get qrScanTorchOff => 'ٹارچ بند کریں';

  @override
  String get qrScanTypeLink => 'لنک';

  @override
  String get qrScanTypeWifi => 'وائی فائی';

  @override
  String get qrScanTypeContact => 'رابطہ';

  @override
  String get qrScanTypeText => 'متن';

  @override
  String get qrGenInputLabel => 'متن یا URL';

  @override
  String get qrGenInputHint => 'کوڈ میں ڈالنے کے لیے مواد درج کریں';

  @override
  String get qrGenPreviewLabel => 'QR کوڈ کا پیش منظر';

  @override
  String get qrGenEmpty => 'اپنا QR کوڈ دیکھنے کے لیے اوپر متن درج کریں۔';

  @override
  String get qrGenSaveGallery => 'گیلری میں محفوظ کریں';

  @override
  String get qrHomeTitle => 'QR اور بارکوڈ';

  @override
  String get qrHomeTabScan => 'اسکین';

  @override
  String get qrHomeTabCreate => 'بنائیں';

  @override
  String get qrHomeScanTitle => 'کوڈ اسکین کریں';

  @override
  String get qrHomeScanBody =>
      'فوراً اسکین کرنے کے لیے کیمرہ QR کوڈ یا بارکوڈ کی طرف کریں۔';

  @override
  String get qrHomeBadgeInstant => 'فوری';

  @override
  String get qrHomeBadgeHistory => 'محفوظ ہسٹری';

  @override
  String get qrHomeStartScan => 'اسکین شروع کریں';

  @override
  String get qrHomeCreateTitle => 'کوڈ بنائیں';

  @override
  String get qrHomeCreateBody =>
      'متن یا URL سے QR کوڈ بنائیں، پھر اسے محفوظ یا شیئر کریں۔';

  @override
  String get qrHomeBadgeShare => 'کہیں بھی شیئر کریں';

  @override
  String get qrHomeBadgeImage => 'تصویر کے طور پر محفوظ';

  @override
  String get qrHomeOpenGenerator => 'جنریٹر کھولیں';

  @override
  String get qrHistoryTitle => 'اسکین ہسٹری';

  @override
  String get qrHistoryMore => 'مزید اختیارات';

  @override
  String get qrHistoryEmpty => 'اسکین کیے گئے کوڈ یہاں نظر آئیں گے۔';

  @override
  String get wifiQrPlaceholder =>
      'QR بنانے کے لیے\nوائی فائی کی تفصیلات درج کریں';

  @override
  String get wifiQrPreviewLabel => 'وائی فائی QR کوڈ';

  @override
  String get wifiQrNetworkDetails => 'نیٹ ورک کی تفصیلات';

  @override
  String get wifiQrSsidLabel => 'نیٹ ورک کا نام (SSID)';

  @override
  String get wifiQrSsidHint => 'گھر کا وائی فائی';

  @override
  String get wifiQrPasswordLabel => 'پاس ورڈ';

  @override
  String get wifiQrPasswordHint => 'پاس ورڈ درج کریں';

  @override
  String get wifiQrShowPassword => 'پاس ورڈ دکھائیں';

  @override
  String get wifiQrHidePassword => 'پاس ورڈ چھپائیں';

  @override
  String get wifiQrSecurity => 'سیکیورٹی';

  @override
  String get wifiQrSecurityNone => 'کوئی نہیں (کھلا)';

  @override
  String get wifiQrHidden => 'پوشیدہ نیٹ ورک';

  @override
  String get wifiQrHiddenHint => 'اگر نیٹ ورک کا نام نظر نہیں آتا تو آن کریں';

  @override
  String get wifiQrSaveImage => 'تصویر محفوظ کریں';

  @override
  String get wifiQrInfo =>
      'جو بھی یہ QR کوڈ اسکین کرے گا وہ خود بخود آپ کے وائی فائی سے جڑ جائے گا۔';

  @override
  String get wifiQrShareText =>
      'میرے وائی فائی سے جڑنے کے لیے یہ QR کوڈ اسکین کریں!';

  @override
  String get ocrCameraDenied =>
      'کیمرے کی اجازت نہیں ملی۔ اجازت دینے کے لیے سیٹنگز کھولیں۔';

  @override
  String get ocrCameraRequired => 'تصویر لینے کے لیے کیمرے کی اجازت درکار ہے۔';

  @override
  String get ocrTimeout =>
      'پڑھنے میں بہت وقت لگا — ہو سکتا ہے ٹیکسٹ ماڈل ابھی ڈاؤن لوڈ ہو رہا ہو۔ ایک بار وائی فائی سے جڑیں یا دوبارہ کوشش کریں۔';

  @override
  String get ocrFailed =>
      'اس تصویر سے متن نہیں پڑھا جا سکا۔ زیادہ صاف تصویر آزمائیں۔';

  @override
  String get ocrPreparing => 'تصویر تیار ہو رہی ہے…';

  @override
  String get ocrScanning => 'متن پڑھا جا رہا ہے…';

  @override
  String get ocrScriptLabel => 'رسم الخط';

  @override
  String get ocrScriptHint =>
      'وہ حروفِ تہجی منتخب کریں جن میں آپ کا متن لکھا ہے۔ اردو، عربی اور بنگالی ابھی نہیں پڑھی جا سکتیں۔';

  @override
  String get ocrScriptLatin => 'لاطینی (انگریزی، رومن اردو…)';

  @override
  String get ocrScriptDevanagari => 'دیوناگری (ہندی، مراٹھی…)';

  @override
  String get ocrScriptChinese => 'چینی';

  @override
  String get ocrScriptJapanese => 'جاپانی';

  @override
  String get ocrScriptKorean => 'کوریائی';

  @override
  String get ocrIdleTitle => 'کسی بھی تصویر سے متن نکالیں';

  @override
  String get ocrIdleBody =>
      'کیمرہ استعمال کریں یا تصویر منتخب کریں — متن فوراً آپ کے فون پر ہی نکل آتا ہے۔';

  @override
  String get ocrBadgeOnDevice => 'ڈیوائس پر AI';

  @override
  String get ocrBadgeLocal => 'مقامی پروسیسنگ';

  @override
  String get ocrBadgeBlocks => 'بلاک کے حساب سے کاپی';

  @override
  String get ocrUseCamera => 'کیمرہ استعمال کریں';

  @override
  String get ocrChooseGallery => 'گیلری سے منتخب کریں';

  @override
  String get ocrOnDeviceNote => 'ڈیوائس پر · اپ لوڈ کی ضرورت نہیں';

  @override
  String get ocrTabImage => 'تصویر';

  @override
  String get ocrTabText => 'متن';

  @override
  String get ocrTapBlockHint => 'کاپی کرنے کے لیے نمایاں بلاک پر ٹیپ کریں';

  @override
  String get ocrBlockTitle => 'بلاک کا متن';

  @override
  String ocrBlockLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سطریں · کاپی کے لیے ٹیپ کریں',
      one: '1 سطر · کاپی کے لیے ٹیپ کریں',
    );
    return '$_temp0';
  }

  @override
  String get ocrCopyBlock => 'بلاک کاپی کریں';

  @override
  String get ocrBlockCopied => 'بلاک کاپی ہو گیا';

  @override
  String get ocrCopyEntireBlock => 'پورا بلاک کاپی کریں';

  @override
  String get ocrCopyLine => 'سطر کاپی کریں';

  @override
  String get ocrNoText => 'کوئی متن نہیں ملا — زیادہ صاف تصویر آزمائیں۔';

  @override
  String get ocrQuickCopy => 'حصوں کے حساب سے فوری کاپی';

  @override
  String ocrBlockNCopied(int number) {
    return 'بلاک $number کاپی ہو گیا';
  }

  @override
  String get ocrDoneEditing => 'ترمیم مکمل';

  @override
  String get ocrEditText => 'متن میں ترمیم کریں';

  @override
  String get ocrAllCopied => 'سارا متن کاپی ہو گیا';

  @override
  String get ocrCopyAll => 'سب کاپی کریں';

  @override
  String get ocrScanAgain => 'اسکین';

  @override
  String ocrStatLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سطریں',
      one: '1 سطر',
    );
    return '$_temp0';
  }

  @override
  String ocrStatWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count الفاظ',
      one: '1 لفظ',
    );
    return '$_temp0';
  }

  @override
  String ocrStatChars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count حروف',
      one: '1 حرف',
    );
    return '$_temp0';
  }

  @override
  String get wordPdfNoText =>
      'اس دستاویز میں نکالنے کے قابل کوئی متن نہیں ملا۔';

  @override
  String get wordPdfInfo =>
      '.docx فائلوں کو PDF میں تبدیل کرتا ہے۔ متن برقرار رہتا ہے؛ پیچیدہ لے آؤٹ (ٹیبل، تصاویر) مختلف دکھ سکتے ہیں۔';

  @override
  String get wordPdfOpeningPicker => 'فائل پکر کھل رہا ہے…';

  @override
  String wordPdfConverting(int percent) {
    return 'تبدیل ہو رہا ہے… $percent%';
  }

  @override
  String get wordPdfDone => 'تبدیلی مکمل';

  @override
  String get wordPdfTapToPick => '.docx فائل منتخب کرنے کے لیے ٹیپ کریں';

  @override
  String get wordPdfSupports => '.docx فارمیٹ سپورٹ کرتا ہے';

  @override
  String get wordPdfFailed =>
      'تبدیلی ناکام رہی۔ ہو سکتا ہے فائل خراب ہو یا .docx دستاویز نہ ہو۔';

  @override
  String get wordPdfFontsOffline =>
      'اس PDF میں کچھ متن (مثلاً اردو، عربی، ہندی، بنگالی یا سیریلک) موجود نہیں۔ اس کا فونٹ صرف ایک بار ڈاؤن لوڈ ہوتا ہے — انٹرنیٹ سے جڑیں اور دوبارہ تبدیل کریں۔';

  @override
  String get wordPdfConvertAnother => 'ایک اور تبدیل کریں';

  @override
  String get wordPdfPick => '.docx فائل منتخب کریں';

  @override
  String get wordPdfStep1Title => 'اپنی Word فائل منتخب کریں';

  @override
  String get wordPdfStep1Desc => 'ڈیوائس اسٹوریج سے ایک .docx فائل منتخب کریں۔';

  @override
  String get wordPdfStep2Title => 'خودکار تبدیلی';

  @override
  String get wordPdfStep2Desc =>
      'متن نکال کر A4 PDF صفحات پر ترتیب دیا جاتا ہے۔';

  @override
  String get wordPdfStep3Title => 'شیئر یا محفوظ کریں';

  @override
  String get wordPdfStep3Desc =>
      'PDF کو کسی بھی ایپ، ای میل یا کلاؤڈ اسٹوریج پر شیئر کریں۔';

  @override
  String get wordPdfReady => 'PDF تیار';
}
