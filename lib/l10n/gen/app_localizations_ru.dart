// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Utility Toolbox';

  @override
  String get navTools => 'Инструменты';

  @override
  String get navFiles => 'Мои файлы';

  @override
  String get settingsTooltip => 'Настройки';

  @override
  String get searchHint => 'Поиск: сжать pdf, сканер, jpg…';

  @override
  String get quickActions => 'Быстрые действия';

  @override
  String get favorites => 'Избранное';

  @override
  String get recent => 'Недавние';

  @override
  String searchNoResults(String query) {
    return 'Ничего не найдено по запросу «$query»';
  }

  @override
  String get toolMenuAddFavorite => 'В избранное';

  @override
  String get toolMenuRemoveFavorite => 'Убрать из избранного';

  @override
  String get toolMenuPinShortcut => 'На главный экран';

  @override
  String get pinShortcutRequested =>
      'Подтвердите, чтобы добавить ярлык на главный экран';

  @override
  String get pinShortcutUnsupported => 'Ваш лаунчер не поддерживает ярлыки';

  @override
  String get newBadge => 'НОВОЕ';

  @override
  String get catScan => 'Сканер и QR';

  @override
  String get catPdf => 'PDF';

  @override
  String get catImage => 'Фото и картинки';

  @override
  String get catText => 'Текст и перевод';

  @override
  String get catCalc => 'Расчёты и конвертеры';

  @override
  String get catNetwork => 'Интернет';

  @override
  String get catDevice => 'Устройство и место';

  @override
  String get catSecurity => 'Безопасность';

  @override
  String get catMedia => 'Видео и аудио';

  @override
  String get toolDocScannerTitle => 'Сканер документов';

  @override
  String get toolDocScannerDesc => 'Бумага в PDF, края находятся сами';

  @override
  String get toolDocScannerKeywords =>
      'сканер, сканировать, сканер документов, скан, отсканировать, чек, квитанция, документ, камсканер, scan paper, camscanner, document, pdf scanner, receipt';

  @override
  String get toolQrScannerTitle => 'Сканер QR и штрихкодов';

  @override
  String get toolQrScannerDesc => 'С камеры или из фото';

  @override
  String get toolQrScannerKeywords =>
      'qr сканер, считать qr, сканер qr кода, штрихкод, штрих код, куар, qr reader, barcode, scan code';

  @override
  String get toolQrGeneratorTitle => 'Создать QR-код';

  @override
  String get toolQrGeneratorDesc => 'Ссылки, текст, контакты и другое';

  @override
  String get toolQrGeneratorKeywords =>
      'создать qr, генератор qr кода, сделать qr код, штрихкод, qr maker, generate qr, barcode generator';

  @override
  String get toolOcrTitle => 'Текст с фото';

  @override
  String get toolOcrDesc => 'Скопируйте текст с любого фото (OCR)';

  @override
  String get toolOcrKeywords =>
      'распознать текст, распознавание текста, текст с картинки, скопировать текст с фото, ocr, text scanner, extract text, copy text from image';

  @override
  String get toolWifiQrTitle => 'QR-код WiFi';

  @override
  String get toolWifiQrDesc => 'Поделиться WiFi без ввода пароля';

  @override
  String get toolWifiQrKeywords =>
      'пароль wifi, пароль вайфай, поделиться wifi, вай фай, wifi password, share wifi';

  @override
  String get toolImageToPdfTitle => 'Фото в PDF';

  @override
  String get toolImageToPdfDesc => 'Объедините фото в один PDF';

  @override
  String get toolImageToPdfKeywords =>
      'jpg в pdf, фото в pdf, картинка в pdf, изображение в пдф, jpg to pdf, photo to pdf, picture to pdf';

  @override
  String get toolMergePdfTitle => 'Объединить PDF';

  @override
  String get toolMergePdfDesc => 'Несколько PDF в один файл';

  @override
  String get toolMergePdfKeywords =>
      'объединить pdf, склеить pdf, соединить пдф, join pdf, combine pdf';

  @override
  String get toolCompressPdfTitle => 'Сжать PDF';

  @override
  String get toolCompressPdfDesc => 'Уменьшить PDF для отправки';

  @override
  String get toolCompressPdfKeywords =>
      'сжать pdf, уменьшить размер pdf, сжать пдф, reduce pdf size, shrink pdf';

  @override
  String get toolSplitPdfTitle => 'Разделить PDF';

  @override
  String get toolSplitPdfDesc => 'Извлечь или удалить страницы';

  @override
  String get toolSplitPdfKeywords =>
      'разделить pdf, извлечь страницы, удалить страницы, вырезать страницы, extract pages, delete pages, cut pdf';

  @override
  String get toolPdfToImagesTitle => 'PDF в JPG';

  @override
  String get toolPdfToImagesDesc => 'Каждая страница — картинка';

  @override
  String get toolPdfToImagesKeywords =>
      'pdf в jpg, pdf в картинку, пдф в фото, pdf в png, pdf to image, pdf to png, pdf pages';

  @override
  String get toolProtectPdfTitle => 'Защитить PDF';

  @override
  String get toolProtectPdfDesc => 'Поставить пароль на PDF';

  @override
  String get toolProtectPdfKeywords =>
      'пароль на pdf, зашифровать pdf, защита pdf, password pdf, encrypt pdf, secure pdf';

  @override
  String get toolUnlockPdfTitle => 'Снять пароль с PDF';

  @override
  String get toolUnlockPdfDesc => 'Убрать известный вам пароль';

  @override
  String get toolUnlockPdfKeywords =>
      'снять пароль pdf, разблокировать pdf, убрать пароль, remove pdf password, decrypt pdf';

  @override
  String get toolWordToPdfTitle => 'Word в PDF';

  @override
  String get toolWordToPdfDesc => 'Конвертация документов .docx';

  @override
  String get toolWordToPdfKeywords =>
      'ворд в пдф, word в pdf, doc в pdf, doc to pdf, docx, word';

  @override
  String get toolImageCompressorTitle => 'Сжать фото';

  @override
  String get toolImageCompressorDesc => 'Меньше вес, то же качество';

  @override
  String get toolImageCompressorKeywords =>
      'сжать фото, уменьшить размер фото, сжать jpg, кб, reduce image size, compress jpg, kb';

  @override
  String get toolImageResizerTitle => 'Размер и формат';

  @override
  String get toolImageResizerDesc => 'Точный размер, JPG, PNG или WEBP';

  @override
  String get toolImageResizerKeywords =>
      'изменить размер фото, jpg в png, png в jpg, фото на паспорт, resize image, jpg to png, png to jpg, webp, passport size';

  @override
  String get toolImageEnhancerTitle => 'Фоторедактор';

  @override
  String get toolImageEnhancerDesc => 'Фильтры, обрезка, яркость и другое';

  @override
  String get toolImageEnhancerKeywords =>
      'редактор фото, обработка фото, фильтр, обрезать, повернуть, edit photo, filter, crop, rotate';

  @override
  String get toolAiUpscalerTitle => 'AI-улучшение фото';

  @override
  String get toolAiUpscalerDesc => 'Увеличьте фото до 4× чётче';

  @override
  String get toolAiUpscalerKeywords =>
      'улучшить качество фото, увеличить разрешение, размытое фото, hd, enhance, increase resolution, blurry';

  @override
  String get toolTranslationTitle => 'Переводчик';

  @override
  String get toolTranslationDesc => 'Офлайн, с голосом и озвучкой';

  @override
  String get toolTranslationKeywords =>
      'переводчик, перевести, перевод, язык, словарь, translator, language, dictionary';

  @override
  String get toolTextUtilitiesTitle => 'Работа с текстом';

  @override
  String get toolTextUtilitiesDesc => 'Счёт слов, регистр, Base64';

  @override
  String get toolTextUtilitiesKeywords =>
      'счётчик слов, количество символов, заглавные буквы, строчные буквы, word counter, uppercase, lowercase, base64';

  @override
  String get toolSmartClipboardTitle => 'Буфер обмена';

  @override
  String get toolSmartClipboardDesc => 'Сохраняйте и ищите скопированное';

  @override
  String get toolSmartClipboardKeywords =>
      'буфер обмена, копировать вставить, заметки, история буфера, copy paste, notes, clipboard history';

  @override
  String get toolCalculatorTitle => 'Калькулятор';

  @override
  String get toolCalculatorDesc => 'Обычный калькулятор с историей';

  @override
  String get toolCalculatorKeywords =>
      'калькулятор, посчитать, проценты, математика, calc, math, percent';

  @override
  String get toolAgeCalculatorTitle => 'Возраст и даты';

  @override
  String get toolAgeCalculatorDesc => 'Точный возраст и дни между датами';

  @override
  String get toolAgeCalculatorKeywords =>
      'день рождения, сколько мне лет, разница дат, счётчик дней, birthday, date difference, days counter';

  @override
  String get toolUnitConverterTitle => 'Конвертер величин';

  @override
  String get toolUnitConverterDesc => 'Длина, вес, температура и другое';

  @override
  String get toolUnitConverterKeywords =>
      'конвертер единиц, перевод величин, см в дюймы, кг в фунты, цельсий, convert units, cm to inch, kg to lb, celsius';

  @override
  String get toolLoanCalculatorTitle => 'Кредит и платёж';

  @override
  String get toolLoanCalculatorDesc => 'Ежемесячный платёж и переплата';

  @override
  String get toolLoanCalculatorKeywords =>
      'кредитный калькулятор, ипотека, проценты, ежемесячный платёж, рассрочка, emi, mortgage, interest, installment';

  @override
  String get toolTimezoneTitle => 'Мировое время';

  @override
  String get toolTimezoneDesc => 'Время в любом городе, есть виджет';

  @override
  String get toolTimezoneKeywords =>
      'часовой пояс, часы, время в городе, мировые часы, time zone, clock, city time';

  @override
  String get toolColorPickerTitle => 'Палитра цветов';

  @override
  String get toolColorPickerDesc => 'HEX, RGB, HSL и CMYK';

  @override
  String get toolColorPickerKeywords =>
      'код цвета, цвет, палитра, color code, hex, palette';

  @override
  String get toolSpeedTestTitle => 'Скорость интернета';

  @override
  String get toolSpeedTestDesc => 'Загрузка, отдача и пинг';

  @override
  String get toolSpeedTestKeywords =>
      'скорость интернета, спидтест, проверить скорость, скорость wifi, мбит, wifi speed, internet speed, mbps';

  @override
  String get toolIpPingTitle => 'IP и пинг';

  @override
  String get toolIpPingDesc => 'Ваш IP и доступность хоста';

  @override
  String get toolIpPingKeywords => 'мой ip, пинг, сеть, my ip, ping, network';

  @override
  String get toolCompassTitle => 'Компас';

  @override
  String get toolCompassDesc => 'Направление и азимут';

  @override
  String get toolCompassKeywords =>
      'компас, направление, север, кибла, direction, north, qibla';

  @override
  String get toolLocationSaverTitle => 'Сохранить место';

  @override
  String get toolLocationSaverDesc => 'Запомнить точку GPS и поделиться';

  @override
  String get toolLocationSaverKeywords =>
      'парковка, где машина, координаты, карта, gps, parking, map, coordinates';

  @override
  String get toolPasswordGeneratorTitle => 'Генератор паролей';

  @override
  String get toolPasswordGeneratorDesc => 'Надёжные случайные пароли';

  @override
  String get toolPasswordGeneratorKeywords =>
      'надёжный пароль, придумать пароль, случайный, secure password, random';

  @override
  String get toolHashGeneratorTitle => 'Генератор хешей';

  @override
  String get toolHashGeneratorDesc => 'MD5, SHA-1, SHA-256 текста и файлов';

  @override
  String get toolHashGeneratorKeywords =>
      'хеш, контрольная сумма, checksum, md5, sha256';

  @override
  String get toolVideoConverterTitle => 'Конвертер видео';

  @override
  String get toolVideoConverterDesc => 'Видео в MP3, GIF, MP4 и другое';

  @override
  String get toolVideoConverterKeywords =>
      'видео в mp3, извлечь звук, сделать gif, конвертер видео, video to mp3, gif maker, audio extract';

  @override
  String get filesEmptyTitle => 'Файлов пока нет';

  @override
  String get filesEmptyBody =>
      'Здесь появятся PDF, картинки и другие созданные вами файлы — их можно снова открыть или отправить.';

  @override
  String get fileOpen => 'Открыть';

  @override
  String get fileShare => 'Поделиться';

  @override
  String get fileRemoveFromList => 'Убрать из списка';

  @override
  String get fileOpenFailed =>
      'Не удалось открыть файл. Возможно, его переместили или удалили.';

  @override
  String get filesClearList => 'Очистить список';

  @override
  String get filesClearConfirm =>
      'Очистить список? Сами файлы останутся на устройстве.';

  @override
  String get incomingSheetTitle => 'Что сделать?';

  @override
  String incomingImages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count изображения',
      many: '$count изображений',
      few: '$count изображения',
      one: '$count изображение',
    );
    return '$_temp0';
  }

  @override
  String incomingPdfs(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла PDF',
      many: '$count файлов PDF',
      few: '$count файла PDF',
      one: '$count файл PDF',
    );
    return '$_temp0';
  }

  @override
  String get incomingText => 'Полученный текст';

  @override
  String get incomingDocument => 'Документ Word';

  @override
  String get incomingVideo => 'Видео';

  @override
  String get incomingUnsupported => 'Этот тип файлов пока не поддерживается';

  @override
  String get incomingFailed => 'Не удалось прочитать файл';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsAppearance => 'Оформление';

  @override
  String get settingsTheme => 'Тема';

  @override
  String get themeSystem => 'Авто';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get languageSystem => 'Как в системе';

  @override
  String get settingsPurchases => 'Покупки';

  @override
  String get removeAdsTitle => 'Убрать рекламу';

  @override
  String get removeAdsSubtitle => 'Разовая покупка, без подписки';

  @override
  String get restorePurchasesTitle => 'Восстановить покупки';

  @override
  String get restorePurchasesSubtitle => 'Вернуть покупку на этом устройстве';

  @override
  String get settingsSupport => 'Поддержка и конфиденциальность';

  @override
  String get shareAppTitle => 'Поделиться приложением';

  @override
  String get shareAppSubtitle => 'Расскажите другу о Utility Toolbox';

  @override
  String shareAppMessage(String url) {
    return 'Я пользуюсь Utility Toolbox: сканирую документы, редактирую PDF, читаю QR-коды и перевожу без интернета. Бесплатно: $url';
  }

  @override
  String get rateAppTitle => 'Оценить приложение';

  @override
  String get rateAppSubtitle => 'Короткий отзыв очень помогает';

  @override
  String get privacyPolicyTitle => 'Политика конфиденциальности';

  @override
  String get privacyPolicySubtitle => 'К чему есть доступ у приложения и зачем';

  @override
  String get privacyChoicesTitle => 'Настройки рекламы';

  @override
  String get privacyChoicesSubtitle =>
      'Изменить согласие на персональную рекламу';

  @override
  String versionLabel(String version) {
    return 'Версия $version';
  }

  @override
  String get onboardingSkip => 'Пропустить';

  @override
  String get onboardingNext => 'Далее';

  @override
  String get onboardingStart => 'Начать';

  @override
  String get onboarding1Title => 'Все инструменты\nв одном';

  @override
  String get onboarding1Body =>
      'Сканируйте документы, редактируйте PDF, читайте QR-коды, переводите и меняйте размер фото — без десятка разных приложений.';

  @override
  String get onboarding2Title => 'Работает из\nлюбого приложения';

  @override
  String get onboarding2Body =>
      'Отправьте фото или PDF в Utility Toolbox, выделите текст, чтобы перевести его, или удерживайте значок приложения для ярлыков.';

  @override
  String get onboarding3Title => 'Быстро, офлайн\nи приватно';

  @override
  String get onboarding3Body =>
      'Почти всё работает прямо на телефоне. Файлы никуда не загружаются, пока вы сами не включите облачную функцию.';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonClear => 'Очистить';
}
