// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Utility Toolbox';

  @override
  String get navTools => 'الأدوات';

  @override
  String get navFiles => 'ملفاتي';

  @override
  String get settingsTooltip => 'الإعدادات';

  @override
  String get searchHint => 'بحث: ضغط pdf، مسح ضوئي، jpg…';

  @override
  String get quickActions => 'إجراءات سريعة';

  @override
  String get favorites => 'المفضلة';

  @override
  String get recent => 'المستخدمة مؤخرًا';

  @override
  String searchNoResults(String query) {
    return 'لا توجد أدوات تطابق «$query»';
  }

  @override
  String get toolMenuAddFavorite => 'إضافة إلى المفضلة';

  @override
  String get toolMenuRemoveFavorite => 'إزالة من المفضلة';

  @override
  String get toolMenuPinShortcut => 'إضافة إلى الشاشة الرئيسية';

  @override
  String get pinShortcutRequested => 'أكّد لإضافة الاختصار إلى شاشتك الرئيسية';

  @override
  String get pinShortcutUnsupported =>
      'تطبيق الشاشة الرئيسية لديك لا يدعم الاختصارات';

  @override
  String get newBadge => 'جديد';

  @override
  String get catScan => 'المسح و QR';

  @override
  String get catPdf => 'PDF';

  @override
  String get catImage => 'الصور';

  @override
  String get catText => 'النصوص والترجمة';

  @override
  String get catCalc => 'الحساب والتحويل';

  @override
  String get catNetwork => 'الإنترنت';

  @override
  String get catDevice => 'الجهاز والموقع';

  @override
  String get catSecurity => 'الأمان';

  @override
  String get catMedia => 'الفيديو والصوت';

  @override
  String get toolDocScannerTitle => 'ماسح المستندات';

  @override
  String get toolDocScannerDesc => 'امسح الورق إلى PDF بحواف تلقائية';

  @override
  String get toolDocScannerKeywords =>
      'ماسح ضوئي, سكانر, مسح ضوئي, ماسح مستندات, تصوير مستندات, كام سكانر, تحويل الورق الى pdf, ماسح pdf, إيصال, فاتورة, scan paper, camscanner, document, pdf scanner, receipt';

  @override
  String get toolQrScannerTitle => 'مسح QR والباركود';

  @override
  String get toolQrScannerDesc => 'من الكاميرا أو من صورة';

  @override
  String get toolQrScannerKeywords =>
      'قارئ باركود, قارئ qr, ماسح باركود, باركود, كيو ار, مسح الكود, قراءة الكود, qr reader, barcode, scan code';

  @override
  String get toolQrGeneratorTitle => 'إنشاء رمز QR';

  @override
  String get toolQrGeneratorDesc => 'روابط ونصوص وجهات اتصال والمزيد';

  @override
  String get toolQrGeneratorKeywords =>
      'صانع qr, إنشاء كود qr, عمل باركود, توليد qr, كيو ار, qr maker, generate qr, barcode generator';

  @override
  String get toolOcrTitle => 'صورة إلى نص';

  @override
  String get toolOcrDesc => 'انسخ النص من أي صورة (OCR)';

  @override
  String get toolOcrKeywords =>
      'تحويل الصورة الى نص, استخراج النص من الصورة, نسخ النص من الصورة, ماسح النصوص, ocr, text scanner, extract text, copy text from image';

  @override
  String get toolWifiQrTitle => 'رمز QR لشبكة WiFi';

  @override
  String get toolWifiQrDesc => 'شارك WiFi دون كتابة كلمة المرور';

  @override
  String get toolWifiQrKeywords =>
      'واي فاي, كلمة سر الواي فاي, مشاركة الواي فاي, باسورد الواي فاي, wifi password, share wifi';

  @override
  String get toolImageToPdfTitle => 'صورة إلى PDF';

  @override
  String get toolImageToPdfDesc => 'حوّل الصور إلى ملف PDF واحد';

  @override
  String get toolImageToPdfKeywords =>
      'تحويل الصور الى pdf, تحويل jpg الى pdf, صور الى pdf, jpg to pdf, photo to pdf, picture to pdf';

  @override
  String get toolMergePdfTitle => 'دمج PDF';

  @override
  String get toolMergePdfDesc => 'اجمع عدة ملفات PDF في ملف واحد';

  @override
  String get toolMergePdfKeywords =>
      'دمج ملفات pdf, جمع pdf, ضم pdf, join pdf, combine pdf';

  @override
  String get toolCompressPdfTitle => 'ضغط PDF';

  @override
  String get toolCompressPdfDesc => 'صغّر حجم ملف PDF لإرساله';

  @override
  String get toolCompressPdfKeywords =>
      'تقليل حجم pdf, تصغير pdf, ضغط ملف pdf, reduce pdf size, shrink pdf';

  @override
  String get toolSplitPdfTitle => 'تقسيم PDF';

  @override
  String get toolSplitPdfDesc => 'استخراج الصفحات أو حذفها';

  @override
  String get toolSplitPdfKeywords =>
      'استخراج صفحات, حذف صفحات, فصل pdf, قص pdf, extract pages, delete pages, cut pdf';

  @override
  String get toolPdfToImagesTitle => 'PDF إلى JPG';

  @override
  String get toolPdfToImagesDesc => 'احفظ كل صفحة كصورة';

  @override
  String get toolPdfToImagesKeywords =>
      'تحويل pdf الى صور, pdf الى صورة, pdf to image, pdf to png, pdf pages';

  @override
  String get toolProtectPdfTitle => 'قفل PDF';

  @override
  String get toolProtectPdfDesc => 'أضف كلمة مرور إلى ملف PDF';

  @override
  String get toolProtectPdfKeywords =>
      'كلمة سر pdf, حماية pdf, تشفير pdf, قفل ملف pdf, password pdf, encrypt pdf, secure pdf';

  @override
  String get toolUnlockPdfTitle => 'فتح قفل PDF';

  @override
  String get toolUnlockPdfDesc => 'أزل كلمة مرور تعرفها';

  @override
  String get toolUnlockPdfKeywords =>
      'إزالة كلمة سر pdf, فك حماية pdf, فك تشفير pdf, remove pdf password, decrypt pdf';

  @override
  String get toolWordToPdfTitle => 'Word إلى PDF';

  @override
  String get toolWordToPdfDesc => 'حوّل مستندات Word بصيغة docx';

  @override
  String get toolWordToPdfKeywords =>
      'تحويل وورد الى pdf, وورد, ملف وورد, doc to pdf, docx, word';

  @override
  String get toolImageCompressorTitle => 'ضغط الصور';

  @override
  String get toolImageCompressorDesc => 'ملف أصغر بنفس الشكل';

  @override
  String get toolImageCompressorKeywords =>
      'تقليل حجم الصورة, تصغير الصور, ضغط الصور, ضغط jpg, كيلوبايت, reduce image size, compress jpg, kb';

  @override
  String get toolImageResizerTitle => 'تغيير الحجم والصيغة';

  @override
  String get toolImageResizerDesc => 'مقاس دقيق، JPG أو PNG أو WEBP';

  @override
  String get toolImageResizerKeywords =>
      'تغيير حجم الصورة, تغيير مقاس الصورة, تحويل jpg الى png, تحويل png الى jpg, صورة جواز السفر, صورة شخصية, resize image, jpg to png, png to jpg, webp, passport size';

  @override
  String get toolImageEnhancerTitle => 'محرر الصور';

  @override
  String get toolImageEnhancerDesc => 'فلاتر وقص وسطوع والمزيد';

  @override
  String get toolImageEnhancerKeywords =>
      'تعديل الصور, تحرير الصور, فلتر, قص, تدوير, edit photo, filter, crop, rotate';

  @override
  String get toolAiUpscalerTitle => 'تكبير الصور AI';

  @override
  String get toolAiUpscalerDesc => 'كبّر الصور حتى 4× بوضوح أعلى';

  @override
  String get toolAiUpscalerKeywords =>
      'تحسين جودة الصورة, توضيح الصور, رفع الجودة, زيادة الدقة, صورة مشوشة, ذكاء اصطناعي, enhance, hd, increase resolution, blurry';

  @override
  String get toolTranslationTitle => 'ترجمة';

  @override
  String get toolTranslationDesc => 'بدون إنترنت، مع الإدخال الصوتي والنطق';

  @override
  String get toolTranslationKeywords =>
      'مترجم, ترجمة, ترجمة بدون نت, ترجمة فورية, قاموس, لغة, translator, language, dictionary';

  @override
  String get toolTextUtilitiesTitle => 'أدوات النص';

  @override
  String get toolTextUtilitiesDesc => 'عدّ الكلمات، حالة الأحرف، Base64';

  @override
  String get toolTextUtilitiesKeywords =>
      'عداد الكلمات, عد الحروف, أحرف كبيرة, أحرف صغيرة, word counter, uppercase, lowercase, base64';

  @override
  String get toolSmartClipboardTitle => 'مدير الحافظة';

  @override
  String get toolSmartClipboardDesc => 'احفظ المنسوخ وثبّته وابحث فيه';

  @override
  String get toolSmartClipboardKeywords =>
      'نسخ ولصق, الحافظة, سجل الحافظة, ملاحظات, copy paste, notes, clipboard history';

  @override
  String get toolCalculatorTitle => 'الآلة الحاسبة';

  @override
  String get toolCalculatorDesc => 'حاسبة يومية مع السجل';

  @override
  String get toolCalculatorKeywords =>
      'حاسبة, آلة حاسبة, رياضيات, نسبة مئوية, calc, math, percent';

  @override
  String get toolAgeCalculatorTitle => 'العمر والتاريخ';

  @override
  String get toolAgeCalculatorDesc => 'عمرك بدقة والأيام بين تاريخين';

  @override
  String get toolAgeCalculatorKeywords =>
      'حساب العمر, حاسبة العمر, عيد ميلاد, فرق التاريخ, عداد الأيام, birthday, date difference, days counter';

  @override
  String get toolUnitConverterTitle => 'محول الوحدات';

  @override
  String get toolUnitConverterDesc => 'الطول والوزن والحرارة والمزيد';

  @override
  String get toolUnitConverterKeywords =>
      'تحويل الوحدات, سم الى انش, كيلو الى رطل, مئوية, فهرنهايت, convert units, cm to inch, kg to lb, celsius';

  @override
  String get toolLoanCalculatorTitle => 'القرض والقسط (EMI)';

  @override
  String get toolLoanCalculatorDesc => 'القسط الشهري وإجمالي الفائدة';

  @override
  String get toolLoanCalculatorKeywords =>
      'حاسبة القرض, قسط شهري, أقساط, فائدة, تمويل, رهن عقاري, emi, mortgage, interest, installment';

  @override
  String get toolTimezoneTitle => 'الساعة العالمية';

  @override
  String get toolTimezoneDesc => 'الوقت في أي مدينة، مع ويدجت';

  @override
  String get toolTimezoneKeywords =>
      'المنطقة الزمنية, فرق التوقيت, ساعة, توقيت المدن, time zone, clock, city time';

  @override
  String get toolColorPickerTitle => 'منتقي الألوان';

  @override
  String get toolColorPickerDesc => 'HEX و RGB و HSL و CMYK';

  @override
  String get toolColorPickerKeywords =>
      'كود اللون, رمز اللون, لوحة ألوان, color code, hex, palette';

  @override
  String get toolSpeedTestTitle => 'قياس سرعة الإنترنت';

  @override
  String get toolSpeedTestDesc => 'التنزيل والرفع و Ping';

  @override
  String get toolSpeedTestKeywords =>
      'سرعة النت, سرعة الانترنت, سرعة الواي فاي, قياس السرعة, ميجابت, wifi speed, internet speed, mbps';

  @override
  String get toolIpPingTitle => 'IP و Ping';

  @override
  String get toolIpPingDesc => 'عنوان IP واختبار الاتصال بالخوادم';

  @override
  String get toolIpPingKeywords =>
      'عنوان ip, الآي بي, بنج, شبكة, my ip, ping, network';

  @override
  String get toolCompassTitle => 'البوصلة';

  @override
  String get toolCompassDesc => 'الاتجاه والزاوية';

  @override
  String get toolCompassKeywords =>
      'اتجاه, الشمال, القبلة, اتجاه القبلة, direction, north, qibla';

  @override
  String get toolLocationSaverTitle => 'حفظ الموقع';

  @override
  String get toolLocationSaverDesc => 'احفظ أماكن GPS وشاركها';

  @override
  String get toolLocationSaverKeywords =>
      'موقف السيارة, موقعي, خريطة, إحداثيات, parking, gps, map, coordinates';

  @override
  String get toolPasswordGeneratorTitle => 'مولد كلمات المرور';

  @override
  String get toolPasswordGeneratorDesc => 'كلمات مرور قوية وعشوائية';

  @override
  String get toolPasswordGeneratorKeywords =>
      'كلمة سر قوية, كلمة مرور عشوائية, باسورد, secure password, random';

  @override
  String get toolHashGeneratorTitle => 'مولد الهاش';

  @override
  String get toolHashGeneratorDesc => 'MD5 و SHA-1 و SHA-256 لنص أو ملف';

  @override
  String get toolHashGeneratorKeywords =>
      'هاش, تشفير, التحقق من الملف, checksum, md5, sha256';

  @override
  String get toolVideoConverterTitle => 'محول الفيديو';

  @override
  String get toolVideoConverterDesc => 'فيديو إلى MP3 و GIF و MP4 والمزيد';

  @override
  String get toolVideoConverterKeywords =>
      'تحويل الفيديو الى mp3, تحويل فيديو, صانع gif, استخراج الصوت, video to mp3, gif maker, audio extract';

  @override
  String get filesEmptyTitle => 'لا توجد ملفات بعد';

  @override
  String get filesEmptyBody =>
      'ستظهر هنا ملفات PDF والصور وغيرها مما تنشئه، لتفتحها أو تشاركها مرة أخرى.';

  @override
  String get fileOpen => 'فتح';

  @override
  String get fileShare => 'مشاركة';

  @override
  String get fileRemoveFromList => 'إزالة من القائمة';

  @override
  String get fileOpenFailed => 'تعذّر فتح هذا الملف. ربما نُقل أو حُذف.';

  @override
  String get filesClearList => 'مسح القائمة';

  @override
  String get filesClearConfirm => 'مسح القائمة؟ ستبقى ملفاتك على الجهاز.';

  @override
  String get incomingSheetTitle => 'ماذا تريد أن تفعل؟';

  @override
  String incomingImages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صورة',
      many: '$count صورة',
      few: '$count صور',
      two: 'صورتان',
      one: 'صورة واحدة',
      zero: 'لا توجد صور',
    );
    return '$_temp0';
  }

  @override
  String incomingPdfs(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ملف PDF',
      many: '$count ملف PDF',
      few: '$count ملفات PDF',
      two: 'ملفان PDF',
      one: 'ملف PDF واحد',
      zero: 'لا توجد ملفات PDF',
    );
    return '$_temp0';
  }

  @override
  String get incomingText => 'نص مُشارَك';

  @override
  String get incomingDocument => 'مستند Word';

  @override
  String get incomingVideo => 'فيديو';

  @override
  String get incomingUnsupported => 'هذا النوع من الملفات غير مدعوم بعد';

  @override
  String get incomingFailed => 'تعذّرت قراءة الملف المُشارَك';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsAppearance => 'المظهر';

  @override
  String get settingsTheme => 'السمة';

  @override
  String get themeSystem => 'تلقائي';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get languageSystem => 'لغة الجهاز';

  @override
  String get settingsPurchases => 'المشتريات';

  @override
  String get removeAdsTitle => 'إزالة الإعلانات';

  @override
  String get removeAdsSubtitle => 'شراء لمرة واحدة، بدون اشتراك';

  @override
  String get restorePurchasesTitle => 'استعادة المشتريات';

  @override
  String get restorePurchasesSubtitle => 'استرجع عملية شراء على هذا الجهاز';

  @override
  String get settingsSupport => 'الدعم والخصوصية';

  @override
  String get shareAppTitle => 'مشاركة التطبيق';

  @override
  String get shareAppSubtitle => 'أخبر صديقًا عن Utility Toolbox';

  @override
  String shareAppMessage(String url) {
    return 'أستخدم Utility Toolbox لمسح المستندات وتعديل ملفات PDF وقراءة رموز QR والترجمة بدون إنترنت. مجاني: $url';
  }

  @override
  String get rateAppTitle => 'قيّم التطبيق';

  @override
  String get rateAppSubtitle => 'تقييم سريع يساعدنا كثيرًا';

  @override
  String get privacyPolicyTitle => 'سياسة الخصوصية';

  @override
  String get privacyPolicySubtitle => 'ما الذي يصل إليه التطبيق ولماذا';

  @override
  String get privacyChoicesTitle => 'خيارات خصوصية الإعلانات';

  @override
  String get privacyChoicesSubtitle => 'غيّر موافقتك على الإعلانات المخصصة';

  @override
  String versionLabel(String version) {
    return 'الإصدار $version';
  }

  @override
  String get onboardingSkip => 'تخطي';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get onboardingStart => 'ابدأ الآن';

  @override
  String get onboarding1Title => 'كل الأدوات\nفي تطبيق واحد';

  @override
  String get onboarding1Body =>
      'امسح المستندات، وعدّل ملفات PDF، واقرأ رموز QR، وترجم، وغيّر حجم الصور — دون تثبيت عشرة تطبيقات.';

  @override
  String get onboarding2Title => 'يعمل من\nأي تطبيق';

  @override
  String get onboarding2Body =>
      'شارك صورة أو ملف PDF مع Utility Toolbox، أو حدّد نصًا لترجمته، أو اضغط مطولًا على أيقونة التطبيق لفتح الاختصارات.';

  @override
  String get onboarding3Title => 'سريع وخاص\nوبدون إنترنت';

  @override
  String get onboarding3Body =>
      'كل شيء تقريبًا يعمل على هاتفك. لا تُرفع ملفاتك أبدًا إلا إذا فعّلت خيارًا سحابيًا بنفسك.';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonClear => 'مسح';
}
