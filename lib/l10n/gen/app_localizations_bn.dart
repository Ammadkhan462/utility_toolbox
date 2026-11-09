// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'Utility Toolbox';

  @override
  String get navTools => 'টুলস';

  @override
  String get navFiles => 'আমার ফাইল';

  @override
  String get settingsTooltip => 'সেটিংস';

  @override
  String get searchHint => 'খুঁজুন: pdf ছোট করা, স্ক্যান, jpg…';

  @override
  String get quickActions => 'দ্রুত কাজ';

  @override
  String get favorites => 'প্রিয়';

  @override
  String get recent => 'সাম্প্রতিক';

  @override
  String searchNoResults(String query) {
    return '“$query” এর সাথে কোনো টুল মেলেনি';
  }

  @override
  String get toolMenuAddFavorite => 'প্রিয়তে যোগ করুন';

  @override
  String get toolMenuRemoveFavorite => 'প্রিয় থেকে সরান';

  @override
  String get toolMenuPinShortcut => 'হোম স্ক্রিনে যোগ করুন';

  @override
  String get pinShortcutRequested =>
      'হোম স্ক্রিনে শর্টকাট যোগ করতে নিশ্চিত করুন';

  @override
  String get pinShortcutUnsupported =>
      'আপনার হোম স্ক্রিন অ্যাপ শর্টকাট সাপোর্ট করে না';

  @override
  String get newBadge => 'নতুন';

  @override
  String get catScan => 'স্ক্যান ও QR';

  @override
  String get catPdf => 'PDF';

  @override
  String get catImage => 'ফটো ও ছবি';

  @override
  String get catText => 'লেখা ও অনুবাদ';

  @override
  String get catCalc => 'হিসাব ও রূপান্তর';

  @override
  String get catNetwork => 'ইন্টারনেট';

  @override
  String get catDevice => 'ডিভাইস ও লোকেশন';

  @override
  String get catSecurity => 'নিরাপত্তা';

  @override
  String get catMedia => 'ভিডিও ও অডিও';

  @override
  String get toolDocScannerTitle => 'ডকুমেন্ট স্ক্যানার';

  @override
  String get toolDocScannerDesc => 'কাগজ স্ক্যান করে PDF, অটো কিনারা';

  @override
  String get toolDocScannerKeywords =>
      'স্ক্যানার, স্ক্যান, ডকুমেন্ট স্ক্যান, কাগজ স্ক্যান, রশিদ, ক্যামস্ক্যানার, scanner, scan paper, camscanner, document, pdf scanner, receipt';

  @override
  String get toolQrScannerTitle => 'QR ও বারকোড স্ক্যান';

  @override
  String get toolQrScannerDesc => 'ক্যামেরা বা ছবি থেকে';

  @override
  String get toolQrScannerKeywords =>
      'কিউআর স্ক্যানার, কিউআর কোড, বারকোড, কোড স্ক্যান, qr code, qr reader, barcode, scan code';

  @override
  String get toolQrGeneratorTitle => 'QR কোড তৈরি';

  @override
  String get toolQrGeneratorDesc => 'লিংক, লেখা, কন্টাক্ট আর আরও অনেক';

  @override
  String get toolQrGeneratorKeywords =>
      'কিউআর কোড বানানো, কিউআর তৈরি, বারকোড তৈরি, qr maker, generate qr, barcode generator';

  @override
  String get toolOcrTitle => 'ছবি থেকে লেখা';

  @override
  String get toolOcrDesc => 'যেকোনো ছবির লেখা কপি করুন (OCR)';

  @override
  String get toolOcrKeywords =>
      'ছবি থেকে লেখা, লেখা কপি, টেক্সট স্ক্যানার, chobi theke lekha, ocr, text scanner, extract text, copy text from image';

  @override
  String get toolWifiQrTitle => 'WiFi QR কোড';

  @override
  String get toolWifiQrDesc => 'পাসওয়ার্ড না লিখেই WiFi শেয়ার';

  @override
  String get toolWifiQrKeywords =>
      'ওয়াইফাই পাসওয়ার্ড, ওয়াইফাই শেয়ার, wifi password, share wifi';

  @override
  String get toolImageToPdfTitle => 'ছবি থেকে PDF';

  @override
  String get toolImageToPdfDesc => 'ছবিগুলো একটি PDF বানান';

  @override
  String get toolImageToPdfKeywords =>
      'ছবি থেকে পিডিএফ, jpg থেকে pdf, ফটো পিডিএফ, jpg to pdf, photo to pdf, picture to pdf';

  @override
  String get toolMergePdfTitle => 'PDF জোড়া লাগান';

  @override
  String get toolMergePdfDesc => 'কয়েকটি PDF একটিতে মেলান';

  @override
  String get toolMergePdfKeywords =>
      'পিডিএফ মার্জ, পিডিএফ যুক্ত করা, pdf merge, join pdf, combine pdf';

  @override
  String get toolCompressPdfTitle => 'PDF ছোট করুন';

  @override
  String get toolCompressPdfDesc => 'পাঠানোর জন্য PDF ছোট করুন';

  @override
  String get toolCompressPdfKeywords =>
      'পিডিএফ ছোট করা, পিডিএফ সাইজ কমানো, pdf compress, reduce pdf size, shrink pdf';

  @override
  String get toolSplitPdfTitle => 'PDF ভাগ করুন';

  @override
  String get toolSplitPdfDesc => 'পাতা আলাদা করুন বা মুছুন';

  @override
  String get toolSplitPdfKeywords =>
      'পিডিএফ ভাগ, পাতা আলাদা, পাতা মুছুন, pdf split, extract pages, delete pages, cut pdf';

  @override
  String get toolPdfToImagesTitle => 'PDF থেকে JPG';

  @override
  String get toolPdfToImagesDesc => 'প্রতিটি পাতা ছবি হিসেবে সেভ';

  @override
  String get toolPdfToImagesKeywords =>
      'পিডিএফ থেকে ছবি, pdf থেকে jpg, pdf to jpg, pdf to image, pdf to png, pdf pages';

  @override
  String get toolProtectPdfTitle => 'PDF লক করুন';

  @override
  String get toolProtectPdfDesc => 'PDF-এ পাসওয়ার্ড দিন';

  @override
  String get toolProtectPdfKeywords =>
      'পিডিএফ পাসওয়ার্ড, পিডিএফ লক, password pdf, encrypt pdf, secure pdf';

  @override
  String get toolUnlockPdfTitle => 'PDF আনলক';

  @override
  String get toolUnlockPdfDesc => 'জানা পাসওয়ার্ড সরিয়ে দিন';

  @override
  String get toolUnlockPdfKeywords =>
      'পিডিএফ আনলক, পাসওয়ার্ড সরান, remove pdf password, decrypt pdf';

  @override
  String get toolWordToPdfTitle => 'Word থেকে PDF';

  @override
  String get toolWordToPdfDesc => '.docx ডকুমেন্ট রূপান্তর';

  @override
  String get toolWordToPdfKeywords =>
      'ওয়ার্ড থেকে পিডিএফ, word to pdf, doc to pdf, docx, word';

  @override
  String get toolImageCompressorTitle => 'ছবি ছোট করুন';

  @override
  String get toolImageCompressorDesc => 'ফাইল ছোট, দেখতে একই';

  @override
  String get toolImageCompressorKeywords =>
      'ছবির সাইজ কমানো, ছবি ছোট করা, কেবি, photo compress, reduce image size, compress jpg, kb';

  @override
  String get toolImageResizerTitle => 'সাইজ ও ফরম্যাট';

  @override
  String get toolImageResizerDesc => 'সঠিক সাইজ, JPG, PNG বা WEBP';

  @override
  String get toolImageResizerKeywords =>
      'ছবির সাইজ পরিবর্তন, পাসপোর্ট সাইজ ছবি, jpg থেকে png, resize image, jpg to png, png to jpg, webp, passport size';

  @override
  String get toolImageEnhancerTitle => 'ফটো এডিটর';

  @override
  String get toolImageEnhancerDesc => 'ফিল্টার, ক্রপ, উজ্জ্বলতা আর আরও';

  @override
  String get toolImageEnhancerKeywords =>
      'ছবি এডিট, ফটো এডিট, ফিল্টার, ক্রপ, ঘোরান, photo editor, edit photo, filter, crop, rotate';

  @override
  String get toolAiUpscalerTitle => 'AI আপস্কেলার';

  @override
  String get toolAiUpscalerDesc => 'ছবি 4× পর্যন্ত বড় ও পরিষ্কার';

  @override
  String get toolAiUpscalerKeywords =>
      'ছবি পরিষ্কার, ঝাপসা ছবি, এইচডি, রেজোলিউশন বাড়ান, enhance, hd, increase resolution, blurry';

  @override
  String get toolTranslationTitle => 'অনুবাদ';

  @override
  String get toolTranslationDesc => 'অফলাইন, ভয়েস ও উচ্চারণসহ';

  @override
  String get toolTranslationKeywords =>
      'অনুবাদ, অনুবাদক, ট্রান্সলেট, বাংলা থেকে ইংরেজি, ইংরেজি থেকে বাংলা, অভিধান, ভাষা, translate, translator, language, dictionary';

  @override
  String get toolTextUtilitiesTitle => 'লেখার টুলস';

  @override
  String get toolTextUtilitiesDesc => 'শব্দ গণনা, কেস বদল, Base64';

  @override
  String get toolTextUtilitiesKeywords =>
      'শব্দ গণনা, বড় হাতের অক্ষর, ছোট হাতের অক্ষর, word counter, uppercase, lowercase, base64';

  @override
  String get toolSmartClipboardTitle => 'ক্লিপবোর্ড ম্যানেজার';

  @override
  String get toolSmartClipboardDesc => 'কপি করা লেখা সেভ, পিন ও খুঁজুন';

  @override
  String get toolSmartClipboardKeywords =>
      'কপি পেস্ট, নোট, ক্লিপবোর্ড, copy paste, notes, clipboard history';

  @override
  String get toolCalculatorTitle => 'ক্যালকুলেটর';

  @override
  String get toolCalculatorDesc => 'হিস্ট্রিসহ রোজকার ক্যালকুলেটর';

  @override
  String get toolCalculatorKeywords =>
      'ক্যালকুলেটর, হিসাব, শতাংশ, অংক, calculator, calc, math, percent';

  @override
  String get toolAgeCalculatorTitle => 'বয়স ও তারিখ';

  @override
  String get toolAgeCalculatorDesc => 'সঠিক বয়স ও দুই তারিখের ব্যবধান';

  @override
  String get toolAgeCalculatorKeywords =>
      'বয়স হিসাব, জন্মদিন, জন্ম তারিখ, তারিখের পার্থক্য, দিন গণনা, age calculator, birthday, date difference, days counter';

  @override
  String get toolUnitConverterTitle => 'ইউনিট কনভার্টার';

  @override
  String get toolUnitConverterDesc => 'দৈর্ঘ্য, ওজন, তাপমাত্রা আর আরও';

  @override
  String get toolUnitConverterKeywords =>
      'একক রূপান্তর, সেমি থেকে ইঞ্চি, কেজি, ফুট, সেলসিয়াস, convert units, cm to inch, kg to lb, celsius';

  @override
  String get toolLoanCalculatorTitle => 'লোন ও EMI';

  @override
  String get toolLoanCalculatorDesc => 'মাসিক কিস্তি ও মোট সুদ';

  @override
  String get toolLoanCalculatorKeywords =>
      'লোন হিসাব, কিস্তি, সুদ, ঋণ, ইএমআই, emi, mortgage, interest, installment';

  @override
  String get toolTimezoneTitle => 'বিশ্ব ঘড়ি';

  @override
  String get toolTimezoneDesc => 'যেকোনো শহরের সময়, উইজেটসহ';

  @override
  String get toolTimezoneKeywords =>
      'টাইম জোন, ঘড়ি, শহরের সময়, বিদেশের সময়, time zone, clock, city time';

  @override
  String get toolColorPickerTitle => 'কালার পিকার';

  @override
  String get toolColorPickerDesc => 'HEX, RGB, HSL ও CMYK';

  @override
  String get toolColorPickerKeywords =>
      'রঙের কোড, রং, কালার কোড, color code, hex, palette';

  @override
  String get toolSpeedTestTitle => 'ইন্টারনেট স্পিড টেস্ট';

  @override
  String get toolSpeedTestDesc => 'ডাউনলোড, আপলোড ও পিং';

  @override
  String get toolSpeedTestKeywords =>
      'নেট স্পিড, ইন্টারনেট স্পিড, ওয়াইফাই স্পিড, speed test, wifi speed, internet speed, mbps';

  @override
  String get toolIpPingTitle => 'IP ও পিং';

  @override
  String get toolIpPingDesc => 'আপনার IP ও হোস্ট পৌঁছায় কিনা';

  @override
  String get toolIpPingKeywords =>
      'আমার আইপি, পিং, নেটওয়ার্ক, my ip, ping, network';

  @override
  String get toolCompassTitle => 'কম্পাস';

  @override
  String get toolCompassDesc => 'দিক ও বেয়ারিং';

  @override
  String get toolCompassKeywords =>
      'দিক, উত্তর, কিবলা, কেবলা, compass, direction, north, qibla';

  @override
  String get toolLocationSaverTitle => 'লোকেশন সেভ';

  @override
  String get toolLocationSaverDesc => 'GPS জায়গা মনে রাখুন ও শেয়ার করুন';

  @override
  String get toolLocationSaverKeywords =>
      'লোকেশন, পার্কিং, ম্যাপ, স্থানাঙ্ক, location, parking, gps, map, coordinates';

  @override
  String get toolPasswordGeneratorTitle => 'পাসওয়ার্ড জেনারেটর';

  @override
  String get toolPasswordGeneratorDesc => 'শক্ত র‍্যান্ডম পাসওয়ার্ড';

  @override
  String get toolPasswordGeneratorKeywords =>
      'শক্ত পাসওয়ার্ড, পাসওয়ার্ড তৈরি, র‍্যান্ডম, secure password, random';

  @override
  String get toolHashGeneratorTitle => 'হ্যাশ জেনারেটর';

  @override
  String get toolHashGeneratorDesc => 'লেখা বা ফাইলের MD5, SHA-1, SHA-256';

  @override
  String get toolHashGeneratorKeywords =>
      'হ্যাশ, চেকসাম, hash, checksum, md5, sha256';

  @override
  String get toolVideoConverterTitle => 'ভিডিও কনভার্টার';

  @override
  String get toolVideoConverterDesc => 'ভিডিও থেকে MP3, GIF, MP4 আর আরও';

  @override
  String get toolVideoConverterKeywords =>
      'ভিডিও থেকে এমপি৩, গান বের করা, জিফ বানানো, video to mp3, gif maker, audio extract';

  @override
  String get filesEmptyTitle => 'এখনো কোনো ফাইল নেই';

  @override
  String get filesEmptyBody =>
      'আপনার তৈরি PDF, ছবি ও অন্যান্য ফাইল এখানে দেখাবে, যাতে আবার খুলতে বা শেয়ার করতে পারেন।';

  @override
  String get fileOpen => 'খুলুন';

  @override
  String get fileShare => 'শেয়ার';

  @override
  String get fileRemoveFromList => 'তালিকা থেকে সরান';

  @override
  String get fileOpenFailed =>
      'ফাইলটি খোলা যায়নি। হয়তো সরানো বা মুছে ফেলা হয়েছে।';

  @override
  String get filesClearList => 'তালিকা মুছুন';

  @override
  String get filesClearConfirm =>
      'তালিকা মুছবেন? আপনার ফাইলগুলো ডিভাইসেই থাকবে।';

  @override
  String get incomingSheetTitle => 'কী করতে চান?';

  @override
  String incomingImages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ছবি',
      one: '১টি ছবি',
    );
    return '$_temp0';
  }

  @override
  String incomingPdfs(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি PDF',
      one: '১টি PDF',
    );
    return '$_temp0';
  }

  @override
  String get incomingText => 'শেয়ার করা লেখা';

  @override
  String get incomingDocument => 'Word ডকুমেন্ট';

  @override
  String get incomingVideo => 'ভিডিও';

  @override
  String get incomingUnsupported => 'এই ধরনের ফাইল এখনো সাপোর্ট করে না';

  @override
  String get incomingFailed => 'শেয়ার করা ফাইলটি পড়া যায়নি';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get settingsAppearance => 'দেখতে কেমন';

  @override
  String get settingsTheme => 'থিম';

  @override
  String get themeSystem => 'অটো';

  @override
  String get themeLight => 'লাইট';

  @override
  String get themeDark => 'ডার্ক';

  @override
  String get settingsLanguage => 'ভাষা';

  @override
  String get languageSystem => 'সিস্টেমের ভাষা';

  @override
  String get settingsPurchases => 'কেনাকাটা';

  @override
  String get removeAdsTitle => 'বিজ্ঞাপন সরান';

  @override
  String get removeAdsSubtitle => 'একবার কিনুন, কোনো সাবস্ক্রিপশন নেই';

  @override
  String get restorePurchasesTitle => 'কেনাকাটা ফিরিয়ে আনুন';

  @override
  String get restorePurchasesSubtitle => 'এই ডিভাইসে আগের কেনাকাটা ফেরত আনুন';

  @override
  String get settingsSupport => 'সহায়তা ও প্রাইভেসি';

  @override
  String get shareAppTitle => 'অ্যাপ শেয়ার করুন';

  @override
  String get shareAppSubtitle => 'বন্ধুকে Utility Toolbox এর কথা বলুন';

  @override
  String shareAppMessage(String url) {
    return 'আমি Utility Toolbox দিয়ে ডকুমেন্ট স্ক্যান করি, PDF এডিট করি, QR কোড পড়ি আর অফলাইনে অনুবাদ করি। ফ্রি: $url';
  }

  @override
  String get rateAppTitle => 'অ্যাপকে রেটিং দিন';

  @override
  String get rateAppSubtitle => 'ছোট একটা রিভিউ অনেক সাহায্য করে';

  @override
  String get privacyPolicyTitle => 'প্রাইভেসি পলিসি';

  @override
  String get privacyPolicySubtitle => 'অ্যাপ কী অ্যাক্সেস করে এবং কেন';

  @override
  String get privacyChoicesTitle => 'বিজ্ঞাপনের প্রাইভেসি';

  @override
  String get privacyChoicesSubtitle => 'পার্সোনালাইজড বিজ্ঞাপনের সম্মতি বদলান';

  @override
  String versionLabel(String version) {
    return 'ভার্সন $version';
  }

  @override
  String get onboardingSkip => 'বাদ দিন';

  @override
  String get onboardingNext => 'পরবর্তী';

  @override
  String get onboardingStart => 'শুরু করুন';

  @override
  String get onboarding1Title => 'সব টুল,\nএক অ্যাপে';

  @override
  String get onboarding1Body =>
      'ডকুমেন্ট স্ক্যান, PDF এডিট, QR কোড পড়া, অনুবাদ আর ছবির সাইজ বদল — দশটা অ্যাপ ইনস্টল না করেই।';

  @override
  String get onboarding2Title => 'যেকোনো অ্যাপ\nথেকে কাজ করে';

  @override
  String get onboarding2Body =>
      'যেকোনো অ্যাপ থেকে ছবি বা PDF Utility Toolbox-এ শেয়ার করুন, লেখা সিলেক্ট করে অনুবাদ করুন, বা শর্টকাটের জন্য অ্যাপ আইকনে চেপে ধরুন।';

  @override
  String get onboarding3Title => 'দ্রুত, অফলাইন\nও নিরাপদ';

  @override
  String get onboarding3Body =>
      'প্রায় সবকিছু আপনার ফোনেই চলে। আপনি নিজে ক্লাউড অপশন চালু না করলে কোনো ফাইল আপলোড হয় না।';

  @override
  String get commonCancel => 'বাতিল';

  @override
  String get commonClear => 'মুছুন';
}
