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

  @override
  String get toolBgRemoverTitle => 'ব্যাকগ্রাউন্ড সরান';

  @override
  String get toolBgRemoverDesc => 'এক ট্যাপে মানুষ ও জিনিস কেটে আলাদা করুন';

  @override
  String get toolBgRemoverKeywords =>
      'ব্যাকগ্রাউন্ড সরান, ব্যাকগ্রাউন্ড মুছুন, কাটআউট, স্বচ্ছ, স্টিকার, পাসপোর্ট ছবি, সাদা ব্যাকগ্রাউন্ড, remove background, remove bg, cutout, transparent, png';

  @override
  String get toolBmiTitle => 'BMI ক্যালকুলেটর';

  @override
  String get toolBmiDesc => 'আপনার BMI ও সুস্থ ওজন জানুন';

  @override
  String get toolBmiKeywords =>
      'বিএমআই, বডি মাস ইনডেক্স, ওজন, উচ্চতা, আদর্শ ওজন, স্থূলতা, স্বাস্থ্য, bmi, body mass index, weight, height, health, fitness, ideal weight, obesity';

  @override
  String get toolBubbleLevelTitle => 'বাবল লেভেল';

  @override
  String get toolBubbleLevelDesc => 'তাক ও ফ্রেম সোজা আছে কি না দেখুন';

  @override
  String get toolBubbleLevelKeywords =>
      'লেভেল, স্পিরিট লেভেল, সোজা, কোণ, ঢাল, level, spirit level, bubble level, straight, angle, tilt';

  @override
  String get toolCurrencyTitle => 'মুদ্রা রূপান্তর';

  @override
  String get toolCurrencyDesc => '১৫০+ মুদ্রার হালনাগাদ বিনিময় হার';

  @override
  String get toolCurrencyKeywords =>
      'মুদ্রা, বিনিময় হার, টাকা, ডলার, রুপি, ইউরো, রিয়াল, কারেন্সি, currency, exchange rate, money, convert, dollar, euro, rupee, taka, riyal, forex';

  @override
  String get toolDirectChatTitle => 'সরাসরি চ্যাট';

  @override
  String get toolDirectChatDesc => 'নম্বর সেভ না করেই WhatsApp-এ মেসেজ করুন';

  @override
  String get toolDirectChatKeywords =>
      'হোয়াটসঅ্যাপ, সরাসরি চ্যাট, মেসেজ, নম্বর সেভ ছাড়া, বার্তা, whatsapp, direct chat, message, unsaved number, click to chat, wa.me, send message, chat';

  @override
  String get toolFlashlightTitle => 'ফ্ল্যাশলাইট';

  @override
  String get toolFlashlightDesc => 'SOS ও স্ট্রোবসহ উজ্জ্বল টর্চ';

  @override
  String get toolFlashlightKeywords =>
      'টর্চ, ফ্ল্যাশলাইট, আলো, বাতি, ফ্ল্যাশ, এলইডি, flashlight, torch, light, led, sos, strobe, flash';

  @override
  String get toolOrganizePdfTitle => 'PDF সাজান';

  @override
  String get toolOrganizePdfDesc => 'পৃষ্ঠা সাজান, ঘোরান বা মুছে ফেলুন';

  @override
  String get toolOrganizePdfKeywords =>
      'সাজানো, ক্রম, ঘোরানো, পৃষ্ঠা মুছুন, পৃষ্ঠা সরান, organize, organise, reorder, rotate, delete pages, remove pages, arrange, sort, pdf';

  @override
  String get toolPdfToTextTitle => 'PDF থেকে টেক্সট';

  @override
  String get toolPdfToTextDesc => 'PDF থেকে সব লেখা কপি করুন';

  @override
  String get toolPdfToTextKeywords =>
      'টেক্সট বের করুন, লেখা কপি, PDF থেকে লেখা, রূপান্তর, pdf to text, extract text, copy text, txt, read pdf, convert, pdf to word';

  @override
  String get toolPercentageTitle => 'শতাংশ ও ছাড়';

  @override
  String get toolPercentageDesc => 'শতাংশ, ছাড়, টিপ ভাগ ও ট্যাক্স মুহূর্তে';

  @override
  String get toolPercentageKeywords =>
      'শতাংশ, পার্সেন্ট, ছাড়, ডিসকাউন্ট, টিপ, বিল ভাগ, ভ্যাট, ট্যাক্স, কর, percentage, percent, discount, sale price, tip, split bill, tax, gst, vat';

  @override
  String get toolSignPdfTitle => 'PDF সাইন করুন';

  @override
  String get toolSignPdfDesc => 'আপনার স্বাক্ষর আঁকুন এবং যেকোনো পৃষ্ঠায় বসান';

  @override
  String get toolSignPdfKeywords =>
      'সাইন, স্বাক্ষর, ই-সাইন, দস্তখত, sign, signature, e-sign, esign, fill and sign, autograph, pdf';

  @override
  String get toolStopwatchTitle => 'স্টপওয়াচ ও টাইমার';

  @override
  String get toolStopwatchDesc => 'ল্যাপসহ স্টপওয়াচ ও কাউন্টডাউন টাইমার';

  @override
  String get toolStopwatchKeywords =>
      'স্টপওয়াচ, টাইমার, কাউন্টডাউন, ল্যাপ, অ্যালার্ম, ঘড়ি, রান্নার টাইমার, ব্যায়াম, stopwatch, timer, countdown, lap, alarm';

  @override
  String get toolWatermarkPdfTitle => 'জলছাপ ও পৃষ্ঠা নম্বর';

  @override
  String get toolWatermarkPdfDesc =>
      'প্রতিটি পৃষ্ঠায় লেখা বা পৃষ্ঠা নম্বর বসান';

  @override
  String get toolWatermarkPdfKeywords =>
      'জলছাপ, ওয়াটারমার্ক, স্ট্যাম্প, পৃষ্ঠা নম্বর, গোপনীয়, খসড়া, watermark, stamp, page numbers, number pages, confidential, draft, footer, header, pdf';

  @override
  String get bmiMetric => 'মেট্রিক (সেমি, কেজি)';

  @override
  String get bmiImperial => 'ইম্পেরিয়াল (ফুট, পাউন্ড)';

  @override
  String get bmiHeight => 'উচ্চতা';

  @override
  String get bmiWeight => 'ওজন';

  @override
  String get bmiFeet => 'ফুট';

  @override
  String get bmiInches => 'ইঞ্চি';

  @override
  String get bmiUnitCm => 'সেমি';

  @override
  String get bmiUnitKg => 'কেজি';

  @override
  String get bmiUnitLb => 'পাউন্ড';

  @override
  String get bmiUnitFt => 'ফুট';

  @override
  String get bmiUnitIn => 'ইঞ্চি';

  @override
  String get bmiAge => 'বয়স (ঐচ্ছিক)';

  @override
  String get bmiSex => 'লিঙ্গ (ঐচ্ছিক)';

  @override
  String get bmiMale => 'পুরুষ';

  @override
  String get bmiFemale => 'নারী';

  @override
  String get bmiYourBmi => 'আপনার BMI';

  @override
  String get bmiUnderweight => 'কম ওজন';

  @override
  String get bmiNormal => 'সুস্থ ওজন';

  @override
  String get bmiOverweight => 'অতিরিক্ত ওজন';

  @override
  String get bmiObese => 'স্থূলতা';

  @override
  String bmiHealthyRange(String min, String max) {
    return 'আপনার উচ্চতায় সুস্থ ওজন: $min – $max';
  }

  @override
  String bmiToLose(String amount) {
    return 'সুস্থ সীমার চেয়ে প্রায় $amount বেশি';
  }

  @override
  String bmiToGain(String amount) {
    return 'সুস্থ সীমার চেয়ে প্রায় $amount কম';
  }

  @override
  String bmiIdealWeight(String weight) {
    return 'আনুমানিক আদর্শ ওজন: $weight';
  }

  @override
  String get bmiChildNote =>
      '১৮ বছরের কম বয়সীদের BMI বয়সভিত্তিক বৃদ্ধি চার্ট দিয়ে দেখা হয়। এই ফলাফল প্রাপ্তবয়স্কদের সীমা অনুযায়ী।';

  @override
  String get bmiDisclaimer =>
      'BMI একটি সাধারণ নির্দেশিকা, চিকিৎসা নির্ণয় নয়।';

  @override
  String get bmiEnterValues => 'আপনার উচ্চতা ও ওজন লিখুন';

  @override
  String get currencyAmount => 'পরিমাণ';

  @override
  String get currencyFrom => 'এই মুদ্রা থেকে';

  @override
  String get currencyTo => 'এই মুদ্রায়';

  @override
  String get currencySwap => 'মুদ্রা অদলবদল করুন';

  @override
  String get currencyChoose => 'মুদ্রা বেছে নিন';

  @override
  String get currencySearchHint => 'মুদ্রা বা কোড খুঁজুন';

  @override
  String get currencyAll => 'সব মুদ্রা';

  @override
  String currencyRatesFrom(String date) {
    return '$date তারিখের হার';
  }

  @override
  String get currencyRefresh => 'হার রিফ্রেশ করুন';

  @override
  String get currencyUpdating => 'হার হালনাগাদ হচ্ছে…';

  @override
  String get currencyOfflineCached =>
      'হালনাগাদ করা যায়নি। সংরক্ষিত হার দেখানো হচ্ছে।';

  @override
  String get currencyNoRatesTitle => 'এখনও হার ডাউনলোড হয়নি';

  @override
  String get currencyNoRatesBody =>
      'বিনিময় হার ডাউনলোড করতে একবার ইন্টারনেটে যুক্ত হন। এরপর ইন্টারনেট ছাড়াও রূপান্তর করা যাবে।';

  @override
  String get currencyRetry => 'আবার চেষ্টা করুন';

  @override
  String get currencyOtherFavorites => 'আপনার প্রিয় মুদ্রা';

  @override
  String get currencyFavoritesHint =>
      'তালিকায় কোনো মুদ্রার পাশে ☆ চাপুন, সেটি এখানে যোগ হবে।';

  @override
  String get currencyCopy => 'ফলাফল কপি করুন';

  @override
  String get currencyCopied => 'কপি হয়েছে';

  @override
  String get currencyNoMatch => 'কোনো মুদ্রা পাওয়া যায়নি';

  @override
  String get currencyDisclaimer =>
      'হারগুলো শুধু ধারণার জন্য, আপনার ব্যাংকের হারের সাথে মিল নাও হতে পারে।';

  @override
  String get directChatPhone => 'ফোন নম্বর';

  @override
  String get directChatCountryCode => 'দেশের কোড';

  @override
  String get directChatSearchCountry => 'দেশ বা কোড খুঁজুন';

  @override
  String get directChatNoCountry => 'কোনো দেশ পাওয়া যায়নি';

  @override
  String get directChatMessage => 'মেসেজ (ঐচ্ছিক)';

  @override
  String get directChatOpen => 'WhatsApp-এ খুলুন';

  @override
  String get directChatPaste => 'নম্বর পেস্ট করুন';

  @override
  String get directChatPasteNone => 'ক্লিপবোর্ডে কোনো ফোন নম্বর নেই';

  @override
  String get directChatTooShort => 'নম্বরটি খুব ছোট মনে হচ্ছে';

  @override
  String get directChatTooLong => 'নম্বরটি খুব বড় মনে হচ্ছে';

  @override
  String directChatWillOpen(String number) {
    return '$number-এর সাথে চ্যাট';
  }

  @override
  String get directChatOpenFailed =>
      'চ্যাট খোলা যায়নি। WhatsApp কি ইনস্টল করা আছে?';

  @override
  String get directChatHint =>
      'কন্টাক্টে সেভ না করেই যেকোনো নম্বরে মেসেজ পাঠান।';

  @override
  String get directChatNotAffiliated =>
      'স্বতন্ত্র টুল। WhatsApp বা Meta-এর সাথে সম্পর্কিত নয়।';

  @override
  String get percentageTabPercent => 'শতাংশ';

  @override
  String get percentageTabDiscount => 'ছাড়';

  @override
  String get percentageTabTip => 'টিপ ও ভাগ';

  @override
  String get percentageTabTax => 'ট্যাক্স / ভ্যাট';

  @override
  String get percentageOfTitle => 'কোনো সংখ্যার শতাংশ';

  @override
  String get percentageFieldPercent => 'শতাংশ';

  @override
  String get percentageFieldNumber => 'সংখ্যা';

  @override
  String percentageOfResult(String percent, String number) {
    return '$number-এর $percent';
  }

  @override
  String get percentageWhatTitle => 'এটি কত শতাংশ?';

  @override
  String get percentageFieldPart => 'মান';

  @override
  String get percentageFieldTotal => 'মোট';

  @override
  String percentageWhatResult(String part, String total) {
    return '$total-এর মধ্যে $part';
  }

  @override
  String get percentageChangeTitle => 'শতাংশ পরিবর্তন';

  @override
  String get percentageFieldOld => 'আগের মান';

  @override
  String get percentageFieldNew => 'নতুন মান';

  @override
  String percentageIncrease(String percent) {
    return '$percent বৃদ্ধি';
  }

  @override
  String percentageDecrease(String percent) {
    return '$percent হ্রাস';
  }

  @override
  String get percentageNoChange => 'কোনো পরিবর্তন নেই';

  @override
  String get percentageDifference => 'পার্থক্য';

  @override
  String get percentagePrice => 'আসল দাম';

  @override
  String get percentageDiscount => 'ছাড়';

  @override
  String get percentageExtraDiscount => 'অতিরিক্ত ছাড় (ঐচ্ছিক)';

  @override
  String get percentageYouPay => 'আপনি দেবেন';

  @override
  String get percentageYouSave => 'আপনার সাশ্রয়';

  @override
  String get percentageTotalDiscount => 'মোট ছাড়';

  @override
  String get percentageBill => 'বিলের পরিমাণ';

  @override
  String get percentageTip => 'টিপ';

  @override
  String get percentageCustom => 'নিজে লিখুন';

  @override
  String get percentagePeople => 'মানুষ';

  @override
  String get percentageAddPerson => 'একজন যোগ করুন';

  @override
  String get percentageRemovePerson => 'একজন কমান';

  @override
  String get percentageTipAmount => 'টিপের পরিমাণ';

  @override
  String get percentageTotal => 'মোট';

  @override
  String get percentagePerPerson => 'প্রত্যেকে দেবেন';

  @override
  String get percentageTaxRate => 'ট্যাক্সের হার';

  @override
  String get percentageAddTax => 'ট্যাক্স যোগ করুন';

  @override
  String get percentageRemoveTax => 'ট্যাক্স বাদ দিন';

  @override
  String get percentagePriceExclTax => 'ট্যাক্স ছাড়া দাম';

  @override
  String get percentagePriceInclTax => 'ট্যাক্সসহ দাম';

  @override
  String get percentageBeforeTax => 'ট্যাক্সের আগে';

  @override
  String get percentageTaxAmount => 'ট্যাক্স';

  @override
  String get percentageAfterTax => 'ট্যাক্সসহ মোট';

  @override
  String get percentageEnterValues => 'ফলাফল দেখতে সংখ্যা লিখুন';

  @override
  String get commonSave => 'সংরক্ষণ';

  @override
  String get commonShare => 'শেয়ার';

  @override
  String get commonCopy => 'কপি';

  @override
  String get commonCopied => 'কপি হয়েছে';

  @override
  String get commonRetry => 'আবার চেষ্টা করুন';

  @override
  String get commonDone => 'সম্পন্ন';

  @override
  String get commonDelete => 'মুছুন';

  @override
  String get commonUndo => 'পূর্বাবস্থায় ফেরান';

  @override
  String get commonOpen => 'খুলুন';

  @override
  String get commonReset => 'রিসেট';

  @override
  String get commonClose => 'বন্ধ করুন';

  @override
  String get commonOpenSettings => 'সেটিংস খুলুন';

  @override
  String get commonChoosePhoto => 'ছবি বেছে নিন';

  @override
  String get commonChooseFile => 'ফাইল বেছে নিন';

  @override
  String get commonCamera => 'ক্যামেরা';

  @override
  String get commonGallery => 'গ্যালারি';

  @override
  String get commonWorking => 'কাজ চলছে…';

  @override
  String get commonSavedToGallery => 'গ্যালারিতে সংরক্ষিত';

  @override
  String get commonSavedToDownloads => 'ডাউনলোডসে সংরক্ষিত';

  @override
  String get commonSaveFailed => 'ফাইল সংরক্ষণ করা যায়নি';

  @override
  String get commonErrorGeneric => 'কিছু ভুল হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get commonErrorOffline => 'ইন্টারনেট সংযোগ নেই';

  @override
  String get commonErrorTimeout => 'অনুরোধের সময় শেষ। আবার চেষ্টা করুন।';

  @override
  String get commonPermissionNeeded =>
      'অনুমতি দরকার। সেটিংসে গিয়ে অনুমতি দিন।';

  @override
  String get commonResult => 'ফলাফল';

  @override
  String get commonStart => 'শুরু';

  @override
  String get commonStop => 'থামান';

  @override
  String get commonClearAll => 'সব মুছুন';

  @override
  String get commonPaste => 'পেস্ট';

  @override
  String get commonSearch => 'খুঁজুন';

  @override
  String get organizePdfHint =>
      'নির্বাচন করতে পৃষ্ঠায় ট্যাপ করুন। সরাতে পৃষ্ঠা চেপে ধরে টেনে আনুন।';

  @override
  String organizePdfSelected(int count) {
    return '$countটি নির্বাচিত';
  }

  @override
  String get organizePdfRotateLeft => 'বাঁয়ে ঘোরান';

  @override
  String get organizePdfRotateRight => 'ডানে ঘোরান';

  @override
  String get organizePdfDelete => 'মুছুন';

  @override
  String get organizePdfSelectAll => 'সব নির্বাচন করুন';

  @override
  String get organizePdfClearSelection => 'নির্বাচন বাতিল করুন';

  @override
  String organizePdfDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি পৃষ্ঠা মুছে ফেলা হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String get organizePdfUndo => 'ফিরিয়ে আনুন';

  @override
  String get organizePdfKeepOne => 'PDF-এ কমপক্ষে একটি পৃষ্ঠা থাকতে হবে।';

  @override
  String get organizePdfNoChanges =>
      'এখনও কোনো পরিবর্তন নেই — আগে পৃষ্ঠা সরান, ঘোরান বা মুছুন।';

  @override
  String get organizePdfReset => 'সব পরিবর্তন বাতিল করুন';

  @override
  String get organizePdfMoveEarlier => 'আগে সরান';

  @override
  String get organizePdfMoveLater => 'পরে সরান';

  @override
  String get organizePdfSave => 'PDF সংরক্ষণ করুন';

  @override
  String get organizePdfFailed => 'এই PDF সংরক্ষণ করা যায়নি।';

  @override
  String get organizePdfResult => 'আপনার সাজানো PDF তৈরি';

  @override
  String pdfToTextReading(int current, int total) {
    return '$totalটির মধ্যে $current নম্বর পৃষ্ঠা পড়া হচ্ছে…';
  }

  @override
  String pdfToTextWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি শব্দ',
    );
    return '$_temp0';
  }

  @override
  String get pdfToTextCopyAll => 'সব কপি করুন';

  @override
  String get pdfToTextCopied => 'লেখা কপি হয়েছে';

  @override
  String get pdfToTextSaveTxt => '.txt হিসেবে সংরক্ষণ';

  @override
  String get pdfToTextEmptyPage => 'এই পৃষ্ঠায় কোনো লেখা নেই';

  @override
  String get pdfToTextScannedTitle => 'কোনো লেখা পাওয়া যায়নি';

  @override
  String get pdfToTextScannedBody =>
      'এই PDF স্ক্যান বা ছবির মতো দেখাচ্ছে, তাই কপি করার মতো লেখা নেই। এর বদলে আমরা ছবি থেকে ১ নম্বর পৃষ্ঠার লেখা পড়তে পারি।';

  @override
  String pdfToTextOpenOcr(String tool) {
    return '$tool দিয়ে ১ নম্বর পৃষ্ঠা পড়ুন';
  }

  @override
  String get pdfToTextFailed => 'এই PDF-এর লেখা পড়া যায়নি।';

  @override
  String pdfToTextPartlyScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি পৃষ্ঠায় কোনো লেখা নেই (হয়তো স্ক্যান করা)।',
    );
    return '$_temp0';
  }

  @override
  String get pdfEditChoosePdf => 'একটি PDF বেছে নিন';

  @override
  String get pdfEditChooseHint =>
      'অথবা যেকোনো অ্যাপ থেকে Utility Toolbox-এ PDF শেয়ার করুন';

  @override
  String get pdfEditChange => 'বদলান';

  @override
  String get pdfEditReading => 'পড়া হচ্ছে…';

  @override
  String pdfEditPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি পৃষ্ঠা',
    );
    return '$_temp0';
  }

  @override
  String pdfEditPageN(int number) {
    return 'পৃষ্ঠা $number';
  }

  @override
  String get pdfEditInvalidPdf => 'এই ফাইলটি সঠিক PDF বলে মনে হচ্ছে না।';

  @override
  String get pdfEditLocked =>
      'এই PDF পাসওয়ার্ড দিয়ে সুরক্ষিত। আগে পাসওয়ার্ড সরিয়ে আবার চেষ্টা করুন।';

  @override
  String get pdfEditLockedShort => 'পাসওয়ার্ড সুরক্ষিত';

  @override
  String get pdfEditPreviewFailed => 'এই পৃষ্ঠাটি দেখানো যায়নি।';

  @override
  String get pdfEditResultReady => 'আপনার PDF তৈরি';

  @override
  String get pdfEditSaveDownloads => 'ডাউনলোডে সংরক্ষণ করুন';

  @override
  String get pdfEditShare => 'শেয়ার করুন';

  @override
  String get pdfEditStartOver => 'আবার শুরু করুন';

  @override
  String get pdfEditSavedToDownloads =>
      'ডাউনলোডে সংরক্ষিত — আমার ফাইলে খুঁজে পাবেন';

  @override
  String get pdfEditSharedInstead => 'এর বদলে শেয়ার মেনু খোলা হয়েছে';

  @override
  String get pdfEditSaveFailed => 'ফাইল তৈরি করা যায়নি। আবার চেষ্টা করুন।';

  @override
  String get signPdfStepPdf => 'আপনার PDF বেছে নিন';

  @override
  String get signPdfStepSignature => 'আপনার স্বাক্ষর তৈরি করুন';

  @override
  String get signPdfStepPlace => 'স্বাক্ষর বসাতে একটি পৃষ্ঠায় ট্যাপ করুন';

  @override
  String get signPdfDraw => 'স্বাক্ষর আঁকুন';

  @override
  String get signPdfDrawAgain => 'আবার আঁকুন';

  @override
  String get signPdfUseSaved => 'সংরক্ষিত স্বাক্ষর ব্যবহার করুন';

  @override
  String get signPdfDeleteSaved => 'সংরক্ষিত স্বাক্ষর মুছুন';

  @override
  String get signPdfSavedDeleted => 'সংরক্ষিত স্বাক্ষর মুছে ফেলা হয়েছে';

  @override
  String get signPdfDrawTitle => 'আপনার স্বাক্ষর আঁকুন';

  @override
  String get signPdfDrawHint => 'আঙুল দিয়ে এখানে স্বাক্ষর করুন';

  @override
  String get signPdfUndo => 'পূর্বাবস্থায় ফেরান';

  @override
  String get signPdfInkBlack => 'কালো';

  @override
  String get signPdfInkBlue => 'নীল';

  @override
  String get signPdfRemember => 'পরের বারের জন্য স্বাক্ষর সংরক্ষণ করুন';

  @override
  String get signPdfDone => 'এই স্বাক্ষর ব্যবহার করুন';

  @override
  String get signPdfEmpty => 'আগে আপনার স্বাক্ষর আঁকুন।';

  @override
  String get signPdfSignatureLabel => 'আপনার স্বাক্ষর';

  @override
  String get signPdfPlaceHint =>
      'সরাতে টেনে আনুন, আকার বদলাতে দুই আঙুল বা স্লাইডার ব্যবহার করুন। পৃষ্ঠায় ট্যাপ করলে স্বাক্ষর সেখানে যাবে।';

  @override
  String get signPdfSize => 'আকার';

  @override
  String get signPdfPlaceConfirm => 'এখানে বসান';

  @override
  String get signPdfRemoveFromPage => 'এই পৃষ্ঠা থেকে সরান';

  @override
  String get signPdfAllPages => 'সব পৃষ্ঠায় যোগ করুন';

  @override
  String signPdfAllPagesDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'সব $countটি পৃষ্ঠায় স্বাক্ষর যোগ হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String get signPdfClearAll => 'সব সরান';

  @override
  String signPdfPlacedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি পৃষ্ঠায় স্বাক্ষর করা হয়েছে',
      zero: 'এখনও কোনো পৃষ্ঠায় স্বাক্ষর হয়নি',
    );
    return '$_temp0';
  }

  @override
  String get signPdfSave => 'স্বাক্ষরিত PDF সংরক্ষণ করুন';

  @override
  String get signPdfNoPlacement => 'আগে একটি পৃষ্ঠায় ট্যাপ করে স্বাক্ষর বসান।';

  @override
  String get signPdfFailed => 'এই PDF-এ স্বাক্ষর করা যায়নি।';

  @override
  String get signPdfResult => 'আপনার স্বাক্ষরিত PDF তৈরি';

  @override
  String get watermarkPdfModeText => 'লেখার জলছাপ';

  @override
  String get watermarkPdfModeNumbers => 'পৃষ্ঠা নম্বর';

  @override
  String get watermarkPdfText => 'জলছাপের লেখা';

  @override
  String get watermarkPdfDefaultText => 'গোপনীয়';

  @override
  String get watermarkPdfTextEmpty => 'আগে জলছাপের লেখা লিখুন।';

  @override
  String get watermarkPdfSize => 'লেখার আকার';

  @override
  String get watermarkPdfOpacity => 'অস্বচ্ছতা';

  @override
  String get watermarkPdfLayout => 'বিন্যাস';

  @override
  String get watermarkPdfDiagonal => 'কোণাকুণি';

  @override
  String get watermarkPdfCenter => 'মাঝখানে';

  @override
  String get watermarkPdfTiled => 'বারবার';

  @override
  String get watermarkPdfColor => 'রং';

  @override
  String get watermarkPdfColorGrey => 'ধূসর';

  @override
  String get watermarkPdfColorRed => 'লাল';

  @override
  String get watermarkPdfColorBlue => 'নীল';

  @override
  String get watermarkPdfColorBlack => 'কালো';

  @override
  String get watermarkPdfColorGreen => 'সবুজ';

  @override
  String get watermarkPdfFormat => 'ধরন';

  @override
  String watermarkPdfPageLabel(String number) {
    return 'পৃষ্ঠা $number';
  }

  @override
  String get watermarkPdfPosition => 'অবস্থান';

  @override
  String get watermarkPdfBottomCenter => 'নিচে মাঝখানে';

  @override
  String get watermarkPdfBottomRight => 'নিচে ডানে';

  @override
  String get watermarkPdfTopRight => 'উপরে ডানে';

  @override
  String get watermarkPdfStartAt => 'শুরু নম্বর';

  @override
  String get watermarkPdfDecrease => 'কমান';

  @override
  String get watermarkPdfIncrease => 'বাড়ান';

  @override
  String get watermarkPdfPreview => 'প্রিভিউ (পৃষ্ঠা ১)';

  @override
  String get watermarkPdfApplyText => 'জলছাপ যোগ করুন';

  @override
  String get watermarkPdfApplyNumbers => 'পৃষ্ঠা নম্বর যোগ করুন';

  @override
  String get watermarkPdfFailed => 'এই PDF আপডেট করা যায়নি।';

  @override
  String get bgRemoverPickTitle => 'একটি ছবি বেছে নিন';

  @override
  String get bgRemoverPickBody =>
      'মানুষ, পোষা প্রাণী ও জিনিসের ছবিতে সবচেয়ে ভালো কাজ করে। ছবিটি আপনার ফোনেই প্রসেস হয়।';

  @override
  String get bgRemoverGallery => 'গ্যালারি থেকে বেছে নিন';

  @override
  String get bgRemoverCamera => 'ছবি তুলুন';

  @override
  String get bgRemoverPreparing => 'ছবি প্রস্তুত হচ্ছে…';

  @override
  String get bgRemoverWorking => 'ব্যাকগ্রাউন্ড সরানো হচ্ছে…';

  @override
  String get bgRemoverDownloading =>
      'ব্যাকগ্রাউন্ড সরানোর টুল প্রস্তুত হচ্ছে। এটি একবারই হয় এবং ইন্টারনেট লাগে…';

  @override
  String get bgRemoverDownloadFailed =>
      'ব্যাকগ্রাউন্ড সরানোর টুল এখনও প্রস্তুত নয়। Google Play পরিষেবা এখনও এটি ডাউনলোড করছে। ইন্টারনেট সংযোগ দেখে এক মিনিট পরে আবার চেষ্টা করুন।';

  @override
  String get bgRemoverNoSubject =>
      'এই ছবিতে কোনো মানুষ বা জিনিস পাওয়া যায়নি। স্পষ্ট বিষয়সহ একটি ছবি চেষ্টা করুন।';

  @override
  String get bgRemoverOpenFailed =>
      'এই ছবিটি খোলা যায়নি। অন্য একটি চেষ্টা করুন।';

  @override
  String get bgRemoverFailed =>
      'ব্যাকগ্রাউন্ড সরানোর সময় কিছু ভুল হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get bgRemoverRetry => 'আবার চেষ্টা করুন';

  @override
  String get bgRemoverAnotherPhoto => 'অন্য ছবি বেছে নিন';

  @override
  String get bgRemoverNewPhoto => 'নতুন ছবি';

  @override
  String get bgRemoverBefore => 'আগে';

  @override
  String get bgRemoverAfter => 'পরে';

  @override
  String get bgRemoverCompare => 'আগে ও পরে তুলনা করুন';

  @override
  String get bgRemoverCompareHint => 'তুলনা করতে স্লাইডার টানুন';

  @override
  String get bgRemoverBgTransparent => 'স্বচ্ছ';

  @override
  String get bgRemoverBgWhite => 'সাদা';

  @override
  String get bgRemoverBgBlack => 'কালো';

  @override
  String get bgRemoverBgBlue => 'নীল';

  @override
  String get bgRemoverBgRed => 'লাল';

  @override
  String get bgRemoverBgYellow => 'হলুদ';

  @override
  String get bgRemoverBgBlur => 'ঝাপসা';

  @override
  String get bgRemoverSave => 'গ্যালারিতে সেভ করুন';

  @override
  String get bgRemoverSaved => 'আপনার গ্যালারিতে সেভ হয়েছে';

  @override
  String get bgRemoverSaveFailed => 'ছবিটি সেভ করা যায়নি। আবার চেষ্টা করুন।';

  @override
  String get bgRemoverPngHint => 'স্বচ্ছ ব্যাকগ্রাউন্ডসহ PNG';

  @override
  String get bgRemoverJpgHint => 'বেছে নেওয়া ব্যাকগ্রাউন্ডসহ JPG';

  @override
  String get bubbleLevelSurfaceHint => 'ফোনটি পৃষ্ঠের উপর সমান করে রাখুন';

  @override
  String get bubbleLevelUprightHint => 'ফোনের কিনারা পৃষ্ঠে ঠেকিয়ে ধরুন';

  @override
  String get bubbleLevelLevel => 'সমান';

  @override
  String bubbleLevelAngleLabel(String angle) {
    return 'ঢাল $angle ডিগ্রি';
  }

  @override
  String bubbleLevelAxes(String x, String y) {
    return 'ডান–বাম $x° · সামনে–পিছনে $y°';
  }

  @override
  String get bubbleLevelCalibrate => 'ক্যালিব্রেট';

  @override
  String get bubbleLevelReset => 'রিসেট';

  @override
  String get bubbleLevelCalibrateTitle => 'লেভেল ক্যালিব্রেট করবেন?';

  @override
  String get bubbleLevelCalibrateBody =>
      'ফোনটি এমন পৃষ্ঠে রাখুন যা নিশ্চিতভাবে সমান (বা সোজা কিনারায় ঠেকিয়ে ধরুন), তারপর ক্যালিব্রেট চাপুন। বর্তমান অবস্থান 0° দেখাবে।';

  @override
  String get bubbleLevelCalibrated =>
      'ক্যালিব্রেট হয়েছে। এই অবস্থান এখন 0° দেখায়।';

  @override
  String get bubbleLevelResetDone => 'ক্যালিব্রেশন মুছে ফেলা হয়েছে';

  @override
  String get bubbleLevelUnavailable =>
      'এই ফোনে মোশন সেন্সর নেই, তাই লেভেল এখানে কাজ করবে না।';

  @override
  String get flashlightOn => 'আলো চালু';

  @override
  String get flashlightOff => 'আলো বন্ধ';

  @override
  String get flashlightTurnOn => 'আলো চালু করুন';

  @override
  String get flashlightTurnOff => 'আলো বন্ধ করুন';

  @override
  String get flashlightModeSteady => 'স্থির';

  @override
  String get flashlightModeSos => 'SOS';

  @override
  String get flashlightModeStrobe => 'স্ট্রোব';

  @override
  String get flashlightSosHint => 'বিপদ সংকেত ··· ––– ··· বারবার জ্বলে-নেভে';

  @override
  String flashlightStrobeSpeed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'প্রতি সেকেন্ডে $countটি ফ্ল্যাশ',
    );
    return '$_temp0';
  }

  @override
  String get flashlightUseScreen => 'স্ক্রিনের আলো ব্যবহার করুন';

  @override
  String get flashlightUseScreenHint => 'ফ্ল্যাশের বদলে স্ক্রিন জ্বালান';

  @override
  String get flashlightNoTorch =>
      'এই ফোনে কোনো ফ্ল্যাশ নেই, তাই এর বদলে স্ক্রিন জ্বলবে।';

  @override
  String get flashlightTorchBusy =>
      'ফ্ল্যাশ ব্যস্ত (হয়তো অন্য অ্যাপ ক্যামেরা ব্যবহার করছে), তাই এর বদলে স্ক্রিন জ্বলবে।';

  @override
  String get flashlightScreenColor => 'স্ক্রিন আলোর রং';

  @override
  String get flashlightColorWhite => 'সাদা';

  @override
  String get flashlightColorWarm => 'উষ্ণ সাদা';

  @override
  String get flashlightColorRed => 'লাল';

  @override
  String get flashlightColorGreen => 'সবুজ';

  @override
  String get flashlightColorBlue => 'নীল';

  @override
  String get flashlightTapToTurnOff => 'বন্ধ করতে যেকোনো জায়গায় ট্যাপ করুন';

  @override
  String get stopwatchTabStopwatch => 'স্টপওয়াচ';

  @override
  String get stopwatchTabTimer => 'টাইমার';

  @override
  String get stopwatchStart => 'শুরু';

  @override
  String get stopwatchPause => 'বিরতি';

  @override
  String get stopwatchResume => 'আবার চালু';

  @override
  String get stopwatchLap => 'ল্যাপ';

  @override
  String get stopwatchReset => 'রিসেট';

  @override
  String stopwatchLapNumber(int number) {
    return 'ল্যাপ $number';
  }

  @override
  String stopwatchCurrentLap(int number, String time) {
    return 'ল্যাপ $number: $time';
  }

  @override
  String get stopwatchBest => 'সবচেয়ে দ্রুত';

  @override
  String get stopwatchWorst => 'সবচেয়ে ধীর';

  @override
  String get stopwatchNoLaps =>
      'স্টপওয়াচ চলার সময় ল্যাপ চাপুন, ল্যাপের সময় সেভ হবে।';

  @override
  String get stopwatchTimerQuickStart => 'দ্রুত শুরু';

  @override
  String stopwatchTimerMinutes(int minutes) {
    return '$minutes মিনিট';
  }

  @override
  String get stopwatchTimerCustom => 'নিজের সময় দিন';

  @override
  String get stopwatchTimerPickTitle => 'টাইমার সেট করুন';

  @override
  String get stopwatchTimerHours => 'ঘণ্টা';

  @override
  String get stopwatchTimerMinutesUnit => 'মিনিট';

  @override
  String get stopwatchTimerSeconds => 'সেকেন্ড';

  @override
  String get stopwatchTimerAddMinute => '+1 মিনিট';

  @override
  String get stopwatchTimerPaused => 'বিরতিতে';

  @override
  String stopwatchTimerRemaining(String time) {
    return '$time বাকি';
  }

  @override
  String get stopwatchTimerTimesUp => 'সময় শেষ!';

  @override
  String stopwatchTimerFinishedBody(String duration) {
    return 'আপনার $duration টাইমার শেষ হয়েছে।';
  }

  @override
  String get stopwatchTimerRestart => 'আবার শুরু';

  @override
  String get stopwatchTimerDone => 'ঠিক আছে';

  @override
  String get stopwatchTimerKeepOpen =>
      'এই স্ক্রিনটি খোলা রাখুন: সময় শেষ হলে ফোন কাঁপবে।';

  @override
  String get translateHeroTitle => 'বলুন বা লিখুন, অনুবাদ হবে';

  @override
  String get translateBadgeOnDevice => 'ডিভাইসেই AI';

  @override
  String get translateBadgeOffline => 'অফলাইনে চলে';

  @override
  String get translateFrom => 'উৎস ভাষা';

  @override
  String get translateTo => 'লক্ষ্য ভাষা';

  @override
  String get translateSwap => 'ভাষা অদলবদল করুন';

  @override
  String get translateHint => 'লেখা লিখুন বা বলতে মাইকে ট্যাপ করুন…';

  @override
  String get translateHintListening =>
      'শুনছে… স্বাভাবিকভাবে বলুন, থামাতে মাইকে ট্যাপ করুন';

  @override
  String translateListeningIn(String language) {
    return '$language ভাষায় শুনছে… থামিয়ে অনুবাদ করতে মাইকে ট্যাপ করুন।';
  }

  @override
  String get translateSameLanguage => 'উৎস ও লক্ষ্য ভাষা আলাদা হতে হবে।';

  @override
  String get translateButton => 'অনুবাদ করুন';

  @override
  String get translateTranslating => 'অনুবাদ হচ্ছে…';

  @override
  String get translateStopAndTranslate => 'থামিয়ে অনুবাদ করুন';

  @override
  String get translateDownloadingModel => 'ভাষা মডেল ডাউনলোড হচ্ছে…';

  @override
  String get translateResultLabel => 'অনুবাদ';

  @override
  String get translatePlayAudio => 'অডিও চালান';

  @override
  String get translateGenerating => 'তৈরি হচ্ছে…';

  @override
  String get translateShareAudio => 'অডিও ফাইল শেয়ার করুন';

  @override
  String get translateGenerateAudio => 'অডিও ফাইল তৈরি করুন';

  @override
  String get translateAudioReady =>
      'অডিও ফাইল তৈরি — পাঠাতে বা সেভ করতে শেয়ার করুন।';

  @override
  String get translateMicStop => 'শোনা থামিয়ে অনুবাদ করুন';

  @override
  String get translateMicStart => 'অনুবাদের জন্য বলুন';

  @override
  String get translateMicBlocked =>
      'মাইক্রোফোনের অনুমতি বন্ধ। ভয়েস ইনপুট ব্যবহার করতে সেটিংসে চালু করুন।';

  @override
  String get translateMicNeeded =>
      'ভয়েস ইনপুটের জন্য মাইক্রোফোনের অনুমতি দরকার।';

  @override
  String get translateSpeechUnavailable =>
      'এই ডিভাইসে কথা শনাক্তকরণ উপলব্ধ নয়।';

  @override
  String get translateNoSpeech => 'কিছু শোনা যায়নি। আবার বলার চেষ্টা করুন।';

  @override
  String get translateVoiceFailed =>
      'ভয়েস ইনপুট বন্ধ হয়ে গেছে। আবার চেষ্টা করুন।';

  @override
  String get translateDownloadFailed =>
      'ভাষা মডেল ডাউনলোড করা যায়নি। ইন্টারনেট সংযোগ দেখুন।';

  @override
  String get translateFailed => 'অনুবাদ ব্যর্থ হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get translateAudioFailed => 'এই ডিভাইসে অডিও ফাইল তৈরি করা যায়নি।';

  @override
  String translateLanguageName(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'af': 'আফ্রিকান্স',
      'sq': 'আলবেনীয়',
      'ar': 'আরবি',
      'be': 'বেলারুশীয়',
      'bn': 'বাংলা',
      'bg': 'বুলগেরীয়',
      'ca': 'কাতালান',
      'zh': 'চীনা (সরলীকৃত)',
      'hr': 'ক্রোয়েশীয়',
      'cs': 'চেক',
      'da': 'ডেনিশ',
      'nl': 'ডাচ',
      'en': 'ইংরেজি',
      'eo': 'এস্পেরান্তো',
      'et': 'এস্তোনীয়',
      'fi': 'ফিনিশ',
      'fr': 'ফরাসি',
      'gl': 'গ্যালিশীয়',
      'ka': 'জর্জিয়ান',
      'de': 'জার্মান',
      'el': 'গ্রিক',
      'gu': 'গুজরাটি',
      'ht': 'হাইতিয়ান ক্রেওল',
      'he': 'হিব্রু',
      'hi': 'হিন্দি',
      'hu': 'হাঙ্গেরীয়',
      'is': 'আইসল্যান্ডীয়',
      'id': 'ইন্দোনেশীয়',
      'ga': 'আইরিশ',
      'it': 'ইতালীয়',
      'ja': 'জাপানি',
      'kn': 'কন্নড়',
      'ko': 'কোরিয়ান',
      'lv': 'লাটভীয়',
      'lt': 'লিথুয়ানীয়',
      'mk': 'ম্যাসেডোনীয়',
      'ms': 'মালয়',
      'mt': 'মাল্টিজ',
      'mr': 'মারাঠি',
      'no': 'নরওয়েজীয়',
      'fa': 'ফারসি',
      'pl': 'পোলিশ',
      'pt': 'পর্তুগিজ',
      'ro': 'রোমানীয়',
      'ru': 'রুশ',
      'sk': 'স্লোভাক',
      'sl': 'স্লোভেনীয়',
      'es': 'স্প্যানিশ',
      'sw': 'সোয়াহিলি',
      'sv': 'সুইডিশ',
      'tl': 'তাগালগ (ফিলিপিনো)',
      'ta': 'তামিল',
      'te': 'তেলুগু',
      'th': 'থাই',
      'tr': 'তুর্কি',
      'uk': 'ইউক্রেনীয়',
      'ur': 'উর্দু',
      'vi': 'ভিয়েতনামী',
      'cy': 'ওয়েলশ',
      'other': '$code',
    });
    return '$_temp0';
  }

  @override
  String get textUtilMode => 'মোড';

  @override
  String get textUtilModeText => 'টেক্সট';

  @override
  String get textUtilHint => 'এখানে লেখা লিখুন…';

  @override
  String get textUtilHintBase64 => 'রূপান্তরের জন্য টেক্সট বা Base64 লিখুন…';

  @override
  String textUtilWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'শব্দ',
    );
    return '$_temp0';
  }

  @override
  String textUtilCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'অক্ষর',
    );
    return '$_temp0';
  }

  @override
  String get textUtilNoSpaces => 'স্পেস ছাড়া';

  @override
  String get textUtilUpper => 'বড় হাতের অক্ষর';

  @override
  String get textUtilLower => 'ছোট হাতের অক্ষর';

  @override
  String get textUtilTitle => 'প্রতি শব্দের প্রথম অক্ষর বড়';

  @override
  String get textUtilSentence => 'বাক্যের প্রথম অক্ষর বড়';

  @override
  String get textUtilEncode => 'এনকোড';

  @override
  String get textUtilDecode => 'ডিকোড';

  @override
  String get textUtilOutput => 'আউটপুট';

  @override
  String get textUtilInvalidBase64 => 'এটি বৈধ Base64 নয়।';

  @override
  String get clipEmptyClipboard => 'ক্লিপবোর্ড খালি বা এতে কোনো লেখা নেই।';

  @override
  String clipSaved(String text) {
    return 'সেভ হয়েছে: $text';
  }

  @override
  String get clipAddManualTitle => 'নিজে লেখা যোগ করুন';

  @override
  String get clipAddHint => 'এখানে লিখুন বা পেস্ট করুন…';

  @override
  String get clipClearUnpinned => 'আনপিন করা মুছুন';

  @override
  String get clipClearHistoryTitle => 'ইতিহাস মুছবেন?';

  @override
  String get clipClearHistoryBody =>
      'সব আনপিন করা আইটেম মুছবেন? পিন করা আইটেম থেকে যাবে।';

  @override
  String get clipSearchHint => 'ক্লিপ খুঁজুন…';

  @override
  String get clipFilterAll => 'সব';

  @override
  String get clipFilterPinned => 'পিন করা';

  @override
  String get clipFilterLinks => 'লিংক';

  @override
  String get clipFilterText => 'টেক্সট';

  @override
  String get clipFilterCode => 'কোড';

  @override
  String clipSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countStringটি সেভ করা',
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
      other: '$countStringটি পিন করা',
    );
    return '$_temp0';
  }

  @override
  String get clipAddText => 'লেখা যোগ করুন';

  @override
  String get clipLabel => 'লেবেল';

  @override
  String get clipAddLabelTitle => 'লেবেল যোগ করুন';

  @override
  String get clipLabelHint => 'যেমন: অফিসের ইমেইল';

  @override
  String get clipEmptyTitle => 'এখনো কোনো ক্লিপ নেই';

  @override
  String get clipEmptyMessage =>
      'ফোনে যেকোনো লেখা কপি করুন, তারপর এখানে স্থায়ীভাবে সেভ করতে পেস্ট-এ ট্যাপ করুন।';

  @override
  String get clipPasteFromClipboard => 'ক্লিপবোর্ড থেকে পেস্ট করুন';

  @override
  String get clipTypeLink => 'লিংক';

  @override
  String get clipTypeEmail => 'ইমেইল';

  @override
  String get clipTypePhone => 'ফোন';

  @override
  String get clipTypeCode => 'কোড';

  @override
  String get clipTypeText => 'টেক্সট';

  @override
  String get clipJustNow => 'এইমাত্র';

  @override
  String clipMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count মিনিট আগে',
    );
    return '$_temp0';
  }

  @override
  String clipHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ঘণ্টা আগে',
    );
    return '$_temp0';
  }

  @override
  String clipDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count দিন আগে',
    );
    return '$_temp0';
  }

  @override
  String get clipPin => 'পিন করুন';

  @override
  String get clipUnpin => 'আনপিন করুন';

  @override
  String get calcDivideByZero => 'শূন্য দিয়ে ভাগ করা যায় না';

  @override
  String get calcCheckExpression => 'হিসাবটি দেখে নিন';

  @override
  String get calcCopyResult => 'ফলাফল কপি করুন';

  @override
  String get calcPlus => 'যোগ';

  @override
  String get calcMinus => 'বিয়োগ';

  @override
  String get calcTimes => 'গুণ';

  @override
  String get calcDivide => 'ভাগ';

  @override
  String get calcPercent => 'শতাংশ';

  @override
  String get calcParentheses => 'বন্ধনী';

  @override
  String get calcEquals => 'সমান';

  @override
  String get calcDecimalPoint => 'দশমিক বিন্দু';

  @override
  String get ageTabAge => 'বয়স';

  @override
  String get ageTabBetween => 'দুই তারিখের মধ্যে';

  @override
  String get ageDateOfBirth => 'জন্মতারিখ';

  @override
  String get ageFrom => 'শুরুর তারিখ';

  @override
  String get ageTo => 'শেষ তারিখ';

  @override
  String get ageFutureDate => 'এই তারিখটি ভবিষ্যতের।';

  @override
  String ageYearsUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'বছর',
    );
    return '$_temp0';
  }

  @override
  String ageDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'দিন',
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
      other: '$countString বছর',
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
      other: '$countString মাস',
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
      other: '$countString দিন',
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
      other: '$countString সপ্তাহ',
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
      other: '$countString দিন পর',
    );
    return '$_temp0';
  }

  @override
  String ageList2(String first, String second) {
    return '$first, $second';
  }

  @override
  String ageList3(String first, String second, String third) {
    return '$first, $second, $third';
  }

  @override
  String get ageNextBirthday => 'পরবর্তী জন্মদিন';

  @override
  String get ageBirthdayToday => 'আজ 🎉';

  @override
  String get ageTotalMonths => 'মোট মাস';

  @override
  String get ageTotalWeeks => 'মোট সপ্তাহ';

  @override
  String get ageTotalDays => 'মোট দিন';

  @override
  String get ageWeeksLabel => 'সপ্তাহ';

  @override
  String get ageWeekdays => 'কর্মদিবস (সোম–শুক্র)';

  @override
  String get ageHours => 'ঘণ্টা';

  @override
  String get ageIncludingEnd => 'শেষ দিনসহ';

  @override
  String get unitFrom => 'মূল একক';

  @override
  String get unitTo => 'লক্ষ্য একক';

  @override
  String get unitEnterValue => 'মান লিখুন';

  @override
  String get unitSwap => 'একক অদলবদল করুন';

  @override
  String unitCategoryName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'length': 'দৈর্ঘ্য',
      'weight': 'ওজন',
      'temperature': 'তাপমাত্রা',
      'area': 'ক্ষেত্রফল',
      'volume': 'আয়তন',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String unitName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'millimeter': 'মিলিমিটার',
      'centimeter': 'সেন্টিমিটার',
      'meter': 'মিটার',
      'kilometer': 'কিলোমিটার',
      'inch': 'ইঞ্চি',
      'foot': 'ফুট',
      'mile': 'মাইল',
      'gram': 'গ্রাম',
      'kilogram': 'কিলোগ্রাম',
      'ounce': 'আউন্স',
      'pound': 'পাউন্ড',
      'celsius': 'সেলসিয়াস',
      'fahrenheit': 'ফারেনহাইট',
      'kelvin': 'কেলভিন',
      'squareMeter': 'বর্গমিটার',
      'squareFoot': 'বর্গফুট',
      'acre': 'একর',
      'hectare': 'হেক্টর',
      'milliliter': 'মিলিলিটার',
      'liter': 'লিটার',
      'gallonUs': 'গ্যালন (মার্কিন)',
      'fluidOunce': 'তরল আউন্স',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String get loanAmount => 'ঋণের পরিমাণ';

  @override
  String get loanInterestRate => 'বার্ষিক সুদের হার';

  @override
  String get loanTenure => 'মেয়াদ';

  @override
  String get loanTenureMonths => 'মেয়াদ (মাস)';

  @override
  String get loanTenureYears => 'মেয়াদ (বছর)';

  @override
  String get loanToggleMonths => 'মাস';

  @override
  String get loanToggleYears => 'বছর';

  @override
  String get loanEmpty => 'মাসিক কিস্তি হিসাব করতে উপরে সঠিক ঋণের তথ্য দিন';

  @override
  String get loanMonthlyEmi => 'মাসিক কিস্তি (EMI)';

  @override
  String get loanPrincipal => 'আসল';

  @override
  String get loanTotalInterest => 'মোট সুদ';

  @override
  String get loanTotalPayment => 'মোট পরিশোধ';

  @override
  String get loanBreakdown => 'বিভাজন';

  @override
  String get loanInterest => 'সুদ';

  @override
  String loanInterestShare(String percent) {
    return '$percent সুদ';
  }

  @override
  String get loanSchedule => 'কিস্তির তালিকা';

  @override
  String loanMonths(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString মাস',
    );
    return '$_temp0';
  }

  @override
  String get loanColMonth => 'মাস';

  @override
  String get loanColBalance => 'বাকি';

  @override
  String get loanShowAll => 'সব মাস দেখুন';

  @override
  String get loanShowLess => 'কম দেখুন';

  @override
  String get clockSearchHint => 'শহর বা দেশ খুঁজুন…';

  @override
  String get clockPinned => 'পিন করা';

  @override
  String get clockAllCities => 'সব শহর';

  @override
  String clockOnWidget(int shown, int total) {
    final intl.NumberFormat shownNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String shownString = shownNumberFormat.format(shown);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'উইজেটে: $totalStringটির মধ্যে $shownStringটি';
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

    return 'উইজেটে: সর্বোচ্চ $maxStringটির মধ্যে $shownStringটি (আরও দেখতে আকার বাড়ান)';
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

    return 'হোম স্ক্রিন উইজেট শুরুতে প্রথম $defaultRowsStringটি দেখায় — নিচের কিনারা টেনে বড় করলে সর্বোচ্চ $maxRowsStringটি দেখা যাবে।';
  }

  @override
  String get clockPin => 'পিন করুন';

  @override
  String get clockUnpin => 'আনপিন করুন';

  @override
  String get clockNoResults => 'মিলে যায় এমন কোনো শহর নেই';

  @override
  String get speedSelectingServer => 'সার্ভার বেছে নেওয়া হচ্ছে…';

  @override
  String get speedPhasePing => 'পিং মাপা হচ্ছে';

  @override
  String get speedPhaseDownload => 'ডাউনলোড স্পিড পরীক্ষা করা হচ্ছে';

  @override
  String get speedPhaseUpload => 'আপলোড স্পিড পরীক্ষা করা হচ্ছে';

  @override
  String get speedDownloadSpeed => 'ডাউনলোড স্পিড';

  @override
  String get speedUploadSpeed => 'আপলোড স্পিড';

  @override
  String get speedRunAgain => 'আবার';

  @override
  String get speedGo => 'শুরু';

  @override
  String speedMeasuredVia(String server) {
    return '$server-এর মাধ্যমে মাপা হয়েছে';
  }

  @override
  String get speedPoweredBy => 'Cloudflare-এর স্পিড টেস্ট সার্ভার ব্যবহার করে';

  @override
  String get speedIdleHint =>
      'পিং, ডাউনলোড ও আপলোড স্পিড মাপতে বোতামে ট্যাপ করুন।';

  @override
  String get speedPing => 'পিং';

  @override
  String get speedResultsTitle => 'স্পিড টেস্টের ফলাফল';

  @override
  String get speedDownload => 'ডাউনলোড';

  @override
  String get speedUpload => 'আপলোড';

  @override
  String speedConnectedIp(String ip) {
    return 'আপনার IP: $ip';
  }

  @override
  String get speedErrorOffline =>
      'ইন্টারনেট সংযোগ নেই। আপনার Wi-Fi বা মোবাইল ডেটা দেখুন।';

  @override
  String get speedErrorTimeout =>
      'পরীক্ষার সময় শেষ হয়ে গেছে। আপনার সংযোগ অস্থির হতে পারে।';

  @override
  String get speedErrorFailed => 'পরীক্ষা ব্যর্থ হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get pingErrorHostNotFound =>
      'হোস্ট পাওয়া যায়নি। ঠিকানা ও ইন্টারনেট সংযোগ দেখুন।';

  @override
  String get pingErrorNoData => 'এই ঠিকানার কোনো তথ্য নেই।';

  @override
  String get pingTabMyIp => 'আমার IP';

  @override
  String get pingTabLookup => 'খুঁজুন';

  @override
  String get pingTabPing => 'পিং';

  @override
  String get pingYourPublicIp => 'আপনার পাবলিক IP';

  @override
  String get pingFieldCity => 'শহর';

  @override
  String get pingFieldRegion => 'অঞ্চল';

  @override
  String get pingFieldCountry => 'দেশ';

  @override
  String get pingFieldIsp => 'ISP / প্রতিষ্ঠান';

  @override
  String get pingFieldTimezone => 'টাইম জোন';

  @override
  String get pingFieldLocation => 'স্থানাঙ্ক';

  @override
  String get pingFieldIp => 'IP ঠিকানা';

  @override
  String get pingIpCopied => 'IP ঠিকানা কপি হয়েছে';

  @override
  String get pingCopyIp => 'IP কপি করুন';

  @override
  String get pingLookupHint => 'IP ঠিকানা বা হোস্টনেম';

  @override
  String get pingLookupButton => 'খুঁজুন';

  @override
  String get pingHostHint => 'হোস্টনেম (যেমন google.com)';

  @override
  String get pingStartButton => 'পিং করুন';

  @override
  String pingHeader(String host, String ip) {
    return '$host ($ip) – TCP পোর্ট 443 দিয়ে পিং';
  }

  @override
  String get pingStatAvg => 'গড়';

  @override
  String get pingStatLoss => 'লস';

  @override
  String get pingStatSent => 'পাঠানো';

  @override
  String get pingTimeout => 'টাইমআউট';

  @override
  String get compassN => 'উ';

  @override
  String get compassNE => 'উপূ';

  @override
  String get compassE => 'পূ';

  @override
  String get compassSE => 'দপূ';

  @override
  String get compassS => 'দ';

  @override
  String get compassSW => 'দপ';

  @override
  String get compassW => 'প';

  @override
  String get compassNW => 'উপ';

  @override
  String get compassNorth => 'উত্তর';

  @override
  String get compassNortheast => 'উত্তর-পূর্ব';

  @override
  String get compassEast => 'পূর্ব';

  @override
  String get compassSoutheast => 'দক্ষিণ-পূর্ব';

  @override
  String get compassSouth => 'দক্ষিণ';

  @override
  String get compassSouthwest => 'দক্ষিণ-পশ্চিম';

  @override
  String get compassWest => 'পশ্চিম';

  @override
  String get compassNorthwest => 'উত্তর-পশ্চিম';

  @override
  String compassSemantics(String degrees, String direction) {
    return 'দিক $degrees°, $direction';
  }

  @override
  String get compassHeadingMagnetic => 'চৌম্বকীয় দিক';

  @override
  String get compassUnavailable =>
      'এই ডিভাইসে ম্যাগনেটোমিটার নেই, তাই কম্পাস কাজ করবে না।';

  @override
  String get locationSavedHeader => 'সংরক্ষিত লোকেশন';

  @override
  String locationSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countStringটি সংরক্ষিত',
      zero: 'এখনও নেই',
    );
    return '$_temp0';
  }

  @override
  String locationEmpty(String save) {
    return 'এখনও কোনো লোকেশন সংরক্ষিত নেই।\nএখনকার জায়গাটি রাখতে “$save” চাপুন।';
  }

  @override
  String locationDeleted(String name) {
    return '“$name” মুছে ফেলা হয়েছে';
  }

  @override
  String get locationSaveDialogTitle => 'লোকেশন সেভ করুন';

  @override
  String get locationNameLabel => 'নাম';

  @override
  String get locationNameHint => 'যেমন বাসা, অফিস…';

  @override
  String get locationNoteLabel => 'নোট (ঐচ্ছিক)';

  @override
  String get locationCurrent => 'বর্তমান লোকেশন';

  @override
  String get locationRefresh => 'লোকেশন আপডেট করুন';

  @override
  String get locationLocating => 'আপনার লোকেশন খোঁজা হচ্ছে…';

  @override
  String get locationServicesOff =>
      'লোকেশন বন্ধ আছে। আপনি কোথায় আছেন দেখতে এটি চালু করুন।';

  @override
  String get locationPermissionDenied =>
      'আপনি কোথায় আছেন দেখতে লোকেশন অ্যাক্সেসের অনুমতি দিন।';

  @override
  String get locationPermissionDeniedForever =>
      'লোকেশন অ্যাক্সেস বন্ধ করা আছে। এই টুল ব্যবহার করতে সেটিংসে অনুমতি দিন।';

  @override
  String get locationErrorTimeout =>
      'GPS সিগন্যাল পাওয়া যায়নি। জানালার কাছে বা বাইরে গিয়ে আবার চেষ্টা করুন।';

  @override
  String get locationAllow => 'অনুমতি দিন';

  @override
  String locationAccuracy(String meters) {
    return 'নির্ভুলতা: ±$meters মি.';
  }

  @override
  String get locationCoordsCopied => 'স্থানাঙ্ক কপি হয়েছে';

  @override
  String get locationCopyCoords => 'স্থানাঙ্ক কপি করুন';

  @override
  String get locationOpenInMaps => 'ম্যাপে খুলুন';

  @override
  String get passwordYours => 'আপনার পাসওয়ার্ড';

  @override
  String get passwordSelectType => 'অন্তত এক ধরনের অক্ষর বেছে নিন';

  @override
  String get passwordStrength => 'শক্তি';

  @override
  String get passwordWeak => 'দুর্বল';

  @override
  String get passwordFair => 'মাঝারি';

  @override
  String get passwordGood => 'ভালো';

  @override
  String get passwordStrong => 'শক্তিশালী';

  @override
  String get passwordLength => 'দৈর্ঘ্য';

  @override
  String passwordChars(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countStringটি অক্ষর',
    );
    return '$_temp0';
  }

  @override
  String get passwordInclude => 'অন্তর্ভুক্ত করুন';

  @override
  String get passwordUppercase => 'বড় হাতের অক্ষর';

  @override
  String get passwordLowercase => 'ছোট হাতের অক্ষর';

  @override
  String get passwordNumbers => 'সংখ্যা';

  @override
  String get passwordSymbols => 'চিহ্ন';

  @override
  String get passwordCopied => 'পাসওয়ার্ড কপি হয়েছে';

  @override
  String get passwordGenerate => 'নতুন তৈরি করুন';

  @override
  String get hashModeText => 'টেক্সট';

  @override
  String get hashModeFile => 'ফাইল';

  @override
  String get hashAlgorithm => 'অ্যালগরিদম';

  @override
  String get hashInputHint => 'হ্যাশ করার জন্য টেক্সট লিখুন…';

  @override
  String get hashPickFile => 'ফাইল বেছে নিতে ট্যাপ করুন';

  @override
  String get hashChange => 'বদলান';

  @override
  String get hashHashing => 'হিসাব করা হচ্ছে…';

  @override
  String get hashGenerate => 'হ্যাশ তৈরি করুন';

  @override
  String get hashFileError => 'এই ফাইলটি পড়া যায়নি। অন্য একটি চেষ্টা করুন।';

  @override
  String get hashCopied => 'হ্যাশ কপি হয়েছে';

  @override
  String get hashCopy => 'হ্যাশ কপি করুন';

  @override
  String get colorPickerFormats => 'রঙের ফরম্যাট';

  @override
  String get colorPickerHexLabel => 'HEX রঙ';

  @override
  String get colorPickerHexInvalid => '৬টি হেক্স অঙ্ক দিন (0–9, A–F)';

  @override
  String get colorPickerApply => 'রঙ প্রয়োগ করুন';

  @override
  String colorPickerCopied(String format) {
    return '$format কপি হয়েছে';
  }

  @override
  String get colorPickerPalette => 'দ্রুত প্যালেট';

  @override
  String colorPickerSwatch(String hex) {
    return 'রঙ $hex';
  }

  @override
  String get imgCompressPickHint => 'ছবি বেছে নিতে বা তুলতে ট্যাপ করুন';

  @override
  String imgCompressSupported(String formats) {
    return '$formats সমর্থিত';
  }

  @override
  String get imgCompressChange => 'ছবি বদলান';

  @override
  String get imgCompressModeQuality => 'মান অনুযায়ী';

  @override
  String get imgCompressModeTarget => 'নির্দিষ্ট সাইজ';

  @override
  String get imgCompressQuality => 'মান';

  @override
  String get imgCompressSmallest => 'সবচেয়ে ছোট ফাইল';

  @override
  String get imgCompressBestQuality => 'সেরা মান';

  @override
  String get imgCompressQualityNote =>
      'বড় ছবির সাইজও প্রায় 1920×1080-এ কমানো হয়।';

  @override
  String imgCompressTargetUnder(String size) {
    return '$size-এর কম';
  }

  @override
  String get imgCompressTargetHint =>
      'সীমার মধ্যে সেরা মান বজায় রাখে — চাকরি ও সরকারি ফর্মে ছবি আপলোডের জন্য কাজের।';

  @override
  String get imgCompressButton => 'ছবি কমপ্রেস করুন';

  @override
  String get imgCompressCompressing => 'কমপ্রেস হচ্ছে…';

  @override
  String get imgCompressSuccess => 'সফলভাবে কমপ্রেস হয়েছে!';

  @override
  String imgCompressFitsTarget(String size) {
    return 'হয়ে গেছে — সাইজ $size-এর কম';
  }

  @override
  String imgCompressMissedTarget(String size) {
    return '$size-এর নিচে নামানো যায়নি। এটিই আমাদের বানানো সবচেয়ে ছোট সংস্করণ।';
  }

  @override
  String get imgCompressStatOriginal => 'মূল';

  @override
  String get imgCompressStatCompressed => 'কমপ্রেসড';

  @override
  String get imgCompressStatSaved => 'সাশ্রয়';

  @override
  String get imgCompressFailed =>
      'এই ছবিটি কমপ্রেস করা যায়নি। অন্য একটি চেষ্টা করুন।';

  @override
  String get imgResizePresetPassport => 'পাসপোর্ট 35×45 mm';

  @override
  String imgResizePresetSquare(String size) {
    return 'বর্গাকার $size';
  }

  @override
  String imgResizePresetStory(String size) {
    return 'স্টোরি $size';
  }

  @override
  String imgResizePresetMax(String name, String px) {
    return '$name (সর্বোচ্চ $px)';
  }

  @override
  String get imgResizeChoosePhotos => 'ছবি বেছে নিন';

  @override
  String imgResizeSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ছবি নির্বাচিত',
      one: '১টি ছবি নির্বাচিত',
    );
    return '$_temp0';
  }

  @override
  String get imgResizePickHint =>
      'এক বা একাধিক বেছে নিন — অথবা অ্যাপে শেয়ার করুন';

  @override
  String get imgResizeChoose => 'বেছে নিন';

  @override
  String get imgResizeChange => 'বদলান';

  @override
  String get imgResizePresets => 'প্রিসেট';

  @override
  String get imgResizeModePercent => 'শতাংশ';

  @override
  String get imgResizeModeMaxSide => 'সর্বোচ্চ দিক';

  @override
  String get imgResizeModeExact => 'নির্দিষ্ট';

  @override
  String get imgResizeWidth => 'প্রস্থ (px)';

  @override
  String get imgResizeHeight => 'উচ্চতা (px)';

  @override
  String get imgResizeCrop => 'মানানোর জন্য ক্রপ করুন (টানা ছাড়া)';

  @override
  String get imgResizeFormat => 'ফরম্যাট';

  @override
  String get imgResizeQuality => 'মান';

  @override
  String get imgResizeButton => 'সাইজ বদলান';

  @override
  String imgResizeSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ছবি গ্যালারিতে সেভ করুন',
      one: '১টি ছবি গ্যালারিতে সেভ করুন',
    );
    return '$_temp0';
  }

  @override
  String get imgResizeChangeSettings => 'সেটিংস বদলান';

  @override
  String imgResizeInvalidSize(int min, int max) {
    return '$min থেকে $max-এর মধ্যে প্রস্থ ও উচ্চতা দিন।';
  }

  @override
  String imgResizeFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ছবি পড়া যায়নি।',
      one: '১টি ছবি পড়া যায়নি।',
    );
    return '$_temp0';
  }

  @override
  String imgResizeSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ছবি আপনার গ্যালারিতে সেভ হয়েছে',
      one: '১টি ছবি আপনার গ্যালারিতে সেভ হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String get imgEnhanceEmptyTitle => 'আপনার ছবি এডিট করুন';

  @override
  String get imgEnhanceEmptyBody =>
      'উজ্জ্বলতা, কনট্রাস্ট, স্যাচুরেশন ও শার্পনেস ঠিক করুন, প্রিসেট লাগান, ঘোরান ও উল্টান — সবই আপনার ডিভাইসে।';

  @override
  String get imgEnhanceFineControls => 'সূক্ষ্ম নিয়ন্ত্রণ';

  @override
  String get imgEnhanceApplying => 'প্রয়োগ হচ্ছে…';

  @override
  String get imgEnhanceChange => 'বদলান';

  @override
  String get imgEnhancePresets => 'প্রিসেট';

  @override
  String get imgEnhanceTransform => 'রূপান্তর';

  @override
  String get imgEnhanceAdjustments => 'সমন্বয়';

  @override
  String get imgEnhanceRotate => 'ঘোরান';

  @override
  String get imgEnhanceFlipH => 'আনুভূমিক উল্টান';

  @override
  String get imgEnhanceFlipV => 'উল্লম্ব উল্টান';

  @override
  String get imgEnhanceBrightness => 'উজ্জ্বলতা';

  @override
  String get imgEnhanceContrast => 'কনট্রাস্ট';

  @override
  String get imgEnhanceSaturation => 'স্যাচুরেশন';

  @override
  String get imgEnhanceSharpen => 'শার্পেন';

  @override
  String get imgEnhanceBlur => 'ব্লার';

  @override
  String get imgEnhanceQuality => 'মান';

  @override
  String get imgEnhanceApply => 'প্রয়োগ';

  @override
  String get imgEnhanceFailed =>
      'এডিট প্রয়োগ করা যায়নি। অন্য একটি ছবি চেষ্টা করুন।';

  @override
  String imgEnhanceResult(String before, String after, String change) {
    return 'হয়ে গেছে! $before → $after ($change)';
  }

  @override
  String get imgEnhancePresetOriginal => 'মূল';

  @override
  String get imgEnhancePresetVivid => 'উজ্জ্বল';

  @override
  String get imgEnhancePresetCool => 'শীতল';

  @override
  String get imgEnhancePresetWarm => 'উষ্ণ';

  @override
  String get imgEnhancePresetDramatic => 'নাটকীয়';

  @override
  String get imgEnhancePresetFade => 'ফিকে';

  @override
  String get imgEnhancePresetVintage => 'ভিনটেজ';

  @override
  String get imgEnhancePresetNoir => 'সাদা-কালো';

  @override
  String get upscalerNewImage => 'নতুন ছবি';

  @override
  String get upscalerIntro =>
      'ডিভাইসে AI দিয়ে ছবি 4× পর্যন্ত বড় করুন। মডেল একবার ডাউনলোডের পর অফলাইনে কাজ করে — মুখের জন্য ঐচ্ছিক ক্লাউড মোড।';

  @override
  String get upscalerBadgeOnDevice => 'ডিভাইসে AI';

  @override
  String get upscalerBadgeOffline => 'অফলাইনে কাজ করে';

  @override
  String get upscalerBadgeUpTo4x => '4× পর্যন্ত বড়';

  @override
  String get upscalerBadgeGpu => 'GPU-তে দ্রুত';

  @override
  String get upscalerBestResults =>
      'সেরা ফল: কম রেজোলিউশনের ছবি, পুরনো স্ক্যান, থাম্বনেইল ও কমপ্রেসড JPEG।';

  @override
  String get upscalerChangeImage => 'ছবি বদলান';

  @override
  String get upscalerTabOriginal => 'মূল';

  @override
  String get upscalerTabUpscaled => 'AI দিয়ে বড়';

  @override
  String get upscalerStageStarting => 'শুরু হচ্ছে…';

  @override
  String get upscalerStageConnecting => 'AI সার্ভারে সংযোগ হচ্ছে…';

  @override
  String get upscalerStageOnDevice => 'এই ডিভাইসে প্রসেস হচ্ছে…';

  @override
  String get upscalerStageCloudUnavailable =>
      'ক্লাউড পাওয়া যাচ্ছে না — এই ডিভাইসে প্রসেস হচ্ছে…';

  @override
  String get upscalerStageUploading => 'ছবি আপলোড হচ্ছে…';

  @override
  String get upscalerStageRestoringFaces =>
      'AI মুখ ও খুঁটিনাটি পুনরুদ্ধার করছে…';

  @override
  String get upscalerStagePreparing => 'ছবি প্রস্তুত হচ্ছে…';

  @override
  String get upscalerStageLoadingModel => 'AI মডেল লোড হচ্ছে…';

  @override
  String get upscalerStageDownloadingModel =>
      'AI মডেল ডাউনলোড হচ্ছে (শুধু একবার)…';

  @override
  String get upscalerStageFallback => 'সাধারণ আপস্কেলিং ব্যবহার হচ্ছে…';

  @override
  String get upscalerStageDecoding => 'ছবি পড়া হচ্ছে…';

  @override
  String upscalerStageResizing(String from, String to) {
    return 'ইনপুটের সাইজ বদলানো হচ্ছে ($from → $to)…';
  }

  @override
  String get upscalerStageDenoising => 'নয়েজ কমানো হচ্ছে…';

  @override
  String upscalerStageUpscaling(String factor) {
    return 'বড় করা হচ্ছে ($factor×)…';
  }

  @override
  String upscalerStageAiTiles(String done, String total) {
    return 'AI দিয়ে বড় করা হচ্ছে… ($done/$total)';
  }

  @override
  String get upscalerStageSharpening => 'শার্প করা হচ্ছে…';

  @override
  String get upscalerStageColour => 'রঙ ঠিক করা হচ্ছে…';

  @override
  String get upscalerStageSaving => 'সেভ হচ্ছে…';

  @override
  String get upscalerStageDone => 'হয়ে গেছে!';

  @override
  String get upscalerLoadingModelHint => 'AI মডেল লোড হচ্ছে (শুধু প্রথমবার)';

  @override
  String get upscalerTime4x => 'ছবির সাইজ অনুযায়ী 4×-এ 15–60 s লাগতে পারে।';

  @override
  String get upscalerTime2x => '2×-এ সাধারণত 5–20 s লাগে।';

  @override
  String upscalerDoneIn(String seconds) {
    return '$seconds s-এ বড় হয়েছে';
  }

  @override
  String get upscalerStatResolution => 'রেজোলিউশন';

  @override
  String get upscalerStatFileSize => 'ফাইল সাইজ';

  @override
  String get upscalerStatScale => 'স্কেল';

  @override
  String get upscalerShareSubject => 'AI দিয়ে বড় করা ছবি';

  @override
  String get upscalerFallbackModelUnavailable =>
      'AI মডেলের একবার ইন্টারনেট দরকার — সাধারণ আপস্কেলিং ব্যবহার করা হয়েছে';

  @override
  String get upscalerFallbackModelFailed =>
      'AI মডেল এই ডিভাইসে চলেনি — সাধারণ আপস্কেলিং ব্যবহার করা হয়েছে';

  @override
  String get upscalerFallbackCloud =>
      'ক্লাউড সার্ভার পাওয়া যায়নি — এই ডিভাইসে প্রসেস করা হয়েছে';

  @override
  String get upscalerSettings => 'AI সেটিংস';

  @override
  String get upscalerFactorLabel => 'বড় করার অনুপাত';

  @override
  String get upscalerFactor2xDesc => 'দ্রুত — বেশিরভাগ ছবির জন্য ভালো';

  @override
  String get upscalerFactor4xDesc => 'সেরা মান — ধীর';

  @override
  String get upscalerOptimiseFor => 'কিসের জন্য উন্নত করবেন';

  @override
  String get upscalerModeAuto => 'অটো';

  @override
  String get upscalerModePhoto => 'ছবি';

  @override
  String get upscalerModeIllustration => 'ইলাস্ট্রেশন';

  @override
  String get upscalerModeFace => 'মুখের খুঁটিনাটি';

  @override
  String get upscalerDenoise => 'আগে নয়েজ কমান';

  @override
  String get upscalerDenoiseTip => 'বড় করার আগে JPEG নয়েজ কমায়';

  @override
  String get upscalerSharpen => 'পরে শার্প করুন';

  @override
  String get upscalerSharpenTip => 'বড় করার পর স্পষ্টতা বাড়ায়';

  @override
  String get upscalerCloudTitle => 'ক্লাউডে মুখ উন্নত করুন';

  @override
  String get upscalerCloudOn =>
      'প্রসেসিংয়ের জন্য আপনার ছবি আমাদের সার্ভারে আপলোড হয়।';

  @override
  String get upscalerCloudOff => 'বন্ধ — ছবি এই ডিভাইসেই থাকে।';

  @override
  String get upscalerCloudDialogTitle => 'ছবি ক্লাউডে পাঠাবেন?';

  @override
  String get upscalerCloudDialogBody =>
      'ক্লাউড মোড আপনার বেছে নেওয়া ছবিটি এনক্রিপ্টেড সংযোগে আমাদের আপস্কেলিং সার্ভারে আপলোড করে, যাতে বড় AI মডেল (GFPGAN + Real-ESRGAN) দিয়ে প্রসেস করা যায়।\n\n• শুধু যে ছবিটি বড় করতে চান সেটিই পাঠানো হয়।\n• ছবিটি মেমরিতে প্রসেস হয় এবং ফল ফেরত দেওয়ার পর রাখা হয় না।\n• এর সঙ্গে কোনো অ্যাকাউন্ট বা ব্যক্তিগত তথ্য পাঠানো হয় না।\n\nআপনি যেকোনো সময় এটি বন্ধ করতে পারেন। ডিভাইস মোড পুরোপুরি অফলাইনে কাজ করে।';

  @override
  String get upscalerCloudKeepLocal => 'ডিভাইসেই রাখুন';

  @override
  String get upscalerCloudEnable => 'ক্লাউড চালু করুন';

  @override
  String get upscalerUpscale => 'AI দিয়ে বড় করুন';

  @override
  String get upscalerUpscaleAgain => 'নতুন সেটিংসে আবার বড় করুন';

  @override
  String get upscalerFailed => 'বড় করা যায়নি';

  @override
  String get upscalerErrorTooLarge =>
      'ছবিটি খুব বড়। ছোট ছবি বা 2× চেষ্টা করুন।';

  @override
  String get upscalerErrorUnreadable =>
      'এই ছবিটি পড়া যায়নি। JPG বা PNG ফাইল ব্যবহার করুন।';

  @override
  String get upscalerErrorNetwork =>
      'নেটওয়ার্ক টাইমআউট। সংযোগ দেখুন বা ক্লাউড মোড বন্ধ করুন।';

  @override
  String get videoPickHint => 'ভিডিও বেছে নিতে ট্যাপ করুন';

  @override
  String videoProbeInfo(String format, String duration) {
    return 'ফরম্যাট: $format · সময়কাল: $duration';
  }

  @override
  String get videoOutputFormat => 'আউটপুট ফরম্যাট';

  @override
  String get videoFmtMostCompatible => 'সবচেয়ে সামঞ্জস্যপূর্ণ';

  @override
  String get videoFmtApple => 'Apple / QuickTime';

  @override
  String get videoFmtFlexible => 'নমনীয় কন্টেইনার';

  @override
  String get videoFmtLegacy => 'পুরনো ফরম্যাট';

  @override
  String get videoFmtGif => 'অ্যানিমেটেড (শব্দ ছাড়া)';

  @override
  String get videoFmtAudioOnly => 'শুধু অডিও';

  @override
  String get videoFmtAudioAac => 'শুধু অডিও (AAC)';

  @override
  String get videoFmtAudioRaw => 'শুধু অডিও (র)';

  @override
  String get videoFmtWav => 'আনকমপ্রেসড অডিও';

  @override
  String videoConvertingPercent(int percent) {
    return 'রূপান্তর হচ্ছে… $percent%';
  }

  @override
  String get videoConvertingWait => 'রূপান্তর হচ্ছে… কিছুটা সময় লাগতে পারে';

  @override
  String get videoDone => 'রূপান্তর সম্পূর্ণ!';

  @override
  String get videoErrorUnsupported =>
      'রূপান্তর ব্যর্থ। এই ফরম্যাট হয়তো আপনার ডিভাইসে সমর্থিত নয়।';

  @override
  String get videoConvertAnother => 'আরেকটি রূপান্তর করুন';

  @override
  String get videoPickButton => 'ভিডিও ফাইল বেছে নিন';

  @override
  String videoConvertTo(String format) {
    return '$format-এ রূপান্তর করুন';
  }

  @override
  String get docScanAndroidOnly =>
      'ডকুমেন্ট স্ক্যানার শুধু Android-এ পাওয়া যায়।';

  @override
  String docScanNeedsPlayServices(String details) {
    return 'স্ক্যানার চালু হয়নি। এর জন্য Google Play পরিষেবা লাগে — সেগুলো আপডেট আছে কিনা দেখুন। ($details)';
  }

  @override
  String get docScanStartFailed => 'স্ক্যানার চালু হয়নি। আবার চেষ্টা করুন।';

  @override
  String get docScanPdfSaved => 'PDF ডাউনলোডসে সেভ হয়েছে — আমার ফাইলে পাবেন';

  @override
  String docScanPagesSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'গ্যালারিতে $countটি পৃষ্ঠা সেভ হয়েছে',
      one: 'গ্যালারিতে ১টি পৃষ্ঠা সেভ হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String get docScanHeadline => 'কাগজ স্ক্যান করে পরিষ্কার PDF বানান';

  @override
  String get docScanIntro =>
      'কিনারা নিজে থেকেই খুঁজে নেয়। যত খুশি পৃষ্ঠা যোগ করুন, সেভের আগে ক্রপ, ঘোরানো ও ফিল্টার দিন।';

  @override
  String get docScanScanning => 'স্ক্যান হচ্ছে…';

  @override
  String get docScanStart => 'স্ক্যান শুরু করুন';

  @override
  String get docScanScannedPages => 'স্ক্যান করা পৃষ্ঠা';

  @override
  String docScanPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি পৃষ্ঠা',
      one: '১টি পৃষ্ঠা',
    );
    return '$_temp0';
  }

  @override
  String get docScanSavePdf => 'PDF সেভ করুন';

  @override
  String get docScanSharePdf => 'PDF শেয়ার করুন';

  @override
  String get docScanCopyText => 'টেক্সট কপি';

  @override
  String get docScanSaveJpg => 'JPG হিসেবে সেভ';

  @override
  String get docScanAnother => 'আরেকটি ডকুমেন্ট স্ক্যান করুন';

  @override
  String get pdfToolsChoosePdf => 'একটি PDF বাছুন';

  @override
  String get pdfToolsChooseHint =>
      'অথবা যেকোনো অ্যাপ থেকে Utility Toolbox-এ PDF শেয়ার করুন';

  @override
  String get pdfToolsReading => 'পড়া হচ্ছে…';

  @override
  String get pdfToolsLockedShort => 'পাসওয়ার্ড দিয়ে সুরক্ষিত';

  @override
  String pdfToolsPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি পৃষ্ঠা',
      one: '১টি পৃষ্ঠা',
    );
    return '$_temp0';
  }

  @override
  String get pdfToolsChange => 'বদলান';

  @override
  String get pdfToolsResultReady => 'আপনার PDF তৈরি';

  @override
  String get pdfToolsSaveDownloads => 'ডাউনলোডসে সেভ করুন';

  @override
  String get pdfToolsStartOver => 'আবার শুরু করুন';

  @override
  String get pdfToolsSavedToDownloads =>
      'ডাউনলোডসে সেভ হয়েছে — আমার ফাইলে পাবেন';

  @override
  String get pdfToolsSharedInstead => 'এর বদলে শেয়ার মেনু খোলা হয়েছে';

  @override
  String get pdfToolsRangeEmpty => 'অন্তত একটি পৃষ্ঠা লিখুন।';

  @override
  String pdfToolsRangeInvalid(String part) {
    return '“$part” কোনো পৃষ্ঠা বা রেঞ্জ নয় (যেমন 1-3, 5)।';
  }

  @override
  String pdfToolsRangeOutside(String part, int count) {
    return '“$part” 1–$count-এর বাইরে।';
  }

  @override
  String get pdfToolsInvalidPdf => 'এই ফাইলটি সঠিক PDF বলে মনে হচ্ছে না।';

  @override
  String pdfToolsLockedUnlockFirst(String tool) {
    return 'এই PDF পাসওয়ার্ড দিয়ে সুরক্ষিত। আগে $tool দিয়ে আনলক করুন।';
  }

  @override
  String pdfToolsPagesLabel(int count) {
    return 'পৃষ্ঠা (1–$count)';
  }

  @override
  String pdfToolsPagesHint(String example) {
    return 'যেমন $example';
  }

  @override
  String pdfToolsPageN(int number) {
    return 'পৃষ্ঠা $number';
  }

  @override
  String get pdfToolsDownload => 'ডাউনলোড';

  @override
  String get pdfToolsSavedNotification =>
      'ডাউনলোডসে সেভ হয়েছে — খুলতে নোটিফিকেশন দেখুন।';

  @override
  String get pdfToolsShareToSave =>
      'শেয়ার মেনু খোলা হয়েছে — ফাইলটি কোথায় সেভ করবেন বাছুন।';

  @override
  String pdfToolsSelectedFile(String name) {
    return 'নির্বাচিত: $name';
  }

  @override
  String pdfToolsSize(String size) {
    return 'আকার: $size';
  }

  @override
  String get pdfToolsDragToReorder => 'ক্রম বদলাতে টেনে আনুন';

  @override
  String get pdfHomeTitle => 'PDF টুলকিট';

  @override
  String get pdfHomeSection => 'PDF টুল';

  @override
  String get pdfHomeSubtitle => 'ডকুমেন্ট তৈরি, একত্র ও উন্নত করুন';

  @override
  String get pdfPasswordEnter => 'একটি পাসওয়ার্ড লিখুন।';

  @override
  String pdfPasswordTooShort(int count) {
    return 'অন্তত $countটি অক্ষর ব্যবহার করুন।';
  }

  @override
  String get pdfPasswordMismatch => 'পাসওয়ার্ড দুটি মিলছে না।';

  @override
  String get pdfPasswordWrong => 'পাসওয়ার্ডটি সঠিক নয়।';

  @override
  String get pdfPasswordLockFailed => 'এই PDF লক করা যায়নি।';

  @override
  String get pdfPasswordUnlockFailed => 'এই PDF আনলক করা যায়নি।';

  @override
  String get pdfPasswordLockedDone => 'আপনার PDF লক হয়েছে';

  @override
  String get pdfPasswordRemovedDone => 'পাসওয়ার্ড সরানো হয়েছে';

  @override
  String get pdfPasswordAlreadyLocked =>
      'এই PDF-এ আগে থেকেই পাসওয়ার্ড আছে। আগে আনলক করুন।';

  @override
  String get pdfPasswordNotLocked =>
      'এই PDF-এ কোনো পাসওয়ার্ড নেই — আনলক করার কিছু নেই।';

  @override
  String get pdfPasswordNew => 'নতুন পাসওয়ার্ড';

  @override
  String get pdfPasswordCurrent => 'বর্তমান পাসওয়ার্ড';

  @override
  String get pdfPasswordRepeat => 'পাসওয়ার্ড আবার লিখুন';

  @override
  String get pdfPasswordShow => 'পাসওয়ার্ড দেখান';

  @override
  String get pdfPasswordHide => 'পাসওয়ার্ড লুকান';

  @override
  String get pdfPasswordWarning =>
      'পাসওয়ার্ডটি নিরাপদে রাখুন — এটি পুনরুদ্ধার করা যায় না। AES-256 দিয়ে এনক্রিপ্ট করা।';

  @override
  String get pdfSplitExtract => 'পৃষ্ঠা বের করুন';

  @override
  String get pdfSplitRemove => 'পৃষ্ঠা সরান';

  @override
  String get pdfSplitPagesHelp =>
      'কমা ও রেঞ্জ ব্যবহার করুন। “8-” মানে ৮ নম্বর পৃষ্ঠা থেকে শেষ পর্যন্ত।';

  @override
  String get pdfSplitRemovesAll => 'এতে সব পৃষ্ঠা মুছে যাবে।';

  @override
  String get pdfSplitFailed => 'এই PDF ভাগ করা যায়নি।';

  @override
  String get pdfToImagesFailed => 'এই PDF রেন্ডার করা যায়নি।';

  @override
  String pdfToImagesSaved(int saved, int total) {
    return '$totalটির মধ্যে $savedটি ছবি গ্যালারিতে সেভ হয়েছে';
  }

  @override
  String get pdfToImagesAllPages => 'সব পৃষ্ঠা';

  @override
  String get pdfToImagesConvert => 'JPG-তে রূপান্তর';

  @override
  String pdfToImagesRendered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি পৃষ্ঠা তৈরি হয়েছে…',
      one: '১টি পৃষ্ঠা তৈরি হয়েছে…',
    );
    return '$_temp0';
  }

  @override
  String pdfToImagesRenderedOf(int count, int total) {
    return '$totalটির মধ্যে $countটি পৃষ্ঠা তৈরি হয়েছে…';
  }

  @override
  String pdfToImagesSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ছবি গ্যালারিতে সেভ করুন',
      one: '১টি ছবি গ্যালারিতে সেভ করুন',
    );
    return '$_temp0';
  }

  @override
  String get pdfCompressButton => 'কমপ্রেস করুন';

  @override
  String get pdfCompressWorking => 'PDF কমপ্রেস হচ্ছে…';

  @override
  String pdfCompressOriginalSize(String size) {
    return 'আসল আকার: $size';
  }

  @override
  String get pdfCompressIntro =>
      'একটি PDF ফাইল বাছুন। ছবি বেশি থাকা ডকুমেন্টে কমপ্রেশন সবচেয়ে ভালো কাজ করে।';

  @override
  String get pdfCompressLow => 'কম';

  @override
  String get pdfCompressMedium => 'মাঝারি';

  @override
  String get pdfCompressHigh => 'বেশি';

  @override
  String get pdfCompressFailed => 'এই PDF কমপ্রেস করা যায়নি।';

  @override
  String pdfCompressBefore(String size) {
    return 'আগে: $size';
  }

  @override
  String pdfCompressAfter(String size) {
    return 'পরে: $size';
  }

  @override
  String get pdfMergeButton => 'একত্র করুন';

  @override
  String get pdfMergeWorking => 'PDF একত্র হচ্ছে…';

  @override
  String get pdfMergePick => 'PDF ফাইল বাছুন';

  @override
  String get pdfMergeIntro => 'একত্র করতে অন্তত দুটি PDF ফাইল বাছুন।';

  @override
  String get pdfMergeFailed =>
      'PDF একত্র করা যায়নি। কোনো একটি ফাইল হয়তো পড়া যাচ্ছে না।';

  @override
  String pdfMergeResult(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'একত্র করা PDF ($countটি পৃষ্ঠা)',
      one: 'একত্র করা PDF (১টি পৃষ্ঠা)',
    );
    return '$_temp0';
  }

  @override
  String get imageToPdfCreate => 'PDF তৈরি করুন';

  @override
  String get imageToPdfWorking => 'PDF তৈরি হচ্ছে…';

  @override
  String get imageToPdfPick => 'ছবি বাছুন';

  @override
  String get imageToPdfIntro => 'রূপান্তর করতে এক বা একাধিক ছবি বাছুন।';

  @override
  String get imageToPdfFailed =>
      'PDF তৈরি করা যায়নি। অন্য ছবি দিয়ে চেষ্টা করুন।';

  @override
  String imageToPdfReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF তৈরি ($countটি পৃষ্ঠা)',
      one: 'PDF তৈরি (১টি পৃষ্ঠা)',
    );
    return '$_temp0';
  }

  @override
  String get qrScanNoCodeInPhoto =>
      'এই ছবিতে কোনো QR কোড বা বারকোড পাওয়া যায়নি।';

  @override
  String get qrScanPhotoFailed => 'এই ছবিটি পড়া যায়নি।';

  @override
  String qrScanResultTitle(String type) {
    return 'স্ক্যান হয়েছে ($type)';
  }

  @override
  String get qrScanFromPhoto => 'ছবি থেকে স্ক্যান';

  @override
  String get qrScanCameraNeeded =>
      'QR কোড ও বারকোড স্ক্যান করতে ক্যামেরার অনুমতি লাগবে।';

  @override
  String get qrScanCameraError =>
      'ক্যামেরা চালু হয়নি। অন্য ক্যামেরা অ্যাপ বন্ধ করে আবার চেষ্টা করুন।';

  @override
  String get qrScanTorchOn => 'ফ্ল্যাশলাইট চালু করুন';

  @override
  String get qrScanTorchOff => 'ফ্ল্যাশলাইট বন্ধ করুন';

  @override
  String get qrScanTypeLink => 'লিংক';

  @override
  String get qrScanTypeWifi => 'ওয়াই-ফাই';

  @override
  String get qrScanTypeContact => 'কন্টাক্ট';

  @override
  String get qrScanTypeText => 'টেক্সট';

  @override
  String get qrGenInputLabel => 'টেক্সট বা URL';

  @override
  String get qrGenInputHint => 'কোডে রাখার লেখা দিন';

  @override
  String get qrGenPreviewLabel => 'QR কোডের প্রিভিউ';

  @override
  String get qrGenEmpty => 'QR কোডের প্রিভিউ দেখতে উপরে টেক্সট লিখুন।';

  @override
  String get qrGenSaveGallery => 'গ্যালারিতে সেভ';

  @override
  String get qrHomeTitle => 'QR ও বারকোড';

  @override
  String get qrHomeTabScan => 'স্ক্যান';

  @override
  String get qrHomeTabCreate => 'তৈরি';

  @override
  String get qrHomeScanTitle => 'একটি কোড স্ক্যান করুন';

  @override
  String get qrHomeScanBody =>
      'তাৎক্ষণিক স্ক্যান করতে ক্যামেরা QR কোড বা বারকোডের দিকে ধরুন।';

  @override
  String get qrHomeBadgeInstant => 'তাৎক্ষণিক';

  @override
  String get qrHomeBadgeHistory => 'সেভ করা ইতিহাস';

  @override
  String get qrHomeStartScan => 'স্ক্যান শুরু করুন';

  @override
  String get qrHomeCreateTitle => 'একটি কোড তৈরি করুন';

  @override
  String get qrHomeCreateBody =>
      'টেক্সট বা URL থেকে QR কোড বানিয়ে সেভ বা শেয়ার করুন।';

  @override
  String get qrHomeBadgeShare => 'যেকোনো জায়গায় শেয়ার';

  @override
  String get qrHomeBadgeImage => 'ছবি হিসেবে সেভ';

  @override
  String get qrHomeOpenGenerator => 'জেনারেটর খুলুন';

  @override
  String get qrHistoryTitle => 'স্ক্যান ইতিহাস';

  @override
  String get qrHistoryMore => 'আরও বিকল্প';

  @override
  String get qrHistoryEmpty => 'স্ক্যান করা কোড এখানে দেখা যাবে।';

  @override
  String get wifiQrPlaceholder => 'QR বানাতে\nওয়াই-ফাইয়ের তথ্য দিন';

  @override
  String get wifiQrPreviewLabel => 'ওয়াই-ফাই QR কোড';

  @override
  String get wifiQrNetworkDetails => 'নেটওয়ার্কের তথ্য';

  @override
  String get wifiQrSsidLabel => 'নেটওয়ার্কের নাম (SSID)';

  @override
  String get wifiQrSsidHint => 'আমার বাসার ওয়াই-ফাই';

  @override
  String get wifiQrPasswordLabel => 'পাসওয়ার্ড';

  @override
  String get wifiQrPasswordHint => 'পাসওয়ার্ড লিখুন';

  @override
  String get wifiQrShowPassword => 'পাসওয়ার্ড দেখান';

  @override
  String get wifiQrHidePassword => 'পাসওয়ার্ড লুকান';

  @override
  String get wifiQrSecurity => 'নিরাপত্তা';

  @override
  String get wifiQrSecurityNone => 'নেই (খোলা)';

  @override
  String get wifiQrHidden => 'লুকানো নেটওয়ার্ক';

  @override
  String get wifiQrHiddenHint => 'নেটওয়ার্কের নাম দেখা না গেলে চালু করুন';

  @override
  String get wifiQrSaveImage => 'ছবি সেভ করুন';

  @override
  String get wifiQrInfo =>
      'এই QR কোড যে স্ক্যান করবে, সে নিজে থেকেই আপনার ওয়াই-ফাইতে যুক্ত হবে।';

  @override
  String get wifiQrShareText =>
      'আমার ওয়াই-ফাইতে যুক্ত হতে এই QR কোড স্ক্যান করুন!';

  @override
  String get ocrCameraDenied =>
      'ক্যামেরার অনুমতি দেওয়া হয়নি। অনুমতি দিতে সেটিংস খুলুন।';

  @override
  String get ocrCameraRequired => 'ছবি তুলতে ক্যামেরার অনুমতি লাগবে।';

  @override
  String get ocrTimeout =>
      'পড়তে অনেক সময় লাগছে — টেক্সট মডেল হয়তো এখনও ডাউনলোড হচ্ছে। একবার ওয়াই-ফাইতে যুক্ত হন বা আবার চেষ্টা করুন।';

  @override
  String get ocrFailed =>
      'এই ছবি থেকে টেক্সট পড়া যায়নি। আরও পরিষ্কার ছবি দিয়ে চেষ্টা করুন।';

  @override
  String get ocrPreparing => 'ছবি প্রস্তুত হচ্ছে…';

  @override
  String get ocrScanning => 'টেক্সট পড়া হচ্ছে…';

  @override
  String get ocrScriptLabel => 'লেখার লিপি';

  @override
  String get ocrScriptHint =>
      'আপনার লেখা যে বর্ণমালায়, সেটি বাছুন। বাংলা, আরবি ও উর্দু এখনও পড়া যায় না।';

  @override
  String get ocrScriptLatin => 'ল্যাটিন (ইংরেজি, স্প্যানিশ…)';

  @override
  String get ocrScriptDevanagari => 'দেবনাগরী (হিন্দি, মারাঠি…)';

  @override
  String get ocrScriptChinese => 'চীনা';

  @override
  String get ocrScriptJapanese => 'জাপানি';

  @override
  String get ocrScriptKorean => 'কোরীয়';

  @override
  String get ocrIdleTitle => 'যেকোনো ছবি থেকে টেক্সট বের করুন';

  @override
  String get ocrIdleBody =>
      'ক্যামেরা ধরুন বা একটি ছবি বাছুন — টেক্সট সঙ্গে সঙ্গে ফোনেই বের হবে।';

  @override
  String get ocrBadgeOnDevice => 'ফোনেই AI';

  @override
  String get ocrBadgeLocal => 'ফোনেই প্রসেস';

  @override
  String get ocrBadgeBlocks => 'ব্লক ধরে কপি';

  @override
  String get ocrUseCamera => 'ক্যামেরা ব্যবহার করুন';

  @override
  String get ocrChooseGallery => 'গ্যালারি থেকে বাছুন';

  @override
  String get ocrOnDeviceNote => 'ফোনেই · আপলোড লাগে না';

  @override
  String get ocrTabImage => 'ছবি';

  @override
  String get ocrTabText => 'টেক্সট';

  @override
  String get ocrTapBlockHint => 'কপি করতে হাইলাইট করা ব্লকে ট্যাপ করুন';

  @override
  String get ocrBlockTitle => 'ব্লকের টেক্সট';

  @override
  String ocrBlockLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি লাইন · কপি করতে ট্যাপ করুন',
      one: '১টি লাইন · কপি করতে ট্যাপ করুন',
    );
    return '$_temp0';
  }

  @override
  String get ocrCopyBlock => 'ব্লক কপি';

  @override
  String get ocrBlockCopied => 'ব্লক কপি হয়েছে';

  @override
  String get ocrCopyEntireBlock => 'পুরো ব্লক কপি করুন';

  @override
  String get ocrCopyLine => 'লাইন কপি';

  @override
  String get ocrNoText => 'কোনো টেক্সট পাওয়া যায়নি — আরও পরিষ্কার ছবি দিন।';

  @override
  String get ocrQuickCopy => 'অংশ ধরে দ্রুত কপি';

  @override
  String ocrBlockNCopied(int number) {
    return '$number নম্বর ব্লক কপি হয়েছে';
  }

  @override
  String get ocrDoneEditing => 'সম্পাদনা শেষ';

  @override
  String get ocrEditText => 'টেক্সট সম্পাদনা';

  @override
  String get ocrAllCopied => 'সব টেক্সট কপি হয়েছে';

  @override
  String get ocrCopyAll => 'সব কপি';

  @override
  String get ocrScanAgain => 'স্ক্যান';

  @override
  String ocrStatLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি লাইন',
      one: '১টি লাইন',
    );
    return '$_temp0';
  }

  @override
  String ocrStatWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি শব্দ',
      one: '১টি শব্দ',
    );
    return '$_temp0';
  }

  @override
  String ocrStatChars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি অক্ষর',
      one: '১টি অক্ষর',
    );
    return '$_temp0';
  }

  @override
  String get wordPdfNoText =>
      'এই ডকুমেন্টে বের করার মতো কোনো টেক্সট পাওয়া যায়নি।';

  @override
  String get wordPdfInfo =>
      '.docx ফাইলকে PDF-এ রূপান্তর করে। টেক্সট ঠিক থাকে; জটিল লেআউট (টেবিল, ছবি) আলাদা দেখাতে পারে।';

  @override
  String get wordPdfOpeningPicker => 'ফাইল বাছাই খোলা হচ্ছে…';

  @override
  String wordPdfConverting(int percent) {
    return 'রূপান্তর হচ্ছে… $percent%';
  }

  @override
  String get wordPdfDone => 'রূপান্তর সম্পন্ন';

  @override
  String get wordPdfTapToPick => 'একটি .docx ফাইল বাছতে ট্যাপ করুন';

  @override
  String get wordPdfSupports => '.docx ফরম্যাট সমর্থিত';

  @override
  String get wordPdfFailed =>
      'রূপান্তর ব্যর্থ। ফাইলটি হয়তো নষ্ট বা .docx ডকুমেন্ট নয়।';

  @override
  String get wordPdfFontsOffline =>
      'এই PDF-এ কিছু টেক্সট (যেমন বাংলা, আরবি, উর্দু, হিন্দি বা সিরিলিক) নেই। এর ফন্ট একবারই ডাউনলোড হয় — ইন্টারনেটে যুক্ত হয়ে আবার রূপান্তর করুন।';

  @override
  String get wordPdfConvertAnother => 'আরেকটি রূপান্তর করুন';

  @override
  String get wordPdfPick => '.docx ফাইল বাছুন';

  @override
  String get wordPdfStep1Title => 'আপনার Word ফাইল বাছুন';

  @override
  String get wordPdfStep1Desc => 'ডিভাইসের স্টোরেজ থেকে একটি .docx ফাইল বাছুন।';

  @override
  String get wordPdfStep2Title => 'স্বয়ংক্রিয় রূপান্তর';

  @override
  String get wordPdfStep2Desc => 'টেক্সট বের করে A4 PDF পৃষ্ঠায় সাজানো হয়।';

  @override
  String get wordPdfStep3Title => 'শেয়ার বা সেভ';

  @override
  String get wordPdfStep3Desc =>
      'PDF যেকোনো অ্যাপ, ইমেইল বা ক্লাউড স্টোরেজে শেয়ার করুন।';

  @override
  String get wordPdfReady => 'PDF তৈরি';
}
