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

  @override
  String get toolBgRemoverTitle => 'Remove Background';

  @override
  String get toolBgRemoverDesc => 'Cut out people and objects in one tap';

  @override
  String get toolBgRemoverKeywords =>
      'remove background, background eraser, remove bg, cutout, transparent, png, sticker, passport photo, white background';

  @override
  String get toolBmiTitle => 'BMI Calculator';

  @override
  String get toolBmiDesc => 'Check your body mass index and healthy weight';

  @override
  String get toolBmiKeywords =>
      'bmi, body mass index, weight, height, health, fitness, ideal weight, obesity';

  @override
  String get toolBubbleLevelTitle => 'Bubble Level';

  @override
  String get toolBubbleLevelDesc =>
      'Check that shelves and frames are straight';

  @override
  String get toolBubbleLevelKeywords =>
      'level, spirit level, bubble level, straight, angle, inclinometer, tilt, ruler';

  @override
  String get toolCurrencyTitle => 'Currency Converter';

  @override
  String get toolCurrencyDesc => 'Live exchange rates for 150+ currencies';

  @override
  String get toolCurrencyKeywords =>
      'currency, exchange rate, money, convert, dollar, euro, rupee, riyal, forex';

  @override
  String get toolDirectChatTitle => 'Direct Chat';

  @override
  String get toolDirectChatDesc =>
      'Message a number on WhatsApp without saving it';

  @override
  String get toolDirectChatKeywords =>
      'whatsapp, direct chat, message, unsaved number, click to chat, wa.me, send message, chat';

  @override
  String get toolFlashlightTitle => 'Flashlight';

  @override
  String get toolFlashlightDesc => 'Bright torch with SOS and strobe';

  @override
  String get toolFlashlightKeywords =>
      'flashlight, torch, light, led, sos, strobe, lamp, flash';

  @override
  String get toolOrganizePdfTitle => 'Organize PDF';

  @override
  String get toolOrganizePdfDesc => 'Reorder, rotate or delete pages';

  @override
  String get toolOrganizePdfKeywords =>
      'organize, organise, reorder, rotate, delete pages, remove pages, arrange, sort, pdf';

  @override
  String get toolPdfToTextTitle => 'PDF to Text';

  @override
  String get toolPdfToTextDesc => 'Copy all the text out of a PDF';

  @override
  String get toolPdfToTextKeywords =>
      'pdf to text, extract text, copy text, txt, read pdf, convert, pdf to word';

  @override
  String get toolPercentageTitle => 'Percentage & Discount';

  @override
  String get toolPercentageDesc =>
      'Percent, discount, tip split and tax in seconds';

  @override
  String get toolPercentageKeywords =>
      'percentage, percent, discount, sale price, tip, split bill, tax, gst, vat, margin, increase, decrease';

  @override
  String get toolSignPdfTitle => 'Sign PDF';

  @override
  String get toolSignPdfDesc => 'Draw your signature and place it on any page';

  @override
  String get toolSignPdfKeywords =>
      'sign, signature, e-sign, esign, fill and sign, autograph, pdf';

  @override
  String get toolStopwatchTitle => 'Stopwatch & Timer';

  @override
  String get toolStopwatchDesc => 'Lap stopwatch and countdown timer';

  @override
  String get toolStopwatchKeywords =>
      'stopwatch, timer, countdown, lap, alarm, clock, kitchen timer, workout';

  @override
  String get toolWatermarkPdfTitle => 'Watermark & Page Numbers';

  @override
  String get toolWatermarkPdfDesc => 'Stamp text or page numbers on every page';

  @override
  String get toolWatermarkPdfKeywords =>
      'watermark, stamp, page numbers, number pages, confidential, draft, footer, header, pdf';

  @override
  String get bmiMetric => 'Metric (cm, kg)';

  @override
  String get bmiImperial => 'Imperial (ft, lb)';

  @override
  String get bmiHeight => 'Height';

  @override
  String get bmiWeight => 'Weight';

  @override
  String get bmiFeet => 'Feet';

  @override
  String get bmiInches => 'Inches';

  @override
  String get bmiUnitCm => 'cm';

  @override
  String get bmiUnitKg => 'kg';

  @override
  String get bmiUnitLb => 'lb';

  @override
  String get bmiUnitFt => 'ft';

  @override
  String get bmiUnitIn => 'in';

  @override
  String get bmiAge => 'Age (optional)';

  @override
  String get bmiSex => 'Sex (optional)';

  @override
  String get bmiMale => 'Male';

  @override
  String get bmiFemale => 'Female';

  @override
  String get bmiYourBmi => 'Your BMI';

  @override
  String get bmiUnderweight => 'Underweight';

  @override
  String get bmiNormal => 'Healthy weight';

  @override
  String get bmiOverweight => 'Overweight';

  @override
  String get bmiObese => 'Obese';

  @override
  String bmiHealthyRange(String min, String max) {
    return 'Healthy weight for your height: $min – $max';
  }

  @override
  String bmiToLose(String amount) {
    return 'About $amount above the healthy range';
  }

  @override
  String bmiToGain(String amount) {
    return 'About $amount below the healthy range';
  }

  @override
  String bmiIdealWeight(String weight) {
    return 'Estimated ideal weight: $weight';
  }

  @override
  String get bmiChildNote =>
      'For children and teens under 18, BMI is read with age-based growth charts. These results use adult ranges.';

  @override
  String get bmiDisclaimer =>
      'BMI is a general guide, not a medical diagnosis.';

  @override
  String get bmiEnterValues => 'Enter your height and weight';

  @override
  String get currencyAmount => 'Amount';

  @override
  String get currencyFrom => 'From';

  @override
  String get currencyTo => 'To';

  @override
  String get currencySwap => 'Swap currencies';

  @override
  String get currencyChoose => 'Choose currency';

  @override
  String get currencySearchHint => 'Search currency or code';

  @override
  String get currencyAll => 'All currencies';

  @override
  String currencyRatesFrom(String date) {
    return 'Rates from $date';
  }

  @override
  String get currencyRefresh => 'Refresh rates';

  @override
  String get currencyUpdating => 'Updating rates…';

  @override
  String get currencyOfflineCached => 'Couldn’t update. Showing saved rates.';

  @override
  String get currencyNoRatesTitle => 'Rates not downloaded yet';

  @override
  String get currencyNoRatesBody =>
      'Connect to the internet once to download exchange rates. After that, the converter also works offline.';

  @override
  String get currencyRetry => 'Try again';

  @override
  String get currencyOtherFavorites => 'Your favorite currencies';

  @override
  String get currencyFavoritesHint =>
      'Tap ☆ next to a currency in the list to add it here.';

  @override
  String get currencyCopy => 'Copy result';

  @override
  String get currencyCopied => 'Copied';

  @override
  String get currencyNoMatch => 'No currency found';

  @override
  String get currencyDisclaimer =>
      'Rates are for reference only and may differ from your bank’s rate.';

  @override
  String get directChatPhone => 'Phone number';

  @override
  String get directChatCountryCode => 'Country code';

  @override
  String get directChatSearchCountry => 'Search country or code';

  @override
  String get directChatNoCountry => 'No country found';

  @override
  String get directChatMessage => 'Message (optional)';

  @override
  String get directChatOpen => 'Open in WhatsApp';

  @override
  String get directChatPaste => 'Paste number';

  @override
  String get directChatPasteNone => 'No phone number found in the clipboard';

  @override
  String get directChatTooShort => 'This number looks too short';

  @override
  String get directChatTooLong => 'This number looks too long';

  @override
  String directChatWillOpen(String number) {
    return 'Chat with $number';
  }

  @override
  String get directChatOpenFailed =>
      'Couldn’t open the chat. Is WhatsApp installed?';

  @override
  String get directChatHint =>
      'Send a message to any number without saving it to your contacts.';

  @override
  String get directChatNotAffiliated =>
      'Independent tool. Not affiliated with WhatsApp or Meta.';

  @override
  String get percentageTabPercent => 'Percent';

  @override
  String get percentageTabDiscount => 'Discount';

  @override
  String get percentageTabTip => 'Tip & split';

  @override
  String get percentageTabTax => 'Tax / VAT';

  @override
  String get percentageOfTitle => 'Percentage of a number';

  @override
  String get percentageFieldPercent => 'Percentage';

  @override
  String get percentageFieldNumber => 'Number';

  @override
  String percentageOfResult(String percent, String number) {
    return '$percent of $number';
  }

  @override
  String get percentageWhatTitle => 'What percent is it?';

  @override
  String get percentageFieldPart => 'Value';

  @override
  String get percentageFieldTotal => 'Total';

  @override
  String percentageWhatResult(String part, String total) {
    return '$part out of $total';
  }

  @override
  String get percentageChangeTitle => 'Percentage change';

  @override
  String get percentageFieldOld => 'Old value';

  @override
  String get percentageFieldNew => 'New value';

  @override
  String percentageIncrease(String percent) {
    return 'Increase of $percent';
  }

  @override
  String percentageDecrease(String percent) {
    return 'Decrease of $percent';
  }

  @override
  String get percentageNoChange => 'No change';

  @override
  String get percentageDifference => 'Difference';

  @override
  String get percentagePrice => 'Original price';

  @override
  String get percentageDiscount => 'Discount';

  @override
  String get percentageExtraDiscount => 'Extra discount (optional)';

  @override
  String get percentageYouPay => 'You pay';

  @override
  String get percentageYouSave => 'You save';

  @override
  String get percentageTotalDiscount => 'Total discount';

  @override
  String get percentageBill => 'Bill amount';

  @override
  String get percentageTip => 'Tip';

  @override
  String get percentageCustom => 'Custom';

  @override
  String get percentagePeople => 'People';

  @override
  String get percentageAddPerson => 'Add a person';

  @override
  String get percentageRemovePerson => 'Remove a person';

  @override
  String get percentageTipAmount => 'Tip amount';

  @override
  String get percentageTotal => 'Total';

  @override
  String get percentagePerPerson => 'Each person pays';

  @override
  String get percentageTaxRate => 'Tax rate';

  @override
  String get percentageAddTax => 'Add tax';

  @override
  String get percentageRemoveTax => 'Remove tax';

  @override
  String get percentagePriceExclTax => 'Price without tax';

  @override
  String get percentagePriceInclTax => 'Price including tax';

  @override
  String get percentageBeforeTax => 'Before tax';

  @override
  String get percentageTaxAmount => 'Tax';

  @override
  String get percentageAfterTax => 'Total with tax';

  @override
  String get percentageEnterValues => 'Enter numbers to see the result';

  @override
  String get commonSave => 'Save';

  @override
  String get commonShare => 'Share';

  @override
  String get commonCopy => 'Copy';

  @override
  String get commonCopied => 'Copied';

  @override
  String get commonRetry => 'Retry';

  @override
  String get commonDone => 'Done';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonUndo => 'Undo';

  @override
  String get commonOpen => 'Open';

  @override
  String get commonReset => 'Reset';

  @override
  String get commonClose => 'Close';

  @override
  String get commonOpenSettings => 'Open settings';

  @override
  String get commonChoosePhoto => 'Choose photo';

  @override
  String get commonChooseFile => 'Choose file';

  @override
  String get commonCamera => 'Camera';

  @override
  String get commonGallery => 'Gallery';

  @override
  String get commonWorking => 'Working…';

  @override
  String get commonSavedToGallery => 'Saved to gallery';

  @override
  String get commonSavedToDownloads => 'Saved to Downloads';

  @override
  String get commonSaveFailed => 'Couldn\'t save the file';

  @override
  String get commonErrorGeneric => 'Something went wrong. Please try again.';

  @override
  String get commonErrorOffline => 'No internet connection';

  @override
  String get commonErrorTimeout => 'The request timed out. Please try again.';

  @override
  String get commonPermissionNeeded =>
      'Permission needed. Allow it in Settings.';

  @override
  String get commonResult => 'Result';

  @override
  String get commonStart => 'Start';

  @override
  String get commonStop => 'Stop';

  @override
  String get commonClearAll => 'Clear all';

  @override
  String get commonPaste => 'Paste';

  @override
  String get commonSearch => 'Search';

  @override
  String get organizePdfHint =>
      'Tap pages to select them. Press and hold a page, then drag to move it.';

  @override
  String organizePdfSelected(int count) {
    return '$count selected';
  }

  @override
  String get organizePdfRotateLeft => 'Rotate left';

  @override
  String get organizePdfRotateRight => 'Rotate right';

  @override
  String get organizePdfDelete => 'Delete';

  @override
  String get organizePdfSelectAll => 'Select all';

  @override
  String get organizePdfClearSelection => 'Clear selection';

  @override
  String organizePdfDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages deleted',
      one: '1 page deleted',
    );
    return '$_temp0';
  }

  @override
  String get organizePdfUndo => 'Undo';

  @override
  String get organizePdfKeepOne => 'A PDF needs at least one page.';

  @override
  String get organizePdfNoChanges =>
      'No changes yet — move, rotate or delete pages first.';

  @override
  String get organizePdfReset => 'Undo all changes';

  @override
  String get organizePdfMoveEarlier => 'Move earlier';

  @override
  String get organizePdfMoveLater => 'Move later';

  @override
  String get organizePdfSave => 'Save PDF';

  @override
  String get organizePdfFailed => 'Couldn’t save this PDF.';

  @override
  String get organizePdfResult => 'Your organized PDF is ready';

  @override
  String pdfToTextReading(int current, int total) {
    return 'Reading page $current of $total…';
  }

  @override
  String pdfToTextWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
    );
    return '$_temp0';
  }

  @override
  String get pdfToTextCopyAll => 'Copy all';

  @override
  String get pdfToTextCopied => 'Text copied';

  @override
  String get pdfToTextSaveTxt => 'Save as .txt';

  @override
  String get pdfToTextEmptyPage => 'No text on this page';

  @override
  String get pdfToTextScannedTitle => 'No text found';

  @override
  String get pdfToTextScannedBody =>
      'This PDF looks like a scan or photos, so there is no text to copy. We can read the words on page 1 from the image instead.';

  @override
  String pdfToTextOpenOcr(String tool) {
    return 'Read page 1 with $tool';
  }

  @override
  String get pdfToTextFailed => 'Couldn’t read the text in this PDF.';

  @override
  String pdfToTextPartlyScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages have no text (they may be scanned).',
      one: '1 page has no text (it may be scanned).',
    );
    return '$_temp0';
  }

  @override
  String get pdfEditChoosePdf => 'Choose a PDF';

  @override
  String get pdfEditChooseHint =>
      'Or share a PDF to Utility Toolbox from any app';

  @override
  String get pdfEditChange => 'Change';

  @override
  String get pdfEditReading => 'Reading…';

  @override
  String pdfEditPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
    );
    return '$_temp0';
  }

  @override
  String pdfEditPageN(int number) {
    return 'Page $number';
  }

  @override
  String get pdfEditInvalidPdf => 'This file doesn’t look like a valid PDF.';

  @override
  String get pdfEditLocked =>
      'This PDF is password protected. Remove the password first, then try again.';

  @override
  String get pdfEditLockedShort => 'Password protected';

  @override
  String get pdfEditPreviewFailed => 'Couldn’t show this page.';

  @override
  String get pdfEditResultReady => 'Your PDF is ready';

  @override
  String get pdfEditSaveDownloads => 'Save to Downloads';

  @override
  String get pdfEditShare => 'Share';

  @override
  String get pdfEditStartOver => 'Start over';

  @override
  String get pdfEditSavedToDownloads =>
      'Saved to Downloads — find it in My Files';

  @override
  String get pdfEditSharedInstead => 'Opened the share sheet instead';

  @override
  String get pdfEditSaveFailed => 'Couldn’t create the file. Please try again.';

  @override
  String get signPdfStepPdf => 'Choose your PDF';

  @override
  String get signPdfStepSignature => 'Create your signature';

  @override
  String get signPdfStepPlace => 'Tap a page to place your signature';

  @override
  String get signPdfDraw => 'Draw signature';

  @override
  String get signPdfDrawAgain => 'Draw again';

  @override
  String get signPdfUseSaved => 'Use saved signature';

  @override
  String get signPdfDeleteSaved => 'Delete saved signature';

  @override
  String get signPdfSavedDeleted => 'Saved signature deleted';

  @override
  String get signPdfDrawTitle => 'Draw your signature';

  @override
  String get signPdfDrawHint => 'Sign here with your finger';

  @override
  String get signPdfUndo => 'Undo';

  @override
  String get signPdfInkBlack => 'Black';

  @override
  String get signPdfInkBlue => 'Blue';

  @override
  String get signPdfRemember => 'Save signature for next time';

  @override
  String get signPdfDone => 'Use this signature';

  @override
  String get signPdfEmpty => 'Draw your signature first.';

  @override
  String get signPdfSignatureLabel => 'Your signature';

  @override
  String get signPdfPlaceHint =>
      'Drag to move, pinch or use the slider to resize. Tap the page to move the signature there.';

  @override
  String get signPdfSize => 'Size';

  @override
  String get signPdfPlaceConfirm => 'Place here';

  @override
  String get signPdfRemoveFromPage => 'Remove from this page';

  @override
  String get signPdfAllPages => 'Add to all pages';

  @override
  String signPdfAllPagesDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Signature added to all $count pages',
      one: 'Signature added to 1 page',
    );
    return '$_temp0';
  }

  @override
  String get signPdfClearAll => 'Remove all';

  @override
  String signPdfPlacedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Signed on $count pages',
      one: 'Signed on 1 page',
      zero: 'No pages signed yet',
    );
    return '$_temp0';
  }

  @override
  String get signPdfSave => 'Save signed PDF';

  @override
  String get signPdfNoPlacement => 'Tap a page to place your signature first.';

  @override
  String get signPdfFailed => 'Couldn’t sign this PDF.';

  @override
  String get signPdfResult => 'Your signed PDF is ready';

  @override
  String get watermarkPdfModeText => 'Text watermark';

  @override
  String get watermarkPdfModeNumbers => 'Page numbers';

  @override
  String get watermarkPdfText => 'Watermark text';

  @override
  String get watermarkPdfDefaultText => 'CONFIDENTIAL';

  @override
  String get watermarkPdfTextEmpty => 'Type the watermark text first.';

  @override
  String get watermarkPdfSize => 'Text size';

  @override
  String get watermarkPdfOpacity => 'Opacity';

  @override
  String get watermarkPdfLayout => 'Layout';

  @override
  String get watermarkPdfDiagonal => 'Diagonal';

  @override
  String get watermarkPdfCenter => 'Centre';

  @override
  String get watermarkPdfTiled => 'Tiled';

  @override
  String get watermarkPdfColor => 'Colour';

  @override
  String get watermarkPdfColorGrey => 'Grey';

  @override
  String get watermarkPdfColorRed => 'Red';

  @override
  String get watermarkPdfColorBlue => 'Blue';

  @override
  String get watermarkPdfColorBlack => 'Black';

  @override
  String get watermarkPdfColorGreen => 'Green';

  @override
  String get watermarkPdfFormat => 'Format';

  @override
  String watermarkPdfPageLabel(String number) {
    return 'Page $number';
  }

  @override
  String get watermarkPdfPosition => 'Position';

  @override
  String get watermarkPdfBottomCenter => 'Bottom centre';

  @override
  String get watermarkPdfBottomRight => 'Bottom right';

  @override
  String get watermarkPdfTopRight => 'Top right';

  @override
  String get watermarkPdfStartAt => 'Start at';

  @override
  String get watermarkPdfDecrease => 'Decrease';

  @override
  String get watermarkPdfIncrease => 'Increase';

  @override
  String get watermarkPdfPreview => 'Preview (page 1)';

  @override
  String get watermarkPdfApplyText => 'Add watermark';

  @override
  String get watermarkPdfApplyNumbers => 'Add page numbers';

  @override
  String get watermarkPdfFailed => 'Couldn’t update this PDF.';

  @override
  String get bgRemoverPickTitle => 'Choose a photo';

  @override
  String get bgRemoverPickBody =>
      'Works best with people, pets and objects. Your photo is processed on your phone.';

  @override
  String get bgRemoverGallery => 'Choose from gallery';

  @override
  String get bgRemoverCamera => 'Take a photo';

  @override
  String get bgRemoverPreparing => 'Preparing photo…';

  @override
  String get bgRemoverWorking => 'Removing background…';

  @override
  String get bgRemoverDownloading =>
      'Getting the background remover ready. This happens only once and needs an internet connection…';

  @override
  String get bgRemoverDownloadFailed =>
      'The background remover isn’t ready yet. Google Play services is still downloading it. Check your internet connection and try again in a minute.';

  @override
  String get bgRemoverNoSubject =>
      'No person or object was found in this photo. Try a photo with a clear subject.';

  @override
  String get bgRemoverOpenFailed =>
      'This photo couldn’t be opened. Try another one.';

  @override
  String get bgRemoverFailed =>
      'Something went wrong while removing the background. Please try again.';

  @override
  String get bgRemoverRetry => 'Try again';

  @override
  String get bgRemoverAnotherPhoto => 'Choose another photo';

  @override
  String get bgRemoverNewPhoto => 'New photo';

  @override
  String get bgRemoverBefore => 'Before';

  @override
  String get bgRemoverAfter => 'After';

  @override
  String get bgRemoverCompare => 'Compare before and after';

  @override
  String get bgRemoverCompareHint => 'Drag the slider to compare';

  @override
  String get bgRemoverBgTransparent => 'Transparent';

  @override
  String get bgRemoverBgWhite => 'White';

  @override
  String get bgRemoverBgBlack => 'Black';

  @override
  String get bgRemoverBgBlue => 'Blue';

  @override
  String get bgRemoverBgRed => 'Red';

  @override
  String get bgRemoverBgYellow => 'Yellow';

  @override
  String get bgRemoverBgBlur => 'Blur';

  @override
  String get bgRemoverSave => 'Save to gallery';

  @override
  String get bgRemoverSaved => 'Saved to your gallery';

  @override
  String get bgRemoverSaveFailed =>
      'Couldn’t save the image. Please try again.';

  @override
  String get bgRemoverPngHint => 'PNG with a transparent background';

  @override
  String get bgRemoverJpgHint => 'JPG with the chosen background';

  @override
  String get bubbleLevelSurfaceHint => 'Lay the phone flat on the surface';

  @override
  String get bubbleLevelUprightHint =>
      'Hold the phone’s edge against the surface';

  @override
  String get bubbleLevelLevel => 'Level';

  @override
  String bubbleLevelAngleLabel(String angle) {
    return 'Tilt $angle degrees';
  }

  @override
  String bubbleLevelAxes(String x, String y) {
    return 'Left–right $x° · Front–back $y°';
  }

  @override
  String get bubbleLevelCalibrate => 'Calibrate';

  @override
  String get bubbleLevelReset => 'Reset';

  @override
  String get bubbleLevelCalibrateTitle => 'Calibrate the level?';

  @override
  String get bubbleLevelCalibrateBody =>
      'Place the phone on a surface you know is level (or hold it against a straight edge), then tap Calibrate. The current position will read 0°.';

  @override
  String get bubbleLevelCalibrated => 'Calibrated. This position now reads 0°.';

  @override
  String get bubbleLevelResetDone => 'Calibration cleared';

  @override
  String get bubbleLevelUnavailable =>
      'This phone has no motion sensor, so the level can’t work here.';

  @override
  String get flashlightOn => 'Light is on';

  @override
  String get flashlightOff => 'Light is off';

  @override
  String get flashlightTurnOn => 'Turn the light on';

  @override
  String get flashlightTurnOff => 'Turn the light off';

  @override
  String get flashlightModeSteady => 'Steady';

  @override
  String get flashlightModeSos => 'SOS';

  @override
  String get flashlightModeStrobe => 'Strobe';

  @override
  String get flashlightSosHint =>
      'Flashes the distress signal ··· ––– ··· again and again';

  @override
  String flashlightStrobeSpeed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count flashes per second',
      one: '1 flash per second',
    );
    return '$_temp0';
  }

  @override
  String get flashlightUseScreen => 'Use screen light';

  @override
  String get flashlightUseScreenHint =>
      'Light up the screen instead of the flash';

  @override
  String get flashlightNoTorch =>
      'No flash found on this phone, so the screen lights up instead.';

  @override
  String get flashlightTorchBusy =>
      'The flash is busy (another app may be using the camera), so the screen lights up instead.';

  @override
  String get flashlightScreenColor => 'Screen light color';

  @override
  String get flashlightColorWhite => 'White';

  @override
  String get flashlightColorWarm => 'Warm white';

  @override
  String get flashlightColorRed => 'Red';

  @override
  String get flashlightColorGreen => 'Green';

  @override
  String get flashlightColorBlue => 'Blue';

  @override
  String get flashlightTapToTurnOff => 'Tap anywhere to turn off';

  @override
  String get stopwatchTabStopwatch => 'Stopwatch';

  @override
  String get stopwatchTabTimer => 'Timer';

  @override
  String get stopwatchStart => 'Start';

  @override
  String get stopwatchPause => 'Pause';

  @override
  String get stopwatchResume => 'Resume';

  @override
  String get stopwatchLap => 'Lap';

  @override
  String get stopwatchReset => 'Reset';

  @override
  String stopwatchLapNumber(int number) {
    return 'Lap $number';
  }

  @override
  String stopwatchCurrentLap(int number, String time) {
    return 'Lap $number: $time';
  }

  @override
  String get stopwatchBest => 'Fastest';

  @override
  String get stopwatchWorst => 'Slowest';

  @override
  String get stopwatchNoLaps =>
      'Tap Lap while the stopwatch runs to record lap times.';

  @override
  String get stopwatchTimerQuickStart => 'Quick start';

  @override
  String stopwatchTimerMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get stopwatchTimerCustom => 'Set your own time';

  @override
  String get stopwatchTimerPickTitle => 'Set timer';

  @override
  String get stopwatchTimerHours => 'hours';

  @override
  String get stopwatchTimerMinutesUnit => 'min';

  @override
  String get stopwatchTimerSeconds => 'sec';

  @override
  String get stopwatchTimerAddMinute => '+1 min';

  @override
  String get stopwatchTimerPaused => 'Paused';

  @override
  String stopwatchTimerRemaining(String time) {
    return '$time left';
  }

  @override
  String get stopwatchTimerTimesUp => 'Time’s up!';

  @override
  String stopwatchTimerFinishedBody(String duration) {
    return 'Your $duration timer has finished.';
  }

  @override
  String get stopwatchTimerRestart => 'Restart';

  @override
  String get stopwatchTimerDone => 'Done';

  @override
  String get stopwatchTimerKeepOpen =>
      'Keep this screen open: the phone vibrates when the time is up.';

  @override
  String get translateHeroTitle => 'Speak or type to translate';

  @override
  String get translateBadgeOnDevice => 'On-device AI';

  @override
  String get translateBadgeOffline => 'Works offline';

  @override
  String get translateFrom => 'From';

  @override
  String get translateTo => 'To';

  @override
  String get translateSwap => 'Swap languages';

  @override
  String get translateHint => 'Enter text or tap the mic to speak…';

  @override
  String get translateHintListening =>
      'Listening… speak naturally, tap the mic to stop';

  @override
  String translateListeningIn(String language) {
    return 'Listening in $language… tap the mic to stop and translate.';
  }

  @override
  String get translateSameLanguage =>
      'Source and target languages must be different.';

  @override
  String get translateButton => 'Translate';

  @override
  String get translateTranslating => 'Translating…';

  @override
  String get translateStopAndTranslate => 'Stop & translate';

  @override
  String get translateDownloadingModel => 'Downloading language model…';

  @override
  String get translateResultLabel => 'Translation';

  @override
  String get translatePlayAudio => 'Play audio';

  @override
  String get translateGenerating => 'Generating…';

  @override
  String get translateShareAudio => 'Share audio file';

  @override
  String get translateGenerateAudio => 'Generate audio file';

  @override
  String get translateAudioReady =>
      'Audio file ready — share it to send or save it.';

  @override
  String get translateMicStop => 'Stop listening & translate';

  @override
  String get translateMicStart => 'Speak to translate';

  @override
  String get translateMicBlocked =>
      'Microphone access is blocked. Enable it in Settings to use voice input.';

  @override
  String get translateMicNeeded =>
      'Microphone permission is needed for voice input.';

  @override
  String get translateSpeechUnavailable =>
      'Speech recognition isn’t available on this device.';

  @override
  String get translateNoSpeech =>
      'Didn’t catch that. Please try speaking again.';

  @override
  String get translateVoiceFailed => 'Voice input stopped. Please try again.';

  @override
  String get translateDownloadFailed =>
      'Couldn’t download the language models. Check your internet connection.';

  @override
  String get translateFailed => 'Translation failed. Please try again.';

  @override
  String get translateAudioFailed =>
      'Couldn’t create an audio file on this device.';

  @override
  String translateLanguageName(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'af': 'Afrikaans',
      'sq': 'Albanian',
      'ar': 'Arabic',
      'be': 'Belarusian',
      'bn': 'Bengali',
      'bg': 'Bulgarian',
      'ca': 'Catalan',
      'zh': 'Chinese (Simplified)',
      'hr': 'Croatian',
      'cs': 'Czech',
      'da': 'Danish',
      'nl': 'Dutch',
      'en': 'English',
      'eo': 'Esperanto',
      'et': 'Estonian',
      'fi': 'Finnish',
      'fr': 'French',
      'gl': 'Galician',
      'ka': 'Georgian',
      'de': 'German',
      'el': 'Greek',
      'gu': 'Gujarati',
      'ht': 'Haitian Creole',
      'he': 'Hebrew',
      'hi': 'Hindi',
      'hu': 'Hungarian',
      'is': 'Icelandic',
      'id': 'Indonesian',
      'ga': 'Irish',
      'it': 'Italian',
      'ja': 'Japanese',
      'kn': 'Kannada',
      'ko': 'Korean',
      'lv': 'Latvian',
      'lt': 'Lithuanian',
      'mk': 'Macedonian',
      'ms': 'Malay',
      'mt': 'Maltese',
      'mr': 'Marathi',
      'no': 'Norwegian',
      'fa': 'Persian (Farsi)',
      'pl': 'Polish',
      'pt': 'Portuguese',
      'ro': 'Romanian',
      'ru': 'Russian',
      'sk': 'Slovak',
      'sl': 'Slovenian',
      'es': 'Spanish',
      'sw': 'Swahili',
      'sv': 'Swedish',
      'tl': 'Tagalog (Filipino)',
      'ta': 'Tamil',
      'te': 'Telugu',
      'th': 'Thai',
      'tr': 'Turkish',
      'uk': 'Ukrainian',
      'ur': 'Urdu',
      'vi': 'Vietnamese',
      'cy': 'Welsh',
      'other': '$code',
    });
    return '$_temp0';
  }

  @override
  String get textUtilMode => 'Mode';

  @override
  String get textUtilModeText => 'Text';

  @override
  String get textUtilHint => 'Enter text here…';

  @override
  String get textUtilHintBase64 => 'Enter text or Base64 to convert…';

  @override
  String textUtilWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'words',
      one: 'word',
    );
    return '$_temp0';
  }

  @override
  String textUtilCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'characters',
      one: 'character',
    );
    return '$_temp0';
  }

  @override
  String get textUtilNoSpaces => 'without spaces';

  @override
  String get textUtilUpper => 'UPPERCASE';

  @override
  String get textUtilLower => 'lowercase';

  @override
  String get textUtilTitle => 'Title Case';

  @override
  String get textUtilSentence => 'Sentence case';

  @override
  String get textUtilEncode => 'Encode';

  @override
  String get textUtilDecode => 'Decode';

  @override
  String get textUtilOutput => 'Output';

  @override
  String get textUtilInvalidBase64 => 'That isn’t valid Base64.';

  @override
  String get clipEmptyClipboard => 'Your clipboard is empty or has no text.';

  @override
  String clipSaved(String text) {
    return 'Saved: $text';
  }

  @override
  String get clipAddManualTitle => 'Add text manually';

  @override
  String get clipAddHint => 'Type or paste text here…';

  @override
  String get clipClearUnpinned => 'Clear unpinned';

  @override
  String get clipClearHistoryTitle => 'Clear history?';

  @override
  String get clipClearHistoryBody =>
      'Remove all unpinned items? Pinned items are kept.';

  @override
  String get clipSearchHint => 'Search clips…';

  @override
  String get clipFilterAll => 'All';

  @override
  String get clipFilterPinned => 'Pinned';

  @override
  String get clipFilterLinks => 'Links';

  @override
  String get clipFilterText => 'Text';

  @override
  String get clipFilterCode => 'Code';

  @override
  String clipSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString saved',
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
      other: '$countString pinned',
    );
    return '$_temp0';
  }

  @override
  String get clipAddText => 'Add text';

  @override
  String get clipLabel => 'Label';

  @override
  String get clipAddLabelTitle => 'Add label';

  @override
  String get clipLabelHint => 'e.g. Work email';

  @override
  String get clipEmptyTitle => 'No clips yet';

  @override
  String get clipEmptyMessage =>
      'Copy any text on your phone, then tap Paste to save it here permanently.';

  @override
  String get clipPasteFromClipboard => 'Paste from clipboard';

  @override
  String get clipTypeLink => 'Link';

  @override
  String get clipTypeEmail => 'Email';

  @override
  String get clipTypePhone => 'Phone';

  @override
  String get clipTypeCode => 'Code';

  @override
  String get clipTypeText => 'Text';

  @override
  String get clipJustNow => 'just now';

  @override
  String clipMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count min ago',
      one: '1 min ago',
    );
    return '$_temp0';
  }

  @override
  String clipHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count h ago',
    );
    return '$_temp0';
  }

  @override
  String clipDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String get clipPin => 'Pin';

  @override
  String get clipUnpin => 'Unpin';

  @override
  String get calcDivideByZero => 'Can’t divide by zero';

  @override
  String get calcCheckExpression => 'Check the expression';

  @override
  String get calcCopyResult => 'Copy result';

  @override
  String get calcPlus => 'Plus';

  @override
  String get calcMinus => 'Minus';

  @override
  String get calcTimes => 'Multiply';

  @override
  String get calcDivide => 'Divide';

  @override
  String get calcPercent => 'Percent';

  @override
  String get calcParentheses => 'Parentheses';

  @override
  String get calcEquals => 'Equals';

  @override
  String get calcDecimalPoint => 'Decimal point';

  @override
  String get ageTabAge => 'Age';

  @override
  String get ageTabBetween => 'Between dates';

  @override
  String get ageDateOfBirth => 'Date of birth';

  @override
  String get ageFrom => 'From';

  @override
  String get ageTo => 'To';

  @override
  String get ageFutureDate => 'That date is in the future.';

  @override
  String ageYearsUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'years',
      one: 'year',
    );
    return '$_temp0';
  }

  @override
  String ageDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'days',
      one: 'day',
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
      other: '$countString years',
      one: '1 year',
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
      other: '$countString months',
      one: '1 month',
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
      other: '$countString days',
      one: '1 day',
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
      other: '$countString weeks',
      one: '1 week',
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
      other: 'in $countString days',
      one: 'in 1 day',
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
  String get ageNextBirthday => 'Next birthday';

  @override
  String get ageBirthdayToday => 'Today 🎉';

  @override
  String get ageTotalMonths => 'Total months';

  @override
  String get ageTotalWeeks => 'Total weeks';

  @override
  String get ageTotalDays => 'Total days';

  @override
  String get ageWeeksLabel => 'Weeks';

  @override
  String get ageWeekdays => 'Weekdays (Mon–Fri)';

  @override
  String get ageHours => 'Hours';

  @override
  String get ageIncludingEnd => 'Including end date';

  @override
  String get unitFrom => 'From';

  @override
  String get unitTo => 'To';

  @override
  String get unitEnterValue => 'Enter value';

  @override
  String get unitSwap => 'Swap units';

  @override
  String unitCategoryName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'length': 'Length',
      'weight': 'Weight',
      'temperature': 'Temperature',
      'area': 'Area',
      'volume': 'Volume',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String unitName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'millimeter': 'Millimeter',
      'centimeter': 'Centimeter',
      'meter': 'Meter',
      'kilometer': 'Kilometer',
      'inch': 'Inch',
      'foot': 'Foot',
      'mile': 'Mile',
      'gram': 'Gram',
      'kilogram': 'Kilogram',
      'ounce': 'Ounce',
      'pound': 'Pound',
      'celsius': 'Celsius',
      'fahrenheit': 'Fahrenheit',
      'kelvin': 'Kelvin',
      'squareMeter': 'Square meter',
      'squareFoot': 'Square foot',
      'acre': 'Acre',
      'hectare': 'Hectare',
      'milliliter': 'Milliliter',
      'liter': 'Liter',
      'gallonUs': 'Gallon (US)',
      'fluidOunce': 'Fluid ounce',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String get loanAmount => 'Loan amount';

  @override
  String get loanInterestRate => 'Annual interest rate';

  @override
  String get loanTenure => 'Tenure';

  @override
  String get loanTenureMonths => 'Tenure (months)';

  @override
  String get loanTenureYears => 'Tenure (years)';

  @override
  String get loanToggleMonths => 'Months';

  @override
  String get loanToggleYears => 'Years';

  @override
  String get loanEmpty =>
      'Enter valid loan details above to calculate your EMI';

  @override
  String get loanMonthlyEmi => 'Monthly EMI';

  @override
  String get loanPrincipal => 'Principal';

  @override
  String get loanTotalInterest => 'Total interest';

  @override
  String get loanTotalPayment => 'Total payment';

  @override
  String get loanBreakdown => 'Breakdown';

  @override
  String get loanInterest => 'Interest';

  @override
  String loanInterestShare(String percent) {
    return '$percent interest';
  }

  @override
  String get loanSchedule => 'Amortization schedule';

  @override
  String loanMonths(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString months',
      one: '1 month',
    );
    return '$_temp0';
  }

  @override
  String get loanColMonth => 'Mo.';

  @override
  String get loanColBalance => 'Balance';

  @override
  String get loanShowAll => 'Show all months';

  @override
  String get loanShowLess => 'Show less';

  @override
  String get clockSearchHint => 'Search city or country…';

  @override
  String get clockPinned => 'Pinned';

  @override
  String get clockAllCities => 'All cities';

  @override
  String clockOnWidget(int shown, int total) {
    final intl.NumberFormat shownNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String shownString = shownNumberFormat.format(shown);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'On widget: $shownString of $totalString';
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

    return 'On widget: $shownString of up to $maxString (resize to show more)';
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

    return 'The home-screen widget shows the first $defaultRowsString by default — drag its bottom edge down to show up to $maxRowsString.';
  }

  @override
  String get clockPin => 'Pin';

  @override
  String get clockUnpin => 'Unpin';

  @override
  String get clockNoResults => 'No matching cities';

  @override
  String get speedSelectingServer => 'Selecting server…';

  @override
  String get speedPhasePing => 'Measuring ping';

  @override
  String get speedPhaseDownload => 'Testing download speed';

  @override
  String get speedPhaseUpload => 'Testing upload speed';

  @override
  String get speedDownloadSpeed => 'Download speed';

  @override
  String get speedUploadSpeed => 'Upload speed';

  @override
  String get speedRunAgain => 'Run again';

  @override
  String get speedGo => 'GO';

  @override
  String speedMeasuredVia(String server) {
    return 'Measured via $server';
  }

  @override
  String get speedPoweredBy => 'Uses Cloudflare speed test servers';

  @override
  String get speedIdleHint =>
      'Tap the button to measure ping, download and upload speed.';

  @override
  String get speedPing => 'Ping';

  @override
  String get speedResultsTitle => 'Speed test results';

  @override
  String get speedDownload => 'Download';

  @override
  String get speedUpload => 'Upload';

  @override
  String speedConnectedIp(String ip) {
    return 'Your IP: $ip';
  }

  @override
  String get speedErrorOffline =>
      'No internet connection. Check your Wi-Fi or mobile data.';

  @override
  String get speedErrorTimeout =>
      'The test timed out. Your connection may be unstable.';

  @override
  String get speedErrorFailed => 'The test failed. Please try again.';

  @override
  String get pingErrorHostNotFound =>
      'Host not found. Check the address and your internet connection.';

  @override
  String get pingErrorNoData => 'No information is available for this address.';

  @override
  String get pingTabMyIp => 'My IP';

  @override
  String get pingTabLookup => 'Lookup';

  @override
  String get pingTabPing => 'Ping';

  @override
  String get pingYourPublicIp => 'Your public IP address';

  @override
  String get pingFieldCity => 'City';

  @override
  String get pingFieldRegion => 'Region';

  @override
  String get pingFieldCountry => 'Country';

  @override
  String get pingFieldIsp => 'ISP / Org';

  @override
  String get pingFieldTimezone => 'Time zone';

  @override
  String get pingFieldLocation => 'Coordinates';

  @override
  String get pingFieldIp => 'IP address';

  @override
  String get pingIpCopied => 'IP address copied';

  @override
  String get pingCopyIp => 'Copy IP';

  @override
  String get pingLookupHint => 'IP address or hostname';

  @override
  String get pingLookupButton => 'Look up';

  @override
  String get pingHostHint => 'Hostname (e.g. google.com)';

  @override
  String get pingStartButton => 'Ping';

  @override
  String pingHeader(String host, String ip) {
    return 'Ping $host ($ip) via TCP port 443';
  }

  @override
  String get pingStatAvg => 'Average';

  @override
  String get pingStatLoss => 'Loss';

  @override
  String get pingStatSent => 'Sent';

  @override
  String get pingTimeout => 'Timeout';

  @override
  String get compassN => 'N';

  @override
  String get compassNE => 'NE';

  @override
  String get compassE => 'E';

  @override
  String get compassSE => 'SE';

  @override
  String get compassS => 'S';

  @override
  String get compassSW => 'SW';

  @override
  String get compassW => 'W';

  @override
  String get compassNW => 'NW';

  @override
  String get compassNorth => 'North';

  @override
  String get compassNortheast => 'Northeast';

  @override
  String get compassEast => 'East';

  @override
  String get compassSoutheast => 'Southeast';

  @override
  String get compassSouth => 'South';

  @override
  String get compassSouthwest => 'Southwest';

  @override
  String get compassWest => 'West';

  @override
  String get compassNorthwest => 'Northwest';

  @override
  String compassSemantics(String degrees, String direction) {
    return 'Heading $degrees°, $direction';
  }

  @override
  String get compassHeadingMagnetic => 'Magnetic heading';

  @override
  String get compassUnavailable =>
      'This device has no magnetometer, so the compass can\'t work.';

  @override
  String get locationSavedHeader => 'Saved locations';

  @override
  String locationSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString saved',
      one: '1 saved',
      zero: 'None yet',
    );
    return '$_temp0';
  }

  @override
  String locationEmpty(String save) {
    return 'No saved locations yet.\nTap $save to bookmark where you are.';
  }

  @override
  String locationDeleted(String name) {
    return '“$name” deleted';
  }

  @override
  String get locationSaveDialogTitle => 'Save location';

  @override
  String get locationNameLabel => 'Name';

  @override
  String get locationNameHint => 'e.g. Home, Office…';

  @override
  String get locationNoteLabel => 'Note (optional)';

  @override
  String get locationCurrent => 'Current location';

  @override
  String get locationRefresh => 'Update location';

  @override
  String get locationLocating => 'Finding your location…';

  @override
  String get locationServicesOff =>
      'Location is turned off. Turn it on to see where you are.';

  @override
  String get locationPermissionDenied =>
      'Allow location access to see where you are.';

  @override
  String get locationPermissionDeniedForever =>
      'Location access is blocked. Allow it in Settings to use this tool.';

  @override
  String get locationErrorTimeout =>
      'Couldn\'t get a GPS fix. Move near a window or outside and try again.';

  @override
  String get locationAllow => 'Allow access';

  @override
  String locationAccuracy(String meters) {
    return 'Accuracy: ±$meters m';
  }

  @override
  String get locationCoordsCopied => 'Coordinates copied';

  @override
  String get locationCopyCoords => 'Copy coordinates';

  @override
  String get locationOpenInMaps => 'Open in Maps';

  @override
  String get passwordYours => 'Your password';

  @override
  String get passwordSelectType => 'Select at least one character type';

  @override
  String get passwordStrength => 'Strength';

  @override
  String get passwordWeak => 'Weak';

  @override
  String get passwordFair => 'Fair';

  @override
  String get passwordGood => 'Good';

  @override
  String get passwordStrong => 'Strong';

  @override
  String get passwordLength => 'Length';

  @override
  String passwordChars(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString characters',
      one: '1 character',
    );
    return '$_temp0';
  }

  @override
  String get passwordInclude => 'Include';

  @override
  String get passwordUppercase => 'Uppercase';

  @override
  String get passwordLowercase => 'Lowercase';

  @override
  String get passwordNumbers => 'Numbers';

  @override
  String get passwordSymbols => 'Symbols';

  @override
  String get passwordCopied => 'Password copied';

  @override
  String get passwordGenerate => 'Generate new';

  @override
  String get hashModeText => 'Text';

  @override
  String get hashModeFile => 'File';

  @override
  String get hashAlgorithm => 'Algorithm';

  @override
  String get hashInputHint => 'Enter text to hash…';

  @override
  String get hashPickFile => 'Tap to choose a file';

  @override
  String get hashChange => 'Change';

  @override
  String get hashHashing => 'Calculating…';

  @override
  String get hashGenerate => 'Generate hash';

  @override
  String get hashFileError => 'Couldn\'t read this file. Try another one.';

  @override
  String get hashCopied => 'Hash copied';

  @override
  String get hashCopy => 'Copy hash';

  @override
  String get colorPickerFormats => 'Color formats';

  @override
  String get colorPickerHexLabel => 'HEX color';

  @override
  String get colorPickerHexInvalid => 'Enter 6 hex digits (0–9, A–F)';

  @override
  String get colorPickerApply => 'Apply color';

  @override
  String colorPickerCopied(String format) {
    return '$format copied';
  }

  @override
  String get colorPickerPalette => 'Quick palette';

  @override
  String colorPickerSwatch(String hex) {
    return 'Color $hex';
  }

  @override
  String get imgCompressPickHint => 'Tap to choose or take a photo';

  @override
  String imgCompressSupported(String formats) {
    return 'Supports $formats';
  }

  @override
  String get imgCompressChange => 'Change photo';

  @override
  String get imgCompressModeQuality => 'By quality';

  @override
  String get imgCompressModeTarget => 'Target size';

  @override
  String get imgCompressQuality => 'Quality';

  @override
  String get imgCompressSmallest => 'Smallest file';

  @override
  String get imgCompressBestQuality => 'Best quality';

  @override
  String get imgCompressQualityNote =>
      'Large photos are also resized to about 1920×1080.';

  @override
  String imgCompressTargetUnder(String size) {
    return 'Under $size';
  }

  @override
  String get imgCompressTargetHint =>
      'Keeps the best quality that fits the limit — handy for job and government form uploads.';

  @override
  String get imgCompressButton => 'Compress photo';

  @override
  String get imgCompressCompressing => 'Compressing…';

  @override
  String get imgCompressSuccess => 'Compressed successfully!';

  @override
  String imgCompressFitsTarget(String size) {
    return 'Done — fits under $size';
  }

  @override
  String imgCompressMissedTarget(String size) {
    return 'Couldn\'t get under $size. This is the smallest version we could make.';
  }

  @override
  String get imgCompressStatOriginal => 'Original';

  @override
  String get imgCompressStatCompressed => 'Compressed';

  @override
  String get imgCompressStatSaved => 'Saved';

  @override
  String get imgCompressFailed =>
      'Couldn\'t compress this photo. Try another one.';

  @override
  String get imgResizePresetPassport => 'Passport 35×45 mm';

  @override
  String imgResizePresetSquare(String size) {
    return 'Square $size';
  }

  @override
  String imgResizePresetStory(String size) {
    return 'Story $size';
  }

  @override
  String imgResizePresetMax(String name, String px) {
    return '$name (max $px)';
  }

  @override
  String get imgResizeChoosePhotos => 'Choose photos';

  @override
  String imgResizeSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos selected',
      one: '1 photo selected',
    );
    return '$_temp0';
  }

  @override
  String get imgResizePickHint => 'Pick one or many — or share them to the app';

  @override
  String get imgResizeChoose => 'Choose';

  @override
  String get imgResizeChange => 'Change';

  @override
  String get imgResizePresets => 'Presets';

  @override
  String get imgResizeModePercent => 'Percent';

  @override
  String get imgResizeModeMaxSide => 'Max side';

  @override
  String get imgResizeModeExact => 'Exact';

  @override
  String get imgResizeWidth => 'Width (px)';

  @override
  String get imgResizeHeight => 'Height (px)';

  @override
  String get imgResizeCrop => 'Crop to fit (no stretching)';

  @override
  String get imgResizeFormat => 'Format';

  @override
  String get imgResizeQuality => 'Quality';

  @override
  String get imgResizeButton => 'Resize';

  @override
  String imgResizeSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Save $count photos to gallery',
      one: 'Save 1 photo to gallery',
    );
    return '$_temp0';
  }

  @override
  String get imgResizeChangeSettings => 'Change settings';

  @override
  String imgResizeInvalidSize(int min, int max) {
    return 'Enter a width and height between $min and $max.';
  }

  @override
  String imgResizeFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos couldn\'t be read.',
      one: '1 photo couldn\'t be read.',
    );
    return '$_temp0';
  }

  @override
  String imgResizeSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Saved $count photos to your gallery',
      one: 'Saved 1 photo to your gallery',
    );
    return '$_temp0';
  }

  @override
  String get imgEnhanceEmptyTitle => 'Edit your photos';

  @override
  String get imgEnhanceEmptyBody =>
      'Adjust brightness, contrast, saturation and sharpness, apply presets, rotate and flip — all on your device.';

  @override
  String get imgEnhanceFineControls => 'Fine controls';

  @override
  String get imgEnhanceApplying => 'Applying…';

  @override
  String get imgEnhanceChange => 'Change';

  @override
  String get imgEnhancePresets => 'Presets';

  @override
  String get imgEnhanceTransform => 'Transform';

  @override
  String get imgEnhanceAdjustments => 'Adjustments';

  @override
  String get imgEnhanceRotate => 'Rotate';

  @override
  String get imgEnhanceFlipH => 'Flip horizontal';

  @override
  String get imgEnhanceFlipV => 'Flip vertical';

  @override
  String get imgEnhanceBrightness => 'Brightness';

  @override
  String get imgEnhanceContrast => 'Contrast';

  @override
  String get imgEnhanceSaturation => 'Saturation';

  @override
  String get imgEnhanceSharpen => 'Sharpen';

  @override
  String get imgEnhanceBlur => 'Blur';

  @override
  String get imgEnhanceQuality => 'Quality';

  @override
  String get imgEnhanceApply => 'Apply';

  @override
  String get imgEnhanceFailed =>
      'Couldn\'t apply the edits. Try another photo.';

  @override
  String imgEnhanceResult(String before, String after, String change) {
    return 'Done! $before → $after ($change)';
  }

  @override
  String get imgEnhancePresetOriginal => 'Original';

  @override
  String get imgEnhancePresetVivid => 'Vivid';

  @override
  String get imgEnhancePresetCool => 'Cool';

  @override
  String get imgEnhancePresetWarm => 'Warm';

  @override
  String get imgEnhancePresetDramatic => 'Dramatic';

  @override
  String get imgEnhancePresetFade => 'Fade';

  @override
  String get imgEnhancePresetVintage => 'Vintage';

  @override
  String get imgEnhancePresetNoir => 'Noir';

  @override
  String get upscalerNewImage => 'New photo';

  @override
  String get upscalerIntro =>
      'Enlarge photos up to 4× with on-device AI. Works offline after a one-time model download — optional cloud mode for faces.';

  @override
  String get upscalerBadgeOnDevice => 'On-device AI';

  @override
  String get upscalerBadgeOffline => 'Works offline';

  @override
  String get upscalerBadgeUpTo4x => 'Up to 4× bigger';

  @override
  String get upscalerBadgeGpu => 'GPU accelerated';

  @override
  String get upscalerBestResults =>
      'Best results: low-res photos, old scans, thumbnails and compressed JPEGs.';

  @override
  String get upscalerChangeImage => 'Change photo';

  @override
  String get upscalerTabOriginal => 'Original';

  @override
  String get upscalerTabUpscaled => 'AI upscaled';

  @override
  String get upscalerStageStarting => 'Starting…';

  @override
  String get upscalerStageConnecting => 'Connecting to the AI server…';

  @override
  String get upscalerStageOnDevice => 'Processing on this device…';

  @override
  String get upscalerStageCloudUnavailable =>
      'Cloud unavailable — processing on this device…';

  @override
  String get upscalerStageUploading => 'Uploading photo…';

  @override
  String get upscalerStageRestoringFaces => 'AI is restoring faces and detail…';

  @override
  String get upscalerStagePreparing => 'Preparing photo…';

  @override
  String get upscalerStageLoadingModel => 'Loading AI model…';

  @override
  String get upscalerStageDownloadingModel =>
      'Downloading AI model (one time)…';

  @override
  String get upscalerStageFallback => 'Using standard upscaling…';

  @override
  String get upscalerStageDecoding => 'Reading photo…';

  @override
  String upscalerStageResizing(String from, String to) {
    return 'Resizing input ($from → $to)…';
  }

  @override
  String get upscalerStageDenoising => 'Reducing noise…';

  @override
  String upscalerStageUpscaling(String factor) {
    return 'Upscaling ($factor×)…';
  }

  @override
  String upscalerStageAiTiles(String done, String total) {
    return 'AI upscaling… ($done/$total)';
  }

  @override
  String get upscalerStageSharpening => 'Sharpening…';

  @override
  String get upscalerStageColour => 'Adjusting colours…';

  @override
  String get upscalerStageSaving => 'Saving…';

  @override
  String get upscalerStageDone => 'Done!';

  @override
  String get upscalerLoadingModelHint =>
      'Loading the AI model (first time only)';

  @override
  String get upscalerTime4x =>
      '4× upscaling can take 15–60 s depending on photo size.';

  @override
  String get upscalerTime2x => '2× upscaling usually takes 5–20 s.';

  @override
  String upscalerDoneIn(String seconds) {
    return 'Upscaled in $seconds s';
  }

  @override
  String get upscalerStatResolution => 'Resolution';

  @override
  String get upscalerStatFileSize => 'File size';

  @override
  String get upscalerStatScale => 'Scale';

  @override
  String get upscalerShareSubject => 'AI upscaled photo';

  @override
  String get upscalerFallbackModelUnavailable =>
      'AI model needs internet once — used standard upscaling';

  @override
  String get upscalerFallbackModelFailed =>
      'The AI model couldn\'t run on this device — used standard upscaling';

  @override
  String get upscalerFallbackCloud =>
      'Cloud server unavailable — processed on this device';

  @override
  String get upscalerSettings => 'AI settings';

  @override
  String get upscalerFactorLabel => 'Upscale factor';

  @override
  String get upscalerFactor2xDesc => 'Fast — great for most photos';

  @override
  String get upscalerFactor4xDesc => 'Best quality — slower';

  @override
  String get upscalerOptimiseFor => 'Optimise for';

  @override
  String get upscalerModeAuto => 'Auto';

  @override
  String get upscalerModePhoto => 'Photo';

  @override
  String get upscalerModeIllustration => 'Illustration';

  @override
  String get upscalerModeFace => 'Face detail';

  @override
  String get upscalerDenoise => 'Pre-denoise';

  @override
  String get upscalerDenoiseTip => 'Reduces JPEG noise before upscaling';

  @override
  String get upscalerSharpen => 'Post-sharpen';

  @override
  String get upscalerSharpenTip => 'Adds crispness after upscaling';

  @override
  String get upscalerCloudTitle => 'Cloud face enhancement';

  @override
  String get upscalerCloudOn =>
      'Your photo is uploaded to our server for processing.';

  @override
  String get upscalerCloudOff => 'Off — photos stay on this device.';

  @override
  String get upscalerCloudDialogTitle => 'Send photos to the cloud?';

  @override
  String get upscalerCloudDialogBody =>
      'Cloud mode uploads the photo you selected to our upscaling server over an encrypted connection so it can be processed with a larger AI model (GFPGAN + Real-ESRGAN).\n\n• Only the photo you choose to upscale is sent.\n• The photo is processed in memory and is not kept after the result is returned.\n• No account or personal details are sent with it.\n\nYou can turn this off at any time. On-device mode works fully offline.';

  @override
  String get upscalerCloudKeepLocal => 'Keep on-device';

  @override
  String get upscalerCloudEnable => 'Enable cloud';

  @override
  String get upscalerUpscale => 'Upscale with AI';

  @override
  String get upscalerUpscaleAgain => 'Upscale again with new settings';

  @override
  String get upscalerFailed => 'Upscale failed';

  @override
  String get upscalerErrorTooLarge =>
      'The photo is too large. Try a smaller photo or 2× upscaling.';

  @override
  String get upscalerErrorUnreadable =>
      'Couldn\'t read this photo. Use a JPG or PNG file.';

  @override
  String get upscalerErrorNetwork =>
      'Network timeout. Check your connection or turn off cloud mode.';

  @override
  String get videoPickHint => 'Tap to pick a video';

  @override
  String videoProbeInfo(String format, String duration) {
    return 'Format: $format · Duration: $duration';
  }

  @override
  String get videoOutputFormat => 'Output format';

  @override
  String get videoFmtMostCompatible => 'Most compatible';

  @override
  String get videoFmtApple => 'Apple / QuickTime';

  @override
  String get videoFmtFlexible => 'Flexible container';

  @override
  String get videoFmtLegacy => 'Older format';

  @override
  String get videoFmtGif => 'Animated (no audio)';

  @override
  String get videoFmtAudioOnly => 'Audio only';

  @override
  String get videoFmtAudioAac => 'Audio only (AAC)';

  @override
  String get videoFmtAudioRaw => 'Audio only (raw)';

  @override
  String get videoFmtWav => 'Uncompressed audio';

  @override
  String videoConvertingPercent(int percent) {
    return 'Converting… $percent%';
  }

  @override
  String get videoConvertingWait => 'Converting… this may take a while';

  @override
  String get videoDone => 'Conversion complete!';

  @override
  String get videoErrorUnsupported =>
      'Conversion failed. This format may not be supported on your device.';

  @override
  String get videoConvertAnother => 'Convert another';

  @override
  String get videoPickButton => 'Pick video file';

  @override
  String videoConvertTo(String format) {
    return 'Convert to $format';
  }

  @override
  String get docScanAndroidOnly =>
      'The document scanner is available on Android.';

  @override
  String docScanNeedsPlayServices(String details) {
    return 'The scanner couldn’t start. It needs Google Play services — make sure they are up to date. ($details)';
  }

  @override
  String get docScanStartFailed =>
      'The scanner couldn’t start. Please try again.';

  @override
  String get docScanPdfSaved => 'PDF saved to Downloads — find it in My Files';

  @override
  String docScanPagesSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Saved $count pages to your gallery',
      one: 'Saved 1 page to your gallery',
    );
    return '$_temp0';
  }

  @override
  String get docScanHeadline => 'Scan paper into a clean PDF';

  @override
  String get docScanIntro =>
      'Edges are found automatically. Add as many pages as you like, crop, rotate and apply filters before saving.';

  @override
  String get docScanScanning => 'Scanning…';

  @override
  String get docScanStart => 'Start scanning';

  @override
  String get docScanScannedPages => 'Scanned pages';

  @override
  String docScanPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
    );
    return '$_temp0';
  }

  @override
  String get docScanSavePdf => 'Save PDF';

  @override
  String get docScanSharePdf => 'Share PDF';

  @override
  String get docScanCopyText => 'Copy text';

  @override
  String get docScanSaveJpg => 'Save as JPG';

  @override
  String get docScanAnother => 'Scan another document';

  @override
  String get pdfToolsChoosePdf => 'Choose a PDF';

  @override
  String get pdfToolsChooseHint =>
      'Or share a PDF to Utility Toolbox from any app';

  @override
  String get pdfToolsReading => 'Reading…';

  @override
  String get pdfToolsLockedShort => 'Password protected';

  @override
  String pdfToolsPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
    );
    return '$_temp0';
  }

  @override
  String get pdfToolsChange => 'Change';

  @override
  String get pdfToolsResultReady => 'Your PDF is ready';

  @override
  String get pdfToolsSaveDownloads => 'Save to Downloads';

  @override
  String get pdfToolsStartOver => 'Start over';

  @override
  String get pdfToolsSavedToDownloads =>
      'Saved to Downloads — find it in My Files';

  @override
  String get pdfToolsSharedInstead => 'Opened the share sheet instead';

  @override
  String get pdfToolsRangeEmpty => 'Enter at least one page.';

  @override
  String pdfToolsRangeInvalid(String part) {
    return '“$part” isn’t a page or range (e.g. 1-3, 5).';
  }

  @override
  String pdfToolsRangeOutside(String part, int count) {
    return '“$part” is outside 1–$count.';
  }

  @override
  String get pdfToolsInvalidPdf => 'This file doesn’t look like a valid PDF.';

  @override
  String pdfToolsLockedUnlockFirst(String tool) {
    return 'This PDF is password protected. Unlock it first with $tool.';
  }

  @override
  String pdfToolsPagesLabel(int count) {
    return 'Pages (1–$count)';
  }

  @override
  String pdfToolsPagesHint(String example) {
    return 'e.g. $example';
  }

  @override
  String pdfToolsPageN(int number) {
    return 'Page $number';
  }

  @override
  String get pdfToolsDownload => 'Download';

  @override
  String get pdfToolsSavedNotification =>
      'Saved to Downloads — check your notification to open it.';

  @override
  String get pdfToolsShareToSave =>
      'Opened share sheet — choose where to save the file.';

  @override
  String pdfToolsSelectedFile(String name) {
    return 'Selected: $name';
  }

  @override
  String pdfToolsSize(String size) {
    return 'Size: $size';
  }

  @override
  String get pdfToolsDragToReorder => 'Drag to reorder';

  @override
  String get pdfHomeTitle => 'PDF Toolkit';

  @override
  String get pdfHomeSection => 'PDF Tools';

  @override
  String get pdfHomeSubtitle => 'Create, combine, and optimize your documents';

  @override
  String get pdfPasswordEnter => 'Enter a password.';

  @override
  String pdfPasswordTooShort(int count) {
    return 'Use at least $count characters.';
  }

  @override
  String get pdfPasswordMismatch => 'The passwords don’t match.';

  @override
  String get pdfPasswordWrong => 'That password is not correct.';

  @override
  String get pdfPasswordLockFailed => 'Couldn’t lock this PDF.';

  @override
  String get pdfPasswordUnlockFailed => 'Couldn’t unlock this PDF.';

  @override
  String get pdfPasswordLockedDone => 'Your PDF is locked';

  @override
  String get pdfPasswordRemovedDone => 'Password removed';

  @override
  String get pdfPasswordAlreadyLocked =>
      'This PDF already has a password. Unlock it first.';

  @override
  String get pdfPasswordNotLocked =>
      'This PDF has no password — nothing to unlock.';

  @override
  String get pdfPasswordNew => 'New password';

  @override
  String get pdfPasswordCurrent => 'Current password';

  @override
  String get pdfPasswordRepeat => 'Repeat password';

  @override
  String get pdfPasswordShow => 'Show password';

  @override
  String get pdfPasswordHide => 'Hide password';

  @override
  String get pdfPasswordWarning =>
      'Keep this password safe — it can’t be recovered. Encrypted with AES-256.';

  @override
  String get pdfSplitExtract => 'Extract pages';

  @override
  String get pdfSplitRemove => 'Remove pages';

  @override
  String get pdfSplitPagesHelp =>
      'Use commas and ranges. “8-” means page 8 to the end.';

  @override
  String get pdfSplitRemovesAll => 'That would remove every page.';

  @override
  String get pdfSplitFailed => 'Couldn’t split this PDF.';

  @override
  String get pdfToImagesFailed => 'Couldn’t render this PDF.';

  @override
  String pdfToImagesSaved(int saved, int total) {
    return 'Saved $saved of $total images to your gallery';
  }

  @override
  String get pdfToImagesAllPages => 'All pages';

  @override
  String get pdfToImagesConvert => 'Convert to JPG';

  @override
  String pdfToImagesRendered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rendered $count pages…',
      one: 'Rendered 1 page…',
    );
    return '$_temp0';
  }

  @override
  String pdfToImagesRenderedOf(int count, int total) {
    return 'Rendered $count of $total pages…';
  }

  @override
  String pdfToImagesSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Save $count images to gallery',
      one: 'Save 1 image to gallery',
    );
    return '$_temp0';
  }

  @override
  String get pdfCompressButton => 'Compress';

  @override
  String get pdfCompressWorking => 'Compressing PDF…';

  @override
  String pdfCompressOriginalSize(String size) {
    return 'Original size: $size';
  }

  @override
  String get pdfCompressIntro =>
      'Choose a PDF file. Compression works best on image-heavy documents.';

  @override
  String get pdfCompressLow => 'Low';

  @override
  String get pdfCompressMedium => 'Medium';

  @override
  String get pdfCompressHigh => 'High';

  @override
  String get pdfCompressFailed => 'Could not compress this PDF.';

  @override
  String pdfCompressBefore(String size) {
    return 'Before: $size';
  }

  @override
  String pdfCompressAfter(String size) {
    return 'After: $size';
  }

  @override
  String get pdfMergeButton => 'Merge';

  @override
  String get pdfMergeWorking => 'Merging PDFs…';

  @override
  String get pdfMergePick => 'Pick PDF files';

  @override
  String get pdfMergeIntro => 'Select at least two PDF files to merge.';

  @override
  String get pdfMergeFailed =>
      'Could not merge PDFs. One of the files may be unreadable.';

  @override
  String pdfMergeResult(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Merged PDF ($count pages)',
      one: 'Merged PDF (1 page)',
    );
    return '$_temp0';
  }

  @override
  String get imageToPdfCreate => 'Create PDF';

  @override
  String get imageToPdfWorking => 'Creating PDF…';

  @override
  String get imageToPdfPick => 'Pick images';

  @override
  String get imageToPdfIntro => 'Select one or more images to convert.';

  @override
  String get imageToPdfFailed =>
      'Could not create PDF. Please try different images.';

  @override
  String imageToPdfReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF ready ($count pages)',
      one: 'PDF ready (1 page)',
    );
    return '$_temp0';
  }

  @override
  String get qrScanNoCodeInPhoto =>
      'No QR code or barcode found in this photo.';

  @override
  String get qrScanPhotoFailed => 'Couldn’t read this photo.';

  @override
  String qrScanResultTitle(String type) {
    return 'Scanned ($type)';
  }

  @override
  String get qrScanFromPhoto => 'Scan from photo';

  @override
  String get qrScanCameraNeeded =>
      'Camera access is needed to scan QR codes and barcodes.';

  @override
  String get qrScanCameraError =>
      'The camera couldn’t start. Close other camera apps and try again.';

  @override
  String get qrScanTorchOn => 'Turn on flashlight';

  @override
  String get qrScanTorchOff => 'Turn off flashlight';

  @override
  String get qrScanTypeLink => 'Link';

  @override
  String get qrScanTypeWifi => 'Wi‑Fi';

  @override
  String get qrScanTypeContact => 'Contact';

  @override
  String get qrScanTypeText => 'Text';

  @override
  String get qrGenInputLabel => 'Text or URL';

  @override
  String get qrGenInputHint => 'Enter content to encode';

  @override
  String get qrGenPreviewLabel => 'QR code preview';

  @override
  String get qrGenEmpty => 'Enter text above to preview your QR code.';

  @override
  String get qrGenSaveGallery => 'Save to Gallery';

  @override
  String get qrHomeTitle => 'QR & Barcode';

  @override
  String get qrHomeTabScan => 'Scan';

  @override
  String get qrHomeTabCreate => 'Create';

  @override
  String get qrHomeScanTitle => 'Scan a code';

  @override
  String get qrHomeScanBody =>
      'Point your camera at a QR code or barcode to scan it instantly.';

  @override
  String get qrHomeBadgeInstant => 'Instant';

  @override
  String get qrHomeBadgeHistory => 'Saved history';

  @override
  String get qrHomeStartScan => 'Start scanning';

  @override
  String get qrHomeCreateTitle => 'Create a code';

  @override
  String get qrHomeCreateBody =>
      'Create a QR code from text or a URL, then save or share it.';

  @override
  String get qrHomeBadgeShare => 'Share anywhere';

  @override
  String get qrHomeBadgeImage => 'Save as image';

  @override
  String get qrHomeOpenGenerator => 'Open generator';

  @override
  String get qrHistoryTitle => 'Scan history';

  @override
  String get qrHistoryMore => 'More options';

  @override
  String get qrHistoryEmpty => 'Scanned codes will appear here.';

  @override
  String get wifiQrPlaceholder => 'Enter WiFi details\nto generate QR';

  @override
  String get wifiQrPreviewLabel => 'WiFi QR code';

  @override
  String get wifiQrNetworkDetails => 'Network details';

  @override
  String get wifiQrSsidLabel => 'Network name (SSID)';

  @override
  String get wifiQrSsidHint => 'My Home WiFi';

  @override
  String get wifiQrPasswordLabel => 'Password';

  @override
  String get wifiQrPasswordHint => 'Enter password';

  @override
  String get wifiQrShowPassword => 'Show password';

  @override
  String get wifiQrHidePassword => 'Hide password';

  @override
  String get wifiQrSecurity => 'Security';

  @override
  String get wifiQrSecurityNone => 'None (open)';

  @override
  String get wifiQrHidden => 'Hidden network';

  @override
  String get wifiQrHiddenHint => 'Turn on if the network name isn’t broadcast';

  @override
  String get wifiQrSaveImage => 'Save image';

  @override
  String get wifiQrInfo =>
      'Anyone who scans this QR code will automatically connect to your WiFi network.';

  @override
  String get wifiQrShareText => 'Scan this QR code to connect to my WiFi!';

  @override
  String get ocrCameraDenied =>
      'Camera permission denied. Open Settings to allow access.';

  @override
  String get ocrCameraRequired =>
      'Camera permission is required to take a photo.';

  @override
  String get ocrTimeout =>
      'Reading took too long — the text model may still be downloading. Connect to Wi‑Fi once, or try again.';

  @override
  String get ocrFailed =>
      'Could not read text from this image. Try a clearer photo.';

  @override
  String get ocrPreparing => 'Preparing image…';

  @override
  String get ocrScanning => 'Reading text…';

  @override
  String get ocrScriptLabel => 'Text script';

  @override
  String get ocrScriptHint =>
      'Pick the alphabet your text is written in. Arabic, Urdu and Bengali can’t be read yet.';

  @override
  String get ocrScriptLatin => 'Latin (English, Spanish…)';

  @override
  String get ocrScriptDevanagari => 'Devanagari (Hindi, Marathi…)';

  @override
  String get ocrScriptChinese => 'Chinese';

  @override
  String get ocrScriptJapanese => 'Japanese';

  @override
  String get ocrScriptKorean => 'Korean';

  @override
  String get ocrIdleTitle => 'Extract text from any image';

  @override
  String get ocrIdleBody =>
      'Point your camera or choose a photo — text is extracted instantly, on-device.';

  @override
  String get ocrBadgeOnDevice => 'On-device AI';

  @override
  String get ocrBadgeLocal => 'Processed locally';

  @override
  String get ocrBadgeBlocks => 'Block-level copy';

  @override
  String get ocrUseCamera => 'Use camera';

  @override
  String get ocrChooseGallery => 'Choose from gallery';

  @override
  String get ocrOnDeviceNote => 'On-device · no upload needed';

  @override
  String get ocrTabImage => 'Image';

  @override
  String get ocrTabText => 'Text';

  @override
  String get ocrTapBlockHint => 'Tap a highlighted block to copy it';

  @override
  String get ocrBlockTitle => 'Block text';

  @override
  String ocrBlockLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lines · tap to copy',
      one: '1 line · tap to copy',
    );
    return '$_temp0';
  }

  @override
  String get ocrCopyBlock => 'Copy block';

  @override
  String get ocrBlockCopied => 'Block copied';

  @override
  String get ocrCopyEntireBlock => 'Copy entire block';

  @override
  String get ocrCopyLine => 'Copy line';

  @override
  String get ocrNoText => 'No text detected — try a clearer photo.';

  @override
  String get ocrQuickCopy => 'Quick copy by section';

  @override
  String ocrBlockNCopied(int number) {
    return 'Copied block $number';
  }

  @override
  String get ocrDoneEditing => 'Done editing';

  @override
  String get ocrEditText => 'Edit text';

  @override
  String get ocrAllCopied => 'All text copied';

  @override
  String get ocrCopyAll => 'Copy all';

  @override
  String get ocrScanAgain => 'Scan';

  @override
  String ocrStatLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lines',
      one: '1 line',
    );
    return '$_temp0';
  }

  @override
  String ocrStatWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
    );
    return '$_temp0';
  }

  @override
  String ocrStatChars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count characters',
      one: '1 character',
    );
    return '$_temp0';
  }

  @override
  String get wordPdfNoText => 'No extractable text found in this document.';

  @override
  String get wordPdfInfo =>
      'Converts .docx files to PDF. The text is kept; complex layouts (tables, images) may look different.';

  @override
  String get wordPdfOpeningPicker => 'Opening file picker…';

  @override
  String wordPdfConverting(int percent) {
    return 'Converting… $percent%';
  }

  @override
  String get wordPdfDone => 'Conversion complete';

  @override
  String get wordPdfTapToPick => 'Tap to pick a .docx file';

  @override
  String get wordPdfSupports => 'Supports .docx format';

  @override
  String get wordPdfFailed =>
      'Conversion failed. The file may be damaged or not a .docx document.';

  @override
  String get wordPdfFontsOffline =>
      'Some text (e.g. Arabic, Urdu, Hindi, Bengali or Cyrillic) is missing from this PDF. Its font is downloaded once — connect to the internet and convert again.';

  @override
  String get wordPdfConvertAnother => 'Convert another';

  @override
  String get wordPdfPick => 'Pick .docx file';

  @override
  String get wordPdfStep1Title => 'Pick your Word file';

  @override
  String get wordPdfStep1Desc =>
      'Select a .docx file from your device storage.';

  @override
  String get wordPdfStep2Title => 'Automatic conversion';

  @override
  String get wordPdfStep2Desc =>
      'Text is extracted and laid out as A4 PDF pages.';

  @override
  String get wordPdfStep3Title => 'Share or save';

  @override
  String get wordPdfStep3Desc =>
      'Share the PDF to any app, email, or cloud storage.';

  @override
  String get wordPdfReady => 'PDF ready';
}
