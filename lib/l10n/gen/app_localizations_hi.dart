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

  @override
  String get toolBgRemoverTitle => 'बैकग्राउंड हटाएँ';

  @override
  String get toolBgRemoverDesc => 'एक टैप में लोगों और चीज़ों को अलग करें';

  @override
  String get toolBgRemoverKeywords =>
      'बैकग्राउंड हटाएँ, बैकग्राउंड मिटाएँ, कटआउट, पारदर्शी, स्टिकर, पासपोर्ट फ़ोटो, सफ़ेद बैकग्राउंड, remove background, remove bg, cutout, transparent, png';

  @override
  String get toolBmiTitle => 'BMI कैलकुलेटर';

  @override
  String get toolBmiDesc => 'अपना BMI और सही वज़न जानें';

  @override
  String get toolBmiKeywords =>
      'बीएमआई, बॉडी मास इंडेक्स, वज़न, वजन, लंबाई, कद, आदर्श वज़न, मोटापा, सेहत, bmi, body mass index, weight, height, health, fitness, ideal weight, obesity';

  @override
  String get toolBubbleLevelTitle => 'बबल लेवल';

  @override
  String get toolBubbleLevelDesc => 'जाँचें कि शेल्फ़ और फ़्रेम सीधे हैं';

  @override
  String get toolBubbleLevelKeywords =>
      'लेवल, स्पिरिट लेवल, सीधा, कोण, झुकाव, level, spirit level, bubble level, straight, angle, tilt';

  @override
  String get toolCurrencyTitle => 'मुद्रा परिवर्तक';

  @override
  String get toolCurrencyDesc => '150+ मुद्राओं की ताज़ा विनिमय दरें';

  @override
  String get toolCurrencyKeywords =>
      'मुद्रा, करेंसी, विनिमय दर, रुपया, डॉलर, यूरो, दिरहम, रियाल, पैसा, बदलें, currency, exchange rate, money, convert, dollar, euro, rupee, riyal, forex';

  @override
  String get toolDirectChatTitle => 'डायरेक्ट चैट';

  @override
  String get toolDirectChatDesc => 'नंबर सेव किए बिना WhatsApp पर मैसेज करें';

  @override
  String get toolDirectChatKeywords =>
      'व्हाट्सएप, वॉट्सऐप, डायरेक्ट चैट, मैसेज, बिना नंबर सेव किए, संदेश, whatsapp, direct chat, message, unsaved number, click to chat, wa.me, send message, chat';

  @override
  String get toolFlashlightTitle => 'टॉर्च';

  @override
  String get toolFlashlightDesc => 'SOS और स्ट्रोब के साथ तेज़ टॉर्च';

  @override
  String get toolFlashlightKeywords =>
      'टॉर्च, लाइट, रोशनी, फ्लैश, बत्ती, flashlight, torch, light, led, sos, strobe, flash';

  @override
  String get toolOrganizePdfTitle => 'PDF व्यवस्थित करें';

  @override
  String get toolOrganizePdfDesc => 'पेज का क्रम बदलें, घुमाएँ या हटाएँ';

  @override
  String get toolOrganizePdfKeywords =>
      'व्यवस्थित, क्रम बदलें, घुमाएँ, पेज हटाएँ, पेज डिलीट, organize, organise, reorder, rotate, delete pages, remove pages, arrange, sort, pdf';

  @override
  String get toolPdfToTextTitle => 'PDF से टेक्स्ट';

  @override
  String get toolPdfToTextDesc => 'PDF का सारा टेक्स्ट कॉपी करें';

  @override
  String get toolPdfToTextKeywords =>
      'टेक्स्ट निकालें, टेक्स्ट कॉपी, PDF से टेक्स्ट, बदलें, pdf to text, extract text, copy text, txt, read pdf, convert, pdf to word';

  @override
  String get toolPercentageTitle => 'प्रतिशत और छूट';

  @override
  String get toolPercentageDesc => 'प्रतिशत, छूट, टिप बँटवारा और टैक्स पल में';

  @override
  String get toolPercentageKeywords =>
      'प्रतिशत, परसेंट, छूट, डिस्काउंट, सेल, टिप, बिल बाँटें, जीएसटी, टैक्स, कर, percentage, percent, discount, sale price, tip, split bill, tax, gst, vat';

  @override
  String get toolSignPdfTitle => 'PDF पर हस्ताक्षर';

  @override
  String get toolSignPdfDesc => 'अपना हस्ताक्षर बनाएँ और किसी भी पेज पर लगाएँ';

  @override
  String get toolSignPdfKeywords =>
      'हस्ताक्षर, साइन, ई-साइन, दस्तख़त, sign, signature, e-sign, esign, fill and sign, autograph, pdf';

  @override
  String get toolStopwatchTitle => 'स्टॉपवॉच और टाइमर';

  @override
  String get toolStopwatchDesc => 'लैप वाली स्टॉपवॉच और उलटी गिनती टाइमर';

  @override
  String get toolStopwatchKeywords =>
      'स्टॉपवॉच, टाइमर, उलटी गिनती, लैप, अलार्म, घड़ी, किचन टाइमर, कसरत, stopwatch, timer, countdown, lap, alarm';

  @override
  String get toolWatermarkPdfTitle => 'वॉटरमार्क और पेज नंबर';

  @override
  String get toolWatermarkPdfDesc => 'हर पेज पर टेक्स्ट या पेज नंबर लगाएँ';

  @override
  String get toolWatermarkPdfKeywords =>
      'वॉटरमार्क, मुहर, पेज नंबर, पेज क्रमांक, गोपनीय, ड्राफ्ट, watermark, stamp, page numbers, number pages, confidential, draft, footer, header, pdf';

  @override
  String get bmiMetric => 'मीट्रिक (सेमी, किग्रा)';

  @override
  String get bmiImperial => 'इंपीरियल (फ़ुट, पाउंड)';

  @override
  String get bmiHeight => 'लंबाई';

  @override
  String get bmiWeight => 'वज़न';

  @override
  String get bmiFeet => 'फ़ुट';

  @override
  String get bmiInches => 'इंच';

  @override
  String get bmiUnitCm => 'सेमी';

  @override
  String get bmiUnitKg => 'किग्रा';

  @override
  String get bmiUnitLb => 'पाउंड';

  @override
  String get bmiUnitFt => 'फ़ुट';

  @override
  String get bmiUnitIn => 'इंच';

  @override
  String get bmiAge => 'उम्र (वैकल्पिक)';

  @override
  String get bmiSex => 'लिंग (वैकल्पिक)';

  @override
  String get bmiMale => 'पुरुष';

  @override
  String get bmiFemale => 'महिला';

  @override
  String get bmiYourBmi => 'आपका BMI';

  @override
  String get bmiUnderweight => 'कम वज़न';

  @override
  String get bmiNormal => 'सही वज़न';

  @override
  String get bmiOverweight => 'ज़्यादा वज़न';

  @override
  String get bmiObese => 'मोटापा';

  @override
  String bmiHealthyRange(String min, String max) {
    return 'आपकी लंबाई के लिए सही वज़न: $min – $max';
  }

  @override
  String bmiToLose(String amount) {
    return 'सही सीमा से लगभग $amount ज़्यादा';
  }

  @override
  String bmiToGain(String amount) {
    return 'सही सीमा से लगभग $amount कम';
  }

  @override
  String bmiIdealWeight(String weight) {
    return 'अनुमानित आदर्श वज़न: $weight';
  }

  @override
  String get bmiChildNote =>
      '18 साल से कम उम्र वालों का BMI उम्र के हिसाब से ग्रोथ चार्ट से देखा जाता है। ये नतीजे वयस्कों की सीमा पर आधारित हैं।';

  @override
  String get bmiDisclaimer => 'BMI एक सामान्य संकेत है, कोई मेडिकल जाँच नहीं।';

  @override
  String get bmiEnterValues => 'अपनी लंबाई और वज़न डालें';

  @override
  String get currencyAmount => 'राशि';

  @override
  String get currencyFrom => 'इस मुद्रा से';

  @override
  String get currencyTo => 'इस मुद्रा में';

  @override
  String get currencySwap => 'मुद्राएँ अदला-बदली करें';

  @override
  String get currencyChoose => 'मुद्रा चुनें';

  @override
  String get currencySearchHint => 'मुद्रा या कोड खोजें';

  @override
  String get currencyAll => 'सभी मुद्राएँ';

  @override
  String currencyRatesFrom(String date) {
    return '$date की दरें';
  }

  @override
  String get currencyRefresh => 'दरें रीफ़्रेश करें';

  @override
  String get currencyUpdating => 'दरें अपडेट हो रही हैं…';

  @override
  String get currencyOfflineCached =>
      'अपडेट नहीं हो सका। सहेजी गई दरें दिख रही हैं।';

  @override
  String get currencyNoRatesTitle => 'दरें अभी डाउनलोड नहीं हुईं';

  @override
  String get currencyNoRatesBody =>
      'विनिमय दरें डाउनलोड करने के लिए एक बार इंटरनेट से जुड़ें। उसके बाद यह बिना इंटरनेट के भी काम करेगा।';

  @override
  String get currencyRetry => 'फिर से कोशिश करें';

  @override
  String get currencyOtherFavorites => 'आपकी पसंदीदा मुद्राएँ';

  @override
  String get currencyFavoritesHint =>
      'सूची में किसी मुद्रा के पास ☆ दबाएँ, वह यहाँ जुड़ जाएगी।';

  @override
  String get currencyCopy => 'नतीजा कॉपी करें';

  @override
  String get currencyCopied => 'कॉपी हो गया';

  @override
  String get currencyNoMatch => 'कोई मुद्रा नहीं मिली';

  @override
  String get currencyDisclaimer =>
      'दरें केवल जानकारी के लिए हैं और आपके बैंक की दर से अलग हो सकती हैं।';

  @override
  String get directChatPhone => 'फ़ोन नंबर';

  @override
  String get directChatCountryCode => 'देश का कोड';

  @override
  String get directChatSearchCountry => 'देश या कोड खोजें';

  @override
  String get directChatNoCountry => 'कोई देश नहीं मिला';

  @override
  String get directChatMessage => 'मैसेज (वैकल्पिक)';

  @override
  String get directChatOpen => 'WhatsApp में खोलें';

  @override
  String get directChatPaste => 'नंबर पेस्ट करें';

  @override
  String get directChatPasteNone => 'क्लिपबोर्ड में कोई फ़ोन नंबर नहीं मिला';

  @override
  String get directChatTooShort => 'यह नंबर बहुत छोटा लग रहा है';

  @override
  String get directChatTooLong => 'यह नंबर बहुत लंबा लग रहा है';

  @override
  String directChatWillOpen(String number) {
    return '$number से चैट';
  }

  @override
  String get directChatOpenFailed =>
      'चैट नहीं खुल सकी। क्या WhatsApp इंस्टॉल है?';

  @override
  String get directChatHint =>
      'किसी भी नंबर को कॉन्टैक्ट में सेव किए बिना मैसेज भेजें।';

  @override
  String get directChatNotAffiliated =>
      'स्वतंत्र टूल। WhatsApp या Meta से संबद्ध नहीं।';

  @override
  String get percentageTabPercent => 'प्रतिशत';

  @override
  String get percentageTabDiscount => 'छूट';

  @override
  String get percentageTabTip => 'टिप और बँटवारा';

  @override
  String get percentageTabTax => 'टैक्स / GST';

  @override
  String get percentageOfTitle => 'किसी संख्या का प्रतिशत';

  @override
  String get percentageFieldPercent => 'प्रतिशत';

  @override
  String get percentageFieldNumber => 'संख्या';

  @override
  String percentageOfResult(String percent, String number) {
    return '$number का $percent';
  }

  @override
  String get percentageWhatTitle => 'यह कितना प्रतिशत है?';

  @override
  String get percentageFieldPart => 'मान';

  @override
  String get percentageFieldTotal => 'कुल';

  @override
  String percentageWhatResult(String part, String total) {
    return '$total में से $part';
  }

  @override
  String get percentageChangeTitle => 'प्रतिशत बदलाव';

  @override
  String get percentageFieldOld => 'पुराना मान';

  @override
  String get percentageFieldNew => 'नया मान';

  @override
  String percentageIncrease(String percent) {
    return '$percent की बढ़ोतरी';
  }

  @override
  String percentageDecrease(String percent) {
    return '$percent की कमी';
  }

  @override
  String get percentageNoChange => 'कोई बदलाव नहीं';

  @override
  String get percentageDifference => 'अंतर';

  @override
  String get percentagePrice => 'असली कीमत';

  @override
  String get percentageDiscount => 'छूट';

  @override
  String get percentageExtraDiscount => 'अतिरिक्त छूट (वैकल्पिक)';

  @override
  String get percentageYouPay => 'आप देंगे';

  @override
  String get percentageYouSave => 'आपकी बचत';

  @override
  String get percentageTotalDiscount => 'कुल छूट';

  @override
  String get percentageBill => 'बिल की राशि';

  @override
  String get percentageTip => 'टिप';

  @override
  String get percentageCustom => 'अपना';

  @override
  String get percentagePeople => 'लोग';

  @override
  String get percentageAddPerson => 'एक व्यक्ति जोड़ें';

  @override
  String get percentageRemovePerson => 'एक व्यक्ति हटाएँ';

  @override
  String get percentageTipAmount => 'टिप की राशि';

  @override
  String get percentageTotal => 'कुल';

  @override
  String get percentagePerPerson => 'हर व्यक्ति देगा';

  @override
  String get percentageTaxRate => 'टैक्स दर';

  @override
  String get percentageAddTax => 'टैक्स जोड़ें';

  @override
  String get percentageRemoveTax => 'टैक्स हटाएँ';

  @override
  String get percentagePriceExclTax => 'टैक्स के बिना कीमत';

  @override
  String get percentagePriceInclTax => 'टैक्स सहित कीमत';

  @override
  String get percentageBeforeTax => 'टैक्स से पहले';

  @override
  String get percentageTaxAmount => 'टैक्स';

  @override
  String get percentageAfterTax => 'टैक्स सहित कुल';

  @override
  String get percentageEnterValues => 'नतीजा देखने के लिए संख्याएँ डालें';

  @override
  String get commonSave => 'सेव करें';

  @override
  String get commonShare => 'शेयर करें';

  @override
  String get commonCopy => 'कॉपी करें';

  @override
  String get commonCopied => 'कॉपी हो गया';

  @override
  String get commonRetry => 'फिर से कोशिश करें';

  @override
  String get commonDone => 'हो गया';

  @override
  String get commonDelete => 'हटाएँ';

  @override
  String get commonUndo => 'पहले जैसा करें';

  @override
  String get commonOpen => 'खोलें';

  @override
  String get commonReset => 'रीसेट करें';

  @override
  String get commonClose => 'बंद करें';

  @override
  String get commonOpenSettings => 'सेटिंग्स खोलें';

  @override
  String get commonChoosePhoto => 'फ़ोटो चुनें';

  @override
  String get commonChooseFile => 'फ़ाइल चुनें';

  @override
  String get commonCamera => 'कैमरा';

  @override
  String get commonGallery => 'गैलरी';

  @override
  String get commonWorking => 'काम हो रहा है…';

  @override
  String get commonSavedToGallery => 'गैलरी में सेव हो गया';

  @override
  String get commonSavedToDownloads => 'डाउनलोड्स में सेव हो गया';

  @override
  String get commonSaveFailed => 'फ़ाइल सेव नहीं हो सकी';

  @override
  String get commonErrorGeneric => 'कुछ गलत हो गया। कृपया फिर से कोशिश करें।';

  @override
  String get commonErrorOffline => 'इंटरनेट कनेक्शन नहीं है';

  @override
  String get commonErrorTimeout =>
      'समय समाप्त हो गया। कृपया फिर से कोशिश करें।';

  @override
  String get commonPermissionNeeded =>
      'अनुमति चाहिए। सेटिंग्स में जाकर अनुमति दें।';

  @override
  String get commonResult => 'परिणाम';

  @override
  String get commonStart => 'शुरू करें';

  @override
  String get commonStop => 'रोकें';

  @override
  String get commonClearAll => 'सब साफ़ करें';

  @override
  String get commonPaste => 'पेस्ट करें';

  @override
  String get commonSearch => 'खोजें';

  @override
  String get organizePdfHint =>
      'चुनने के लिए पेज पर टैप करें। पेज को दबाकर रखें, फिर खिसकाने के लिए खींचें।';

  @override
  String organizePdfSelected(int count) {
    return '$count चुने गए';
  }

  @override
  String get organizePdfRotateLeft => 'बाएँ घुमाएँ';

  @override
  String get organizePdfRotateRight => 'दाएँ घुमाएँ';

  @override
  String get organizePdfDelete => 'हटाएँ';

  @override
  String get organizePdfSelectAll => 'सभी चुनें';

  @override
  String get organizePdfClearSelection => 'चयन हटाएँ';

  @override
  String organizePdfDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पेज हटाए गए',
    );
    return '$_temp0';
  }

  @override
  String get organizePdfUndo => 'वापस लाएँ';

  @override
  String get organizePdfKeepOne => 'PDF में कम से कम एक पेज होना चाहिए।';

  @override
  String get organizePdfNoChanges =>
      'अभी कोई बदलाव नहीं — पहले पेज खिसकाएँ, घुमाएँ या हटाएँ।';

  @override
  String get organizePdfReset => 'सभी बदलाव वापस लें';

  @override
  String get organizePdfMoveEarlier => 'पहले ले जाएँ';

  @override
  String get organizePdfMoveLater => 'बाद में ले जाएँ';

  @override
  String get organizePdfSave => 'PDF सेव करें';

  @override
  String get organizePdfFailed => 'यह PDF सेव नहीं हो सकी।';

  @override
  String get organizePdfResult => 'आपकी व्यवस्थित PDF तैयार है';

  @override
  String pdfToTextReading(int current, int total) {
    return '$total में से पेज $current पढ़ा जा रहा है…';
  }

  @override
  String pdfToTextWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count शब्द',
    );
    return '$_temp0';
  }

  @override
  String get pdfToTextCopyAll => 'सब कॉपी करें';

  @override
  String get pdfToTextCopied => 'टेक्स्ट कॉपी हो गया';

  @override
  String get pdfToTextSaveTxt => '.txt के रूप में सेव करें';

  @override
  String get pdfToTextEmptyPage => 'इस पेज पर कोई टेक्स्ट नहीं';

  @override
  String get pdfToTextScannedTitle => 'कोई टेक्स्ट नहीं मिला';

  @override
  String get pdfToTextScannedBody =>
      'यह PDF स्कैन या फ़ोटो जैसी लगती है, इसलिए इसमें कॉपी करने लायक टेक्स्ट नहीं है। इसके बजाय हम पेज 1 की तस्वीर से शब्द पढ़ सकते हैं।';

  @override
  String pdfToTextOpenOcr(String tool) {
    return '$tool से पेज 1 पढ़ें';
  }

  @override
  String get pdfToTextFailed => 'इस PDF का टेक्स्ट पढ़ा नहीं जा सका।';

  @override
  String pdfToTextPartlyScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पेज पर कोई टेक्स्ट नहीं है (शायद स्कैन किए गए हैं)।',
    );
    return '$_temp0';
  }

  @override
  String get pdfEditChoosePdf => 'PDF चुनें';

  @override
  String get pdfEditChooseHint =>
      'या किसी भी ऐप से PDF को Utility Toolbox में शेयर करें';

  @override
  String get pdfEditChange => 'बदलें';

  @override
  String get pdfEditReading => 'पढ़ा जा रहा है…';

  @override
  String pdfEditPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पेज',
    );
    return '$_temp0';
  }

  @override
  String pdfEditPageN(int number) {
    return 'पेज $number';
  }

  @override
  String get pdfEditInvalidPdf => 'यह फ़ाइल सही PDF नहीं लगती।';

  @override
  String get pdfEditLocked =>
      'यह PDF पासवर्ड से सुरक्षित है। पहले पासवर्ड हटाएँ, फिर दोबारा कोशिश करें।';

  @override
  String get pdfEditLockedShort => 'पासवर्ड से सुरक्षित';

  @override
  String get pdfEditPreviewFailed => 'यह पेज दिखाया नहीं जा सका।';

  @override
  String get pdfEditResultReady => 'आपकी PDF तैयार है';

  @override
  String get pdfEditSaveDownloads => 'डाउनलोड में सेव करें';

  @override
  String get pdfEditShare => 'शेयर करें';

  @override
  String get pdfEditStartOver => 'फिर से शुरू करें';

  @override
  String get pdfEditSavedToDownloads =>
      'डाउनलोड में सेव हो गया — मेरी फ़ाइलें में देखें';

  @override
  String get pdfEditSharedInstead => 'इसके बजाय शेयर मेन्यू खोला गया';

  @override
  String get pdfEditSaveFailed => 'फ़ाइल नहीं बन सकी। कृपया फिर से कोशिश करें।';

  @override
  String get signPdfStepPdf => 'अपनी PDF चुनें';

  @override
  String get signPdfStepSignature => 'अपना हस्ताक्षर बनाएँ';

  @override
  String get signPdfStepPlace => 'हस्ताक्षर लगाने के लिए किसी पेज पर टैप करें';

  @override
  String get signPdfDraw => 'हस्ताक्षर बनाएँ';

  @override
  String get signPdfDrawAgain => 'फिर से बनाएँ';

  @override
  String get signPdfUseSaved => 'सेव किया हस्ताक्षर इस्तेमाल करें';

  @override
  String get signPdfDeleteSaved => 'सेव किया हस्ताक्षर हटाएँ';

  @override
  String get signPdfSavedDeleted => 'सेव किया हस्ताक्षर हटा दिया गया';

  @override
  String get signPdfDrawTitle => 'अपना हस्ताक्षर बनाएँ';

  @override
  String get signPdfDrawHint => 'यहाँ उंगली से हस्ताक्षर करें';

  @override
  String get signPdfUndo => 'पूर्ववत करें';

  @override
  String get signPdfInkBlack => 'काला';

  @override
  String get signPdfInkBlue => 'नीला';

  @override
  String get signPdfRemember => 'अगली बार के लिए हस्ताक्षर सेव करें';

  @override
  String get signPdfDone => 'यह हस्ताक्षर इस्तेमाल करें';

  @override
  String get signPdfEmpty => 'पहले अपना हस्ताक्षर बनाएँ।';

  @override
  String get signPdfSignatureLabel => 'आपका हस्ताक्षर';

  @override
  String get signPdfPlaceHint =>
      'हटाने के लिए खींचें, आकार बदलने के लिए दो उंगलियों या स्लाइडर का इस्तेमाल करें। पेज पर टैप करें तो हस्ताक्षर वहीं आ जाएगा।';

  @override
  String get signPdfSize => 'आकार';

  @override
  String get signPdfPlaceConfirm => 'यहाँ लगाएँ';

  @override
  String get signPdfRemoveFromPage => 'इस पेज से हटाएँ';

  @override
  String get signPdfAllPages => 'सभी पेज पर लगाएँ';

  @override
  String signPdfAllPagesDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'सभी $count पेज पर हस्ताक्षर लगा दिया गया',
    );
    return '$_temp0';
  }

  @override
  String get signPdfClearAll => 'सभी हटाएँ';

  @override
  String signPdfPlacedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पेज पर हस्ताक्षर किए गए',
      zero: 'अभी तक किसी पेज पर हस्ताक्षर नहीं',
    );
    return '$_temp0';
  }

  @override
  String get signPdfSave => 'हस्ताक्षरित PDF सेव करें';

  @override
  String get signPdfNoPlacement => 'पहले किसी पेज पर टैप करके हस्ताक्षर लगाएँ।';

  @override
  String get signPdfFailed => 'इस PDF पर हस्ताक्षर नहीं हो सका।';

  @override
  String get signPdfResult => 'आपकी हस्ताक्षरित PDF तैयार है';

  @override
  String get watermarkPdfModeText => 'टेक्स्ट वॉटरमार्क';

  @override
  String get watermarkPdfModeNumbers => 'पेज नंबर';

  @override
  String get watermarkPdfText => 'वॉटरमार्क का टेक्स्ट';

  @override
  String get watermarkPdfDefaultText => 'गोपनीय';

  @override
  String get watermarkPdfTextEmpty => 'पहले वॉटरमार्क का टेक्स्ट लिखें।';

  @override
  String get watermarkPdfSize => 'टेक्स्ट का आकार';

  @override
  String get watermarkPdfOpacity => 'अपारदर्शिता';

  @override
  String get watermarkPdfLayout => 'लेआउट';

  @override
  String get watermarkPdfDiagonal => 'तिरछा';

  @override
  String get watermarkPdfCenter => 'बीच में';

  @override
  String get watermarkPdfTiled => 'दोहराया हुआ';

  @override
  String get watermarkPdfColor => 'रंग';

  @override
  String get watermarkPdfColorGrey => 'स्लेटी';

  @override
  String get watermarkPdfColorRed => 'लाल';

  @override
  String get watermarkPdfColorBlue => 'नीला';

  @override
  String get watermarkPdfColorBlack => 'काला';

  @override
  String get watermarkPdfColorGreen => 'हरा';

  @override
  String get watermarkPdfFormat => 'फ़ॉर्मैट';

  @override
  String watermarkPdfPageLabel(String number) {
    return 'पेज $number';
  }

  @override
  String get watermarkPdfPosition => 'जगह';

  @override
  String get watermarkPdfBottomCenter => 'नीचे बीच में';

  @override
  String get watermarkPdfBottomRight => 'नीचे दाएँ';

  @override
  String get watermarkPdfTopRight => 'ऊपर दाएँ';

  @override
  String get watermarkPdfStartAt => 'यहाँ से शुरू';

  @override
  String get watermarkPdfDecrease => 'घटाएँ';

  @override
  String get watermarkPdfIncrease => 'बढ़ाएँ';

  @override
  String get watermarkPdfPreview => 'प्रीव्यू (पेज 1)';

  @override
  String get watermarkPdfApplyText => 'वॉटरमार्क लगाएँ';

  @override
  String get watermarkPdfApplyNumbers => 'पेज नंबर लगाएँ';

  @override
  String get watermarkPdfFailed => 'यह PDF अपडेट नहीं हो सकी।';

  @override
  String get bgRemoverPickTitle => 'एक फ़ोटो चुनें';

  @override
  String get bgRemoverPickBody =>
      'लोगों, पालतू जानवरों और चीज़ों के साथ सबसे अच्छा काम करता है। आपकी फ़ोटो आपके फ़ोन पर ही प्रोसेस होती है।';

  @override
  String get bgRemoverGallery => 'गैलरी से चुनें';

  @override
  String get bgRemoverCamera => 'फ़ोटो लें';

  @override
  String get bgRemoverPreparing => 'फ़ोटो तैयार हो रही है…';

  @override
  String get bgRemoverWorking => 'बैकग्राउंड हटाया जा रहा है…';

  @override
  String get bgRemoverDownloading =>
      'बैकग्राउंड हटाने का टूल तैयार हो रहा है। यह सिर्फ़ एक बार होता है और इंटरनेट चाहिए…';

  @override
  String get bgRemoverDownloadFailed =>
      'बैकग्राउंड हटाने का टूल अभी तैयार नहीं है। Google Play सेवाएँ इसे अभी डाउनलोड कर रही हैं। इंटरनेट कनेक्शन जाँचें और एक मिनट बाद फिर कोशिश करें।';

  @override
  String get bgRemoverNoSubject =>
      'इस फ़ोटो में कोई व्यक्ति या चीज़ नहीं मिली। साफ़ दिखने वाले विषय वाली फ़ोटो आज़माएँ।';

  @override
  String get bgRemoverOpenFailed => 'यह फ़ोटो खुल नहीं सकी। कोई दूसरी आज़माएँ।';

  @override
  String get bgRemoverFailed =>
      'बैकग्राउंड हटाते समय कुछ गड़बड़ हो गई। कृपया फिर कोशिश करें।';

  @override
  String get bgRemoverRetry => 'फिर कोशिश करें';

  @override
  String get bgRemoverAnotherPhoto => 'दूसरी फ़ोटो चुनें';

  @override
  String get bgRemoverNewPhoto => 'नई फ़ोटो';

  @override
  String get bgRemoverBefore => 'पहले';

  @override
  String get bgRemoverAfter => 'बाद में';

  @override
  String get bgRemoverCompare => 'पहले और बाद की तुलना करें';

  @override
  String get bgRemoverCompareHint => 'तुलना के लिए स्लाइडर खींचें';

  @override
  String get bgRemoverBgTransparent => 'पारदर्शी';

  @override
  String get bgRemoverBgWhite => 'सफ़ेद';

  @override
  String get bgRemoverBgBlack => 'काला';

  @override
  String get bgRemoverBgBlue => 'नीला';

  @override
  String get bgRemoverBgRed => 'लाल';

  @override
  String get bgRemoverBgYellow => 'पीला';

  @override
  String get bgRemoverBgBlur => 'धुंधला';

  @override
  String get bgRemoverSave => 'गैलरी में सेव करें';

  @override
  String get bgRemoverSaved => 'आपकी गैलरी में सेव हो गई';

  @override
  String get bgRemoverSaveFailed =>
      'इमेज सेव नहीं हो सकी। कृपया फिर कोशिश करें।';

  @override
  String get bgRemoverPngHint => 'पारदर्शी बैकग्राउंड वाली PNG';

  @override
  String get bgRemoverJpgHint => 'चुने गए बैकग्राउंड वाली JPG';

  @override
  String get bubbleLevelSurfaceHint => 'फ़ोन को सतह पर सीधा लिटाएँ';

  @override
  String get bubbleLevelUprightHint => 'फ़ोन का किनारा सतह से सटाकर रखें';

  @override
  String get bubbleLevelLevel => 'समतल';

  @override
  String bubbleLevelAngleLabel(String angle) {
    return 'झुकाव $angle डिग्री';
  }

  @override
  String bubbleLevelAxes(String x, String y) {
    return 'दाएँ–बाएँ $x° · आगे–पीछे $y°';
  }

  @override
  String get bubbleLevelCalibrate => 'कैलिब्रेट करें';

  @override
  String get bubbleLevelReset => 'रीसेट करें';

  @override
  String get bubbleLevelCalibrateTitle => 'लेवल कैलिब्रेट करें?';

  @override
  String get bubbleLevelCalibrateBody =>
      'फ़ोन को ऐसी सतह पर रखें जो पक्का समतल हो (या किसी सीधे किनारे से सटाएँ), फिर कैलिब्रेट करें पर टैप करें। मौजूदा स्थिति 0° दिखाएगी।';

  @override
  String get bubbleLevelCalibrated =>
      'कैलिब्रेट हो गया। यह स्थिति अब 0° दिखाती है।';

  @override
  String get bubbleLevelResetDone => 'कैलिब्रेशन हटा दिया गया';

  @override
  String get bubbleLevelUnavailable =>
      'इस फ़ोन में मोशन सेंसर नहीं है, इसलिए लेवल यहाँ काम नहीं कर सकता।';

  @override
  String get flashlightOn => 'लाइट चालू है';

  @override
  String get flashlightOff => 'लाइट बंद है';

  @override
  String get flashlightTurnOn => 'लाइट चालू करें';

  @override
  String get flashlightTurnOff => 'लाइट बंद करें';

  @override
  String get flashlightModeSteady => 'लगातार';

  @override
  String get flashlightModeSos => 'SOS';

  @override
  String get flashlightModeStrobe => 'स्ट्रोब';

  @override
  String get flashlightSosHint => 'संकट संकेत ··· ––– ··· बार-बार चमकाता है';

  @override
  String flashlightStrobeSpeed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'हर सेकंड $count फ्लैश',
    );
    return '$_temp0';
  }

  @override
  String get flashlightUseScreen => 'स्क्रीन लाइट इस्तेमाल करें';

  @override
  String get flashlightUseScreenHint => 'फ्लैश के बजाय स्क्रीन जलाएँ';

  @override
  String get flashlightNoTorch =>
      'इस फ़ोन में फ्लैश नहीं मिला, इसलिए स्क्रीन रोशनी देगी।';

  @override
  String get flashlightTorchBusy =>
      'फ्लैश व्यस्त है (शायद कोई दूसरा ऐप कैमरा इस्तेमाल कर रहा है), इसलिए स्क्रीन रोशनी देगी।';

  @override
  String get flashlightScreenColor => 'स्क्रीन लाइट का रंग';

  @override
  String get flashlightColorWhite => 'सफ़ेद';

  @override
  String get flashlightColorWarm => 'हल्का पीला सफ़ेद';

  @override
  String get flashlightColorRed => 'लाल';

  @override
  String get flashlightColorGreen => 'हरा';

  @override
  String get flashlightColorBlue => 'नीला';

  @override
  String get flashlightTapToTurnOff => 'बंद करने के लिए कहीं भी टैप करें';

  @override
  String get stopwatchTabStopwatch => 'स्टॉपवॉच';

  @override
  String get stopwatchTabTimer => 'टाइमर';

  @override
  String get stopwatchStart => 'शुरू करें';

  @override
  String get stopwatchPause => 'रोकें';

  @override
  String get stopwatchResume => 'जारी रखें';

  @override
  String get stopwatchLap => 'लैप';

  @override
  String get stopwatchReset => 'रीसेट करें';

  @override
  String stopwatchLapNumber(int number) {
    return 'लैप $number';
  }

  @override
  String stopwatchCurrentLap(int number, String time) {
    return 'लैप $number: $time';
  }

  @override
  String get stopwatchBest => 'सबसे तेज़';

  @override
  String get stopwatchWorst => 'सबसे धीमा';

  @override
  String get stopwatchNoLaps =>
      'स्टॉपवॉच चलते समय लैप दबाएँ, लैप का समय दर्ज होगा।';

  @override
  String get stopwatchTimerQuickStart => 'तुरंत शुरू';

  @override
  String stopwatchTimerMinutes(int minutes) {
    return '$minutes मिनट';
  }

  @override
  String get stopwatchTimerCustom => 'अपना समय चुनें';

  @override
  String get stopwatchTimerPickTitle => 'टाइमर सेट करें';

  @override
  String get stopwatchTimerHours => 'घंटे';

  @override
  String get stopwatchTimerMinutesUnit => 'मिनट';

  @override
  String get stopwatchTimerSeconds => 'सेकंड';

  @override
  String get stopwatchTimerAddMinute => '+1 मिनट';

  @override
  String get stopwatchTimerPaused => 'रुका हुआ';

  @override
  String stopwatchTimerRemaining(String time) {
    return '$time बाकी';
  }

  @override
  String get stopwatchTimerTimesUp => 'समय पूरा!';

  @override
  String stopwatchTimerFinishedBody(String duration) {
    return 'आपका $duration का टाइमर पूरा हो गया।';
  }

  @override
  String get stopwatchTimerRestart => 'फिर से शुरू करें';

  @override
  String get stopwatchTimerDone => 'ठीक है';

  @override
  String get stopwatchTimerKeepOpen =>
      'यह स्क्रीन खुली रखें: समय पूरा होने पर फ़ोन वाइब्रेट करेगा।';

  @override
  String get translateHeroTitle => 'बोलें या लिखें, अनुवाद पाएं';

  @override
  String get translateBadgeOnDevice => 'डिवाइस पर AI';

  @override
  String get translateBadgeOffline => 'ऑफ़लाइन चलता है';

  @override
  String get translateFrom => 'स्रोत भाषा';

  @override
  String get translateTo => 'लक्ष्य भाषा';

  @override
  String get translateSwap => 'भाषाएं बदलें';

  @override
  String get translateHint => 'टेक्स्ट लिखें या बोलने के लिए माइक टैप करें…';

  @override
  String get translateHintListening =>
      'सुन रहा है… सामान्य रूप से बोलें, रोकने के लिए माइक टैप करें';

  @override
  String translateListeningIn(String language) {
    return '$language में सुन रहा है… रोककर अनुवाद करने के लिए माइक टैप करें।';
  }

  @override
  String get translateSameLanguage => 'स्रोत और लक्ष्य भाषा अलग होनी चाहिए।';

  @override
  String get translateButton => 'अनुवाद करें';

  @override
  String get translateTranslating => 'अनुवाद हो रहा है…';

  @override
  String get translateStopAndTranslate => 'रोकें और अनुवाद करें';

  @override
  String get translateDownloadingModel => 'भाषा मॉडल डाउनलोड हो रहा है…';

  @override
  String get translateResultLabel => 'अनुवाद';

  @override
  String get translatePlayAudio => 'ऑडियो चलाएं';

  @override
  String get translateGenerating => 'बन रहा है…';

  @override
  String get translateShareAudio => 'ऑडियो फ़ाइल शेयर करें';

  @override
  String get translateGenerateAudio => 'ऑडियो फ़ाइल बनाएं';

  @override
  String get translateAudioReady =>
      'ऑडियो फ़ाइल तैयार है — भेजने या सेव करने के लिए शेयर करें।';

  @override
  String get translateMicStop => 'सुनना रोकें और अनुवाद करें';

  @override
  String get translateMicStart => 'अनुवाद के लिए बोलें';

  @override
  String get translateMicBlocked =>
      'माइक्रोफ़ोन की अनुमति बंद है। वॉइस इनपुट के लिए इसे सेटिंग में चालू करें।';

  @override
  String get translateMicNeeded =>
      'वॉइस इनपुट के लिए माइक्रोफ़ोन की अनुमति चाहिए।';

  @override
  String get translateSpeechUnavailable =>
      'इस डिवाइस पर वाक् पहचान उपलब्ध नहीं है।';

  @override
  String get translateNoSpeech => 'कुछ सुनाई नहीं दिया। कृपया फिर से बोलें।';

  @override
  String get translateVoiceFailed =>
      'वॉइस इनपुट रुक गया। कृपया फिर से कोशिश करें।';

  @override
  String get translateDownloadFailed =>
      'भाषा मॉडल डाउनलोड नहीं हो सके। अपना इंटरनेट कनेक्शन जांचें।';

  @override
  String get translateFailed => 'अनुवाद विफल रहा। कृपया फिर से कोशिश करें।';

  @override
  String get translateAudioFailed => 'इस डिवाइस पर ऑडियो फ़ाइल नहीं बन सकी।';

  @override
  String translateLanguageName(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'af': 'अफ़्रीकांस',
      'sq': 'अल्बानियाई',
      'ar': 'अरबी',
      'be': 'बेलारूसी',
      'bn': 'बांग्ला',
      'bg': 'बुल्गारियाई',
      'ca': 'कैटलन',
      'zh': 'चीनी (सरलीकृत)',
      'hr': 'क्रोएशियाई',
      'cs': 'चेक',
      'da': 'डेनिश',
      'nl': 'डच',
      'en': 'अंग्रेज़ी',
      'eo': 'एस्पेरांतो',
      'et': 'एस्टोनियाई',
      'fi': 'फ़िनिश',
      'fr': 'फ़्रेंच',
      'gl': 'गैलिशियन',
      'ka': 'जॉर्जियाई',
      'de': 'जर्मन',
      'el': 'यूनानी',
      'gu': 'गुजराती',
      'ht': 'हैतियाई क्रियोल',
      'he': 'हिब्रू',
      'hi': 'हिन्दी',
      'hu': 'हंगेरियाई',
      'is': 'आइसलैंडिक',
      'id': 'इंडोनेशियाई',
      'ga': 'आयरिश',
      'it': 'इतालवी',
      'ja': 'जापानी',
      'kn': 'कन्नड़',
      'ko': 'कोरियाई',
      'lv': 'लातवियाई',
      'lt': 'लिथुआनियाई',
      'mk': 'मकदूनियाई',
      'ms': 'मलय',
      'mt': 'माल्टीज़',
      'mr': 'मराठी',
      'no': 'नॉर्वेजियाई',
      'fa': 'फ़ारसी',
      'pl': 'पोलिश',
      'pt': 'पुर्तगाली',
      'ro': 'रोमानियाई',
      'ru': 'रूसी',
      'sk': 'स्लोवाक',
      'sl': 'स्लोवेनियाई',
      'es': 'स्पेनिश',
      'sw': 'स्वाहिली',
      'sv': 'स्वीडिश',
      'tl': 'तागालोग (फ़िलिपिनो)',
      'ta': 'तमिल',
      'te': 'तेलुगु',
      'th': 'थाई',
      'tr': 'तुर्की',
      'uk': 'यूक्रेनी',
      'ur': 'उर्दू',
      'vi': 'वियतनामी',
      'cy': 'वेल्श',
      'other': '$code',
    });
    return '$_temp0';
  }

  @override
  String get textUtilMode => 'मोड';

  @override
  String get textUtilModeText => 'टेक्स्ट';

  @override
  String get textUtilHint => 'यहां टेक्स्ट लिखें…';

  @override
  String get textUtilHintBase64 => 'बदलने के लिए टेक्स्ट या Base64 लिखें…';

  @override
  String textUtilWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'शब्द',
    );
    return '$_temp0';
  }

  @override
  String textUtilCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'अक्षर',
    );
    return '$_temp0';
  }

  @override
  String get textUtilNoSpaces => 'स्पेस के बिना';

  @override
  String get textUtilUpper => 'बड़े अक्षर';

  @override
  String get textUtilLower => 'छोटे अक्षर';

  @override
  String get textUtilTitle => 'हर शब्द का पहला अक्षर बड़ा';

  @override
  String get textUtilSentence => 'वाक्य का पहला अक्षर बड़ा';

  @override
  String get textUtilEncode => 'एनकोड करें';

  @override
  String get textUtilDecode => 'डिकोड करें';

  @override
  String get textUtilOutput => 'आउटपुट';

  @override
  String get textUtilInvalidBase64 => 'यह मान्य Base64 नहीं है।';

  @override
  String get clipEmptyClipboard =>
      'क्लिपबोर्ड खाली है या उसमें कोई टेक्स्ट नहीं है।';

  @override
  String clipSaved(String text) {
    return 'सेव हुआ: $text';
  }

  @override
  String get clipAddManualTitle => 'टेक्स्ट खुद जोड़ें';

  @override
  String get clipAddHint => 'यहां टाइप या पेस्ट करें…';

  @override
  String get clipClearUnpinned => 'अनपिन किए गए हटाएं';

  @override
  String get clipClearHistoryTitle => 'इतिहास साफ़ करें?';

  @override
  String get clipClearHistoryBody =>
      'सभी अनपिन आइटम हटाएं? पिन किए गए आइटम बने रहेंगे।';

  @override
  String get clipSearchHint => 'क्लिप खोजें…';

  @override
  String get clipFilterAll => 'सभी';

  @override
  String get clipFilterPinned => 'पिन किए गए';

  @override
  String get clipFilterLinks => 'लिंक';

  @override
  String get clipFilterText => 'टेक्स्ट';

  @override
  String get clipFilterCode => 'कोड';

  @override
  String clipSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString सेव',
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
      other: '$countString पिन',
    );
    return '$_temp0';
  }

  @override
  String get clipAddText => 'टेक्स्ट जोड़ें';

  @override
  String get clipLabel => 'लेबल';

  @override
  String get clipAddLabelTitle => 'लेबल जोड़ें';

  @override
  String get clipLabelHint => 'जैसे: ऑफ़िस ईमेल';

  @override
  String get clipEmptyTitle => 'अभी कोई क्लिप नहीं';

  @override
  String get clipEmptyMessage =>
      'फ़ोन पर कोई भी टेक्स्ट कॉपी करें, फिर उसे यहां हमेशा के लिए सेव करने को पेस्ट टैप करें।';

  @override
  String get clipPasteFromClipboard => 'क्लिपबोर्ड से पेस्ट करें';

  @override
  String get clipTypeLink => 'लिंक';

  @override
  String get clipTypeEmail => 'ईमेल';

  @override
  String get clipTypePhone => 'फ़ोन';

  @override
  String get clipTypeCode => 'कोड';

  @override
  String get clipTypeText => 'टेक्स्ट';

  @override
  String get clipJustNow => 'अभी-अभी';

  @override
  String clipMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count मिनट पहले',
    );
    return '$_temp0';
  }

  @override
  String clipHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count घंटे पहले',
    );
    return '$_temp0';
  }

  @override
  String clipDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिन पहले',
      one: '1 दिन पहले',
    );
    return '$_temp0';
  }

  @override
  String get clipPin => 'पिन करें';

  @override
  String get clipUnpin => 'अनपिन करें';

  @override
  String get calcDivideByZero => 'शून्य से भाग नहीं दिया जा सकता';

  @override
  String get calcCheckExpression => 'एक्सप्रेशन जांचें';

  @override
  String get calcCopyResult => 'परिणाम कॉपी करें';

  @override
  String get calcPlus => 'धन';

  @override
  String get calcMinus => 'ऋण';

  @override
  String get calcTimes => 'गुणा';

  @override
  String get calcDivide => 'भाग';

  @override
  String get calcPercent => 'प्रतिशत';

  @override
  String get calcParentheses => 'कोष्ठक';

  @override
  String get calcEquals => 'बराबर';

  @override
  String get calcDecimalPoint => 'दशमलव बिंदु';

  @override
  String get ageTabAge => 'आयु';

  @override
  String get ageTabBetween => 'दो तारीखों के बीच';

  @override
  String get ageDateOfBirth => 'जन्मतिथि';

  @override
  String get ageFrom => 'आरंभ तिथि';

  @override
  String get ageTo => 'अंतिम तिथि';

  @override
  String get ageFutureDate => 'यह तारीख भविष्य की है।';

  @override
  String ageYearsUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'वर्ष',
    );
    return '$_temp0';
  }

  @override
  String ageDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'दिन',
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
      other: '$countString वर्ष',
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
      other: '$countString महीने',
      one: '1 महीना',
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
      other: '$countString दिन',
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
      other: '$countString सप्ताह',
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
      other: '$countString दिन में',
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
  String get ageNextBirthday => 'अगला जन्मदिन';

  @override
  String get ageBirthdayToday => 'आज 🎉';

  @override
  String get ageTotalMonths => 'कुल महीने';

  @override
  String get ageTotalWeeks => 'कुल सप्ताह';

  @override
  String get ageTotalDays => 'कुल दिन';

  @override
  String get ageWeeksLabel => 'सप्ताह';

  @override
  String get ageWeekdays => 'कार्यदिवस (सोम–शुक्र)';

  @override
  String get ageHours => 'घंटे';

  @override
  String get ageIncludingEnd => 'अंतिम तिथि सहित';

  @override
  String get unitFrom => 'मूल इकाई';

  @override
  String get unitTo => 'लक्ष्य इकाई';

  @override
  String get unitEnterValue => 'मान दर्ज करें';

  @override
  String get unitSwap => 'इकाइयां बदलें';

  @override
  String unitCategoryName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'length': 'लंबाई',
      'weight': 'वज़न',
      'temperature': 'तापमान',
      'area': 'क्षेत्रफल',
      'volume': 'आयतन',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String unitName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'millimeter': 'मिलीमीटर',
      'centimeter': 'सेंटीमीटर',
      'meter': 'मीटर',
      'kilometer': 'किलोमीटर',
      'inch': 'इंच',
      'foot': 'फ़ुट',
      'mile': 'मील',
      'gram': 'ग्राम',
      'kilogram': 'किलोग्राम',
      'ounce': 'औंस',
      'pound': 'पाउंड',
      'celsius': 'सेल्सियस',
      'fahrenheit': 'फ़ारेनहाइट',
      'kelvin': 'केल्विन',
      'squareMeter': 'वर्ग मीटर',
      'squareFoot': 'वर्ग फ़ुट',
      'acre': 'एकड़',
      'hectare': 'हेक्टेयर',
      'milliliter': 'मिलीलीटर',
      'liter': 'लीटर',
      'gallonUs': 'गैलन (अमेरिकी)',
      'fluidOunce': 'तरल औंस',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String get loanAmount => 'ऋण राशि';

  @override
  String get loanInterestRate => 'वार्षिक ब्याज दर';

  @override
  String get loanTenure => 'अवधि';

  @override
  String get loanTenureMonths => 'अवधि (महीने)';

  @override
  String get loanTenureYears => 'अवधि (वर्ष)';

  @override
  String get loanToggleMonths => 'महीने';

  @override
  String get loanToggleYears => 'वर्ष';

  @override
  String get loanEmpty => 'EMI निकालने के लिए ऊपर सही ऋण विवरण भरें';

  @override
  String get loanMonthlyEmi => 'मासिक EMI';

  @override
  String get loanPrincipal => 'मूलधन';

  @override
  String get loanTotalInterest => 'कुल ब्याज';

  @override
  String get loanTotalPayment => 'कुल भुगतान';

  @override
  String get loanBreakdown => 'विवरण';

  @override
  String get loanInterest => 'ब्याज';

  @override
  String loanInterestShare(String percent) {
    return '$percent ब्याज';
  }

  @override
  String get loanSchedule => 'भुगतान अनुसूची';

  @override
  String loanMonths(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString महीने',
      one: '1 महीना',
    );
    return '$_temp0';
  }

  @override
  String get loanColMonth => 'माह';

  @override
  String get loanColBalance => 'शेष';

  @override
  String get loanShowAll => 'सभी महीने दिखाएं';

  @override
  String get loanShowLess => 'कम दिखाएं';

  @override
  String get clockSearchHint => 'शहर या देश खोजें…';

  @override
  String get clockPinned => 'पिन किए गए';

  @override
  String get clockAllCities => 'सभी शहर';

  @override
  String clockOnWidget(int shown, int total) {
    final intl.NumberFormat shownNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String shownString = shownNumberFormat.format(shown);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'विजेट पर: $totalString में से $shownString';
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

    return 'विजेट पर: अधिकतम $maxString में से $shownString (और देखने के लिए आकार बढ़ाएं)';
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

    return 'होम-स्क्रीन विजेट शुरू में पहले $defaultRowsString दिखाता है — नीचे का किनारा खींचकर बड़ा करें तो $maxRowsString तक दिखेंगे।';
  }

  @override
  String get clockPin => 'पिन करें';

  @override
  String get clockUnpin => 'अनपिन करें';

  @override
  String get clockNoResults => 'कोई मिलता-जुलता शहर नहीं';

  @override
  String get speedSelectingServer => 'सर्वर चुना जा रहा है…';

  @override
  String get speedPhasePing => 'पिंग मापा जा रहा है';

  @override
  String get speedPhaseDownload => 'डाउनलोड स्पीड जाँची जा रही है';

  @override
  String get speedPhaseUpload => 'अपलोड स्पीड जाँची जा रही है';

  @override
  String get speedDownloadSpeed => 'डाउनलोड स्पीड';

  @override
  String get speedUploadSpeed => 'अपलोड स्पीड';

  @override
  String get speedRunAgain => 'फिर से';

  @override
  String get speedGo => 'शुरू';

  @override
  String speedMeasuredVia(String server) {
    return '$server के ज़रिए मापा गया';
  }

  @override
  String get speedPoweredBy =>
      'Cloudflare के स्पीड टेस्ट सर्वर का इस्तेमाल करता है';

  @override
  String get speedIdleHint =>
      'पिंग, डाउनलोड और अपलोड स्पीड मापने के लिए बटन दबाएँ।';

  @override
  String get speedPing => 'पिंग';

  @override
  String get speedResultsTitle => 'स्पीड टेस्ट के नतीजे';

  @override
  String get speedDownload => 'डाउनलोड';

  @override
  String get speedUpload => 'अपलोड';

  @override
  String speedConnectedIp(String ip) {
    return 'आपका IP: $ip';
  }

  @override
  String get speedErrorOffline =>
      'इंटरनेट कनेक्शन नहीं है। अपना Wi-Fi या मोबाइल डेटा जाँचें।';

  @override
  String get speedErrorTimeout =>
      'टेस्ट का समय खत्म हो गया। आपका कनेक्शन अस्थिर हो सकता है।';

  @override
  String get speedErrorFailed => 'टेस्ट विफल रहा। कृपया फिर से कोशिश करें।';

  @override
  String get pingErrorHostNotFound =>
      'होस्ट नहीं मिला। पता और अपना इंटरनेट कनेक्शन जाँचें।';

  @override
  String get pingErrorNoData => 'इस पते के लिए कोई जानकारी उपलब्ध नहीं है।';

  @override
  String get pingTabMyIp => 'मेरा IP';

  @override
  String get pingTabLookup => 'खोजें';

  @override
  String get pingTabPing => 'पिंग';

  @override
  String get pingYourPublicIp => 'आपका सार्वजनिक IP';

  @override
  String get pingFieldCity => 'शहर';

  @override
  String get pingFieldRegion => 'क्षेत्र';

  @override
  String get pingFieldCountry => 'देश';

  @override
  String get pingFieldIsp => 'ISP / संस्था';

  @override
  String get pingFieldTimezone => 'समय क्षेत्र';

  @override
  String get pingFieldLocation => 'निर्देशांक';

  @override
  String get pingFieldIp => 'IP पता';

  @override
  String get pingIpCopied => 'IP पता कॉपी हो गया';

  @override
  String get pingCopyIp => 'IP कॉपी करें';

  @override
  String get pingLookupHint => 'IP पता या होस्टनेम';

  @override
  String get pingLookupButton => 'खोजें';

  @override
  String get pingHostHint => 'होस्टनेम (जैसे google.com)';

  @override
  String get pingStartButton => 'पिंग करें';

  @override
  String pingHeader(String host, String ip) {
    return '$host ($ip) – TCP पोर्ट 443 से पिंग';
  }

  @override
  String get pingStatAvg => 'औसत';

  @override
  String get pingStatLoss => 'लॉस';

  @override
  String get pingStatSent => 'भेजे गए';

  @override
  String get pingTimeout => 'टाइमआउट';

  @override
  String get compassN => 'उ';

  @override
  String get compassNE => 'उपू';

  @override
  String get compassE => 'पू';

  @override
  String get compassSE => 'दपू';

  @override
  String get compassS => 'द';

  @override
  String get compassSW => 'दप';

  @override
  String get compassW => 'प';

  @override
  String get compassNW => 'उप';

  @override
  String get compassNorth => 'उत्तर';

  @override
  String get compassNortheast => 'उत्तर-पूर्व';

  @override
  String get compassEast => 'पूर्व';

  @override
  String get compassSoutheast => 'दक्षिण-पूर्व';

  @override
  String get compassSouth => 'दक्षिण';

  @override
  String get compassSouthwest => 'दक्षिण-पश्चिम';

  @override
  String get compassWest => 'पश्चिम';

  @override
  String get compassNorthwest => 'उत्तर-पश्चिम';

  @override
  String compassSemantics(String degrees, String direction) {
    return 'दिशा $degrees°, $direction';
  }

  @override
  String get compassHeadingMagnetic => 'चुंबकीय दिशा';

  @override
  String get compassUnavailable =>
      'इस डिवाइस में मैग्नेटोमीटर नहीं है, इसलिए कम्पास काम नहीं करेगा।';

  @override
  String get locationSavedHeader => 'सेव की गई लोकेशन';

  @override
  String locationSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString सेव की गईं',
      zero: 'अभी कोई नहीं',
    );
    return '$_temp0';
  }

  @override
  String locationEmpty(String save) {
    return 'अभी कोई लोकेशन सेव नहीं है।\nअपनी मौजूदा जगह सेव करने के लिए “$save” दबाएँ।';
  }

  @override
  String locationDeleted(String name) {
    return '“$name” हटा दिया गया';
  }

  @override
  String get locationSaveDialogTitle => 'लोकेशन सेव करें';

  @override
  String get locationNameLabel => 'नाम';

  @override
  String get locationNameHint => 'जैसे घर, ऑफ़िस…';

  @override
  String get locationNoteLabel => 'नोट (वैकल्पिक)';

  @override
  String get locationCurrent => 'मौजूदा लोकेशन';

  @override
  String get locationRefresh => 'लोकेशन अपडेट करें';

  @override
  String get locationLocating => 'आपकी लोकेशन खोजी जा रही है…';

  @override
  String get locationServicesOff =>
      'लोकेशन बंद है। आप कहाँ हैं, यह देखने के लिए इसे चालू करें।';

  @override
  String get locationPermissionDenied =>
      'आप कहाँ हैं, यह देखने के लिए लोकेशन की अनुमति दें।';

  @override
  String get locationPermissionDeniedForever =>
      'लोकेशन एक्सेस ब्लॉक है। इस टूल के लिए सेटिंग्स में अनुमति दें।';

  @override
  String get locationErrorTimeout =>
      'GPS सिग्नल नहीं मिला। खिड़की के पास या बाहर जाकर फिर से कोशिश करें।';

  @override
  String get locationAllow => 'अनुमति दें';

  @override
  String locationAccuracy(String meters) {
    return 'सटीकता: ±$meters मी.';
  }

  @override
  String get locationCoordsCopied => 'निर्देशांक कॉपी हो गए';

  @override
  String get locationCopyCoords => 'निर्देशांक कॉपी करें';

  @override
  String get locationOpenInMaps => 'मैप में खोलें';

  @override
  String get passwordYours => 'आपका पासवर्ड';

  @override
  String get passwordSelectType => 'कम से कम एक तरह के अक्षर चुनें';

  @override
  String get passwordStrength => 'मज़बूती';

  @override
  String get passwordWeak => 'कमज़ोर';

  @override
  String get passwordFair => 'ठीक-ठाक';

  @override
  String get passwordGood => 'अच्छा';

  @override
  String get passwordStrong => 'मज़बूत';

  @override
  String get passwordLength => 'लंबाई';

  @override
  String passwordChars(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString अक्षर',
    );
    return '$_temp0';
  }

  @override
  String get passwordInclude => 'शामिल करें';

  @override
  String get passwordUppercase => 'बड़े अक्षर';

  @override
  String get passwordLowercase => 'छोटे अक्षर';

  @override
  String get passwordNumbers => 'अंक';

  @override
  String get passwordSymbols => 'चिह्न';

  @override
  String get passwordCopied => 'पासवर्ड कॉपी हो गया';

  @override
  String get passwordGenerate => 'नया बनाएँ';

  @override
  String get hashModeText => 'टेक्स्ट';

  @override
  String get hashModeFile => 'फ़ाइल';

  @override
  String get hashAlgorithm => 'एल्गोरिदम';

  @override
  String get hashInputHint => 'हैश करने के लिए टेक्स्ट लिखें…';

  @override
  String get hashPickFile => 'फ़ाइल चुनने के लिए टैप करें';

  @override
  String get hashChange => 'बदलें';

  @override
  String get hashHashing => 'गणना हो रही है…';

  @override
  String get hashGenerate => 'हैश बनाएँ';

  @override
  String get hashFileError =>
      'यह फ़ाइल पढ़ी नहीं जा सकी। कोई दूसरी फ़ाइल आज़माएँ।';

  @override
  String get hashCopied => 'हैश कॉपी हो गया';

  @override
  String get hashCopy => 'हैश कॉपी करें';

  @override
  String get colorPickerFormats => 'रंग फ़ॉर्मेट';

  @override
  String get colorPickerHexLabel => 'HEX रंग';

  @override
  String get colorPickerHexInvalid => '6 हेक्स अंक डालें (0–9, A–F)';

  @override
  String get colorPickerApply => 'रंग लागू करें';

  @override
  String colorPickerCopied(String format) {
    return '$format कॉपी हो गया';
  }

  @override
  String get colorPickerPalette => 'क्विक पैलेट';

  @override
  String colorPickerSwatch(String hex) {
    return 'रंग $hex';
  }

  @override
  String get imgCompressPickHint => 'फ़ोटो चुनने या खींचने के लिए टैप करें';

  @override
  String imgCompressSupported(String formats) {
    return '$formats सपोर्टेड';
  }

  @override
  String get imgCompressChange => 'फ़ोटो बदलें';

  @override
  String get imgCompressModeQuality => 'क्वालिटी के अनुसार';

  @override
  String get imgCompressModeTarget => 'तय साइज़';

  @override
  String get imgCompressQuality => 'क्वालिटी';

  @override
  String get imgCompressSmallest => 'सबसे छोटी फ़ाइल';

  @override
  String get imgCompressBestQuality => 'सबसे अच्छी क्वालिटी';

  @override
  String get imgCompressQualityNote =>
      'बड़ी फ़ोटो का साइज़ भी लगभग 1920×1080 तक घटाया जाता है।';

  @override
  String imgCompressTargetUnder(String size) {
    return '$size से कम';
  }

  @override
  String get imgCompressTargetHint =>
      'सीमा के अंदर सबसे अच्छी क्वालिटी रखता है — नौकरी और सरकारी फ़ॉर्म में फ़ोटो अपलोड के लिए काम का।';

  @override
  String get imgCompressButton => 'फ़ोटो कंप्रेस करें';

  @override
  String get imgCompressCompressing => 'कंप्रेस हो रही है…';

  @override
  String get imgCompressSuccess => 'सफलतापूर्वक कंप्रेस हो गई!';

  @override
  String imgCompressFitsTarget(String size) {
    return 'हो गया — साइज़ $size से कम है';
  }

  @override
  String imgCompressMissedTarget(String size) {
    return '$size से कम नहीं हो सकी। यह सबसे छोटा वर्शन है जो हम बना सके।';
  }

  @override
  String get imgCompressStatOriginal => 'मूल';

  @override
  String get imgCompressStatCompressed => 'कंप्रेस्ड';

  @override
  String get imgCompressStatSaved => 'बचत';

  @override
  String get imgCompressFailed =>
      'यह फ़ोटो कंप्रेस नहीं हो सकी। कोई दूसरी आज़माएँ।';

  @override
  String get imgResizePresetPassport => 'पासपोर्ट 35×45 mm';

  @override
  String imgResizePresetSquare(String size) {
    return 'स्क्वेयर $size';
  }

  @override
  String imgResizePresetStory(String size) {
    return 'स्टोरी $size';
  }

  @override
  String imgResizePresetMax(String name, String px) {
    return '$name (अधिकतम $px)';
  }

  @override
  String get imgResizeChoosePhotos => 'फ़ोटो चुनें';

  @override
  String imgResizeSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो चुनी गईं',
      one: '1 फ़ोटो चुनी गई',
    );
    return '$_temp0';
  }

  @override
  String get imgResizePickHint => 'एक या कई चुनें — या उन्हें ऐप में शेयर करें';

  @override
  String get imgResizeChoose => 'चुनें';

  @override
  String get imgResizeChange => 'बदलें';

  @override
  String get imgResizePresets => 'प्रीसेट';

  @override
  String get imgResizeModePercent => 'प्रतिशत';

  @override
  String get imgResizeModeMaxSide => 'अधिकतम साइड';

  @override
  String get imgResizeModeExact => 'सटीक';

  @override
  String get imgResizeWidth => 'चौड़ाई (px)';

  @override
  String get imgResizeHeight => 'ऊँचाई (px)';

  @override
  String get imgResizeCrop => 'फ़िट करने के लिए क्रॉप करें (बिना खिंचाव)';

  @override
  String get imgResizeFormat => 'फ़ॉर्मेट';

  @override
  String get imgResizeQuality => 'क्वालिटी';

  @override
  String get imgResizeButton => 'साइज़ बदलें';

  @override
  String imgResizeSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो गैलरी में सेव करें',
      one: '1 फ़ोटो गैलरी में सेव करें',
    );
    return '$_temp0';
  }

  @override
  String get imgResizeChangeSettings => 'सेटिंग बदलें';

  @override
  String imgResizeInvalidSize(int min, int max) {
    return '$min और $max के बीच चौड़ाई और ऊँचाई डालें।';
  }

  @override
  String imgResizeFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो पढ़ी नहीं जा सकीं।',
      one: '1 फ़ोटो पढ़ी नहीं जा सकी।',
    );
    return '$_temp0';
  }

  @override
  String imgResizeSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो आपकी गैलरी में सेव हुईं',
      one: '1 फ़ोटो आपकी गैलरी में सेव हुई',
    );
    return '$_temp0';
  }

  @override
  String get imgEnhanceEmptyTitle => 'अपनी फ़ोटो एडिट करें';

  @override
  String get imgEnhanceEmptyBody =>
      'ब्राइटनेस, कंट्रास्ट, सैचुरेशन और शार्पनेस एडजस्ट करें, प्रीसेट लगाएँ, घुमाएँ और पलटें — सब आपके डिवाइस पर।';

  @override
  String get imgEnhanceFineControls => 'बारीक कंट्रोल';

  @override
  String get imgEnhanceApplying => 'लागू हो रहा है…';

  @override
  String get imgEnhanceChange => 'बदलें';

  @override
  String get imgEnhancePresets => 'प्रीसेट';

  @override
  String get imgEnhanceTransform => 'ट्रांसफ़ॉर्म';

  @override
  String get imgEnhanceAdjustments => 'एडजस्टमेंट';

  @override
  String get imgEnhanceRotate => 'घुमाएँ';

  @override
  String get imgEnhanceFlipH => 'क्षैतिज पलटें';

  @override
  String get imgEnhanceFlipV => 'लंबवत पलटें';

  @override
  String get imgEnhanceBrightness => 'ब्राइटनेस';

  @override
  String get imgEnhanceContrast => 'कंट्रास्ट';

  @override
  String get imgEnhanceSaturation => 'सैचुरेशन';

  @override
  String get imgEnhanceSharpen => 'शार्पन';

  @override
  String get imgEnhanceBlur => 'ब्लर';

  @override
  String get imgEnhanceQuality => 'क्वालिटी';

  @override
  String get imgEnhanceApply => 'लागू करें';

  @override
  String get imgEnhanceFailed =>
      'बदलाव लागू नहीं हो सके। कोई दूसरी फ़ोटो आज़माएँ।';

  @override
  String imgEnhanceResult(String before, String after, String change) {
    return 'हो गया! $before → $after ($change)';
  }

  @override
  String get imgEnhancePresetOriginal => 'मूल';

  @override
  String get imgEnhancePresetVivid => 'चटक';

  @override
  String get imgEnhancePresetCool => 'कूल';

  @override
  String get imgEnhancePresetWarm => 'वॉर्म';

  @override
  String get imgEnhancePresetDramatic => 'ड्रामैटिक';

  @override
  String get imgEnhancePresetFade => 'फ़ेड';

  @override
  String get imgEnhancePresetVintage => 'विंटेज';

  @override
  String get imgEnhancePresetNoir => 'ब्लैक एंड व्हाइट';

  @override
  String get upscalerNewImage => 'नई फ़ोटो';

  @override
  String get upscalerIntro =>
      'डिवाइस पर AI से फ़ोटो को 4× तक बड़ा करें। मॉडल एक बार डाउनलोड होने के बाद ऑफ़लाइन काम करता है — चेहरों के लिए वैकल्पिक क्लाउड मोड।';

  @override
  String get upscalerBadgeOnDevice => 'डिवाइस पर AI';

  @override
  String get upscalerBadgeOffline => 'ऑफ़लाइन काम करता है';

  @override
  String get upscalerBadgeUpTo4x => '4× तक बड़ा';

  @override
  String get upscalerBadgeGpu => 'GPU से तेज़';

  @override
  String get upscalerBestResults =>
      'सबसे अच्छे नतीजे: कम रिज़ॉल्यूशन की फ़ोटो, पुराने स्कैन, थंबनेल और कंप्रेस्ड JPEG।';

  @override
  String get upscalerChangeImage => 'फ़ोटो बदलें';

  @override
  String get upscalerTabOriginal => 'मूल';

  @override
  String get upscalerTabUpscaled => 'AI से बड़ी';

  @override
  String get upscalerStageStarting => 'शुरू हो रहा है…';

  @override
  String get upscalerStageConnecting => 'AI सर्वर से जुड़ रहे हैं…';

  @override
  String get upscalerStageOnDevice => 'इसी डिवाइस पर प्रोसेस हो रहा है…';

  @override
  String get upscalerStageCloudUnavailable =>
      'क्लाउड उपलब्ध नहीं — इसी डिवाइस पर प्रोसेस हो रहा है…';

  @override
  String get upscalerStageUploading => 'फ़ोटो अपलोड हो रही है…';

  @override
  String get upscalerStageRestoringFaces =>
      'AI चेहरे और बारीकियाँ सुधार रहा है…';

  @override
  String get upscalerStagePreparing => 'फ़ोटो तैयार हो रही है…';

  @override
  String get upscalerStageLoadingModel => 'AI मॉडल लोड हो रहा है…';

  @override
  String get upscalerStageDownloadingModel =>
      'AI मॉडल डाउनलोड हो रहा है (सिर्फ़ एक बार)…';

  @override
  String get upscalerStageFallback => 'सामान्य अपस्केलिंग इस्तेमाल हो रही है…';

  @override
  String get upscalerStageDecoding => 'फ़ोटो पढ़ी जा रही है…';

  @override
  String upscalerStageResizing(String from, String to) {
    return 'इनपुट का साइज़ बदल रहे हैं ($from → $to)…';
  }

  @override
  String get upscalerStageDenoising => 'नॉइज़ कम कर रहे हैं…';

  @override
  String upscalerStageUpscaling(String factor) {
    return 'बड़ा कर रहे हैं ($factor×)…';
  }

  @override
  String upscalerStageAiTiles(String done, String total) {
    return 'AI से बड़ा कर रहे हैं… ($done/$total)';
  }

  @override
  String get upscalerStageSharpening => 'शार्प कर रहे हैं…';

  @override
  String get upscalerStageColour => 'रंग एडजस्ट कर रहे हैं…';

  @override
  String get upscalerStageSaving => 'सेव हो रहा है…';

  @override
  String get upscalerStageDone => 'हो गया!';

  @override
  String get upscalerLoadingModelHint =>
      'AI मॉडल लोड हो रहा है (सिर्फ़ पहली बार)';

  @override
  String get upscalerTime4x =>
      'फ़ोटो के साइज़ के अनुसार 4× में 15–60 s लग सकते हैं।';

  @override
  String get upscalerTime2x => '2× में आमतौर पर 5–20 s लगते हैं।';

  @override
  String upscalerDoneIn(String seconds) {
    return '$seconds s में बड़ी हुई';
  }

  @override
  String get upscalerStatResolution => 'रिज़ॉल्यूशन';

  @override
  String get upscalerStatFileSize => 'फ़ाइल साइज़';

  @override
  String get upscalerStatScale => 'स्केल';

  @override
  String get upscalerShareSubject => 'AI से बड़ी की गई फ़ोटो';

  @override
  String get upscalerFallbackModelUnavailable =>
      'AI मॉडल को एक बार इंटरनेट चाहिए — सामान्य अपस्केलिंग इस्तेमाल की गई';

  @override
  String get upscalerFallbackModelFailed =>
      'AI मॉडल इस डिवाइस पर नहीं चल सका — सामान्य अपस्केलिंग इस्तेमाल की गई';

  @override
  String get upscalerFallbackCloud =>
      'क्लाउड सर्वर उपलब्ध नहीं — इसी डिवाइस पर प्रोसेस किया गया';

  @override
  String get upscalerSettings => 'AI सेटिंग';

  @override
  String get upscalerFactorLabel => 'बड़ा करने का अनुपात';

  @override
  String get upscalerFactor2xDesc => 'तेज़ — ज़्यादातर फ़ोटो के लिए बढ़िया';

  @override
  String get upscalerFactor4xDesc => 'सबसे अच्छी क्वालिटी — धीमा';

  @override
  String get upscalerOptimiseFor => 'किसके लिए बेहतर करें';

  @override
  String get upscalerModeAuto => 'ऑटो';

  @override
  String get upscalerModePhoto => 'फ़ोटो';

  @override
  String get upscalerModeIllustration => 'इलस्ट्रेशन';

  @override
  String get upscalerModeFace => 'चेहरे की बारीकी';

  @override
  String get upscalerDenoise => 'पहले नॉइज़ हटाएँ';

  @override
  String get upscalerDenoiseTip => 'बड़ा करने से पहले JPEG नॉइज़ कम करता है';

  @override
  String get upscalerSharpen => 'बाद में शार्प करें';

  @override
  String get upscalerSharpenTip => 'बड़ा करने के बाद स्पष्टता बढ़ाता है';

  @override
  String get upscalerCloudTitle => 'क्लाउड से चेहरे सुधारें';

  @override
  String get upscalerCloudOn =>
      'आपकी फ़ोटो प्रोसेसिंग के लिए हमारे सर्वर पर अपलोड होती है।';

  @override
  String get upscalerCloudOff => 'बंद — फ़ोटो इसी डिवाइस पर रहती हैं।';

  @override
  String get upscalerCloudDialogTitle => 'फ़ोटो क्लाउड पर भेजें?';

  @override
  String get upscalerCloudDialogBody =>
      'क्लाउड मोड आपकी चुनी हुई फ़ोटो को एन्क्रिप्टेड कनेक्शन से हमारे अपस्केलिंग सर्वर पर अपलोड करता है, ताकि उसे बड़े AI मॉडल (GFPGAN + Real-ESRGAN) से प्रोसेस किया जा सके।\n\n• सिर्फ़ वही फ़ोटो भेजी जाती है जिसे आप बड़ा करना चुनते हैं।\n• फ़ोटो मेमोरी में प्रोसेस होती है और नतीजा लौटने के बाद रखी नहीं जाती।\n• इसके साथ कोई अकाउंट या निजी जानकारी नहीं भेजी जाती।\n\nआप इसे कभी भी बंद कर सकते हैं। डिवाइस मोड पूरी तरह ऑफ़लाइन काम करता है।';

  @override
  String get upscalerCloudKeepLocal => 'डिवाइस पर ही रखें';

  @override
  String get upscalerCloudEnable => 'क्लाउड चालू करें';

  @override
  String get upscalerUpscale => 'AI से बड़ा करें';

  @override
  String get upscalerUpscaleAgain => 'नई सेटिंग से फिर बड़ा करें';

  @override
  String get upscalerFailed => 'बड़ा नहीं हो सका';

  @override
  String get upscalerErrorTooLarge =>
      'फ़ोटो बहुत बड़ी है। छोटी फ़ोटो या 2× आज़माएँ।';

  @override
  String get upscalerErrorUnreadable =>
      'यह फ़ोटो पढ़ी नहीं जा सकी। JPG या PNG फ़ाइल इस्तेमाल करें।';

  @override
  String get upscalerErrorNetwork =>
      'नेटवर्क टाइमआउट। कनेक्शन जाँचें या क्लाउड मोड बंद करें।';

  @override
  String get videoPickHint => 'वीडियो चुनने के लिए टैप करें';

  @override
  String videoProbeInfo(String format, String duration) {
    return 'फ़ॉर्मेट: $format · अवधि: $duration';
  }

  @override
  String get videoOutputFormat => 'आउटपुट फ़ॉर्मेट';

  @override
  String get videoFmtMostCompatible => 'सबसे ज़्यादा संगत';

  @override
  String get videoFmtApple => 'Apple / QuickTime';

  @override
  String get videoFmtFlexible => 'लचीला कंटेनर';

  @override
  String get videoFmtLegacy => 'पुराना फ़ॉर्मेट';

  @override
  String get videoFmtGif => 'एनिमेटेड (बिना आवाज़)';

  @override
  String get videoFmtAudioOnly => 'सिर्फ़ ऑडियो';

  @override
  String get videoFmtAudioAac => 'सिर्फ़ ऑडियो (AAC)';

  @override
  String get videoFmtAudioRaw => 'सिर्फ़ ऑडियो (रॉ)';

  @override
  String get videoFmtWav => 'बिना कंप्रेस ऑडियो';

  @override
  String videoConvertingPercent(int percent) {
    return 'कन्वर्ट हो रहा है… $percent%';
  }

  @override
  String get videoConvertingWait =>
      'कन्वर्ट हो रहा है… इसमें थोड़ा समय लग सकता है';

  @override
  String get videoDone => 'कन्वर्ज़न पूरा!';

  @override
  String get videoErrorUnsupported =>
      'कन्वर्ज़न विफल। हो सकता है यह फ़ॉर्मेट आपके डिवाइस पर सपोर्टेड न हो।';

  @override
  String get videoConvertAnother => 'एक और कन्वर्ट करें';

  @override
  String get videoPickButton => 'वीडियो फ़ाइल चुनें';

  @override
  String videoConvertTo(String format) {
    return '$format में कन्वर्ट करें';
  }

  @override
  String get docScanAndroidOnly =>
      'डॉक्यूमेंट स्कैनर केवल Android पर उपलब्ध है।';

  @override
  String docScanNeedsPlayServices(String details) {
    return 'स्कैनर शुरू नहीं हो सका। इसके लिए Google Play सेवाएँ चाहिए — पक्का करें कि वे अपडेट हैं। ($details)';
  }

  @override
  String get docScanStartFailed =>
      'स्कैनर शुरू नहीं हो सका। कृपया फिर से कोशिश करें।';

  @override
  String get docScanPdfSaved =>
      'PDF डाउनलोड्स में सेव हो गया — इसे मेरी फ़ाइलें में देखें';

  @override
  String docScanPagesSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पेज गैलरी में सेव हुए',
      one: '1 पेज गैलरी में सेव हुआ',
    );
    return '$_temp0';
  }

  @override
  String get docScanHeadline => 'कागज़ को साफ़ PDF में स्कैन करें';

  @override
  String get docScanIntro =>
      'किनारे अपने-आप पहचाने जाते हैं। जितने चाहें पेज जोड़ें, सेव करने से पहले क्रॉप करें, घुमाएँ और फ़िल्टर लगाएँ।';

  @override
  String get docScanScanning => 'स्कैन हो रहा है…';

  @override
  String get docScanStart => 'स्कैन शुरू करें';

  @override
  String get docScanScannedPages => 'स्कैन किए गए पेज';

  @override
  String docScanPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पेज',
      one: '1 पेज',
    );
    return '$_temp0';
  }

  @override
  String get docScanSavePdf => 'PDF सेव करें';

  @override
  String get docScanSharePdf => 'PDF शेयर करें';

  @override
  String get docScanCopyText => 'टेक्स्ट कॉपी करें';

  @override
  String get docScanSaveJpg => 'JPG के रूप में सेव करें';

  @override
  String get docScanAnother => 'दूसरा दस्तावेज़ स्कैन करें';

  @override
  String get pdfToolsChoosePdf => 'PDF चुनें';

  @override
  String get pdfToolsChooseHint =>
      'या किसी भी ऐप से Utility Toolbox में PDF शेयर करें';

  @override
  String get pdfToolsReading => 'पढ़ा जा रहा है…';

  @override
  String get pdfToolsLockedShort => 'पासवर्ड से सुरक्षित';

  @override
  String pdfToolsPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पेज',
      one: '1 पेज',
    );
    return '$_temp0';
  }

  @override
  String get pdfToolsChange => 'बदलें';

  @override
  String get pdfToolsResultReady => 'आपका PDF तैयार है';

  @override
  String get pdfToolsSaveDownloads => 'डाउनलोड्स में सेव करें';

  @override
  String get pdfToolsStartOver => 'फिर से शुरू करें';

  @override
  String get pdfToolsSavedToDownloads =>
      'डाउनलोड्स में सेव हो गया — इसे मेरी फ़ाइलें में देखें';

  @override
  String get pdfToolsSharedInstead => 'इसकी जगह शेयर मेनू खोला गया';

  @override
  String get pdfToolsRangeEmpty => 'कम से कम एक पेज डालें।';

  @override
  String pdfToolsRangeInvalid(String part) {
    return '“$part” कोई पेज या रेंज नहीं है (जैसे 1-3, 5)।';
  }

  @override
  String pdfToolsRangeOutside(String part, int count) {
    return '“$part” 1–$count के बाहर है।';
  }

  @override
  String get pdfToolsInvalidPdf => 'यह फ़ाइल सही PDF नहीं लगती।';

  @override
  String pdfToolsLockedUnlockFirst(String tool) {
    return 'यह PDF पासवर्ड से सुरक्षित है। पहले $tool से इसे अनलॉक करें।';
  }

  @override
  String pdfToolsPagesLabel(int count) {
    return 'पेज (1–$count)';
  }

  @override
  String pdfToolsPagesHint(String example) {
    return 'जैसे $example';
  }

  @override
  String pdfToolsPageN(int number) {
    return 'पेज $number';
  }

  @override
  String get pdfToolsDownload => 'डाउनलोड';

  @override
  String get pdfToolsSavedNotification =>
      'डाउनलोड्स में सेव हो गया — खोलने के लिए सूचना देखें।';

  @override
  String get pdfToolsShareToSave =>
      'शेयर मेनू खुला — चुनें कि फ़ाइल कहाँ सेव करनी है।';

  @override
  String pdfToolsSelectedFile(String name) {
    return 'चुनी गई फ़ाइल: $name';
  }

  @override
  String pdfToolsSize(String size) {
    return 'आकार: $size';
  }

  @override
  String get pdfToolsDragToReorder => 'क्रम बदलने के लिए खींचें';

  @override
  String get pdfHomeTitle => 'PDF टूलकिट';

  @override
  String get pdfHomeSection => 'PDF टूल्स';

  @override
  String get pdfHomeSubtitle => 'अपने दस्तावेज़ बनाएँ, जोड़ें और बेहतर करें';

  @override
  String get pdfPasswordEnter => 'पासवर्ड डालें।';

  @override
  String pdfPasswordTooShort(int count) {
    return 'कम से कम $count अक्षर इस्तेमाल करें।';
  }

  @override
  String get pdfPasswordMismatch => 'पासवर्ड मेल नहीं खाते।';

  @override
  String get pdfPasswordWrong => 'यह पासवर्ड सही नहीं है।';

  @override
  String get pdfPasswordLockFailed => 'यह PDF लॉक नहीं हो सका।';

  @override
  String get pdfPasswordUnlockFailed => 'यह PDF अनलॉक नहीं हो सका।';

  @override
  String get pdfPasswordLockedDone => 'आपका PDF लॉक हो गया';

  @override
  String get pdfPasswordRemovedDone => 'पासवर्ड हटा दिया गया';

  @override
  String get pdfPasswordAlreadyLocked =>
      'इस PDF पर पहले से पासवर्ड है। पहले इसे अनलॉक करें।';

  @override
  String get pdfPasswordNotLocked =>
      'इस PDF पर कोई पासवर्ड नहीं है — अनलॉक करने को कुछ नहीं।';

  @override
  String get pdfPasswordNew => 'नया पासवर्ड';

  @override
  String get pdfPasswordCurrent => 'मौजूदा पासवर्ड';

  @override
  String get pdfPasswordRepeat => 'पासवर्ड दोबारा डालें';

  @override
  String get pdfPasswordShow => 'पासवर्ड दिखाएँ';

  @override
  String get pdfPasswordHide => 'पासवर्ड छिपाएँ';

  @override
  String get pdfPasswordWarning =>
      'यह पासवर्ड सँभालकर रखें — इसे वापस नहीं पाया जा सकता। AES-256 से एन्क्रिप्टेड।';

  @override
  String get pdfSplitExtract => 'पेज निकालें';

  @override
  String get pdfSplitRemove => 'पेज हटाएँ';

  @override
  String get pdfSplitPagesHelp =>
      'कॉमा और रेंज इस्तेमाल करें। “8-” का मतलब पेज 8 से आख़िर तक।';

  @override
  String get pdfSplitRemovesAll => 'इससे सारे पेज हट जाएँगे।';

  @override
  String get pdfSplitFailed => 'यह PDF बाँटा नहीं जा सका।';

  @override
  String get pdfToImagesFailed => 'यह PDF रेंडर नहीं हो सका।';

  @override
  String pdfToImagesSaved(int saved, int total) {
    return '$total में से $saved इमेज गैलरी में सेव हुईं';
  }

  @override
  String get pdfToImagesAllPages => 'सभी पेज';

  @override
  String get pdfToImagesConvert => 'JPG में बदलें';

  @override
  String pdfToImagesRendered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पेज तैयार…',
      one: '1 पेज तैयार…',
    );
    return '$_temp0';
  }

  @override
  String pdfToImagesRenderedOf(int count, int total) {
    return '$total में से $count पेज तैयार…';
  }

  @override
  String pdfToImagesSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count इमेज गैलरी में सेव करें',
      one: '1 इमेज गैलरी में सेव करें',
    );
    return '$_temp0';
  }

  @override
  String get pdfCompressButton => 'कंप्रेस करें';

  @override
  String get pdfCompressWorking => 'PDF कंप्रेस हो रहा है…';

  @override
  String pdfCompressOriginalSize(String size) {
    return 'मूल आकार: $size';
  }

  @override
  String get pdfCompressIntro =>
      'एक PDF फ़ाइल चुनें। ज़्यादा इमेज वाले दस्तावेज़ों पर कंप्रेशन सबसे अच्छा काम करता है।';

  @override
  String get pdfCompressLow => 'कम';

  @override
  String get pdfCompressMedium => 'मध्यम';

  @override
  String get pdfCompressHigh => 'ज़्यादा';

  @override
  String get pdfCompressFailed => 'यह PDF कंप्रेस नहीं हो सका।';

  @override
  String pdfCompressBefore(String size) {
    return 'पहले: $size';
  }

  @override
  String pdfCompressAfter(String size) {
    return 'बाद में: $size';
  }

  @override
  String get pdfMergeButton => 'जोड़ें';

  @override
  String get pdfMergeWorking => 'PDF जोड़े जा रहे हैं…';

  @override
  String get pdfMergePick => 'PDF फ़ाइलें चुनें';

  @override
  String get pdfMergeIntro => 'जोड़ने के लिए कम से कम दो PDF फ़ाइलें चुनें।';

  @override
  String get pdfMergeFailed =>
      'PDF जोड़े नहीं जा सके। हो सकता है कोई फ़ाइल पढ़ने लायक न हो।';

  @override
  String pdfMergeResult(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'जोड़ा गया PDF ($count पेज)',
      one: 'जोड़ा गया PDF (1 पेज)',
    );
    return '$_temp0';
  }

  @override
  String get imageToPdfCreate => 'PDF बनाएँ';

  @override
  String get imageToPdfWorking => 'PDF बन रहा है…';

  @override
  String get imageToPdfPick => 'इमेज चुनें';

  @override
  String get imageToPdfIntro => 'बदलने के लिए एक या ज़्यादा इमेज चुनें।';

  @override
  String get imageToPdfFailed => 'PDF नहीं बन सका। कृपया दूसरी इमेज आज़माएँ।';

  @override
  String imageToPdfReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF तैयार ($count पेज)',
      one: 'PDF तैयार (1 पेज)',
    );
    return '$_temp0';
  }

  @override
  String get qrScanNoCodeInPhoto =>
      'इस फ़ोटो में कोई QR कोड या बारकोड नहीं मिला।';

  @override
  String get qrScanPhotoFailed => 'यह फ़ोटो पढ़ी नहीं जा सकी।';

  @override
  String qrScanResultTitle(String type) {
    return 'स्कैन हुआ ($type)';
  }

  @override
  String get qrScanFromPhoto => 'फ़ोटो से स्कैन करें';

  @override
  String get qrScanCameraNeeded =>
      'QR कोड और बारकोड स्कैन करने के लिए कैमरे की अनुमति चाहिए।';

  @override
  String get qrScanCameraError =>
      'कैमरा शुरू नहीं हो सका। दूसरे कैमरा ऐप बंद करके फिर कोशिश करें।';

  @override
  String get qrScanTorchOn => 'फ़्लैशलाइट चालू करें';

  @override
  String get qrScanTorchOff => 'फ़्लैशलाइट बंद करें';

  @override
  String get qrScanTypeLink => 'लिंक';

  @override
  String get qrScanTypeWifi => 'वाई-फ़ाई';

  @override
  String get qrScanTypeContact => 'संपर्क';

  @override
  String get qrScanTypeText => 'टेक्स्ट';

  @override
  String get qrGenInputLabel => 'टेक्स्ट या URL';

  @override
  String get qrGenInputHint => 'कोड में डालने वाला कंटेंट लिखें';

  @override
  String get qrGenPreviewLabel => 'QR कोड प्रीव्यू';

  @override
  String get qrGenEmpty => 'अपना QR कोड देखने के लिए ऊपर टेक्स्ट लिखें।';

  @override
  String get qrGenSaveGallery => 'गैलरी में सेव करें';

  @override
  String get qrHomeTitle => 'QR और बारकोड';

  @override
  String get qrHomeTabScan => 'स्कैन';

  @override
  String get qrHomeTabCreate => 'बनाएँ';

  @override
  String get qrHomeScanTitle => 'कोड स्कैन करें';

  @override
  String get qrHomeScanBody =>
      'तुरंत स्कैन करने के लिए कैमरा QR कोड या बारकोड की ओर करें।';

  @override
  String get qrHomeBadgeInstant => 'तुरंत';

  @override
  String get qrHomeBadgeHistory => 'सेव हिस्ट्री';

  @override
  String get qrHomeStartScan => 'स्कैन शुरू करें';

  @override
  String get qrHomeCreateTitle => 'कोड बनाएँ';

  @override
  String get qrHomeCreateBody =>
      'टेक्स्ट या URL से QR कोड बनाएँ, फिर उसे सेव या शेयर करें।';

  @override
  String get qrHomeBadgeShare => 'कहीं भी शेयर करें';

  @override
  String get qrHomeBadgeImage => 'इमेज के रूप में सेव';

  @override
  String get qrHomeOpenGenerator => 'जनरेटर खोलें';

  @override
  String get qrHistoryTitle => 'स्कैन हिस्ट्री';

  @override
  String get qrHistoryMore => 'और विकल्प';

  @override
  String get qrHistoryEmpty => 'स्कैन किए गए कोड यहाँ दिखेंगे।';

  @override
  String get wifiQrPlaceholder => 'QR बनाने के लिए\nवाई-फ़ाई की जानकारी डालें';

  @override
  String get wifiQrPreviewLabel => 'वाई-फ़ाई QR कोड';

  @override
  String get wifiQrNetworkDetails => 'नेटवर्क की जानकारी';

  @override
  String get wifiQrSsidLabel => 'नेटवर्क का नाम (SSID)';

  @override
  String get wifiQrSsidHint => 'मेरा होम वाई-फ़ाई';

  @override
  String get wifiQrPasswordLabel => 'पासवर्ड';

  @override
  String get wifiQrPasswordHint => 'पासवर्ड डालें';

  @override
  String get wifiQrShowPassword => 'पासवर्ड दिखाएँ';

  @override
  String get wifiQrHidePassword => 'पासवर्ड छिपाएँ';

  @override
  String get wifiQrSecurity => 'सुरक्षा';

  @override
  String get wifiQrSecurityNone => 'कोई नहीं (खुला)';

  @override
  String get wifiQrHidden => 'छिपा हुआ नेटवर्क';

  @override
  String get wifiQrHiddenHint => 'अगर नेटवर्क का नाम नहीं दिखता तो चालू करें';

  @override
  String get wifiQrSaveImage => 'इमेज सेव करें';

  @override
  String get wifiQrInfo =>
      'जो भी यह QR कोड स्कैन करेगा, वह अपने-आप आपके वाई-फ़ाई से जुड़ जाएगा।';

  @override
  String get wifiQrShareText =>
      'मेरे वाई-फ़ाई से जुड़ने के लिए यह QR कोड स्कैन करें!';

  @override
  String get ocrCameraDenied =>
      'कैमरे की अनुमति नहीं मिली। अनुमति देने के लिए सेटिंग्स खोलें।';

  @override
  String get ocrCameraRequired => 'फ़ोटो लेने के लिए कैमरे की अनुमति चाहिए।';

  @override
  String get ocrTimeout =>
      'पढ़ने में बहुत समय लगा — टेक्स्ट मॉडल शायद अभी डाउनलोड हो रहा है। एक बार वाई-फ़ाई से जुड़ें या फिर कोशिश करें।';

  @override
  String get ocrFailed =>
      'इस इमेज से टेक्स्ट नहीं पढ़ा जा सका। ज़्यादा साफ़ फ़ोटो आज़माएँ।';

  @override
  String get ocrPreparing => 'इमेज तैयार हो रही है…';

  @override
  String get ocrScanning => 'टेक्स्ट पढ़ा जा रहा है…';

  @override
  String get ocrScriptLabel => 'लिपि';

  @override
  String get ocrScriptHint =>
      'वह लिपि चुनें जिसमें आपका टेक्स्ट लिखा है। अरबी, उर्दू और बांग्ला अभी नहीं पढ़ी जा सकतीं।';

  @override
  String get ocrScriptLatin => 'लैटिन (अंग्रेज़ी, स्पैनिश…)';

  @override
  String get ocrScriptDevanagari => 'देवनागरी (हिंदी, मराठी…)';

  @override
  String get ocrScriptChinese => 'चीनी';

  @override
  String get ocrScriptJapanese => 'जापानी';

  @override
  String get ocrScriptKorean => 'कोरियाई';

  @override
  String get ocrIdleTitle => 'किसी भी इमेज से टेक्स्ट निकालें';

  @override
  String get ocrIdleBody =>
      'कैमरा लगाएँ या फ़ोटो चुनें — टेक्स्ट तुरंत आपके फ़ोन पर ही निकल जाता है।';

  @override
  String get ocrBadgeOnDevice => 'डिवाइस पर AI';

  @override
  String get ocrBadgeLocal => 'लोकल प्रोसेसिंग';

  @override
  String get ocrBadgeBlocks => 'ब्लॉक के हिसाब से कॉपी';

  @override
  String get ocrUseCamera => 'कैमरा इस्तेमाल करें';

  @override
  String get ocrChooseGallery => 'गैलरी से चुनें';

  @override
  String get ocrOnDeviceNote => 'डिवाइस पर · अपलोड की ज़रूरत नहीं';

  @override
  String get ocrTabImage => 'इमेज';

  @override
  String get ocrTabText => 'टेक्स्ट';

  @override
  String get ocrTapBlockHint =>
      'कॉपी करने के लिए हाइलाइट किए ब्लॉक पर टैप करें';

  @override
  String get ocrBlockTitle => 'ब्लॉक टेक्स्ट';

  @override
  String ocrBlockLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count लाइनें · कॉपी के लिए टैप करें',
      one: '1 लाइन · कॉपी के लिए टैप करें',
    );
    return '$_temp0';
  }

  @override
  String get ocrCopyBlock => 'ब्लॉक कॉपी करें';

  @override
  String get ocrBlockCopied => 'ब्लॉक कॉपी हो गया';

  @override
  String get ocrCopyEntireBlock => 'पूरा ब्लॉक कॉपी करें';

  @override
  String get ocrCopyLine => 'लाइन कॉपी करें';

  @override
  String get ocrNoText => 'कोई टेक्स्ट नहीं मिला — ज़्यादा साफ़ फ़ोटो आज़माएँ।';

  @override
  String get ocrQuickCopy => 'हिस्से के हिसाब से झटपट कॉपी';

  @override
  String ocrBlockNCopied(int number) {
    return 'ब्लॉक $number कॉपी हो गया';
  }

  @override
  String get ocrDoneEditing => 'एडिटिंग पूरी';

  @override
  String get ocrEditText => 'टेक्स्ट एडिट करें';

  @override
  String get ocrAllCopied => 'पूरा टेक्स्ट कॉपी हो गया';

  @override
  String get ocrCopyAll => 'सब कॉपी करें';

  @override
  String get ocrScanAgain => 'स्कैन';

  @override
  String ocrStatLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count लाइनें',
      one: '1 लाइन',
    );
    return '$_temp0';
  }

  @override
  String ocrStatWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count शब्द',
      one: '1 शब्द',
    );
    return '$_temp0';
  }

  @override
  String ocrStatChars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count अक्षर',
      one: '1 अक्षर',
    );
    return '$_temp0';
  }

  @override
  String get wordPdfNoText =>
      'इस दस्तावेज़ में निकालने लायक कोई टेक्स्ट नहीं मिला।';

  @override
  String get wordPdfInfo =>
      '.docx फ़ाइलों को PDF में बदलता है। टेक्स्ट बना रहता है; जटिल लेआउट (टेबल, इमेज) अलग दिख सकते हैं।';

  @override
  String get wordPdfOpeningPicker => 'फ़ाइल पिकर खुल रहा है…';

  @override
  String wordPdfConverting(int percent) {
    return 'बदला जा रहा है… $percent%';
  }

  @override
  String get wordPdfDone => 'बदलाव पूरा हुआ';

  @override
  String get wordPdfTapToPick => '.docx फ़ाइल चुनने के लिए टैप करें';

  @override
  String get wordPdfSupports => '.docx फ़ॉर्मैट सपोर्ट करता है';

  @override
  String get wordPdfFailed =>
      'बदलाव नहीं हो सका। फ़ाइल ख़राब हो सकती है या .docx दस्तावेज़ नहीं है।';

  @override
  String get wordPdfFontsOffline =>
      'इस PDF में कुछ टेक्स्ट (जैसे हिंदी, उर्दू, अरबी, बांग्ला या सिरिलिक) नहीं है। इसका फ़ॉन्ट सिर्फ़ एक बार डाउनलोड होता है — इंटरनेट से जुड़ें और फिर से बदलें।';

  @override
  String get wordPdfConvertAnother => 'दूसरी फ़ाइल बदलें';

  @override
  String get wordPdfPick => '.docx फ़ाइल चुनें';

  @override
  String get wordPdfStep1Title => 'अपनी Word फ़ाइल चुनें';

  @override
  String get wordPdfStep1Desc => 'डिवाइस स्टोरेज से एक .docx फ़ाइल चुनें।';

  @override
  String get wordPdfStep2Title => 'अपने-आप बदलाव';

  @override
  String get wordPdfStep2Desc =>
      'टेक्स्ट निकालकर A4 PDF पेजों पर सजाया जाता है।';

  @override
  String get wordPdfStep3Title => 'शेयर या सेव करें';

  @override
  String get wordPdfStep3Desc =>
      'PDF को किसी भी ऐप, ईमेल या क्लाउड स्टोरेज पर शेयर करें।';

  @override
  String get wordPdfReady => 'PDF तैयार';
}
