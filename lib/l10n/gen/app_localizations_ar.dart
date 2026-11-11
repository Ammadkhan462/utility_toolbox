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

  @override
  String get toolBgRemoverTitle => 'إزالة الخلفية';

  @override
  String get toolBgRemoverDesc => 'اقتطع الأشخاص والأشياء بنقرة واحدة';

  @override
  String get toolBgRemoverKeywords =>
      'إزالة الخلفية, ممحاة الخلفية, قص, شفاف, ملصق, صورة جواز, خلفية بيضاء, remove background, remove bg, cutout, transparent, png, sticker';

  @override
  String get toolBmiTitle => 'مؤشر كتلة الجسم';

  @override
  String get toolBmiDesc => 'اعرف مؤشر كتلة جسمك ووزنك الصحي';

  @override
  String get toolBmiKeywords =>
      'مؤشر كتلة الجسم, كتلة الجسم, الوزن, الطول, الوزن المثالي, السمنة, صحة, رشاقة, bmi, body mass index, weight, height, health, fitness, ideal weight, obesity';

  @override
  String get toolBubbleLevelTitle => 'ميزان الماء';

  @override
  String get toolBubbleLevelDesc => 'تأكد من استقامة الرفوف والإطارات';

  @override
  String get toolBubbleLevelKeywords =>
      'ميزان, ميزان ماء, استواء, زاوية, ميل, مستقيم, level, spirit level, bubble level, angle, tilt';

  @override
  String get toolCurrencyTitle => 'محوّل العملات';

  @override
  String get toolCurrencyDesc => 'أسعار صرف محدّثة لأكثر من 150 عملة';

  @override
  String get toolCurrencyKeywords =>
      'عملة, عملات, سعر الصرف, صرف, تحويل العملات, دولار, يورو, ريال, درهم, دينار, جنيه, currency, exchange rate, money, convert, dollar, euro, rupee, riyal, forex';

  @override
  String get toolDirectChatTitle => 'الدردشة المباشرة';

  @override
  String get toolDirectChatDesc => 'راسل أي رقم على WhatsApp دون حفظه';

  @override
  String get toolDirectChatKeywords =>
      'واتساب, واتس, دردشة مباشرة, رسالة, رقم غير محفوظ, مراسلة بدون حفظ الرقم, whatsapp, direct chat, message, unsaved number, click to chat, wa.me, send message, chat';

  @override
  String get toolFlashlightTitle => 'مصباح يدوي';

  @override
  String get toolFlashlightDesc => 'ضوء قوي مع وضع SOS والوميض';

  @override
  String get toolFlashlightKeywords =>
      'مصباح, كشاف, ضوء, فلاش, ليد, وميض, نجدة, flashlight, torch, light, led, sos, strobe, flash';

  @override
  String get toolOrganizePdfTitle => 'تنظيم PDF';

  @override
  String get toolOrganizePdfDesc => 'أعد ترتيب الصفحات أو دوّرها أو احذفها';

  @override
  String get toolOrganizePdfKeywords =>
      'تنظيم, ترتيب, تدوير, حذف صفحات, إزالة صفحات, organize, organise, reorder, rotate, delete pages, remove pages, arrange, sort, pdf';

  @override
  String get toolPdfToTextTitle => 'PDF إلى نص';

  @override
  String get toolPdfToTextDesc => 'انسخ كل النص من ملف PDF';

  @override
  String get toolPdfToTextKeywords =>
      'استخراج النص, نسخ النص, تحويل PDF إلى نص, قراءة PDF, pdf to text, extract text, copy text, txt, read pdf, convert, pdf to word';

  @override
  String get toolPercentageTitle => 'النسبة المئوية والخصم';

  @override
  String get toolPercentageDesc => 'النسبة والخصم والإكرامية والضريبة في ثوانٍ';

  @override
  String get toolPercentageKeywords =>
      'نسبة مئوية, نسبة, خصم, تخفيض, سعر بعد الخصم, إكرامية, بقشيش, تقسيم الفاتورة, ضريبة, ضريبة القيمة المضافة, percentage, percent, discount, sale price, tip, split bill, tax, gst, vat';

  @override
  String get toolSignPdfTitle => 'توقيع PDF';

  @override
  String get toolSignPdfDesc => 'ارسم توقيعك وضعه على أي صفحة';

  @override
  String get toolSignPdfKeywords =>
      'توقيع, إمضاء, توقيع إلكتروني, تعبئة وتوقيع, sign, signature, e-sign, esign, fill and sign, autograph, pdf';

  @override
  String get toolStopwatchTitle => 'ساعة إيقاف ومؤقت';

  @override
  String get toolStopwatchDesc => 'ساعة إيقاف بالجولات ومؤقت تنازلي';

  @override
  String get toolStopwatchKeywords =>
      'ساعة إيقاف, مؤقت, عد تنازلي, جولة, منبه, ساعة, مؤقت المطبخ, تمرين, stopwatch, timer, countdown, lap, alarm';

  @override
  String get toolWatermarkPdfTitle => 'علامة مائية وأرقام صفحات';

  @override
  String get toolWatermarkPdfDesc => 'أضف نصًا أو أرقام صفحات على كل صفحة';

  @override
  String get toolWatermarkPdfKeywords =>
      'علامة مائية, ختم, أرقام الصفحات, ترقيم الصفحات, سري, مسودة, تذييل, watermark, stamp, page numbers, number pages, confidential, draft, footer, header, pdf';

  @override
  String get bmiMetric => 'متري (سم، كغ)';

  @override
  String get bmiImperial => 'إمبراطوري (قدم، رطل)';

  @override
  String get bmiHeight => 'الطول';

  @override
  String get bmiWeight => 'الوزن';

  @override
  String get bmiFeet => 'أقدام';

  @override
  String get bmiInches => 'بوصات';

  @override
  String get bmiUnitCm => 'سم';

  @override
  String get bmiUnitKg => 'كغ';

  @override
  String get bmiUnitLb => 'رطل';

  @override
  String get bmiUnitFt => 'قدم';

  @override
  String get bmiUnitIn => 'بوصة';

  @override
  String get bmiAge => 'العمر (اختياري)';

  @override
  String get bmiSex => 'الجنس (اختياري)';

  @override
  String get bmiMale => 'ذكر';

  @override
  String get bmiFemale => 'أنثى';

  @override
  String get bmiYourBmi => 'مؤشر كتلة جسمك';

  @override
  String get bmiUnderweight => 'نقص الوزن';

  @override
  String get bmiNormal => 'وزن صحي';

  @override
  String get bmiOverweight => 'زيادة الوزن';

  @override
  String get bmiObese => 'سمنة';

  @override
  String bmiHealthyRange(String min, String max) {
    return 'الوزن الصحي لطولك: $min – $max';
  }

  @override
  String bmiToLose(String amount) {
    return 'أعلى من النطاق الصحي بنحو $amount';
  }

  @override
  String bmiToGain(String amount) {
    return 'أقل من النطاق الصحي بنحو $amount';
  }

  @override
  String bmiIdealWeight(String weight) {
    return 'الوزن المثالي التقريبي: $weight';
  }

  @override
  String get bmiChildNote =>
      'للأطفال والمراهقين دون 18 عامًا يُقرأ المؤشر بمخططات النمو حسب العمر. هذه النتائج تعتمد نطاقات البالغين.';

  @override
  String get bmiDisclaimer => 'مؤشر كتلة الجسم دليل عام وليس تشخيصًا طبيًا.';

  @override
  String get bmiEnterValues => 'أدخل طولك ووزنك';

  @override
  String get currencyAmount => 'المبلغ';

  @override
  String get currencyFrom => 'من';

  @override
  String get currencyTo => 'إلى';

  @override
  String get currencySwap => 'تبديل العملتين';

  @override
  String get currencyChoose => 'اختر العملة';

  @override
  String get currencySearchHint => 'ابحث عن عملة أو رمز';

  @override
  String get currencyAll => 'كل العملات';

  @override
  String currencyRatesFrom(String date) {
    return 'أسعار بتاريخ $date';
  }

  @override
  String get currencyRefresh => 'تحديث الأسعار';

  @override
  String get currencyUpdating => 'جارٍ تحديث الأسعار…';

  @override
  String get currencyOfflineCached => 'تعذّر التحديث. تُعرض الأسعار المحفوظة.';

  @override
  String get currencyNoRatesTitle => 'لم يتم تنزيل الأسعار بعد';

  @override
  String get currencyNoRatesBody =>
      'اتصل بالإنترنت مرة واحدة لتنزيل أسعار الصرف. بعد ذلك يعمل المحوّل دون اتصال أيضًا.';

  @override
  String get currencyRetry => 'حاول مرة أخرى';

  @override
  String get currencyOtherFavorites => 'عملاتك المفضلة';

  @override
  String get currencyFavoritesHint =>
      'اضغط ☆ بجانب أي عملة في القائمة لإضافتها هنا.';

  @override
  String get currencyCopy => 'نسخ النتيجة';

  @override
  String get currencyCopied => 'تم النسخ';

  @override
  String get currencyNoMatch => 'لم يتم العثور على عملة';

  @override
  String get currencyDisclaimer =>
      'الأسعار للاسترشاد فقط وقد تختلف عن سعر البنك.';

  @override
  String get directChatPhone => 'رقم الهاتف';

  @override
  String get directChatCountryCode => 'رمز الدولة';

  @override
  String get directChatSearchCountry => 'ابحث عن دولة أو رمز';

  @override
  String get directChatNoCountry => 'لم يتم العثور على دولة';

  @override
  String get directChatMessage => 'الرسالة (اختياري)';

  @override
  String get directChatOpen => 'فتح في WhatsApp';

  @override
  String get directChatPaste => 'لصق الرقم';

  @override
  String get directChatPasteNone => 'لا يوجد رقم هاتف في الحافظة';

  @override
  String get directChatTooShort => 'يبدو أن الرقم قصير جدًا';

  @override
  String get directChatTooLong => 'يبدو أن الرقم طويل جدًا';

  @override
  String directChatWillOpen(String number) {
    return 'دردشة مع $number';
  }

  @override
  String get directChatOpenFailed => 'تعذّر فتح الدردشة. هل WhatsApp مثبّت؟';

  @override
  String get directChatHint =>
      'أرسل رسالة إلى أي رقم دون حفظه في جهات الاتصال.';

  @override
  String get directChatNotAffiliated =>
      'أداة مستقلة، لا ترتبط بـ WhatsApp أو Meta.';

  @override
  String get percentageTabPercent => 'النسبة';

  @override
  String get percentageTabDiscount => 'الخصم';

  @override
  String get percentageTabTip => 'الإكرامية والتقسيم';

  @override
  String get percentageTabTax => 'الضريبة';

  @override
  String get percentageOfTitle => 'نسبة من عدد';

  @override
  String get percentageFieldPercent => 'النسبة';

  @override
  String get percentageFieldNumber => 'العدد';

  @override
  String percentageOfResult(String percent, String number) {
    return '$percent من $number';
  }

  @override
  String get percentageWhatTitle => 'كم النسبة؟';

  @override
  String get percentageFieldPart => 'القيمة';

  @override
  String get percentageFieldTotal => 'الإجمالي';

  @override
  String percentageWhatResult(String part, String total) {
    return '$part من أصل $total';
  }

  @override
  String get percentageChangeTitle => 'نسبة التغيّر';

  @override
  String get percentageFieldOld => 'القيمة القديمة';

  @override
  String get percentageFieldNew => 'القيمة الجديدة';

  @override
  String percentageIncrease(String percent) {
    return 'زيادة بنسبة $percent';
  }

  @override
  String percentageDecrease(String percent) {
    return 'انخفاض بنسبة $percent';
  }

  @override
  String get percentageNoChange => 'لا تغيير';

  @override
  String get percentageDifference => 'الفرق';

  @override
  String get percentagePrice => 'السعر الأصلي';

  @override
  String get percentageDiscount => 'الخصم';

  @override
  String get percentageExtraDiscount => 'خصم إضافي (اختياري)';

  @override
  String get percentageYouPay => 'ستدفع';

  @override
  String get percentageYouSave => 'ستوفّر';

  @override
  String get percentageTotalDiscount => 'إجمالي الخصم';

  @override
  String get percentageBill => 'مبلغ الفاتورة';

  @override
  String get percentageTip => 'الإكرامية';

  @override
  String get percentageCustom => 'مخصّص';

  @override
  String get percentagePeople => 'عدد الأشخاص';

  @override
  String get percentageAddPerson => 'إضافة شخص';

  @override
  String get percentageRemovePerson => 'إزالة شخص';

  @override
  String get percentageTipAmount => 'مبلغ الإكرامية';

  @override
  String get percentageTotal => 'الإجمالي';

  @override
  String get percentagePerPerson => 'يدفع كل شخص';

  @override
  String get percentageTaxRate => 'نسبة الضريبة';

  @override
  String get percentageAddTax => 'إضافة الضريبة';

  @override
  String get percentageRemoveTax => 'إزالة الضريبة';

  @override
  String get percentagePriceExclTax => 'السعر بدون ضريبة';

  @override
  String get percentagePriceInclTax => 'السعر شامل الضريبة';

  @override
  String get percentageBeforeTax => 'قبل الضريبة';

  @override
  String get percentageTaxAmount => 'الضريبة';

  @override
  String get percentageAfterTax => 'الإجمالي مع الضريبة';

  @override
  String get percentageEnterValues => 'أدخل الأرقام لرؤية النتيجة';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonShare => 'مشاركة';

  @override
  String get commonCopy => 'نسخ';

  @override
  String get commonCopied => 'تم النسخ';

  @override
  String get commonRetry => 'إعادة المحاولة';

  @override
  String get commonDone => 'تم';

  @override
  String get commonDelete => 'حذف';

  @override
  String get commonUndo => 'تراجع';

  @override
  String get commonOpen => 'فتح';

  @override
  String get commonReset => 'إعادة تعيين';

  @override
  String get commonClose => 'إغلاق';

  @override
  String get commonOpenSettings => 'فتح الإعدادات';

  @override
  String get commonChoosePhoto => 'اختيار صورة';

  @override
  String get commonChooseFile => 'اختيار ملف';

  @override
  String get commonCamera => 'الكاميرا';

  @override
  String get commonGallery => 'المعرض';

  @override
  String get commonWorking => 'جارٍ العمل…';

  @override
  String get commonSavedToGallery => 'تم الحفظ في المعرض';

  @override
  String get commonSavedToDownloads => 'تم الحفظ في التنزيلات';

  @override
  String get commonSaveFailed => 'تعذّر حفظ الملف';

  @override
  String get commonErrorGeneric => 'حدث خطأ ما. يُرجى المحاولة مرة أخرى.';

  @override
  String get commonErrorOffline => 'لا يوجد اتصال بالإنترنت';

  @override
  String get commonErrorTimeout => 'انتهت مهلة الطلب. يُرجى المحاولة مرة أخرى.';

  @override
  String get commonPermissionNeeded => 'الإذن مطلوب. اسمح به من الإعدادات.';

  @override
  String get commonResult => 'النتيجة';

  @override
  String get commonStart => 'ابدأ';

  @override
  String get commonStop => 'إيقاف';

  @override
  String get commonClearAll => 'مسح الكل';

  @override
  String get commonPaste => 'لصق';

  @override
  String get commonSearch => 'بحث';

  @override
  String get organizePdfHint =>
      'اضغط على الصفحات لتحديدها. اضغط مطولًا على صفحة ثم اسحبها لنقلها.';

  @override
  String organizePdfSelected(int count) {
    return 'تم تحديد $count';
  }

  @override
  String get organizePdfRotateLeft => 'تدوير لليسار';

  @override
  String get organizePdfRotateRight => 'تدوير لليمين';

  @override
  String get organizePdfDelete => 'حذف';

  @override
  String get organizePdfSelectAll => 'تحديد الكل';

  @override
  String get organizePdfClearSelection => 'إلغاء التحديد';

  @override
  String organizePdfDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم حذف $count صفحة',
      many: 'تم حذف $count صفحة',
      few: 'تم حذف $count صفحات',
      two: 'تم حذف صفحتين',
      one: 'تم حذف صفحة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get organizePdfUndo => 'تراجع';

  @override
  String get organizePdfKeepOne =>
      'يجب أن يحتوي ملف PDF على صفحة واحدة على الأقل.';

  @override
  String get organizePdfNoChanges =>
      'لا توجد تغييرات بعد — انقل الصفحات أو دوّرها أو احذفها أولًا.';

  @override
  String get organizePdfReset => 'التراجع عن كل التغييرات';

  @override
  String get organizePdfMoveEarlier => 'نقل للأمام';

  @override
  String get organizePdfMoveLater => 'نقل للخلف';

  @override
  String get organizePdfSave => 'حفظ PDF';

  @override
  String get organizePdfFailed => 'تعذّر حفظ ملف PDF هذا.';

  @override
  String get organizePdfResult => 'ملف PDF المنظّم جاهز';

  @override
  String pdfToTextReading(int current, int total) {
    return 'جارٍ قراءة الصفحة $current من $total…';
  }

  @override
  String pdfToTextWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count كلمة',
      many: '$count كلمة',
      few: '$count كلمات',
      two: 'كلمتان',
      one: 'كلمة واحدة',
      zero: 'لا كلمات',
    );
    return '$_temp0';
  }

  @override
  String get pdfToTextCopyAll => 'نسخ الكل';

  @override
  String get pdfToTextCopied => 'تم نسخ النص';

  @override
  String get pdfToTextSaveTxt => 'حفظ كملف ‎.txt';

  @override
  String get pdfToTextEmptyPage => 'لا يوجد نص في هذه الصفحة';

  @override
  String get pdfToTextScannedTitle => 'لم يتم العثور على نص';

  @override
  String get pdfToTextScannedBody =>
      'يبدو أن ملف PDF هذا صور ممسوحة ضوئيًا، لذا لا يوجد نص لنسخه. يمكننا بدلًا من ذلك قراءة كلمات الصفحة 1 من الصورة.';

  @override
  String pdfToTextOpenOcr(String tool) {
    return 'اقرأ الصفحة 1 باستخدام $tool';
  }

  @override
  String get pdfToTextFailed => 'تعذّرت قراءة النص في ملف PDF هذا.';

  @override
  String pdfToTextPartlyScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحة بلا نص (قد تكون ممسوحة ضوئيًا).',
      many: '$count صفحة بلا نص (قد تكون ممسوحة ضوئيًا).',
      few: '$count صفحات بلا نص (قد تكون ممسوحة ضوئيًا).',
      two: 'صفحتان بلا نص (قد تكونان ممسوحتين ضوئيًا).',
      one: 'صفحة واحدة بلا نص (قد تكون ممسوحة ضوئيًا).',
    );
    return '$_temp0';
  }

  @override
  String get pdfEditChoosePdf => 'اختر ملف PDF';

  @override
  String get pdfEditChooseHint =>
      'أو شارك ملف PDF مع Utility Toolbox من أي تطبيق';

  @override
  String get pdfEditChange => 'تغيير';

  @override
  String get pdfEditReading => 'جارٍ القراءة…';

  @override
  String pdfEditPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحة',
      many: '$count صفحة',
      few: '$count صفحات',
      two: 'صفحتان',
      one: 'صفحة واحدة',
      zero: 'لا توجد صفحات',
    );
    return '$_temp0';
  }

  @override
  String pdfEditPageN(int number) {
    return 'صفحة $number';
  }

  @override
  String get pdfEditInvalidPdf => 'لا يبدو أن هذا الملف ملف PDF صالح.';

  @override
  String get pdfEditLocked =>
      'هذا الملف محمي بكلمة مرور. أزل كلمة المرور أولًا ثم حاول مرة أخرى.';

  @override
  String get pdfEditLockedShort => 'محمي بكلمة مرور';

  @override
  String get pdfEditPreviewFailed => 'تعذّر عرض هذه الصفحة.';

  @override
  String get pdfEditResultReady => 'ملف PDF جاهز';

  @override
  String get pdfEditSaveDownloads => 'حفظ في التنزيلات';

  @override
  String get pdfEditShare => 'مشاركة';

  @override
  String get pdfEditStartOver => 'البدء من جديد';

  @override
  String get pdfEditSavedToDownloads =>
      'تم الحفظ في التنزيلات — تجده في ملفاتي';

  @override
  String get pdfEditSharedInstead => 'تم فتح قائمة المشاركة بدلًا من ذلك';

  @override
  String get pdfEditSaveFailed => 'تعذّر إنشاء الملف. حاول مرة أخرى.';

  @override
  String get signPdfStepPdf => 'اختر ملف PDF';

  @override
  String get signPdfStepSignature => 'أنشئ توقيعك';

  @override
  String get signPdfStepPlace => 'اضغط على صفحة لوضع توقيعك';

  @override
  String get signPdfDraw => 'ارسم التوقيع';

  @override
  String get signPdfDrawAgain => 'ارسم من جديد';

  @override
  String get signPdfUseSaved => 'استخدم التوقيع المحفوظ';

  @override
  String get signPdfDeleteSaved => 'حذف التوقيع المحفوظ';

  @override
  String get signPdfSavedDeleted => 'تم حذف التوقيع المحفوظ';

  @override
  String get signPdfDrawTitle => 'ارسم توقيعك';

  @override
  String get signPdfDrawHint => 'وقّع هنا بإصبعك';

  @override
  String get signPdfUndo => 'تراجع';

  @override
  String get signPdfInkBlack => 'أسود';

  @override
  String get signPdfInkBlue => 'أزرق';

  @override
  String get signPdfRemember => 'احفظ التوقيع للمرة القادمة';

  @override
  String get signPdfDone => 'استخدم هذا التوقيع';

  @override
  String get signPdfEmpty => 'ارسم توقيعك أولًا.';

  @override
  String get signPdfSignatureLabel => 'توقيعك';

  @override
  String get signPdfPlaceHint =>
      'اسحب للتحريك، واستخدم إصبعين أو الشريط لتغيير الحجم. اضغط على الصفحة لنقل التوقيع إلى هناك.';

  @override
  String get signPdfSize => 'الحجم';

  @override
  String get signPdfPlaceConfirm => 'ضعه هنا';

  @override
  String get signPdfRemoveFromPage => 'إزالة من هذه الصفحة';

  @override
  String get signPdfAllPages => 'أضفه إلى كل الصفحات';

  @override
  String signPdfAllPagesDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تمت إضافة التوقيع إلى كل الصفحات ($count)',
      many: 'تمت إضافة التوقيع إلى كل الصفحات ($count)',
      few: 'تمت إضافة التوقيع إلى كل الصفحات ($count)',
      two: 'تمت إضافة التوقيع إلى الصفحتين',
      one: 'تمت إضافة التوقيع إلى صفحة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get signPdfClearAll => 'إزالة الكل';

  @override
  String signPdfPlacedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم التوقيع على $count صفحة',
      many: 'تم التوقيع على $count صفحة',
      few: 'تم التوقيع على $count صفحات',
      two: 'تم التوقيع على صفحتين',
      one: 'تم التوقيع على صفحة واحدة',
      zero: 'لم يتم توقيع أي صفحة بعد',
    );
    return '$_temp0';
  }

  @override
  String get signPdfSave => 'حفظ ملف PDF الموقّع';

  @override
  String get signPdfNoPlacement => 'اضغط على صفحة لوضع توقيعك أولًا.';

  @override
  String get signPdfFailed => 'تعذّر توقيع ملف PDF هذا.';

  @override
  String get signPdfResult => 'ملف PDF الموقّع جاهز';

  @override
  String get watermarkPdfModeText => 'علامة مائية نصية';

  @override
  String get watermarkPdfModeNumbers => 'أرقام الصفحات';

  @override
  String get watermarkPdfText => 'نص العلامة المائية';

  @override
  String get watermarkPdfDefaultText => 'سري';

  @override
  String get watermarkPdfTextEmpty => 'اكتب نص العلامة المائية أولًا.';

  @override
  String get watermarkPdfSize => 'حجم النص';

  @override
  String get watermarkPdfOpacity => 'الشفافية';

  @override
  String get watermarkPdfLayout => 'التخطيط';

  @override
  String get watermarkPdfDiagonal => 'قطري';

  @override
  String get watermarkPdfCenter => 'في المنتصف';

  @override
  String get watermarkPdfTiled => 'متكرر';

  @override
  String get watermarkPdfColor => 'اللون';

  @override
  String get watermarkPdfColorGrey => 'رمادي';

  @override
  String get watermarkPdfColorRed => 'أحمر';

  @override
  String get watermarkPdfColorBlue => 'أزرق';

  @override
  String get watermarkPdfColorBlack => 'أسود';

  @override
  String get watermarkPdfColorGreen => 'أخضر';

  @override
  String get watermarkPdfFormat => 'التنسيق';

  @override
  String watermarkPdfPageLabel(String number) {
    return 'صفحة $number';
  }

  @override
  String get watermarkPdfPosition => 'الموضع';

  @override
  String get watermarkPdfBottomCenter => 'أسفل المنتصف';

  @override
  String get watermarkPdfBottomRight => 'أسفل اليمين';

  @override
  String get watermarkPdfTopRight => 'أعلى اليمين';

  @override
  String get watermarkPdfStartAt => 'البدء من';

  @override
  String get watermarkPdfDecrease => 'إنقاص';

  @override
  String get watermarkPdfIncrease => 'زيادة';

  @override
  String get watermarkPdfPreview => 'معاينة (الصفحة 1)';

  @override
  String get watermarkPdfApplyText => 'إضافة العلامة المائية';

  @override
  String get watermarkPdfApplyNumbers => 'إضافة أرقام الصفحات';

  @override
  String get watermarkPdfFailed => 'تعذّر تعديل ملف PDF هذا.';

  @override
  String get bgRemoverPickTitle => 'اختر صورة';

  @override
  String get bgRemoverPickBody =>
      'يعمل بأفضل شكل مع الأشخاص والحيوانات الأليفة والأشياء. تتم معالجة صورتك على هاتفك.';

  @override
  String get bgRemoverGallery => 'اختيار من المعرض';

  @override
  String get bgRemoverCamera => 'التقاط صورة';

  @override
  String get bgRemoverPreparing => 'جارٍ تجهيز الصورة…';

  @override
  String get bgRemoverWorking => 'جارٍ إزالة الخلفية…';

  @override
  String get bgRemoverDownloading =>
      'جارٍ تجهيز أداة إزالة الخلفية. يحدث هذا مرة واحدة فقط ويحتاج إلى اتصال بالإنترنت…';

  @override
  String get bgRemoverDownloadFailed =>
      'أداة إزالة الخلفية ليست جاهزة بعد، فخدمات Google Play ما زالت تنزّلها. تحقق من اتصالك بالإنترنت وحاول مجددًا بعد دقيقة.';

  @override
  String get bgRemoverNoSubject =>
      'لم يُعثر على شخص أو شيء في هذه الصورة. جرّب صورة يظهر فيها الموضوع بوضوح.';

  @override
  String get bgRemoverOpenFailed => 'تعذّر فتح هذه الصورة. جرّب صورة أخرى.';

  @override
  String get bgRemoverFailed =>
      'حدث خطأ أثناء إزالة الخلفية. يُرجى المحاولة مرة أخرى.';

  @override
  String get bgRemoverRetry => 'حاول مرة أخرى';

  @override
  String get bgRemoverAnotherPhoto => 'اختر صورة أخرى';

  @override
  String get bgRemoverNewPhoto => 'صورة جديدة';

  @override
  String get bgRemoverBefore => 'قبل';

  @override
  String get bgRemoverAfter => 'بعد';

  @override
  String get bgRemoverCompare => 'قارن بين قبل وبعد';

  @override
  String get bgRemoverCompareHint => 'اسحب الشريط للمقارنة';

  @override
  String get bgRemoverBgTransparent => 'شفاف';

  @override
  String get bgRemoverBgWhite => 'أبيض';

  @override
  String get bgRemoverBgBlack => 'أسود';

  @override
  String get bgRemoverBgBlue => 'أزرق';

  @override
  String get bgRemoverBgRed => 'أحمر';

  @override
  String get bgRemoverBgYellow => 'أصفر';

  @override
  String get bgRemoverBgBlur => 'تمويه';

  @override
  String get bgRemoverSave => 'حفظ في المعرض';

  @override
  String get bgRemoverSaved => 'تم الحفظ في المعرض';

  @override
  String get bgRemoverSaveFailed =>
      'تعذّر حفظ الصورة. يُرجى المحاولة مرة أخرى.';

  @override
  String get bgRemoverPngHint => 'PNG بخلفية شفافة';

  @override
  String get bgRemoverJpgHint => 'JPG بالخلفية المختارة';

  @override
  String get bubbleLevelSurfaceHint => 'ضع الهاتف مسطحًا على السطح';

  @override
  String get bubbleLevelUprightHint => 'ضع حافة الهاتف على السطح';

  @override
  String get bubbleLevelLevel => 'مستوٍ';

  @override
  String bubbleLevelAngleLabel(String angle) {
    return 'الميل $angle درجة';
  }

  @override
  String bubbleLevelAxes(String x, String y) {
    return 'يمين–يسار $x° · أمام–خلف $y°';
  }

  @override
  String get bubbleLevelCalibrate => 'معايرة';

  @override
  String get bubbleLevelReset => 'إعادة ضبط';

  @override
  String get bubbleLevelCalibrateTitle => 'معايرة الميزان؟';

  @override
  String get bubbleLevelCalibrateBody =>
      'ضع الهاتف على سطح تعرف أنه مستوٍ (أو أسنده إلى حافة مستقيمة)، ثم انقر على «معايرة». سيُقرأ الوضع الحالي على أنه 0°.';

  @override
  String get bubbleLevelCalibrated => 'تمت المعايرة. هذا الوضع يُقرأ الآن 0°.';

  @override
  String get bubbleLevelResetDone => 'تم مسح المعايرة';

  @override
  String get bubbleLevelUnavailable =>
      'لا يحتوي هذا الهاتف على مستشعر حركة، لذا لا يمكن تشغيل الميزان.';

  @override
  String get flashlightOn => 'الضوء يعمل';

  @override
  String get flashlightOff => 'الضوء مطفأ';

  @override
  String get flashlightTurnOn => 'تشغيل الضوء';

  @override
  String get flashlightTurnOff => 'إطفاء الضوء';

  @override
  String get flashlightModeSteady => 'ثابت';

  @override
  String get flashlightModeSos => 'SOS';

  @override
  String get flashlightModeStrobe => 'وميض';

  @override
  String get flashlightSosHint =>
      'يومض بإشارة الاستغاثة ··· ––– ··· بشكل متكرر';

  @override
  String flashlightStrobeSpeed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ومضات في الثانية',
      two: 'ومضتان في الثانية',
      one: 'ومضة واحدة في الثانية',
    );
    return '$_temp0';
  }

  @override
  String get flashlightUseScreen => 'استخدام ضوء الشاشة';

  @override
  String get flashlightUseScreenHint => 'إضاءة الشاشة بدلًا من الفلاش';

  @override
  String get flashlightNoTorch =>
      'لم يُعثر على فلاش في هذا الهاتف، لذا ستضيء الشاشة بدلًا منه.';

  @override
  String get flashlightTorchBusy =>
      'الفلاش مشغول (ربما يستخدم تطبيق آخر الكاميرا)، لذا ستضيء الشاشة بدلًا منه.';

  @override
  String get flashlightScreenColor => 'لون ضوء الشاشة';

  @override
  String get flashlightColorWhite => 'أبيض';

  @override
  String get flashlightColorWarm => 'أبيض دافئ';

  @override
  String get flashlightColorRed => 'أحمر';

  @override
  String get flashlightColorGreen => 'أخضر';

  @override
  String get flashlightColorBlue => 'أزرق';

  @override
  String get flashlightTapToTurnOff => 'انقر في أي مكان للإطفاء';

  @override
  String get stopwatchTabStopwatch => 'ساعة الإيقاف';

  @override
  String get stopwatchTabTimer => 'المؤقت';

  @override
  String get stopwatchStart => 'بدء';

  @override
  String get stopwatchPause => 'إيقاف مؤقت';

  @override
  String get stopwatchResume => 'استئناف';

  @override
  String get stopwatchLap => 'جولة';

  @override
  String get stopwatchReset => 'إعادة ضبط';

  @override
  String stopwatchLapNumber(int number) {
    return 'الجولة $number';
  }

  @override
  String stopwatchCurrentLap(int number, String time) {
    return 'الجولة $number: $time';
  }

  @override
  String get stopwatchBest => 'الأسرع';

  @override
  String get stopwatchWorst => 'الأبطأ';

  @override
  String get stopwatchNoLaps =>
      'انقر على «جولة» أثناء تشغيل الساعة لتسجيل أوقات الجولات.';

  @override
  String get stopwatchTimerQuickStart => 'بدء سريع';

  @override
  String stopwatchTimerMinutes(int minutes) {
    return '$minutes دقيقة';
  }

  @override
  String get stopwatchTimerCustom => 'اضبط وقتك الخاص';

  @override
  String get stopwatchTimerPickTitle => 'ضبط المؤقت';

  @override
  String get stopwatchTimerHours => 'ساعات';

  @override
  String get stopwatchTimerMinutesUnit => 'دقائق';

  @override
  String get stopwatchTimerSeconds => 'ثوانٍ';

  @override
  String get stopwatchTimerAddMinute => '+1 دقيقة';

  @override
  String get stopwatchTimerPaused => 'متوقف مؤقتًا';

  @override
  String stopwatchTimerRemaining(String time) {
    return 'متبقٍ $time';
  }

  @override
  String get stopwatchTimerTimesUp => 'انتهى الوقت!';

  @override
  String stopwatchTimerFinishedBody(String duration) {
    return 'انتهى مؤقت $duration.';
  }

  @override
  String get stopwatchTimerRestart => 'إعادة التشغيل';

  @override
  String get stopwatchTimerDone => 'تم';

  @override
  String get stopwatchTimerKeepOpen =>
      'أبقِ هذه الشاشة مفتوحة: سيهتز الهاتف عند انتهاء الوقت.';

  @override
  String get translateHeroTitle => 'تحدّث أو اكتب للترجمة';

  @override
  String get translateBadgeOnDevice => 'ذكاء اصطناعي على الجهاز';

  @override
  String get translateBadgeOffline => 'يعمل دون اتصال';

  @override
  String get translateFrom => 'من';

  @override
  String get translateTo => 'إلى';

  @override
  String get translateSwap => 'تبديل اللغتين';

  @override
  String get translateHint => 'أدخل نصًا أو اضغط على الميكروفون للتحدث…';

  @override
  String get translateHintListening =>
      'جارٍ الاستماع… تحدّث بشكل طبيعي واضغط على الميكروفون للإيقاف';

  @override
  String translateListeningIn(String language) {
    return 'جارٍ الاستماع ($language)… اضغط على الميكروفون للإيقاف والترجمة.';
  }

  @override
  String get translateSameLanguage => 'يجب أن تختلف لغة المصدر عن اللغة الهدف.';

  @override
  String get translateButton => 'ترجمة';

  @override
  String get translateTranslating => 'جارٍ الترجمة…';

  @override
  String get translateStopAndTranslate => 'إيقاف وترجمة';

  @override
  String get translateDownloadingModel => 'جارٍ تنزيل نموذج اللغة…';

  @override
  String get translateResultLabel => 'الترجمة';

  @override
  String get translatePlayAudio => 'تشغيل الصوت';

  @override
  String get translateGenerating => 'جارٍ الإنشاء…';

  @override
  String get translateShareAudio => 'مشاركة الملف الصوتي';

  @override
  String get translateGenerateAudio => 'إنشاء ملف صوتي';

  @override
  String get translateAudioReady =>
      'الملف الصوتي جاهز — شاركه لإرساله أو حفظه.';

  @override
  String get translateMicStop => 'إيقاف الاستماع والترجمة';

  @override
  String get translateMicStart => 'تحدّث للترجمة';

  @override
  String get translateMicBlocked =>
      'الوصول إلى الميكروفون محظور. فعّله من الإعدادات لاستخدام الإدخال الصوتي.';

  @override
  String get translateMicNeeded => 'يلزم إذن الميكروفون للإدخال الصوتي.';

  @override
  String get translateSpeechUnavailable =>
      'التعرّف على الكلام غير متاح على هذا الجهاز.';

  @override
  String get translateNoSpeech =>
      'لم يتم التقاط أي كلام. يُرجى التحدث مرة أخرى.';

  @override
  String get translateVoiceFailed =>
      'توقف الإدخال الصوتي. يُرجى المحاولة مرة أخرى.';

  @override
  String get translateDownloadFailed =>
      'تعذّر تنزيل نماذج اللغة. تحقّق من اتصالك بالإنترنت.';

  @override
  String get translateFailed => 'فشلت الترجمة. يُرجى المحاولة مرة أخرى.';

  @override
  String get translateAudioFailed => 'تعذّر إنشاء ملف صوتي على هذا الجهاز.';

  @override
  String translateLanguageName(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'af': 'الأفريقانية',
      'sq': 'الألبانية',
      'ar': 'العربية',
      'be': 'البيلاروسية',
      'bn': 'البنغالية',
      'bg': 'البلغارية',
      'ca': 'الكتالانية',
      'zh': 'الصينية (المبسّطة)',
      'hr': 'الكرواتية',
      'cs': 'التشيكية',
      'da': 'الدنماركية',
      'nl': 'الهولندية',
      'en': 'الإنجليزية',
      'eo': 'الإسبرانتو',
      'et': 'الإستونية',
      'fi': 'الفنلندية',
      'fr': 'الفرنسية',
      'gl': 'الجاليكية',
      'ka': 'الجورجية',
      'de': 'الألمانية',
      'el': 'اليونانية',
      'gu': 'الغوجاراتية',
      'ht': 'الكريولية الهايتية',
      'he': 'العبرية',
      'hi': 'الهندية',
      'hu': 'المجرية',
      'is': 'الأيسلندية',
      'id': 'الإندونيسية',
      'ga': 'الأيرلندية',
      'it': 'الإيطالية',
      'ja': 'اليابانية',
      'kn': 'الكانادا',
      'ko': 'الكورية',
      'lv': 'اللاتفية',
      'lt': 'الليتوانية',
      'mk': 'المقدونية',
      'ms': 'الملايوية',
      'mt': 'المالطية',
      'mr': 'الماراثية',
      'no': 'النرويجية',
      'fa': 'الفارسية',
      'pl': 'البولندية',
      'pt': 'البرتغالية',
      'ro': 'الرومانية',
      'ru': 'الروسية',
      'sk': 'السلوفاكية',
      'sl': 'السلوفينية',
      'es': 'الإسبانية',
      'sw': 'السواحلية',
      'sv': 'السويدية',
      'tl': 'التاغالوغية (الفلبينية)',
      'ta': 'التاميلية',
      'te': 'التيلوغوية',
      'th': 'التايلاندية',
      'tr': 'التركية',
      'uk': 'الأوكرانية',
      'ur': 'الأردية',
      'vi': 'الفيتنامية',
      'cy': 'الويلزية',
      'other': '$code',
    });
    return '$_temp0';
  }

  @override
  String get textUtilMode => 'الوضع';

  @override
  String get textUtilModeText => 'نص';

  @override
  String get textUtilHint => 'أدخل النص هنا…';

  @override
  String get textUtilHintBase64 => 'أدخل نصًا أو Base64 لتحويله…';

  @override
  String textUtilWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'كلمة',
      many: 'كلمة',
      few: 'كلمات',
      two: 'كلمتان',
      one: 'كلمة',
      zero: 'كلمة',
    );
    return '$_temp0';
  }

  @override
  String textUtilCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حرف',
      many: 'حرفًا',
      few: 'أحرف',
      two: 'حرفان',
      one: 'حرف',
      zero: 'حرف',
    );
    return '$_temp0';
  }

  @override
  String get textUtilNoSpaces => 'بدون مسافات';

  @override
  String get textUtilUpper => 'أحرف كبيرة';

  @override
  String get textUtilLower => 'أحرف صغيرة';

  @override
  String get textUtilTitle => 'أول حرف كبير لكل كلمة';

  @override
  String get textUtilSentence => 'أول حرف كبير لكل جملة';

  @override
  String get textUtilEncode => 'ترميز';

  @override
  String get textUtilDecode => 'فك الترميز';

  @override
  String get textUtilOutput => 'الناتج';

  @override
  String get textUtilInvalidBase64 => 'هذا ليس Base64 صالحًا.';

  @override
  String get clipEmptyClipboard => 'الحافظة فارغة أو لا تحتوي على نص.';

  @override
  String clipSaved(String text) {
    return 'تم الحفظ: $text';
  }

  @override
  String get clipAddManualTitle => 'إضافة نص يدويًا';

  @override
  String get clipAddHint => 'اكتب النص أو الصقه هنا…';

  @override
  String get clipClearUnpinned => 'مسح غير المثبّتة';

  @override
  String get clipClearHistoryTitle => 'مسح السجل؟';

  @override
  String get clipClearHistoryBody =>
      'هل تريد إزالة كل العناصر غير المثبّتة؟ ستبقى العناصر المثبّتة.';

  @override
  String get clipSearchHint => 'ابحث في المقاطع…';

  @override
  String get clipFilterAll => 'الكل';

  @override
  String get clipFilterPinned => 'المثبّتة';

  @override
  String get clipFilterLinks => 'الروابط';

  @override
  String get clipFilterText => 'النصوص';

  @override
  String get clipFilterCode => 'الأكواد';

  @override
  String clipSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString عنصر محفوظ',
      many: '$countString عنصرًا محفوظًا',
      few: '$countString عناصر محفوظة',
      two: 'عنصران محفوظان',
      one: 'عنصر محفوظ واحد',
      zero: 'لا عناصر محفوظة',
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
      other: '$countString عنصر مثبّت',
      many: '$countString عنصرًا مثبّتًا',
      few: '$countString عناصر مثبّتة',
      two: 'عنصران مثبّتان',
      one: 'عنصر مثبّت واحد',
      zero: 'لا عناصر مثبّتة',
    );
    return '$_temp0';
  }

  @override
  String get clipAddText => 'إضافة نص';

  @override
  String get clipLabel => 'تسمية';

  @override
  String get clipAddLabelTitle => 'إضافة تسمية';

  @override
  String get clipLabelHint => 'مثال: بريد العمل';

  @override
  String get clipEmptyTitle => 'لا توجد مقاطع بعد';

  @override
  String get clipEmptyMessage =>
      'انسخ أي نص على هاتفك، ثم اضغط على «لصق» لحفظه هنا بشكل دائم.';

  @override
  String get clipPasteFromClipboard => 'لصق من الحافظة';

  @override
  String get clipTypeLink => 'رابط';

  @override
  String get clipTypeEmail => 'بريد إلكتروني';

  @override
  String get clipTypePhone => 'هاتف';

  @override
  String get clipTypeCode => 'كود';

  @override
  String get clipTypeText => 'نص';

  @override
  String get clipJustNow => 'الآن';

  @override
  String clipMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'منذ $count دقيقة',
      many: 'منذ $count دقيقة',
      few: 'منذ $count دقائق',
      two: 'منذ دقيقتين',
      one: 'منذ دقيقة',
      zero: 'منذ $count دقيقة',
    );
    return '$_temp0';
  }

  @override
  String clipHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'منذ $count ساعة',
      many: 'منذ $count ساعة',
      few: 'منذ $count ساعات',
      two: 'منذ ساعتين',
      one: 'منذ ساعة',
      zero: 'منذ $count ساعة',
    );
    return '$_temp0';
  }

  @override
  String clipDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'منذ $count يوم',
      many: 'منذ $count يومًا',
      few: 'منذ $count أيام',
      two: 'منذ يومين',
      one: 'منذ يوم',
      zero: 'منذ $count يوم',
    );
    return '$_temp0';
  }

  @override
  String get clipPin => 'تثبيت';

  @override
  String get clipUnpin => 'إلغاء التثبيت';

  @override
  String get calcDivideByZero => 'لا يمكن القسمة على صفر';

  @override
  String get calcCheckExpression => 'تحقّق من العملية الحسابية';

  @override
  String get calcCopyResult => 'نسخ الناتج';

  @override
  String get calcPlus => 'زائد';

  @override
  String get calcMinus => 'ناقص';

  @override
  String get calcTimes => 'ضرب';

  @override
  String get calcDivide => 'قسمة';

  @override
  String get calcPercent => 'بالمئة';

  @override
  String get calcParentheses => 'أقواس';

  @override
  String get calcEquals => 'يساوي';

  @override
  String get calcDecimalPoint => 'فاصلة عشرية';

  @override
  String get ageTabAge => 'العمر';

  @override
  String get ageTabBetween => 'بين تاريخين';

  @override
  String get ageDateOfBirth => 'تاريخ الميلاد';

  @override
  String get ageFrom => 'من تاريخ';

  @override
  String get ageTo => 'إلى تاريخ';

  @override
  String get ageFutureDate => 'هذا التاريخ في المستقبل.';

  @override
  String ageYearsUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'سنة',
      many: 'سنة',
      few: 'سنوات',
      two: 'سنتان',
      one: 'سنة',
      zero: 'سنة',
    );
    return '$_temp0';
  }

  @override
  String ageDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'يوم',
      many: 'يومًا',
      few: 'أيام',
      two: 'يومان',
      one: 'يوم',
      zero: 'يوم',
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
      other: '$countString سنة',
      many: '$countString سنة',
      few: '$countString سنوات',
      two: 'سنتان',
      one: 'سنة واحدة',
      zero: '$countString سنة',
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
      other: '$countString شهر',
      many: '$countString شهرًا',
      few: '$countString أشهر',
      two: 'شهران',
      one: 'شهر واحد',
      zero: '$countString شهر',
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
      other: '$countString يوم',
      many: '$countString يومًا',
      few: '$countString أيام',
      two: 'يومان',
      one: 'يوم واحد',
      zero: '$countString يوم',
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
      other: '$countString أسبوع',
      many: '$countString أسبوعًا',
      few: '$countString أسابيع',
      two: 'أسبوعان',
      one: 'أسبوع واحد',
      zero: '$countString أسبوع',
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
      other: 'بعد $countString يوم',
      many: 'بعد $countString يومًا',
      few: 'بعد $countString أيام',
      two: 'بعد يومين',
      one: 'بعد يوم واحد',
      zero: 'بعد $countString يوم',
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
  String get ageNextBirthday => 'عيد الميلاد القادم';

  @override
  String get ageBirthdayToday => 'اليوم 🎉';

  @override
  String get ageTotalMonths => 'إجمالي الأشهر';

  @override
  String get ageTotalWeeks => 'إجمالي الأسابيع';

  @override
  String get ageTotalDays => 'إجمالي الأيام';

  @override
  String get ageWeeksLabel => 'الأسابيع';

  @override
  String get ageWeekdays => 'أيام العمل (الإثنين–الجمعة)';

  @override
  String get ageHours => 'الساعات';

  @override
  String get ageIncludingEnd => 'مع احتساب يوم النهاية';

  @override
  String get unitFrom => 'من';

  @override
  String get unitTo => 'إلى';

  @override
  String get unitEnterValue => 'أدخل القيمة';

  @override
  String get unitSwap => 'تبديل الوحدتين';

  @override
  String unitCategoryName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'length': 'الطول',
      'weight': 'الوزن',
      'temperature': 'درجة الحرارة',
      'area': 'المساحة',
      'volume': 'الحجم',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String unitName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'millimeter': 'مليمتر',
      'centimeter': 'سنتيمتر',
      'meter': 'متر',
      'kilometer': 'كيلومتر',
      'inch': 'بوصة',
      'foot': 'قدم',
      'mile': 'ميل',
      'gram': 'غرام',
      'kilogram': 'كيلوغرام',
      'ounce': 'أونصة',
      'pound': 'رطل',
      'celsius': 'درجة مئوية',
      'fahrenheit': 'فهرنهايت',
      'kelvin': 'كلفن',
      'squareMeter': 'متر مربع',
      'squareFoot': 'قدم مربعة',
      'acre': 'إيكر',
      'hectare': 'هكتار',
      'milliliter': 'مليلتر',
      'liter': 'لتر',
      'gallonUs': 'غالون (أمريكي)',
      'fluidOunce': 'أونصة سائلة',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String get loanAmount => 'مبلغ القرض';

  @override
  String get loanInterestRate => 'معدل الفائدة السنوي';

  @override
  String get loanTenure => 'المدة';

  @override
  String get loanTenureMonths => 'المدة (بالأشهر)';

  @override
  String get loanTenureYears => 'المدة (بالسنوات)';

  @override
  String get loanToggleMonths => 'أشهر';

  @override
  String get loanToggleYears => 'سنوات';

  @override
  String get loanEmpty => 'أدخل بيانات قرض صحيحة أعلاه لحساب القسط الشهري';

  @override
  String get loanMonthlyEmi => 'القسط الشهري';

  @override
  String get loanPrincipal => 'أصل المبلغ';

  @override
  String get loanTotalInterest => 'إجمالي الفائدة';

  @override
  String get loanTotalPayment => 'إجمالي المدفوع';

  @override
  String get loanBreakdown => 'التفصيل';

  @override
  String get loanInterest => 'الفائدة';

  @override
  String loanInterestShare(String percent) {
    return '$percent فائدة';
  }

  @override
  String get loanSchedule => 'جدول السداد';

  @override
  String loanMonths(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString شهر',
      many: '$countString شهرًا',
      few: '$countString أشهر',
      two: 'شهران',
      one: 'شهر واحد',
      zero: '$countString شهر',
    );
    return '$_temp0';
  }

  @override
  String get loanColMonth => 'شهر';

  @override
  String get loanColBalance => 'الرصيد';

  @override
  String get loanShowAll => 'عرض كل الأشهر';

  @override
  String get loanShowLess => 'عرض أقل';

  @override
  String get clockSearchHint => 'ابحث عن مدينة أو دولة…';

  @override
  String get clockPinned => 'المثبّتة';

  @override
  String get clockAllCities => 'كل المدن';

  @override
  String clockOnWidget(int shown, int total) {
    final intl.NumberFormat shownNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String shownString = shownNumberFormat.format(shown);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'على الأداة: $shownString من $totalString';
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

    return 'على الأداة: $shownString من أصل $maxString كحدٍّ أقصى (غيّر الحجم لعرض المزيد)';
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

    return 'تعرض أداة الشاشة الرئيسية أول $defaultRowsString افتراضيًا — اسحب حافتها السفلية لأسفل لعرض ما يصل إلى $maxRowsString.';
  }

  @override
  String get clockPin => 'تثبيت';

  @override
  String get clockUnpin => 'إلغاء التثبيت';

  @override
  String get clockNoResults => 'لا توجد مدن مطابقة';

  @override
  String get speedSelectingServer => 'جارٍ اختيار الخادم…';

  @override
  String get speedPhasePing => 'جارٍ قياس زمن الاستجابة';

  @override
  String get speedPhaseDownload => 'جارٍ اختبار سرعة التنزيل';

  @override
  String get speedPhaseUpload => 'جارٍ اختبار سرعة الرفع';

  @override
  String get speedDownloadSpeed => 'سرعة التنزيل';

  @override
  String get speedUploadSpeed => 'سرعة الرفع';

  @override
  String get speedRunAgain => 'إعادة';

  @override
  String get speedGo => 'ابدأ';

  @override
  String speedMeasuredVia(String server) {
    return 'تم القياس عبر $server';
  }

  @override
  String get speedPoweredBy => 'يستخدم خوادم اختبار السرعة من Cloudflare';

  @override
  String get speedIdleHint =>
      'اضغط على الزر لقياس زمن الاستجابة وسرعة التنزيل والرفع.';

  @override
  String get speedPing => 'زمن الاستجابة';

  @override
  String get speedResultsTitle => 'نتائج اختبار السرعة';

  @override
  String get speedDownload => 'التنزيل';

  @override
  String get speedUpload => 'الرفع';

  @override
  String speedConnectedIp(String ip) {
    return 'عنوان IP الخاص بك: $ip';
  }

  @override
  String get speedErrorOffline =>
      'لا يوجد اتصال بالإنترنت. تحقق من شبكة Wi-Fi أو بيانات الجوال.';

  @override
  String get speedErrorTimeout =>
      'انتهت مهلة الاختبار. قد يكون اتصالك غير مستقر.';

  @override
  String get speedErrorFailed => 'فشل الاختبار. يُرجى المحاولة مرة أخرى.';

  @override
  String get pingErrorHostNotFound =>
      'لم يتم العثور على المضيف. تحقق من العنوان ومن اتصالك بالإنترنت.';

  @override
  String get pingErrorNoData => 'لا تتوفر معلومات عن هذا العنوان.';

  @override
  String get pingTabMyIp => 'IP الخاص بي';

  @override
  String get pingTabLookup => 'بحث';

  @override
  String get pingTabPing => 'Ping';

  @override
  String get pingYourPublicIp => 'عنوان IP العام الخاص بك';

  @override
  String get pingFieldCity => 'المدينة';

  @override
  String get pingFieldRegion => 'المنطقة';

  @override
  String get pingFieldCountry => 'الدولة';

  @override
  String get pingFieldIsp => 'مزود الخدمة';

  @override
  String get pingFieldTimezone => 'المنطقة الزمنية';

  @override
  String get pingFieldLocation => 'الإحداثيات';

  @override
  String get pingFieldIp => 'عنوان IP';

  @override
  String get pingIpCopied => 'تم نسخ عنوان IP';

  @override
  String get pingCopyIp => 'نسخ عنوان IP';

  @override
  String get pingLookupHint => 'عنوان IP أو اسم المضيف';

  @override
  String get pingLookupButton => 'بحث';

  @override
  String get pingHostHint => 'اسم المضيف (مثل google.com)';

  @override
  String get pingStartButton => 'اختبار';

  @override
  String pingHeader(String host, String ip) {
    return 'Ping إلى $host ($ip) عبر منفذ TCP 443';
  }

  @override
  String get pingStatAvg => 'المتوسط';

  @override
  String get pingStatLoss => 'الفقد';

  @override
  String get pingStatSent => 'المُرسَل';

  @override
  String get pingTimeout => 'انتهت المهلة';

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
  String get compassNortheast => 'شمال شرق';

  @override
  String get compassEast => 'شرق';

  @override
  String get compassSoutheast => 'جنوب شرق';

  @override
  String get compassSouth => 'جنوب';

  @override
  String get compassSouthwest => 'جنوب غرب';

  @override
  String get compassWest => 'غرب';

  @override
  String get compassNorthwest => 'شمال غرب';

  @override
  String compassSemantics(String degrees, String direction) {
    return 'الاتجاه $degrees°، $direction';
  }

  @override
  String get compassHeadingMagnetic => 'الاتجاه المغناطيسي';

  @override
  String get compassUnavailable =>
      'لا يحتوي هذا الجهاز على مستشعر مغناطيسي، لذا لا يمكن تشغيل البوصلة.';

  @override
  String get locationSavedHeader => 'المواقع المحفوظة';

  @override
  String locationSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString موقع',
      many: '$countString موقعًا',
      few: '$countString مواقع',
      two: 'موقعان',
      one: 'موقع واحد',
      zero: 'لا يوجد',
    );
    return '$_temp0';
  }

  @override
  String locationEmpty(String save) {
    return 'لا توجد مواقع محفوظة بعد.\nاضغط على «$save» لحفظ مكانك الحالي.';
  }

  @override
  String locationDeleted(String name) {
    return 'تم حذف «$name»';
  }

  @override
  String get locationSaveDialogTitle => 'حفظ الموقع';

  @override
  String get locationNameLabel => 'الاسم';

  @override
  String get locationNameHint => 'مثل: المنزل، العمل…';

  @override
  String get locationNoteLabel => 'ملاحظة (اختياري)';

  @override
  String get locationCurrent => 'الموقع الحالي';

  @override
  String get locationRefresh => 'تحديث الموقع';

  @override
  String get locationLocating => 'جارٍ تحديد موقعك…';

  @override
  String get locationServicesOff => 'خدمة الموقع متوقفة. شغّلها لمعرفة مكانك.';

  @override
  String get locationPermissionDenied =>
      'اسمح بالوصول إلى الموقع لمعرفة مكانك.';

  @override
  String get locationPermissionDeniedForever =>
      'الوصول إلى الموقع محظور. اسمح به من الإعدادات لاستخدام هذه الأداة.';

  @override
  String get locationErrorTimeout =>
      'تعذّر تحديد الموقع عبر GPS. اقترب من نافذة أو اخرج ثم حاول مجددًا.';

  @override
  String get locationAllow => 'السماح بالوصول';

  @override
  String locationAccuracy(String meters) {
    return 'الدقة: ±$meters م';
  }

  @override
  String get locationCoordsCopied => 'تم نسخ الإحداثيات';

  @override
  String get locationCopyCoords => 'نسخ الإحداثيات';

  @override
  String get locationOpenInMaps => 'فتح في الخرائط';

  @override
  String get passwordYours => 'كلمة المرور';

  @override
  String get passwordSelectType => 'اختر نوعًا واحدًا على الأقل من الأحرف';

  @override
  String get passwordStrength => 'القوة';

  @override
  String get passwordWeak => 'ضعيفة';

  @override
  String get passwordFair => 'مقبولة';

  @override
  String get passwordGood => 'جيدة';

  @override
  String get passwordStrong => 'قوية';

  @override
  String get passwordLength => 'الطول';

  @override
  String passwordChars(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString حرف',
      many: '$countString حرفًا',
      few: '$countString أحرف',
      two: 'حرفان',
      one: 'حرف واحد',
    );
    return '$_temp0';
  }

  @override
  String get passwordInclude => 'تضمين';

  @override
  String get passwordUppercase => 'أحرف كبيرة';

  @override
  String get passwordLowercase => 'أحرف صغيرة';

  @override
  String get passwordNumbers => 'أرقام';

  @override
  String get passwordSymbols => 'رموز';

  @override
  String get passwordCopied => 'تم نسخ كلمة المرور';

  @override
  String get passwordGenerate => 'إنشاء كلمة جديدة';

  @override
  String get hashModeText => 'نص';

  @override
  String get hashModeFile => 'ملف';

  @override
  String get hashAlgorithm => 'الخوارزمية';

  @override
  String get hashInputHint => 'أدخل النص المراد حساب الهاش له…';

  @override
  String get hashPickFile => 'اضغط لاختيار ملف';

  @override
  String get hashChange => 'تغيير';

  @override
  String get hashHashing => 'جارٍ الحساب…';

  @override
  String get hashGenerate => 'إنشاء الهاش';

  @override
  String get hashFileError => 'تعذّرت قراءة هذا الملف. جرّب ملفًا آخر.';

  @override
  String get hashCopied => 'تم نسخ الهاش';

  @override
  String get hashCopy => 'نسخ الهاش';

  @override
  String get colorPickerFormats => 'صيغ الألوان';

  @override
  String get colorPickerHexLabel => 'لون HEX';

  @override
  String get colorPickerHexInvalid => 'أدخل 6 أرقام سداسية عشرية (0–9، A–F)';

  @override
  String get colorPickerApply => 'تطبيق اللون';

  @override
  String colorPickerCopied(String format) {
    return 'تم نسخ $format';
  }

  @override
  String get colorPickerPalette => 'لوحة سريعة';

  @override
  String colorPickerSwatch(String hex) {
    return 'اللون $hex';
  }

  @override
  String get imgCompressPickHint => 'انقر لاختيار صورة أو التقاطها';

  @override
  String imgCompressSupported(String formats) {
    return 'يدعم $formats';
  }

  @override
  String get imgCompressChange => 'تغيير الصورة';

  @override
  String get imgCompressModeQuality => 'حسب الجودة';

  @override
  String get imgCompressModeTarget => 'حجم محدد';

  @override
  String get imgCompressQuality => 'الجودة';

  @override
  String get imgCompressSmallest => 'أصغر ملف';

  @override
  String get imgCompressBestQuality => 'أفضل جودة';

  @override
  String get imgCompressQualityNote =>
      'يتم أيضًا تصغير الصور الكبيرة إلى نحو 1920×1080.';

  @override
  String imgCompressTargetUnder(String size) {
    return 'أقل من $size';
  }

  @override
  String get imgCompressTargetHint =>
      'يحافظ على أفضل جودة ضمن الحد المطلوب — مفيد لرفع الصور في نماذج الوظائف والجهات الحكومية.';

  @override
  String get imgCompressButton => 'ضغط الصورة';

  @override
  String get imgCompressCompressing => 'جارٍ الضغط…';

  @override
  String get imgCompressSuccess => 'تم الضغط بنجاح!';

  @override
  String imgCompressFitsTarget(String size) {
    return 'تم — الحجم أقل من $size';
  }

  @override
  String imgCompressMissedTarget(String size) {
    return 'تعذّر الوصول إلى أقل من $size. هذه أصغر نسخة أمكن إنشاؤها.';
  }

  @override
  String get imgCompressStatOriginal => 'الأصلي';

  @override
  String get imgCompressStatCompressed => 'بعد الضغط';

  @override
  String get imgCompressStatSaved => 'التوفير';

  @override
  String get imgCompressFailed => 'تعذّر ضغط هذه الصورة. جرّب صورة أخرى.';

  @override
  String get imgResizePresetPassport => 'جواز سفر 35×45 مم';

  @override
  String imgResizePresetSquare(String size) {
    return 'مربع $size';
  }

  @override
  String imgResizePresetStory(String size) {
    return 'قصة $size';
  }

  @override
  String imgResizePresetMax(String name, String px) {
    return '$name (حد أقصى $px)';
  }

  @override
  String get imgResizeChoosePhotos => 'اختر الصور';

  @override
  String imgResizeSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم اختيار $count صورة',
      many: 'تم اختيار $count صورة',
      few: 'تم اختيار $count صور',
      two: 'تم اختيار صورتين',
      one: 'تم اختيار صورة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get imgResizePickHint => 'اختر صورة أو أكثر — أو شاركها مع التطبيق';

  @override
  String get imgResizeChoose => 'اختيار';

  @override
  String get imgResizeChange => 'تغيير';

  @override
  String get imgResizePresets => 'قوالب جاهزة';

  @override
  String get imgResizeModePercent => 'نسبة مئوية';

  @override
  String get imgResizeModeMaxSide => 'أقصى ضلع';

  @override
  String get imgResizeModeExact => 'مقاس دقيق';

  @override
  String get imgResizeWidth => 'العرض (px)';

  @override
  String get imgResizeHeight => 'الارتفاع (px)';

  @override
  String get imgResizeCrop => 'قص للملاءمة (دون تمديد)';

  @override
  String get imgResizeFormat => 'الصيغة';

  @override
  String get imgResizeQuality => 'الجودة';

  @override
  String get imgResizeButton => 'تغيير الحجم';

  @override
  String imgResizeSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حفظ $count صورة في المعرض',
      many: 'حفظ $count صورة في المعرض',
      few: 'حفظ $count صور في المعرض',
      two: 'حفظ صورتين في المعرض',
      one: 'حفظ صورة واحدة في المعرض',
    );
    return '$_temp0';
  }

  @override
  String get imgResizeChangeSettings => 'تغيير الإعدادات';

  @override
  String imgResizeInvalidSize(int min, int max) {
    return 'أدخل عرضًا وارتفاعًا بين $min و$max.';
  }

  @override
  String imgResizeFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تعذّرت قراءة $count صورة.',
      many: 'تعذّرت قراءة $count صورة.',
      few: 'تعذّرت قراءة $count صور.',
      two: 'تعذّرت قراءة صورتين.',
      one: 'تعذّرت قراءة صورة واحدة.',
    );
    return '$_temp0';
  }

  @override
  String imgResizeSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم حفظ $count صورة في المعرض',
      many: 'تم حفظ $count صورة في المعرض',
      few: 'تم حفظ $count صور في المعرض',
      two: 'تم حفظ صورتين في المعرض',
      one: 'تم حفظ صورة واحدة في المعرض',
    );
    return '$_temp0';
  }

  @override
  String get imgEnhanceEmptyTitle => 'عدّل صورك';

  @override
  String get imgEnhanceEmptyBody =>
      'اضبط السطوع والتباين والتشبع والحدة، وطبّق القوالب، ودوّر الصورة واقلبها — كل ذلك على جهازك.';

  @override
  String get imgEnhanceFineControls => 'تحكم دقيق';

  @override
  String get imgEnhanceApplying => 'جارٍ التطبيق…';

  @override
  String get imgEnhanceChange => 'تغيير';

  @override
  String get imgEnhancePresets => 'قوالب جاهزة';

  @override
  String get imgEnhanceTransform => 'تحويل';

  @override
  String get imgEnhanceAdjustments => 'تعديلات';

  @override
  String get imgEnhanceRotate => 'تدوير';

  @override
  String get imgEnhanceFlipH => 'قلب أفقي';

  @override
  String get imgEnhanceFlipV => 'قلب رأسي';

  @override
  String get imgEnhanceBrightness => 'السطوع';

  @override
  String get imgEnhanceContrast => 'التباين';

  @override
  String get imgEnhanceSaturation => 'التشبع';

  @override
  String get imgEnhanceSharpen => 'الحدة';

  @override
  String get imgEnhanceBlur => 'التمويه';

  @override
  String get imgEnhanceQuality => 'الجودة';

  @override
  String get imgEnhanceApply => 'تطبيق';

  @override
  String get imgEnhanceFailed => 'تعذّر تطبيق التعديلات. جرّب صورة أخرى.';

  @override
  String imgEnhanceResult(String before, String after, String change) {
    return 'تم! $before ← $after ($change)';
  }

  @override
  String get imgEnhancePresetOriginal => 'الأصلي';

  @override
  String get imgEnhancePresetVivid => 'زاهٍ';

  @override
  String get imgEnhancePresetCool => 'بارد';

  @override
  String get imgEnhancePresetWarm => 'دافئ';

  @override
  String get imgEnhancePresetDramatic => 'درامي';

  @override
  String get imgEnhancePresetFade => 'باهت';

  @override
  String get imgEnhancePresetVintage => 'عتيق';

  @override
  String get imgEnhancePresetNoir => 'أبيض وأسود';

  @override
  String get upscalerNewImage => 'صورة جديدة';

  @override
  String get upscalerIntro =>
      'كبّر صورك حتى 4× بالذكاء الاصطناعي على جهازك. يعمل دون إنترنت بعد تنزيل النموذج مرة واحدة — مع وضع سحابي اختياري للوجوه.';

  @override
  String get upscalerBadgeOnDevice => 'ذكاء اصطناعي على الجهاز';

  @override
  String get upscalerBadgeOffline => 'يعمل دون إنترنت';

  @override
  String get upscalerBadgeUpTo4x => 'تكبير حتى 4×';

  @override
  String get upscalerBadgeGpu => 'تسريع GPU';

  @override
  String get upscalerBestResults =>
      'أفضل النتائج: الصور منخفضة الدقة، والمسح الضوئي القديم، والصور المصغّرة، وملفات JPEG المضغوطة.';

  @override
  String get upscalerChangeImage => 'تغيير الصورة';

  @override
  String get upscalerTabOriginal => 'الأصلية';

  @override
  String get upscalerTabUpscaled => 'مكبّرة بالذكاء الاصطناعي';

  @override
  String get upscalerStageStarting => 'جارٍ البدء…';

  @override
  String get upscalerStageConnecting => 'جارٍ الاتصال بخادم الذكاء الاصطناعي…';

  @override
  String get upscalerStageOnDevice => 'تتم المعالجة على هذا الجهاز…';

  @override
  String get upscalerStageCloudUnavailable =>
      'السحابة غير متاحة — تتم المعالجة على هذا الجهاز…';

  @override
  String get upscalerStageUploading => 'جارٍ رفع الصورة…';

  @override
  String get upscalerStageRestoringFaces =>
      'الذكاء الاصطناعي يستعيد الوجوه والتفاصيل…';

  @override
  String get upscalerStagePreparing => 'جارٍ تجهيز الصورة…';

  @override
  String get upscalerStageLoadingModel => 'جارٍ تحميل نموذج الذكاء الاصطناعي…';

  @override
  String get upscalerStageDownloadingModel =>
      'جارٍ تنزيل نموذج الذكاء الاصطناعي (مرة واحدة)…';

  @override
  String get upscalerStageFallback => 'يُستخدم التكبير العادي…';

  @override
  String get upscalerStageDecoding => 'جارٍ قراءة الصورة…';

  @override
  String upscalerStageResizing(String from, String to) {
    return 'جارٍ تصغير المدخل ($from ← $to)…';
  }

  @override
  String get upscalerStageDenoising => 'جارٍ تقليل التشويش…';

  @override
  String upscalerStageUpscaling(String factor) {
    return 'جارٍ التكبير ($factor×)…';
  }

  @override
  String upscalerStageAiTiles(String done, String total) {
    return 'تكبير بالذكاء الاصطناعي… ($done/$total)';
  }

  @override
  String get upscalerStageSharpening => 'جارٍ زيادة الحدة…';

  @override
  String get upscalerStageColour => 'جارٍ ضبط الألوان…';

  @override
  String get upscalerStageSaving => 'جارٍ الحفظ…';

  @override
  String get upscalerStageDone => 'تم!';

  @override
  String get upscalerLoadingModelHint =>
      'جارٍ تحميل نموذج الذكاء الاصطناعي (أول مرة فقط)';

  @override
  String get upscalerTime4x =>
      'قد يستغرق التكبير 4× من 15 إلى 60 ثانية حسب حجم الصورة.';

  @override
  String get upscalerTime2x => 'يستغرق التكبير 2× عادةً من 5 إلى 20 ثانية.';

  @override
  String upscalerDoneIn(String seconds) {
    return 'تم التكبير في $seconds ث';
  }

  @override
  String get upscalerStatResolution => 'الدقة';

  @override
  String get upscalerStatFileSize => 'حجم الملف';

  @override
  String get upscalerStatScale => 'التكبير';

  @override
  String get upscalerShareSubject => 'صورة مكبّرة بالذكاء الاصطناعي';

  @override
  String get upscalerFallbackModelUnavailable =>
      'يحتاج نموذج الذكاء الاصطناعي إلى الإنترنت مرة واحدة — تم استخدام التكبير العادي';

  @override
  String get upscalerFallbackModelFailed =>
      'تعذّر تشغيل نموذج الذكاء الاصطناعي على هذا الجهاز — تم استخدام التكبير العادي';

  @override
  String get upscalerFallbackCloud =>
      'الخادم السحابي غير متاح — تمت المعالجة على هذا الجهاز';

  @override
  String get upscalerSettings => 'إعدادات الذكاء الاصطناعي';

  @override
  String get upscalerFactorLabel => 'معامل التكبير';

  @override
  String get upscalerFactor2xDesc => 'سريع — مناسب لمعظم الصور';

  @override
  String get upscalerFactor4xDesc => 'أفضل جودة — أبطأ';

  @override
  String get upscalerOptimiseFor => 'تحسين لـ';

  @override
  String get upscalerModeAuto => 'تلقائي';

  @override
  String get upscalerModePhoto => 'صورة';

  @override
  String get upscalerModeIllustration => 'رسم توضيحي';

  @override
  String get upscalerModeFace => 'تفاصيل الوجه';

  @override
  String get upscalerDenoise => 'إزالة التشويش';

  @override
  String get upscalerDenoiseTip => 'يقلل تشويش JPEG قبل التكبير';

  @override
  String get upscalerSharpen => 'زيادة الحدة';

  @override
  String get upscalerSharpenTip => 'يضيف وضوحًا بعد التكبير';

  @override
  String get upscalerCloudTitle => 'تحسين الوجوه سحابيًا';

  @override
  String get upscalerCloudOn => 'يتم رفع صورتك إلى خادمنا لمعالجتها.';

  @override
  String get upscalerCloudOff => 'متوقف — تبقى الصور على هذا الجهاز.';

  @override
  String get upscalerCloudDialogTitle => 'إرسال الصور إلى السحابة؟';

  @override
  String get upscalerCloudDialogBody =>
      'يرفع الوضع السحابي الصورة التي اخترتها إلى خادم التكبير لدينا عبر اتصال مشفّر لمعالجتها بنموذج ذكاء اصطناعي أكبر (GFPGAN + Real-ESRGAN).\n\n• تُرسل فقط الصورة التي تختار تكبيرها.\n• تتم معالجة الصورة في الذاكرة ولا يتم الاحتفاظ بها بعد إرجاع النتيجة.\n• لا تُرسل معها أي بيانات حساب أو بيانات شخصية.\n\nيمكنك إيقاف هذا في أي وقت. يعمل الوضع على الجهاز دون إنترنت بالكامل.';

  @override
  String get upscalerCloudKeepLocal => 'البقاء على الجهاز';

  @override
  String get upscalerCloudEnable => 'تفعيل السحابة';

  @override
  String get upscalerUpscale => 'تكبير بالذكاء الاصطناعي';

  @override
  String get upscalerUpscaleAgain => 'تكبير مجددًا بالإعدادات الجديدة';

  @override
  String get upscalerFailed => 'فشل التكبير';

  @override
  String get upscalerErrorTooLarge =>
      'الصورة كبيرة جدًا. جرّب صورة أصغر أو تكبير 2×.';

  @override
  String get upscalerErrorUnreadable =>
      'تعذّرت قراءة هذه الصورة. استخدم ملف JPG أو PNG.';

  @override
  String get upscalerErrorNetwork =>
      'انتهت مهلة الشبكة. تحقق من الاتصال أو أوقف الوضع السحابي.';

  @override
  String get videoPickHint => 'انقر لاختيار فيديو';

  @override
  String videoProbeInfo(String format, String duration) {
    return 'الصيغة: $format · المدة: $duration';
  }

  @override
  String get videoOutputFormat => 'صيغة الإخراج';

  @override
  String get videoFmtMostCompatible => 'الأكثر توافقًا';

  @override
  String get videoFmtApple => 'Apple / QuickTime';

  @override
  String get videoFmtFlexible => 'حاوية مرنة';

  @override
  String get videoFmtLegacy => 'صيغة قديمة';

  @override
  String get videoFmtGif => 'متحركة (بلا صوت)';

  @override
  String get videoFmtAudioOnly => 'صوت فقط';

  @override
  String get videoFmtAudioAac => 'صوت فقط (AAC)';

  @override
  String get videoFmtAudioRaw => 'صوت فقط (خام)';

  @override
  String get videoFmtWav => 'صوت غير مضغوط';

  @override
  String videoConvertingPercent(int percent) {
    return 'جارٍ التحويل… $percent%';
  }

  @override
  String get videoConvertingWait => 'جارٍ التحويل… قد يستغرق ذلك بعض الوقت';

  @override
  String get videoDone => 'اكتمل التحويل!';

  @override
  String get videoErrorUnsupported =>
      'فشل التحويل. قد لا تكون هذه الصيغة مدعومة على جهازك.';

  @override
  String get videoConvertAnother => 'تحويل ملف آخر';

  @override
  String get videoPickButton => 'اختيار ملف فيديو';

  @override
  String videoConvertTo(String format) {
    return 'تحويل إلى $format';
  }

  @override
  String get docScanAndroidOnly => 'ماسح المستندات متاح على أندرويد فقط.';

  @override
  String docScanNeedsPlayServices(String details) {
    return 'تعذّر تشغيل الماسح. يحتاج إلى خدمات Google Play، فتأكد من تحديثها. ($details)';
  }

  @override
  String get docScanStartFailed =>
      'تعذّر تشغيل الماسح. يُرجى المحاولة مرة أخرى.';

  @override
  String get docScanPdfSaved =>
      'تم حفظ ملف PDF في التنزيلات — تجده في «ملفاتي»';

  @override
  String docScanPagesSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم حفظ $count صفحة في المعرض',
      many: 'تم حفظ $count صفحة في المعرض',
      few: 'تم حفظ $count صفحات في المعرض',
      two: 'تم حفظ صفحتين في المعرض',
      one: 'تم حفظ صفحة واحدة في المعرض',
      zero: 'لم يُحفظ أي صفحة في المعرض',
    );
    return '$_temp0';
  }

  @override
  String get docScanHeadline => 'حوّل الورق إلى ملف PDF واضح';

  @override
  String get docScanIntro =>
      'تُكتشف الحواف تلقائيًا. أضف ما تشاء من الصفحات، واقتصّ وأدِر وطبّق الفلاتر قبل الحفظ.';

  @override
  String get docScanScanning => 'جارٍ المسح…';

  @override
  String get docScanStart => 'ابدأ المسح';

  @override
  String get docScanScannedPages => 'الصفحات الممسوحة';

  @override
  String docScanPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحة',
      many: '$count صفحة',
      few: '$count صفحات',
      two: 'صفحتان',
      one: 'صفحة واحدة',
      zero: 'لا صفحات',
    );
    return '$_temp0';
  }

  @override
  String get docScanSavePdf => 'حفظ PDF';

  @override
  String get docScanSharePdf => 'مشاركة PDF';

  @override
  String get docScanCopyText => 'نسخ النص';

  @override
  String get docScanSaveJpg => 'حفظ كـ JPG';

  @override
  String get docScanAnother => 'مسح مستند آخر';

  @override
  String get pdfToolsChoosePdf => 'اختر ملف PDF';

  @override
  String get pdfToolsChooseHint =>
      'أو شارك ملف PDF مع Utility Toolbox من أي تطبيق';

  @override
  String get pdfToolsReading => 'جارٍ القراءة…';

  @override
  String get pdfToolsLockedShort => 'محمي بكلمة مرور';

  @override
  String pdfToolsPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صفحة',
      many: '$count صفحة',
      few: '$count صفحات',
      two: 'صفحتان',
      one: 'صفحة واحدة',
      zero: 'لا صفحات',
    );
    return '$_temp0';
  }

  @override
  String get pdfToolsChange => 'تغيير';

  @override
  String get pdfToolsResultReady => 'ملف PDF جاهز';

  @override
  String get pdfToolsSaveDownloads => 'حفظ في التنزيلات';

  @override
  String get pdfToolsStartOver => 'البدء من جديد';

  @override
  String get pdfToolsSavedToDownloads =>
      'تم الحفظ في التنزيلات — تجده في «ملفاتي»';

  @override
  String get pdfToolsSharedInstead => 'فُتحت قائمة المشاركة بدلًا من ذلك';

  @override
  String get pdfToolsRangeEmpty => 'أدخل صفحة واحدة على الأقل.';

  @override
  String pdfToolsRangeInvalid(String part) {
    return '«$part» ليس رقم صفحة أو نطاقًا (مثل 1-3، 5).';
  }

  @override
  String pdfToolsRangeOutside(String part, int count) {
    return '«$part» خارج النطاق 1–$count.';
  }

  @override
  String get pdfToolsInvalidPdf => 'لا يبدو أن هذا الملف PDF صالح.';

  @override
  String pdfToolsLockedUnlockFirst(String tool) {
    return 'ملف PDF هذا محمي بكلمة مرور. افتح قفله أولًا باستخدام «$tool».';
  }

  @override
  String pdfToolsPagesLabel(int count) {
    return 'الصفحات (1–$count)';
  }

  @override
  String pdfToolsPagesHint(String example) {
    return 'مثال: $example';
  }

  @override
  String pdfToolsPageN(int number) {
    return 'الصفحة $number';
  }

  @override
  String get pdfToolsDownload => 'تنزيل';

  @override
  String get pdfToolsSavedNotification =>
      'تم الحفظ في التنزيلات — افتحه من الإشعار.';

  @override
  String get pdfToolsShareToSave =>
      'فُتحت قائمة المشاركة — اختر مكان حفظ الملف.';

  @override
  String pdfToolsSelectedFile(String name) {
    return 'المحدد: $name';
  }

  @override
  String pdfToolsSize(String size) {
    return 'الحجم: $size';
  }

  @override
  String get pdfToolsDragToReorder => 'اسحب لإعادة الترتيب';

  @override
  String get pdfHomeTitle => 'أدوات PDF';

  @override
  String get pdfHomeSection => 'أدوات PDF';

  @override
  String get pdfHomeSubtitle => 'أنشئ مستنداتك وادمجها وحسّنها';

  @override
  String get pdfPasswordEnter => 'أدخل كلمة مرور.';

  @override
  String pdfPasswordTooShort(int count) {
    return 'استخدم $count أحرف على الأقل.';
  }

  @override
  String get pdfPasswordMismatch => 'كلمتا المرور غير متطابقتين.';

  @override
  String get pdfPasswordWrong => 'كلمة المرور غير صحيحة.';

  @override
  String get pdfPasswordLockFailed => 'تعذّر قفل ملف PDF هذا.';

  @override
  String get pdfPasswordUnlockFailed => 'تعذّر فتح قفل ملف PDF هذا.';

  @override
  String get pdfPasswordLockedDone => 'تم قفل ملف PDF';

  @override
  String get pdfPasswordRemovedDone => 'تمت إزالة كلمة المرور';

  @override
  String get pdfPasswordAlreadyLocked =>
      'يحتوي ملف PDF هذا على كلمة مرور بالفعل. افتح قفله أولًا.';

  @override
  String get pdfPasswordNotLocked =>
      'لا يحتوي ملف PDF هذا على كلمة مرور — لا شيء لفتحه.';

  @override
  String get pdfPasswordNew => 'كلمة مرور جديدة';

  @override
  String get pdfPasswordCurrent => 'كلمة المرور الحالية';

  @override
  String get pdfPasswordRepeat => 'أعد كتابة كلمة المرور';

  @override
  String get pdfPasswordShow => 'إظهار كلمة المرور';

  @override
  String get pdfPasswordHide => 'إخفاء كلمة المرور';

  @override
  String get pdfPasswordWarning =>
      'احتفظ بكلمة المرور في مكان آمن — لا يمكن استعادتها. التشفير بمعيار AES-256.';

  @override
  String get pdfSplitExtract => 'استخراج صفحات';

  @override
  String get pdfSplitRemove => 'حذف صفحات';

  @override
  String get pdfSplitPagesHelp =>
      'استخدم الفواصل والنطاقات. «8-» تعني من الصفحة 8 حتى النهاية.';

  @override
  String get pdfSplitRemovesAll => 'سيؤدي ذلك إلى حذف كل الصفحات.';

  @override
  String get pdfSplitFailed => 'تعذّر تقسيم ملف PDF هذا.';

  @override
  String get pdfToImagesFailed => 'تعذّر عرض ملف PDF هذا.';

  @override
  String pdfToImagesSaved(int saved, int total) {
    return 'تم حفظ $saved من $total صورة في المعرض';
  }

  @override
  String get pdfToImagesAllPages => 'كل الصفحات';

  @override
  String get pdfToImagesConvert => 'تحويل إلى JPG';

  @override
  String pdfToImagesRendered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تمت معالجة $count صفحة…',
      many: 'تمت معالجة $count صفحة…',
      few: 'تمت معالجة $count صفحات…',
      two: 'تمت معالجة صفحتين…',
      one: 'تمت معالجة صفحة واحدة…',
      zero: 'لم تُعالج أي صفحة بعد…',
    );
    return '$_temp0';
  }

  @override
  String pdfToImagesRenderedOf(int count, int total) {
    return 'تمت معالجة $count من $total صفحة…';
  }

  @override
  String pdfToImagesSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حفظ $count صورة في المعرض',
      many: 'حفظ $count صورة في المعرض',
      few: 'حفظ $count صور في المعرض',
      two: 'حفظ صورتين في المعرض',
      one: 'حفظ صورة واحدة في المعرض',
      zero: 'لا صور للحفظ',
    );
    return '$_temp0';
  }

  @override
  String get pdfCompressButton => 'ضغط';

  @override
  String get pdfCompressWorking => 'جارٍ ضغط PDF…';

  @override
  String pdfCompressOriginalSize(String size) {
    return 'الحجم الأصلي: $size';
  }

  @override
  String get pdfCompressIntro =>
      'اختر ملف PDF. يكون الضغط أفضل مع المستندات المليئة بالصور.';

  @override
  String get pdfCompressLow => 'منخفض';

  @override
  String get pdfCompressMedium => 'متوسط';

  @override
  String get pdfCompressHigh => 'مرتفع';

  @override
  String get pdfCompressFailed => 'تعذّر ضغط ملف PDF هذا.';

  @override
  String pdfCompressBefore(String size) {
    return 'قبل: $size';
  }

  @override
  String pdfCompressAfter(String size) {
    return 'بعد: $size';
  }

  @override
  String get pdfMergeButton => 'دمج';

  @override
  String get pdfMergeWorking => 'جارٍ دمج ملفات PDF…';

  @override
  String get pdfMergePick => 'اختر ملفات PDF';

  @override
  String get pdfMergeIntro => 'اختر ملفّي PDF على الأقل لدمجهما.';

  @override
  String get pdfMergeFailed =>
      'تعذّر دمج ملفات PDF. قد يكون أحد الملفات غير قابل للقراءة.';

  @override
  String pdfMergeResult(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ملف PDF المدمج ($count صفحة)',
      many: 'ملف PDF المدمج ($count صفحة)',
      few: 'ملف PDF المدمج ($count صفحات)',
      two: 'ملف PDF المدمج (صفحتان)',
      one: 'ملف PDF المدمج (صفحة واحدة)',
      zero: 'ملف PDF المدمج (لا صفحات)',
    );
    return '$_temp0';
  }

  @override
  String get imageToPdfCreate => 'إنشاء PDF';

  @override
  String get imageToPdfWorking => 'جارٍ إنشاء PDF…';

  @override
  String get imageToPdfPick => 'اختر الصور';

  @override
  String get imageToPdfIntro => 'اختر صورة واحدة أو أكثر لتحويلها.';

  @override
  String get imageToPdfFailed => 'تعذّر إنشاء PDF. جرّب صورًا أخرى.';

  @override
  String imageToPdfReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ملف PDF جاهز ($count صفحة)',
      many: 'ملف PDF جاهز ($count صفحة)',
      few: 'ملف PDF جاهز ($count صفحات)',
      two: 'ملف PDF جاهز (صفحتان)',
      one: 'ملف PDF جاهز (صفحة واحدة)',
      zero: 'ملف PDF جاهز (لا صفحات)',
    );
    return '$_temp0';
  }

  @override
  String get qrScanNoCodeInPhoto =>
      'لم يُعثر على رمز QR أو باركود في هذه الصورة.';

  @override
  String get qrScanPhotoFailed => 'تعذّرت قراءة هذه الصورة.';

  @override
  String qrScanResultTitle(String type) {
    return 'تم المسح ($type)';
  }

  @override
  String get qrScanFromPhoto => 'المسح من صورة';

  @override
  String get qrScanCameraNeeded =>
      'يلزم الوصول إلى الكاميرا لمسح رموز QR والباركود.';

  @override
  String get qrScanCameraError =>
      'تعذّر تشغيل الكاميرا. أغلق تطبيقات الكاميرا الأخرى وحاول مجددًا.';

  @override
  String get qrScanTorchOn => 'تشغيل الكشاف';

  @override
  String get qrScanTorchOff => 'إطفاء الكشاف';

  @override
  String get qrScanTypeLink => 'رابط';

  @override
  String get qrScanTypeWifi => 'واي فاي';

  @override
  String get qrScanTypeContact => 'جهة اتصال';

  @override
  String get qrScanTypeText => 'نص';

  @override
  String get qrGenInputLabel => 'نص أو رابط';

  @override
  String get qrGenInputHint => 'أدخل المحتوى المراد ترميزه';

  @override
  String get qrGenPreviewLabel => 'معاينة رمز QR';

  @override
  String get qrGenEmpty => 'أدخل نصًا في الأعلى لمعاينة رمز QR.';

  @override
  String get qrGenSaveGallery => 'حفظ في المعرض';

  @override
  String get qrHomeTitle => 'QR والباركود';

  @override
  String get qrHomeTabScan => 'مسح';

  @override
  String get qrHomeTabCreate => 'إنشاء';

  @override
  String get qrHomeScanTitle => 'امسح رمزًا';

  @override
  String get qrHomeScanBody =>
      'وجّه الكاميرا نحو رمز QR أو باركود لمسحه فورًا.';

  @override
  String get qrHomeBadgeInstant => 'فوري';

  @override
  String get qrHomeBadgeHistory => 'سجل محفوظ';

  @override
  String get qrHomeStartScan => 'ابدأ المسح';

  @override
  String get qrHomeCreateTitle => 'أنشئ رمزًا';

  @override
  String get qrHomeCreateBody =>
      'أنشئ رمز QR من نص أو رابط، ثم احفظه أو شاركه.';

  @override
  String get qrHomeBadgeShare => 'شارك في أي مكان';

  @override
  String get qrHomeBadgeImage => 'حفظ كصورة';

  @override
  String get qrHomeOpenGenerator => 'فتح المولّد';

  @override
  String get qrHistoryTitle => 'سجل المسح';

  @override
  String get qrHistoryMore => 'خيارات إضافية';

  @override
  String get qrHistoryEmpty => 'ستظهر الرموز الممسوحة هنا.';

  @override
  String get wifiQrPlaceholder => 'أدخل بيانات الواي فاي\nلإنشاء رمز QR';

  @override
  String get wifiQrPreviewLabel => 'رمز QR للواي فاي';

  @override
  String get wifiQrNetworkDetails => 'تفاصيل الشبكة';

  @override
  String get wifiQrSsidLabel => 'اسم الشبكة (SSID)';

  @override
  String get wifiQrSsidHint => 'واي فاي المنزل';

  @override
  String get wifiQrPasswordLabel => 'كلمة المرور';

  @override
  String get wifiQrPasswordHint => 'أدخل كلمة المرور';

  @override
  String get wifiQrShowPassword => 'إظهار كلمة المرور';

  @override
  String get wifiQrHidePassword => 'إخفاء كلمة المرور';

  @override
  String get wifiQrSecurity => 'الأمان';

  @override
  String get wifiQrSecurityNone => 'بدون (مفتوحة)';

  @override
  String get wifiQrHidden => 'شبكة مخفية';

  @override
  String get wifiQrHiddenHint => 'فعّله إذا كان اسم الشبكة غير ظاهر';

  @override
  String get wifiQrSaveImage => 'حفظ الصورة';

  @override
  String get wifiQrInfo =>
      'أي شخص يمسح رمز QR هذا سيتصل بشبكة الواي فاي تلقائيًا.';

  @override
  String get wifiQrShareText =>
      'امسح رمز QR هذا للاتصال بشبكة الواي فاي الخاصة بي!';

  @override
  String get ocrCameraDenied =>
      'تم رفض إذن الكاميرا. افتح الإعدادات للسماح بالوصول.';

  @override
  String get ocrCameraRequired => 'يلزم إذن الكاميرا لالتقاط صورة.';

  @override
  String get ocrTimeout =>
      'استغرقت القراءة وقتًا طويلًا — ربما ما زال نموذج النص قيد التنزيل. اتصل بشبكة واي فاي مرة واحدة أو حاول مجددًا.';

  @override
  String get ocrFailed => 'تعذّرت قراءة النص من هذه الصورة. جرّب صورة أوضح.';

  @override
  String get ocrPreparing => 'جارٍ تجهيز الصورة…';

  @override
  String get ocrScanning => 'جارٍ قراءة النص…';

  @override
  String get ocrScriptLabel => 'نظام الكتابة';

  @override
  String get ocrScriptHint =>
      'اختر الأبجدية المكتوب بها النص. لا يمكن قراءة العربية والأردية والبنغالية بعد.';

  @override
  String get ocrScriptLatin => 'اللاتينية (الإنجليزية، الإسبانية…)';

  @override
  String get ocrScriptDevanagari => 'الديفاناغارية (الهندية، الماراثية…)';

  @override
  String get ocrScriptChinese => 'الصينية';

  @override
  String get ocrScriptJapanese => 'اليابانية';

  @override
  String get ocrScriptKorean => 'الكورية';

  @override
  String get ocrIdleTitle => 'استخرج النص من أي صورة';

  @override
  String get ocrIdleBody =>
      'وجّه الكاميرا أو اختر صورة — يُستخرج النص فورًا على جهازك.';

  @override
  String get ocrBadgeOnDevice => 'ذكاء اصطناعي على الجهاز';

  @override
  String get ocrBadgeLocal => 'معالجة محلية';

  @override
  String get ocrBadgeBlocks => 'نسخ حسب الفقرة';

  @override
  String get ocrUseCamera => 'استخدام الكاميرا';

  @override
  String get ocrChooseGallery => 'الاختيار من المعرض';

  @override
  String get ocrOnDeviceNote => 'على الجهاز · لا حاجة للرفع';

  @override
  String get ocrTabImage => 'الصورة';

  @override
  String get ocrTabText => 'النص';

  @override
  String get ocrTapBlockHint => 'اضغط على فقرة مظللة لنسخها';

  @override
  String get ocrBlockTitle => 'نص الفقرة';

  @override
  String ocrBlockLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سطر · اضغط للنسخ',
      many: '$count سطرًا · اضغط للنسخ',
      few: '$count أسطر · اضغط للنسخ',
      two: 'سطران · اضغط للنسخ',
      one: 'سطر واحد · اضغط للنسخ',
      zero: 'لا أسطر',
    );
    return '$_temp0';
  }

  @override
  String get ocrCopyBlock => 'نسخ الفقرة';

  @override
  String get ocrBlockCopied => 'تم نسخ الفقرة';

  @override
  String get ocrCopyEntireBlock => 'نسخ الفقرة كاملة';

  @override
  String get ocrCopyLine => 'نسخ السطر';

  @override
  String get ocrNoText => 'لم يُكتشف أي نص — جرّب صورة أوضح.';

  @override
  String get ocrQuickCopy => 'نسخ سريع حسب القسم';

  @override
  String ocrBlockNCopied(int number) {
    return 'تم نسخ الفقرة $number';
  }

  @override
  String get ocrDoneEditing => 'إنهاء التعديل';

  @override
  String get ocrEditText => 'تعديل النص';

  @override
  String get ocrAllCopied => 'تم نسخ النص كله';

  @override
  String get ocrCopyAll => 'نسخ الكل';

  @override
  String get ocrScanAgain => 'مسح';

  @override
  String ocrStatLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سطر',
      many: '$count سطرًا',
      few: '$count أسطر',
      two: 'سطران',
      one: 'سطر واحد',
      zero: 'لا أسطر',
    );
    return '$_temp0';
  }

  @override
  String ocrStatWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count كلمة',
      many: '$count كلمة',
      few: '$count كلمات',
      two: 'كلمتان',
      one: 'كلمة واحدة',
      zero: 'لا كلمات',
    );
    return '$_temp0';
  }

  @override
  String ocrStatChars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count حرف',
      many: '$count حرفًا',
      few: '$count أحرف',
      two: 'حرفان',
      one: 'حرف واحد',
      zero: 'لا أحرف',
    );
    return '$_temp0';
  }

  @override
  String get wordPdfNoText => 'لم يُعثر على نص قابل للاستخراج في هذا المستند.';

  @override
  String get wordPdfInfo =>
      'يحوّل ملفات ‎.docx إلى PDF. يُحتفظ بالنص، وقد تختلف التخطيطات المعقدة (الجداول والصور).';

  @override
  String get wordPdfOpeningPicker => 'جارٍ فتح منتقي الملفات…';

  @override
  String wordPdfConverting(int percent) {
    return 'جارٍ التحويل… $percent٪';
  }

  @override
  String get wordPdfDone => 'اكتمل التحويل';

  @override
  String get wordPdfTapToPick => 'اضغط لاختيار ملف ‎.docx';

  @override
  String get wordPdfSupports => 'يدعم صيغة ‎.docx';

  @override
  String get wordPdfFailed =>
      'فشل التحويل. قد يكون الملف تالفًا أو ليس مستند ‎.docx.';

  @override
  String get wordPdfFontsOffline =>
      'بعض النص (مثل العربية أو الأردية أو الهندية أو البنغالية أو السيريلية) غير موجود في ملف PDF هذا. يُنزَّل خطه مرة واحدة فقط — اتصل بالإنترنت وأعد التحويل.';

  @override
  String get wordPdfConvertAnother => 'تحويل ملف آخر';

  @override
  String get wordPdfPick => 'اختر ملف ‎.docx';

  @override
  String get wordPdfStep1Title => 'اختر ملف Word';

  @override
  String get wordPdfStep1Desc => 'اختر ملف ‎.docx من ذاكرة جهازك.';

  @override
  String get wordPdfStep2Title => 'تحويل تلقائي';

  @override
  String get wordPdfStep2Desc => 'يُستخرج النص ويُنسَّق في صفحات PDF بحجم A4.';

  @override
  String get wordPdfStep3Title => 'مشاركة أو حفظ';

  @override
  String get wordPdfStep3Desc =>
      'شارك ملف PDF مع أي تطبيق أو بريد إلكتروني أو تخزين سحابي.';

  @override
  String get wordPdfReady => 'ملف PDF جاهز';
}
