// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Utility Toolbox';

  @override
  String get navTools => 'टूल्स';

  @override
  String get navFiles => 'मेरी फ़ाइलें';

  @override
  String get settingsTooltip => 'सेटिंग्स';

  @override
  String get searchHint => 'खोजें: pdf छोटा करें, स्कैन, jpg…';

  @override
  String get quickActions => 'झटपट काम';

  @override
  String get favorites => 'पसंदीदा';

  @override
  String get recent => 'हाल ही में';

  @override
  String searchNoResults(String query) {
    return '“$query” से कोई टूल नहीं मिला';
  }

  @override
  String get toolMenuAddFavorite => 'पसंदीदा में जोड़ें';

  @override
  String get toolMenuRemoveFavorite => 'पसंदीदा से हटाएं';

  @override
  String get toolMenuPinShortcut => 'होम स्क्रीन पर जोड़ें';

  @override
  String get pinShortcutRequested =>
      'होम स्क्रीन पर शॉर्टकट जोड़ने के लिए पुष्टि करें';

  @override
  String get pinShortcutUnsupported =>
      'आपका होम स्क्रीन ऐप शॉर्टकट सपोर्ट नहीं करता';

  @override
  String get newBadge => 'नया';

  @override
  String get catScan => 'स्कैन और QR';

  @override
  String get catPdf => 'PDF';

  @override
  String get catImage => 'फ़ोटो और इमेज';

  @override
  String get catText => 'टेक्स्ट और अनुवाद';

  @override
  String get catCalc => 'कैलकुलेट और कन्वर्ट';

  @override
  String get catNetwork => 'इंटरनेट';

  @override
  String get catDevice => 'डिवाइस और लोकेशन';

  @override
  String get catSecurity => 'सुरक्षा';

  @override
  String get catMedia => 'वीडियो और ऑडियो';

  @override
  String get toolDocScannerTitle => 'डॉक्यूमेंट स्कैनर';

  @override
  String get toolDocScannerDesc => 'कागज़ स्कैन करके PDF बनाएं';

  @override
  String get toolDocScannerKeywords =>
      'scan paper, camscanner, document, pdf scanner, receipt, स्कैनर, डॉक्यूमेंट स्कैन, दस्तावेज़, कागज़ स्कैन, रसीद, pdf स्कैनर, scanner app, document scan karna';

  @override
  String get toolQrScannerTitle => 'QR और बारकोड स्कैन';

  @override
  String get toolQrScannerDesc => 'कैमरा या फ़ोटो से';

  @override
  String get toolQrScannerKeywords =>
      'qr reader, barcode, scan code, क्यूआर कोड, QR स्कैनर, बारकोड स्कैनर, कोड स्कैन, qr code scan karna, qr scanner';

  @override
  String get toolQrGeneratorTitle => 'QR कोड बनाएं';

  @override
  String get toolQrGeneratorDesc => 'लिंक, टेक्स्ट, कॉन्टैक्ट और भी';

  @override
  String get toolQrGeneratorKeywords =>
      'qr maker, generate qr, barcode generator, QR कोड बनाएं, क्यूआर बनाना, qr code banaye, qr generator';

  @override
  String get toolOcrTitle => 'फ़ोटो से टेक्स्ट';

  @override
  String get toolOcrDesc => 'किसी भी फ़ोटो से टेक्स्ट कॉपी करें (OCR)';

  @override
  String get toolOcrKeywords =>
      'ocr, text scanner, extract text, copy text from image, फ़ोटो से टेक्स्ट, इमेज से टेक्स्ट, लिखावट कॉपी, photo se text, image to text';

  @override
  String get toolWifiQrTitle => 'WiFi QR कोड';

  @override
  String get toolWifiQrDesc => 'बिना पासवर्ड टाइप किए WiFi शेयर करें';

  @override
  String get toolWifiQrKeywords =>
      'wifi password, share wifi, वाईफाई पासवर्ड, वाईफाई शेयर, wifi password dekhe, wifi qr';

  @override
  String get toolImageToPdfTitle => 'फ़ोटो से PDF';

  @override
  String get toolImageToPdfDesc => 'फ़ोटो को एक PDF में बदलें';

  @override
  String get toolImageToPdfKeywords =>
      'jpg to pdf, photo to pdf, picture to pdf, फ़ोटो से pdf, फोटो को pdf बनाएं, image to pdf, photo ko pdf kaise banaye';

  @override
  String get toolMergePdfTitle => 'PDF जोड़ें';

  @override
  String get toolMergePdfDesc => 'कई PDF को एक में मिलाएं';

  @override
  String get toolMergePdfKeywords =>
      'join pdf, combine pdf, merge pdf, pdf जोड़ना, pdf मिलाएं, pdf jodna';

  @override
  String get toolCompressPdfTitle => 'PDF छोटा करें';

  @override
  String get toolCompressPdfDesc => 'भेजने के लिए PDF का साइज़ घटाएं';

  @override
  String get toolCompressPdfKeywords =>
      'reduce pdf size, shrink pdf, compress pdf, pdf साइज़ कम, pdf छोटा करें, pdf size kam kare, pdf kb kam';

  @override
  String get toolSplitPdfTitle => 'PDF अलग करें';

  @override
  String get toolSplitPdfDesc => 'पेज निकालें या हटाएं';

  @override
  String get toolSplitPdfKeywords =>
      'extract pages, delete pages, cut pdf, split pdf, pdf पेज अलग, pdf पेज हटाएं, pdf page alag kare';

  @override
  String get toolPdfToImagesTitle => 'PDF से JPG';

  @override
  String get toolPdfToImagesDesc => 'हर पेज को इमेज के रूप में सेव करें';

  @override
  String get toolPdfToImagesKeywords =>
      'pdf to image, pdf to png, pdf pages, pdf to jpg, pdf से फ़ोटो, pdf se photo';

  @override
  String get toolProtectPdfTitle => 'PDF लॉक करें';

  @override
  String get toolProtectPdfDesc => 'PDF पर पासवर्ड लगाएं';

  @override
  String get toolProtectPdfKeywords =>
      'password pdf, encrypt pdf, secure pdf, pdf पासवर्ड, pdf लॉक, pdf par password lagaye';

  @override
  String get toolUnlockPdfTitle => 'PDF अनलॉक करें';

  @override
  String get toolUnlockPdfDesc => 'पता हो तो पासवर्ड हटाएं';

  @override
  String get toolUnlockPdfKeywords =>
      'remove pdf password, decrypt pdf, unlock pdf, pdf पासवर्ड हटाएं, pdf ka password hataye';

  @override
  String get toolWordToPdfTitle => 'Word से PDF';

  @override
  String get toolWordToPdfDesc => '.docx डॉक्यूमेंट कन्वर्ट करें';

  @override
  String get toolWordToPdfKeywords =>
      'doc to pdf, docx, word, word to pdf, वर्ड से pdf, word file ko pdf';

  @override
  String get toolImageCompressorTitle => 'फ़ोटो छोटा करें';

  @override
  String get toolImageCompressorDesc => 'छोटी फ़ाइल, वैसा ही लुक';

  @override
  String get toolImageCompressorKeywords =>
      'reduce image size, compress jpg, kb, फ़ोटो साइज़ कम, फोटो kb कम करें, photo size kam kare, photo compress, 20kb, 50kb';

  @override
  String get toolImageResizerTitle => 'रीसाइज़ और कन्वर्ट';

  @override
  String get toolImageResizerDesc => 'सही साइज़, JPG, PNG या WEBP';

  @override
  String get toolImageResizerKeywords =>
      'resize image, jpg to png, png to jpg, webp, passport size, फ़ोटो रीसाइज़, पासपोर्ट साइज़ फ़ोटो, photo resize, photo ka size badle, फॉर्म के लिए फोटो';

  @override
  String get toolImageEnhancerTitle => 'फ़ोटो एडिटर';

  @override
  String get toolImageEnhancerDesc => 'फ़िल्टर, क्रॉप, ब्राइटनेस और भी';

  @override
  String get toolImageEnhancerKeywords =>
      'edit photo, filter, crop, rotate, फ़ोटो एडिट, फोटो एडिटिंग, photo editor, photo edit karna';

  @override
  String get toolAiUpscalerTitle => 'AI अपस्केलर';

  @override
  String get toolAiUpscalerDesc => 'फ़ोटो 4× तक बड़ी और साफ़ करें';

  @override
  String get toolAiUpscalerKeywords =>
      'enhance, hd, increase resolution, blurry, धुंधली फ़ोटो साफ़, फ़ोटो HD करें, photo hd kare, photo clear kare';

  @override
  String get toolTranslationTitle => 'अनुवाद';

  @override
  String get toolTranslationDesc => 'ऑफ़लाइन, बोलकर और सुनकर';

  @override
  String get toolTranslationKeywords =>
      'translator, language, dictionary, अनुवाद, ट्रांसलेट, हिंदी से इंग्लिश, इंग्लिश से हिंदी, translate, hindi to english, anuvad, शब्दकोश';

  @override
  String get toolTextUtilitiesTitle => 'टेक्स्ट टूल्स';

  @override
  String get toolTextUtilitiesDesc => 'शब्द गिनें, केस बदलें, Base64';

  @override
  String get toolTextUtilitiesKeywords =>
      'word counter, uppercase, lowercase, base64, शब्द गिनती, word count, बड़े अक्षर, छोटे अक्षर';

  @override
  String get toolSmartClipboardTitle => 'क्लिपबोर्ड मैनेजर';

  @override
  String get toolSmartClipboardDesc => 'कॉपी किया टेक्स्ट सेव, पिन और खोजें';

  @override
  String get toolSmartClipboardKeywords =>
      'copy paste, notes, clipboard history, कॉपी पेस्ट, नोट्स, क्लिपबोर्ड';

  @override
  String get toolCalculatorTitle => 'कैलकुलेटर';

  @override
  String get toolCalculatorDesc => 'हिस्ट्री वाला रोज़ का कैलकुलेटर';

  @override
  String get toolCalculatorKeywords =>
      'calc, math, percent, कैलकुलेटर, गणित, प्रतिशत, hisab, percentage';

  @override
  String get toolAgeCalculatorTitle => 'उम्र और तारीख';

  @override
  String get toolAgeCalculatorDesc => 'सही उम्र और तारीखों के बीच दिन';

  @override
  String get toolAgeCalculatorKeywords =>
      'birthday, date difference, days counter, age calculator, उम्र, जन्मदिन, उम्र कैलकुलेटर, umar kitni hai, तारीख अंतर';

  @override
  String get toolUnitConverterTitle => 'यूनिट कन्वर्टर';

  @override
  String get toolUnitConverterDesc => 'लंबाई, वज़न, तापमान और भी';

  @override
  String get toolUnitConverterKeywords =>
      'convert units, cm to inch, kg to lb, celsius, यूनिट बदलें, फुट से मीटर, गज, बीघा, unit converter';

  @override
  String get toolLoanCalculatorTitle => 'लोन और EMI';

  @override
  String get toolLoanCalculatorDesc => 'मासिक किस्त और कुल ब्याज';

  @override
  String get toolLoanCalculatorKeywords =>
      'emi, mortgage, interest, installment, लोन, ब्याज, किस्त, emi calculator, home loan, ब्याज कैलकुलेटर';

  @override
  String get toolTimezoneTitle => 'विश्व घड़ी';

  @override
  String get toolTimezoneDesc => 'किसी भी शहर का समय, विजेट के साथ';

  @override
  String get toolTimezoneKeywords =>
      'time zone, clock, city time, world clock, घड़ी, समय, दूसरे देश का समय';

  @override
  String get toolColorPickerTitle => 'कलर पिकर';

  @override
  String get toolColorPickerDesc => 'HEX, RGB, HSL और CMYK';

  @override
  String get toolColorPickerKeywords =>
      'color code, hex, palette, रंग, कलर कोड';

  @override
  String get toolSpeedTestTitle => 'इंटरनेट स्पीड टेस्ट';

  @override
  String get toolSpeedTestDesc => 'डाउनलोड, अपलोड और पिंग';

  @override
  String get toolSpeedTestKeywords =>
      'wifi speed, internet speed, mbps, नेट स्पीड, इंटरनेट स्पीड, net speed check, speed test, 4g 5g speed';

  @override
  String get toolIpPingTitle => 'IP और पिंग';

  @override
  String get toolIpPingDesc => 'आपका IP पता और होस्ट की पहुंच';

  @override
  String get toolIpPingKeywords => 'my ip, ping, network, मेरा ip, नेटवर्क';

  @override
  String get toolCompassTitle => 'कम्पास';

  @override
  String get toolCompassDesc => 'दिशा और बेयरिंग';

  @override
  String get toolCompassKeywords =>
      'direction, north, qibla, दिशा, उत्तर, दिशा सूचक, कंपास, vastu disha';

  @override
  String get toolLocationSaverTitle => 'लोकेशन सेव करें';

  @override
  String get toolLocationSaverDesc => 'GPS जगह याद रखें और शेयर करें';

  @override
  String get toolLocationSaverKeywords =>
      'parking, gps, map, coordinates, लोकेशन, पार्किंग, नक्शा, location share';

  @override
  String get toolPasswordGeneratorTitle => 'पासवर्ड जनरेटर';

  @override
  String get toolPasswordGeneratorDesc => 'मज़बूत रैंडम पासवर्ड';

  @override
  String get toolPasswordGeneratorKeywords =>
      'secure password, random, पासवर्ड बनाएं, मज़बूत पासवर्ड, password generator';

  @override
  String get toolHashGeneratorTitle => 'हैश जनरेटर';

  @override
  String get toolHashGeneratorDesc => 'टेक्स्ट या फ़ाइल का MD5, SHA-1, SHA-256';

  @override
  String get toolHashGeneratorKeywords => 'checksum, md5, sha256, हैश';

  @override
  String get toolVideoConverterTitle => 'वीडियो कन्वर्टर';

  @override
  String get toolVideoConverterDesc => 'वीडियो से MP3, GIF, MP4 और भी';

  @override
  String get toolVideoConverterKeywords =>
      'video to mp3, gif maker, audio extract, वीडियो से गाना, वीडियो से mp3, video se audio, gif बनाएं';

  @override
  String get filesEmptyTitle => 'अभी कोई फ़ाइल नहीं';

  @override
  String get filesEmptyBody =>
      'आपकी बनाई PDF, इमेज और दूसरी फ़ाइलें यहां दिखेंगी, ताकि आप उन्हें फिर से खोल या शेयर कर सकें।';

  @override
  String get fileOpen => 'खोलें';

  @override
  String get fileShare => 'शेयर करें';

  @override
  String get fileRemoveFromList => 'लिस्ट से हटाएं';

  @override
  String get fileOpenFailed =>
      'यह फ़ाइल नहीं खुली। शायद इसे हटा दिया गया है या कहीं और ले जाया गया है।';

  @override
  String get filesClearList => 'लिस्ट साफ़ करें';

  @override
  String get filesClearConfirm =>
      'लिस्ट साफ़ करें? आपकी फ़ाइलें फ़ोन में ही रहेंगी।';

  @override
  String get incomingSheetTitle => 'आप क्या करना चाहते हैं?';

  @override
  String incomingImages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count इमेज',
      one: '1 इमेज',
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
  String get incomingText => 'शेयर किया गया टेक्स्ट';

  @override
  String get incomingDocument => 'Word डॉक्यूमेंट';

  @override
  String get incomingVideo => 'वीडियो';

  @override
  String get incomingUnsupported => 'यह फ़ाइल टाइप अभी सपोर्ट नहीं है';

  @override
  String get incomingFailed => 'शेयर की गई फ़ाइल पढ़ी नहीं जा सकी';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsAppearance => 'दिखावट';

  @override
  String get settingsTheme => 'थीम';

  @override
  String get themeSystem => 'ऑटो';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get languageSystem => 'सिस्टम की भाषा';

  @override
  String get settingsPurchases => 'खरीदारी';

  @override
  String get removeAdsTitle => 'विज्ञापन हटाएं';

  @override
  String get removeAdsSubtitle => 'एक बार की खरीद, कोई सब्सक्रिप्शन नहीं';

  @override
  String get restorePurchasesTitle => 'खरीदारी वापस पाएं';

  @override
  String get restorePurchasesSubtitle =>
      'इस डिवाइस पर पुरानी खरीदारी वापस लाएं';

  @override
  String get settingsSupport => 'सपोर्ट और प्राइवेसी';

  @override
  String get shareAppTitle => 'ऐप शेयर करें';

  @override
  String get shareAppSubtitle => 'दोस्तों को Utility Toolbox के बारे में बताएं';

  @override
  String shareAppMessage(String url) {
    return 'Utility Toolbox से डॉक्यूमेंट स्कैन, PDF एडिट, QR कोड स्कैन और ऑफ़लाइन अनुवाद — सब एक ही ऐप में। मुझे यह बहुत काम का लगता है। फ्री: $url';
  }

  @override
  String get rateAppTitle => 'ऐप को रेट करें';

  @override
  String get rateAppSubtitle => 'एक छोटा सा रिव्यू बहुत मदद करता है';

  @override
  String get privacyPolicyTitle => 'प्राइवेसी पॉलिसी';

  @override
  String get privacyPolicySubtitle => 'ऐप क्या एक्सेस करता है और क्यों';

  @override
  String get privacyChoicesTitle => 'विज्ञापन प्राइवेसी विकल्प';

  @override
  String get privacyChoicesSubtitle => 'पर्सनलाइज़्ड विज्ञापनों की सहमति बदलें';

  @override
  String versionLabel(String version) {
    return 'वर्शन $version';
  }

  @override
  String get onboardingSkip => 'छोड़ें';

  @override
  String get onboardingNext => 'आगे';

  @override
  String get onboardingStart => 'शुरू करें';

  @override
  String get onboarding1Title => 'हर टूल,\nएक ऐप में';

  @override
  String get onboarding1Body =>
      'डॉक्यूमेंट स्कैन करें, PDF एडिट करें, QR कोड पढ़ें, अनुवाद करें और फ़ोटो रीसाइज़ करें — दस ऐप डाउनलोड किए बिना।';

  @override
  String get onboarding2Title => 'हर ऐप से\nकाम करे';

  @override
  String get onboarding2Body =>
      'कोई फ़ोटो या PDF Utility Toolbox पर शेयर करें, अनुवाद के लिए टेक्स्ट सिलेक्ट करें, या शॉर्टकट के लिए ऐप आइकन दबाकर रखें।';

  @override
  String get onboarding3Title => 'तेज़, ऑफ़लाइन\nऔर प्राइवेट';

  @override
  String get onboarding3Body =>
      'लगभग सब कुछ आपके फ़ोन पर ही चलता है। आपकी फ़ाइलें तभी अपलोड होती हैं जब आप खुद कोई क्लाउड विकल्प चालू करें।';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get commonClear => 'साफ़ करें';
}
