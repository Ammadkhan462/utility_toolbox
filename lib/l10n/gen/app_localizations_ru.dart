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

  @override
  String get toolBgRemoverTitle => 'Удалить фон';

  @override
  String get toolBgRemoverDesc => 'Вырезайте людей и предметы одним касанием';

  @override
  String get toolBgRemoverKeywords =>
      'удалить фон, убрать фон, вырезать, прозрачный, стикер, фото на паспорт, белый фон, remove background, remove bg, cutout, png';

  @override
  String get toolBmiTitle => 'Калькулятор ИМТ';

  @override
  String get toolBmiDesc => 'Индекс массы тела и здоровый вес';

  @override
  String get toolBmiKeywords =>
      'ИМТ, индекс массы тела, вес, рост, идеальный вес, ожирение, здоровье, bmi, body mass index, weight, height, ideal weight, obesity';

  @override
  String get toolBubbleLevelTitle => 'Уровень';

  @override
  String get toolBubbleLevelDesc => 'Проверьте, ровно ли висят полки и рамки';

  @override
  String get toolBubbleLevelKeywords =>
      'уровень, строительный уровень, ровно, угол, наклон, уклономер, level, spirit level, bubble level, tilt';

  @override
  String get toolCurrencyTitle => 'Конвертер валют';

  @override
  String get toolCurrencyDesc => 'Актуальные курсы более 150 валют';

  @override
  String get toolCurrencyKeywords =>
      'валюта, курс валют, обмен, деньги, конвертер, перевести, доллар, евро, рубль, тенге, currency, exchange rate, money, convert, forex';

  @override
  String get toolDirectChatTitle => 'Прямой чат';

  @override
  String get toolDirectChatDesc => 'Написать в WhatsApp, не сохраняя номер';

  @override
  String get toolDirectChatKeywords =>
      'ватсап, вотсап, прямой чат, сообщение, без сохранения номера, написать, whatsapp, direct chat, message, unsaved number, click to chat, wa.me, send message, chat';

  @override
  String get toolFlashlightTitle => 'Фонарик';

  @override
  String get toolFlashlightDesc => 'Яркий фонарик с SOS и стробоскопом';

  @override
  String get toolFlashlightKeywords =>
      'фонарик, фонарь, свет, вспышка, лампа, стробоскоп, flashlight, torch, light, led, sos, strobe, flash';

  @override
  String get toolOrganizePdfTitle => 'Упорядочить PDF';

  @override
  String get toolOrganizePdfDesc =>
      'Меняйте порядок страниц, поворачивайте и удаляйте их';

  @override
  String get toolOrganizePdfKeywords =>
      'упорядочить, порядок страниц, повернуть, удалить страницы, сортировать, organize, organise, reorder, rotate, delete pages, remove pages, arrange, sort, pdf';

  @override
  String get toolPdfToTextTitle => 'PDF в текст';

  @override
  String get toolPdfToTextDesc => 'Скопируйте весь текст из PDF';

  @override
  String get toolPdfToTextKeywords =>
      'извлечь текст, скопировать текст, pdf в txt, конвертировать, прочитать pdf, pdf to text, extract text, copy text, txt, read pdf, convert, pdf to word';

  @override
  String get toolPercentageTitle => 'Проценты и скидки';

  @override
  String get toolPercentageDesc =>
      'Проценты, скидки, чаевые и налог за секунды';

  @override
  String get toolPercentageKeywords =>
      'процент, проценты, скидка, распродажа, чаевые, разделить счёт, НДС, налог, percentage, percent, discount, tip, split bill, tax, vat';

  @override
  String get toolSignPdfTitle => 'Подписать PDF';

  @override
  String get toolSignPdfDesc =>
      'Нарисуйте подпись и поставьте её на любую страницу';

  @override
  String get toolSignPdfKeywords =>
      'подписать, подпись, электронная подпись, заполнить и подписать, автограф, sign, signature, e-sign, esign, fill and sign, autograph, pdf';

  @override
  String get toolStopwatchTitle => 'Секундомер и таймер';

  @override
  String get toolStopwatchDesc =>
      'Секундомер с кругами и таймер обратного отсчёта';

  @override
  String get toolStopwatchKeywords =>
      'секундомер, таймер, обратный отсчёт, круг, будильник, часы, кухонный таймер, тренировка, stopwatch, timer, countdown, lap';

  @override
  String get toolWatermarkPdfTitle => 'Водяной знак и номера страниц';

  @override
  String get toolWatermarkPdfDesc =>
      'Добавьте текст или номера на каждую страницу';

  @override
  String get toolWatermarkPdfKeywords =>
      'водяной знак, штамп, номера страниц, нумерация, конфиденциально, черновик, колонтитул, watermark, stamp, page numbers, number pages, confidential, draft, footer, header, pdf';

  @override
  String get bmiMetric => 'Метрическая (см, кг)';

  @override
  String get bmiImperial => 'Имперская (фут, фунт)';

  @override
  String get bmiHeight => 'Рост';

  @override
  String get bmiWeight => 'Вес';

  @override
  String get bmiFeet => 'Футы';

  @override
  String get bmiInches => 'Дюймы';

  @override
  String get bmiUnitCm => 'см';

  @override
  String get bmiUnitKg => 'кг';

  @override
  String get bmiUnitLb => 'фунт';

  @override
  String get bmiUnitFt => 'фут';

  @override
  String get bmiUnitIn => 'дюйм';

  @override
  String get bmiAge => 'Возраст (необязательно)';

  @override
  String get bmiSex => 'Пол (необязательно)';

  @override
  String get bmiMale => 'Мужской';

  @override
  String get bmiFemale => 'Женский';

  @override
  String get bmiYourBmi => 'Ваш ИМТ';

  @override
  String get bmiUnderweight => 'Недостаточный вес';

  @override
  String get bmiNormal => 'Нормальный вес';

  @override
  String get bmiOverweight => 'Избыточный вес';

  @override
  String get bmiObese => 'Ожирение';

  @override
  String bmiHealthyRange(String min, String max) {
    return 'Здоровый вес при вашем росте: $min – $max';
  }

  @override
  String bmiToLose(String amount) {
    return 'Примерно на $amount выше нормы';
  }

  @override
  String bmiToGain(String amount) {
    return 'Примерно на $amount ниже нормы';
  }

  @override
  String bmiIdealWeight(String weight) {
    return 'Примерный идеальный вес: $weight';
  }

  @override
  String get bmiChildNote =>
      'Для детей и подростков до 18 лет ИМТ оценивают по возрастным таблицам роста. Здесь используются нормы для взрослых.';

  @override
  String get bmiDisclaimer => 'ИМТ — общий ориентир, а не медицинский диагноз.';

  @override
  String get bmiEnterValues => 'Введите рост и вес';

  @override
  String get currencyAmount => 'Сумма';

  @override
  String get currencyFrom => 'Из валюты';

  @override
  String get currencyTo => 'В валюту';

  @override
  String get currencySwap => 'Поменять валюты местами';

  @override
  String get currencyChoose => 'Выбрать валюту';

  @override
  String get currencySearchHint => 'Поиск валюты или кода';

  @override
  String get currencyAll => 'Все валюты';

  @override
  String currencyRatesFrom(String date) {
    return 'Курсы на $date';
  }

  @override
  String get currencyRefresh => 'Обновить курсы';

  @override
  String get currencyUpdating => 'Обновляем курсы…';

  @override
  String get currencyOfflineCached =>
      'Не удалось обновить. Показаны сохранённые курсы.';

  @override
  String get currencyNoRatesTitle => 'Курсы ещё не загружены';

  @override
  String get currencyNoRatesBody =>
      'Подключитесь к интернету один раз, чтобы загрузить курсы. После этого конвертер работает и без сети.';

  @override
  String get currencyRetry => 'Повторить';

  @override
  String get currencyOtherFavorites => 'Избранные валюты';

  @override
  String get currencyFavoritesHint =>
      'Нажмите ☆ рядом с валютой в списке, чтобы добавить её сюда.';

  @override
  String get currencyCopy => 'Копировать результат';

  @override
  String get currencyCopied => 'Скопировано';

  @override
  String get currencyNoMatch => 'Валюта не найдена';

  @override
  String get currencyDisclaimer =>
      'Курсы справочные и могут отличаться от курса вашего банка.';

  @override
  String get directChatPhone => 'Номер телефона';

  @override
  String get directChatCountryCode => 'Код страны';

  @override
  String get directChatSearchCountry => 'Поиск страны или кода';

  @override
  String get directChatNoCountry => 'Страна не найдена';

  @override
  String get directChatMessage => 'Сообщение (необязательно)';

  @override
  String get directChatOpen => 'Открыть в WhatsApp';

  @override
  String get directChatPaste => 'Вставить номер';

  @override
  String get directChatPasteNone => 'В буфере обмена нет номера телефона';

  @override
  String get directChatTooShort => 'Номер слишком короткий';

  @override
  String get directChatTooLong => 'Номер слишком длинный';

  @override
  String directChatWillOpen(String number) {
    return 'Чат с $number';
  }

  @override
  String get directChatOpenFailed =>
      'Не удалось открыть чат. WhatsApp установлен?';

  @override
  String get directChatHint =>
      'Пишите на любой номер, не сохраняя его в контактах.';

  @override
  String get directChatNotAffiliated =>
      'Независимый инструмент. Не связан с WhatsApp или Meta.';

  @override
  String get percentageTabPercent => 'Проценты';

  @override
  String get percentageTabDiscount => 'Скидка';

  @override
  String get percentageTabTip => 'Чаевые';

  @override
  String get percentageTabTax => 'Налог / НДС';

  @override
  String get percentageOfTitle => 'Процент от числа';

  @override
  String get percentageFieldPercent => 'Процент';

  @override
  String get percentageFieldNumber => 'Число';

  @override
  String percentageOfResult(String percent, String number) {
    return '$percent от $number';
  }

  @override
  String get percentageWhatTitle => 'Сколько это процентов?';

  @override
  String get percentageFieldPart => 'Значение';

  @override
  String get percentageFieldTotal => 'Всего';

  @override
  String percentageWhatResult(String part, String total) {
    return '$part из $total';
  }

  @override
  String get percentageChangeTitle => 'Изменение в процентах';

  @override
  String get percentageFieldOld => 'Старое значение';

  @override
  String get percentageFieldNew => 'Новое значение';

  @override
  String percentageIncrease(String percent) {
    return 'Рост на $percent';
  }

  @override
  String percentageDecrease(String percent) {
    return 'Снижение на $percent';
  }

  @override
  String get percentageNoChange => 'Без изменений';

  @override
  String get percentageDifference => 'Разница';

  @override
  String get percentagePrice => 'Исходная цена';

  @override
  String get percentageDiscount => 'Скидка';

  @override
  String get percentageExtraDiscount => 'Доп. скидка (необязательно)';

  @override
  String get percentageYouPay => 'К оплате';

  @override
  String get percentageYouSave => 'Экономия';

  @override
  String get percentageTotalDiscount => 'Итоговая скидка';

  @override
  String get percentageBill => 'Сумма счёта';

  @override
  String get percentageTip => 'Чаевые';

  @override
  String get percentageCustom => 'Своё';

  @override
  String get percentagePeople => 'Человек';

  @override
  String get percentageAddPerson => 'Добавить человека';

  @override
  String get percentageRemovePerson => 'Убрать человека';

  @override
  String get percentageTipAmount => 'Сумма чаевых';

  @override
  String get percentageTotal => 'Итого';

  @override
  String get percentagePerPerson => 'С каждого';

  @override
  String get percentageTaxRate => 'Ставка налога';

  @override
  String get percentageAddTax => 'Начислить налог';

  @override
  String get percentageRemoveTax => 'Выделить налог';

  @override
  String get percentagePriceExclTax => 'Цена без налога';

  @override
  String get percentagePriceInclTax => 'Цена с налогом';

  @override
  String get percentageBeforeTax => 'Без налога';

  @override
  String get percentageTaxAmount => 'Налог';

  @override
  String get percentageAfterTax => 'Итого с налогом';

  @override
  String get percentageEnterValues => 'Введите числа, чтобы увидеть результат';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonShare => 'Поделиться';

  @override
  String get commonCopy => 'Копировать';

  @override
  String get commonCopied => 'Скопировано';

  @override
  String get commonRetry => 'Повторить';

  @override
  String get commonDone => 'Готово';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get commonUndo => 'Отменить';

  @override
  String get commonOpen => 'Открыть';

  @override
  String get commonReset => 'Сбросить';

  @override
  String get commonClose => 'Закрыть';

  @override
  String get commonOpenSettings => 'Открыть настройки';

  @override
  String get commonChoosePhoto => 'Выбрать фото';

  @override
  String get commonChooseFile => 'Выбрать файл';

  @override
  String get commonCamera => 'Камера';

  @override
  String get commonGallery => 'Галерея';

  @override
  String get commonWorking => 'Обработка…';

  @override
  String get commonSavedToGallery => 'Сохранено в галерею';

  @override
  String get commonSavedToDownloads => 'Сохранено в «Загрузки»';

  @override
  String get commonSaveFailed => 'Не удалось сохранить файл';

  @override
  String get commonErrorGeneric => 'Что-то пошло не так. Попробуйте ещё раз.';

  @override
  String get commonErrorOffline => 'Нет подключения к интернету';

  @override
  String get commonErrorTimeout =>
      'Время ожидания истекло. Попробуйте ещё раз.';

  @override
  String get commonPermissionNeeded =>
      'Нужно разрешение. Включите его в настройках.';

  @override
  String get commonResult => 'Результат';

  @override
  String get commonStart => 'Старт';

  @override
  String get commonStop => 'Стоп';

  @override
  String get commonClearAll => 'Очистить всё';

  @override
  String get commonPaste => 'Вставить';

  @override
  String get commonSearch => 'Поиск';

  @override
  String get organizePdfHint =>
      'Нажимайте на страницы, чтобы выбрать их. Удерживайте страницу и перетащите, чтобы переместить.';

  @override
  String organizePdfSelected(int count) {
    return 'Выбрано: $count';
  }

  @override
  String get organizePdfRotateLeft => 'Повернуть влево';

  @override
  String get organizePdfRotateRight => 'Повернуть вправо';

  @override
  String get organizePdfDelete => 'Удалить';

  @override
  String get organizePdfSelectAll => 'Выбрать все';

  @override
  String get organizePdfClearSelection => 'Снять выбор';

  @override
  String organizePdfDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалено $count страницы',
      many: 'Удалено $count страниц',
      few: 'Удалены $count страницы',
      one: 'Удалена $count страница',
    );
    return '$_temp0';
  }

  @override
  String get organizePdfUndo => 'Отменить';

  @override
  String get organizePdfKeepOne =>
      'В PDF должна остаться хотя бы одна страница.';

  @override
  String get organizePdfNoChanges =>
      'Изменений пока нет — сначала переместите, поверните или удалите страницы.';

  @override
  String get organizePdfReset => 'Отменить все изменения';

  @override
  String get organizePdfMoveEarlier => 'Переместить раньше';

  @override
  String get organizePdfMoveLater => 'Переместить позже';

  @override
  String get organizePdfSave => 'Сохранить PDF';

  @override
  String get organizePdfFailed => 'Не удалось сохранить этот PDF.';

  @override
  String get organizePdfResult => 'Упорядоченный PDF готов';

  @override
  String pdfToTextReading(int current, int total) {
    return 'Чтение страницы $current из $total…';
  }

  @override
  String pdfToTextWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слова',
      many: '$count слов',
      few: '$count слова',
      one: '$count слово',
    );
    return '$_temp0';
  }

  @override
  String get pdfToTextCopyAll => 'Копировать всё';

  @override
  String get pdfToTextCopied => 'Текст скопирован';

  @override
  String get pdfToTextSaveTxt => 'Сохранить как .txt';

  @override
  String get pdfToTextEmptyPage => 'На этой странице нет текста';

  @override
  String get pdfToTextScannedTitle => 'Текст не найден';

  @override
  String get pdfToTextScannedBody =>
      'Похоже, этот PDF состоит из сканов или фото, поэтому копировать нечего. Вместо этого можно распознать слова на странице 1 по изображению.';

  @override
  String pdfToTextOpenOcr(String tool) {
    return 'Распознать страницу 1: $tool';
  }

  @override
  String get pdfToTextFailed => 'Не удалось прочитать текст этого PDF.';

  @override
  String pdfToTextPartlyScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'На $count страницах нет текста (возможно, это сканы).',
      many: 'На $count страницах нет текста (возможно, это сканы).',
      few: 'На $count страницах нет текста (возможно, это сканы).',
      one: 'На $count странице нет текста (возможно, это скан).',
    );
    return '$_temp0';
  }

  @override
  String get pdfEditChoosePdf => 'Выберите PDF';

  @override
  String get pdfEditChooseHint =>
      'Или поделитесь PDF с Utility Toolbox из любого приложения';

  @override
  String get pdfEditChange => 'Изменить';

  @override
  String get pdfEditReading => 'Чтение…';

  @override
  String pdfEditPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '$count страница',
    );
    return '$_temp0';
  }

  @override
  String pdfEditPageN(int number) {
    return 'Страница $number';
  }

  @override
  String get pdfEditInvalidPdf => 'Этот файл не похож на корректный PDF.';

  @override
  String get pdfEditLocked =>
      'Этот PDF защищён паролем. Сначала снимите пароль, затем повторите попытку.';

  @override
  String get pdfEditLockedShort => 'Защищён паролем';

  @override
  String get pdfEditPreviewFailed => 'Не удалось показать эту страницу.';

  @override
  String get pdfEditResultReady => 'Ваш PDF готов';

  @override
  String get pdfEditSaveDownloads => 'Сохранить в «Загрузки»';

  @override
  String get pdfEditShare => 'Поделиться';

  @override
  String get pdfEditStartOver => 'Начать заново';

  @override
  String get pdfEditSavedToDownloads =>
      'Сохранено в «Загрузки» — файл есть в разделе «Мои файлы»';

  @override
  String get pdfEditSharedInstead => 'Вместо этого открыто меню «Поделиться»';

  @override
  String get pdfEditSaveFailed =>
      'Не удалось создать файл. Попробуйте ещё раз.';

  @override
  String get signPdfStepPdf => 'Выберите PDF';

  @override
  String get signPdfStepSignature => 'Создайте подпись';

  @override
  String get signPdfStepPlace => 'Нажмите на страницу, чтобы поставить подпись';

  @override
  String get signPdfDraw => 'Нарисовать подпись';

  @override
  String get signPdfDrawAgain => 'Нарисовать заново';

  @override
  String get signPdfUseSaved => 'Использовать сохранённую подпись';

  @override
  String get signPdfDeleteSaved => 'Удалить сохранённую подпись';

  @override
  String get signPdfSavedDeleted => 'Сохранённая подпись удалена';

  @override
  String get signPdfDrawTitle => 'Нарисуйте подпись';

  @override
  String get signPdfDrawHint => 'Распишитесь здесь пальцем';

  @override
  String get signPdfUndo => 'Отменить';

  @override
  String get signPdfInkBlack => 'Чёрный';

  @override
  String get signPdfInkBlue => 'Синий';

  @override
  String get signPdfRemember => 'Сохранить подпись на будущее';

  @override
  String get signPdfDone => 'Использовать эту подпись';

  @override
  String get signPdfEmpty => 'Сначала нарисуйте подпись.';

  @override
  String get signPdfSignatureLabel => 'Ваша подпись';

  @override
  String get signPdfPlaceHint =>
      'Перетащите, чтобы переместить; меняйте размер двумя пальцами или ползунком. Нажмите на страницу, чтобы перенести подпись туда.';

  @override
  String get signPdfSize => 'Размер';

  @override
  String get signPdfPlaceConfirm => 'Поставить здесь';

  @override
  String get signPdfRemoveFromPage => 'Убрать с этой страницы';

  @override
  String get signPdfAllPages => 'Добавить на все страницы';

  @override
  String signPdfAllPagesDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Подпись добавлена на все $count страницы',
      many: 'Подпись добавлена на все $count страниц',
      few: 'Подпись добавлена на все $count страницы',
      one: 'Подпись добавлена на $count страницу',
    );
    return '$_temp0';
  }

  @override
  String get signPdfClearAll => 'Убрать все';

  @override
  String signPdfPlacedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Подписано $count страницы',
      many: 'Подписано $count страниц',
      few: 'Подписаны $count страницы',
      one: 'Подписана $count страница',
      zero: 'Пока ни одна страница не подписана',
    );
    return '$_temp0';
  }

  @override
  String get signPdfSave => 'Сохранить подписанный PDF';

  @override
  String get signPdfNoPlacement =>
      'Сначала нажмите на страницу и поставьте подпись.';

  @override
  String get signPdfFailed => 'Не удалось подписать этот PDF.';

  @override
  String get signPdfResult => 'Подписанный PDF готов';

  @override
  String get watermarkPdfModeText => 'Текстовый знак';

  @override
  String get watermarkPdfModeNumbers => 'Номера страниц';

  @override
  String get watermarkPdfText => 'Текст водяного знака';

  @override
  String get watermarkPdfDefaultText => 'КОНФИДЕНЦИАЛЬНО';

  @override
  String get watermarkPdfTextEmpty => 'Сначала введите текст водяного знака.';

  @override
  String get watermarkPdfSize => 'Размер текста';

  @override
  String get watermarkPdfOpacity => 'Непрозрачность';

  @override
  String get watermarkPdfLayout => 'Расположение';

  @override
  String get watermarkPdfDiagonal => 'По диагонали';

  @override
  String get watermarkPdfCenter => 'По центру';

  @override
  String get watermarkPdfTiled => 'Плиткой';

  @override
  String get watermarkPdfColor => 'Цвет';

  @override
  String get watermarkPdfColorGrey => 'Серый';

  @override
  String get watermarkPdfColorRed => 'Красный';

  @override
  String get watermarkPdfColorBlue => 'Синий';

  @override
  String get watermarkPdfColorBlack => 'Чёрный';

  @override
  String get watermarkPdfColorGreen => 'Зелёный';

  @override
  String get watermarkPdfFormat => 'Формат';

  @override
  String watermarkPdfPageLabel(String number) {
    return 'Страница $number';
  }

  @override
  String get watermarkPdfPosition => 'Положение';

  @override
  String get watermarkPdfBottomCenter => 'Внизу по центру';

  @override
  String get watermarkPdfBottomRight => 'Внизу справа';

  @override
  String get watermarkPdfTopRight => 'Вверху справа';

  @override
  String get watermarkPdfStartAt => 'Начать с';

  @override
  String get watermarkPdfDecrease => 'Уменьшить';

  @override
  String get watermarkPdfIncrease => 'Увеличить';

  @override
  String get watermarkPdfPreview => 'Предпросмотр (страница 1)';

  @override
  String get watermarkPdfApplyText => 'Добавить водяной знак';

  @override
  String get watermarkPdfApplyNumbers => 'Добавить номера страниц';

  @override
  String get watermarkPdfFailed => 'Не удалось изменить этот PDF.';

  @override
  String get bgRemoverPickTitle => 'Выберите фото';

  @override
  String get bgRemoverPickBody =>
      'Лучше всего работает с людьми, животными и предметами. Фото обрабатывается прямо на телефоне.';

  @override
  String get bgRemoverGallery => 'Выбрать из галереи';

  @override
  String get bgRemoverCamera => 'Сделать фото';

  @override
  String get bgRemoverPreparing => 'Готовим фото…';

  @override
  String get bgRemoverWorking => 'Удаляем фон…';

  @override
  String get bgRemoverDownloading =>
      'Готовим инструмент удаления фона. Это происходит один раз и требует интернета…';

  @override
  String get bgRemoverDownloadFailed =>
      'Инструмент ещё не готов: сервисы Google Play продолжают его загружать. Проверьте подключение к интернету и попробуйте снова через минуту.';

  @override
  String get bgRemoverNoSubject =>
      'На этом фото не найдено ни людей, ни предметов. Попробуйте фото с чётким объектом.';

  @override
  String get bgRemoverOpenFailed =>
      'Не удалось открыть это фото. Попробуйте другое.';

  @override
  String get bgRemoverFailed => 'Не удалось удалить фон. Попробуйте ещё раз.';

  @override
  String get bgRemoverRetry => 'Повторить';

  @override
  String get bgRemoverAnotherPhoto => 'Выбрать другое фото';

  @override
  String get bgRemoverNewPhoto => 'Новое фото';

  @override
  String get bgRemoverBefore => 'До';

  @override
  String get bgRemoverAfter => 'После';

  @override
  String get bgRemoverCompare => 'Сравнить до и после';

  @override
  String get bgRemoverCompareHint => 'Перетащите ползунок, чтобы сравнить';

  @override
  String get bgRemoverBgTransparent => 'Прозрачный';

  @override
  String get bgRemoverBgWhite => 'Белый';

  @override
  String get bgRemoverBgBlack => 'Чёрный';

  @override
  String get bgRemoverBgBlue => 'Синий';

  @override
  String get bgRemoverBgRed => 'Красный';

  @override
  String get bgRemoverBgYellow => 'Жёлтый';

  @override
  String get bgRemoverBgBlur => 'Размытие';

  @override
  String get bgRemoverSave => 'Сохранить в галерею';

  @override
  String get bgRemoverSaved => 'Сохранено в галерею';

  @override
  String get bgRemoverSaveFailed =>
      'Не удалось сохранить изображение. Попробуйте ещё раз.';

  @override
  String get bgRemoverPngHint => 'PNG с прозрачным фоном';

  @override
  String get bgRemoverJpgHint => 'JPG с выбранным фоном';

  @override
  String get bubbleLevelSurfaceHint =>
      'Положите телефон на поверхность экраном вверх';

  @override
  String get bubbleLevelUprightHint => 'Приложите край телефона к поверхности';

  @override
  String get bubbleLevelLevel => 'Ровно';

  @override
  String bubbleLevelAngleLabel(String angle) {
    return 'Наклон $angle градусов';
  }

  @override
  String bubbleLevelAxes(String x, String y) {
    return 'Влево–вправо $x° · Вперёд–назад $y°';
  }

  @override
  String get bubbleLevelCalibrate => 'Откалибровать';

  @override
  String get bubbleLevelReset => 'Сбросить';

  @override
  String get bubbleLevelCalibrateTitle => 'Откалибровать уровень?';

  @override
  String get bubbleLevelCalibrateBody =>
      'Положите телефон на заведомо ровную поверхность (или приложите к ровному краю) и нажмите «Откалибровать». Текущее положение будет считаться 0°.';

  @override
  String get bubbleLevelCalibrated =>
      'Готово. Это положение теперь считается 0°.';

  @override
  String get bubbleLevelResetDone => 'Калибровка сброшена';

  @override
  String get bubbleLevelUnavailable =>
      'В этом телефоне нет датчика движения, поэтому уровень здесь не работает.';

  @override
  String get flashlightOn => 'Свет включён';

  @override
  String get flashlightOff => 'Свет выключен';

  @override
  String get flashlightTurnOn => 'Включить свет';

  @override
  String get flashlightTurnOff => 'Выключить свет';

  @override
  String get flashlightModeSteady => 'Постоянный';

  @override
  String get flashlightModeSos => 'SOS';

  @override
  String get flashlightModeStrobe => 'Стробоскоп';

  @override
  String get flashlightSosHint =>
      'Снова и снова мигает сигналом бедствия ··· ––– ···';

  @override
  String flashlightStrobeSpeed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count вспышки в секунду',
      many: '$count вспышек в секунду',
      few: '$count вспышки в секунду',
      one: '1 вспышка в секунду',
    );
    return '$_temp0';
  }

  @override
  String get flashlightUseScreen => 'Светить экраном';

  @override
  String get flashlightUseScreenHint => 'Светит экран вместо вспышки';

  @override
  String get flashlightNoTorch =>
      'На этом телефоне нет вспышки, поэтому светить будет экран.';

  @override
  String get flashlightTorchBusy =>
      'Вспышка занята (возможно, камерой пользуется другое приложение), поэтому светить будет экран.';

  @override
  String get flashlightScreenColor => 'Цвет экрана';

  @override
  String get flashlightColorWhite => 'Белый';

  @override
  String get flashlightColorWarm => 'Тёплый белый';

  @override
  String get flashlightColorRed => 'Красный';

  @override
  String get flashlightColorGreen => 'Зелёный';

  @override
  String get flashlightColorBlue => 'Синий';

  @override
  String get flashlightTapToTurnOff =>
      'Коснитесь в любом месте, чтобы выключить';

  @override
  String get stopwatchTabStopwatch => 'Секундомер';

  @override
  String get stopwatchTabTimer => 'Таймер';

  @override
  String get stopwatchStart => 'Старт';

  @override
  String get stopwatchPause => 'Пауза';

  @override
  String get stopwatchResume => 'Продолжить';

  @override
  String get stopwatchLap => 'Круг';

  @override
  String get stopwatchReset => 'Сбросить';

  @override
  String stopwatchLapNumber(int number) {
    return 'Круг $number';
  }

  @override
  String stopwatchCurrentLap(int number, String time) {
    return 'Круг $number: $time';
  }

  @override
  String get stopwatchBest => 'Самый быстрый';

  @override
  String get stopwatchWorst => 'Самый медленный';

  @override
  String get stopwatchNoLaps =>
      'Нажимайте «Круг» во время отсчёта, чтобы записывать время кругов.';

  @override
  String get stopwatchTimerQuickStart => 'Быстрый старт';

  @override
  String stopwatchTimerMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String get stopwatchTimerCustom => 'Задать своё время';

  @override
  String get stopwatchTimerPickTitle => 'Установить таймер';

  @override
  String get stopwatchTimerHours => 'часы';

  @override
  String get stopwatchTimerMinutesUnit => 'мин';

  @override
  String get stopwatchTimerSeconds => 'сек';

  @override
  String get stopwatchTimerAddMinute => '+1 мин';

  @override
  String get stopwatchTimerPaused => 'На паузе';

  @override
  String stopwatchTimerRemaining(String time) {
    return 'Осталось $time';
  }

  @override
  String get stopwatchTimerTimesUp => 'Время вышло!';

  @override
  String stopwatchTimerFinishedBody(String duration) {
    return 'Таймер на $duration завершён.';
  }

  @override
  String get stopwatchTimerRestart => 'Заново';

  @override
  String get stopwatchTimerDone => 'Готово';

  @override
  String get stopwatchTimerKeepOpen =>
      'Не закрывайте этот экран: телефон завибрирует, когда время выйдет.';

  @override
  String get translateHeroTitle => 'Говорите или печатайте для перевода';

  @override
  String get translateBadgeOnDevice => 'ИИ на устройстве';

  @override
  String get translateBadgeOffline => 'Работает офлайн';

  @override
  String get translateFrom => 'Исходный язык';

  @override
  String get translateTo => 'Язык перевода';

  @override
  String get translateSwap => 'Поменять языки местами';

  @override
  String get translateHint => 'Введите текст или нажмите на микрофон…';

  @override
  String get translateHintListening =>
      'Слушаю… говорите как обычно, нажмите на микрофон, чтобы остановить';

  @override
  String translateListeningIn(String language) {
    return 'Слушаю ($language)… нажмите на микрофон, чтобы остановить и перевести.';
  }

  @override
  String get translateSameLanguage =>
      'Исходный язык и язык перевода должны различаться.';

  @override
  String get translateButton => 'Перевести';

  @override
  String get translateTranslating => 'Перевод…';

  @override
  String get translateStopAndTranslate => 'Остановить и перевести';

  @override
  String get translateDownloadingModel => 'Загрузка языковой модели…';

  @override
  String get translateResultLabel => 'Перевод';

  @override
  String get translatePlayAudio => 'Прослушать';

  @override
  String get translateGenerating => 'Создание…';

  @override
  String get translateShareAudio => 'Отправить аудиофайл';

  @override
  String get translateGenerateAudio => 'Создать аудиофайл';

  @override
  String get translateAudioReady =>
      'Аудиофайл готов — поделитесь им, чтобы отправить или сохранить.';

  @override
  String get translateMicStop => 'Остановить запись и перевести';

  @override
  String get translateMicStart => 'Говорите для перевода';

  @override
  String get translateMicBlocked =>
      'Доступ к микрофону запрещён. Включите его в настройках, чтобы пользоваться голосовым вводом.';

  @override
  String get translateMicNeeded =>
      'Для голосового ввода нужно разрешение на микрофон.';

  @override
  String get translateSpeechUnavailable =>
      'Распознавание речи недоступно на этом устройстве.';

  @override
  String get translateNoSpeech =>
      'Не удалось распознать речь. Попробуйте ещё раз.';

  @override
  String get translateVoiceFailed =>
      'Голосовой ввод прерван. Попробуйте ещё раз.';

  @override
  String get translateDownloadFailed =>
      'Не удалось загрузить языковые модели. Проверьте подключение к интернету.';

  @override
  String get translateFailed => 'Не удалось перевести. Попробуйте ещё раз.';

  @override
  String get translateAudioFailed =>
      'Не удалось создать аудиофайл на этом устройстве.';

  @override
  String translateLanguageName(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'af': 'Африкаанс',
      'sq': 'Албанский',
      'ar': 'Арабский',
      'be': 'Белорусский',
      'bn': 'Бенгальский',
      'bg': 'Болгарский',
      'ca': 'Каталанский',
      'zh': 'Китайский (упрощённый)',
      'hr': 'Хорватский',
      'cs': 'Чешский',
      'da': 'Датский',
      'nl': 'Нидерландский',
      'en': 'Английский',
      'eo': 'Эсперанто',
      'et': 'Эстонский',
      'fi': 'Финский',
      'fr': 'Французский',
      'gl': 'Галисийский',
      'ka': 'Грузинский',
      'de': 'Немецкий',
      'el': 'Греческий',
      'gu': 'Гуджарати',
      'ht': 'Гаитянский креольский',
      'he': 'Иврит',
      'hi': 'Хинди',
      'hu': 'Венгерский',
      'is': 'Исландский',
      'id': 'Индонезийский',
      'ga': 'Ирландский',
      'it': 'Итальянский',
      'ja': 'Японский',
      'kn': 'Каннада',
      'ko': 'Корейский',
      'lv': 'Латышский',
      'lt': 'Литовский',
      'mk': 'Македонский',
      'ms': 'Малайский',
      'mt': 'Мальтийский',
      'mr': 'Маратхи',
      'no': 'Норвежский',
      'fa': 'Персидский (фарси)',
      'pl': 'Польский',
      'pt': 'Португальский',
      'ro': 'Румынский',
      'ru': 'Русский',
      'sk': 'Словацкий',
      'sl': 'Словенский',
      'es': 'Испанский',
      'sw': 'Суахили',
      'sv': 'Шведский',
      'tl': 'Тагальский (филиппинский)',
      'ta': 'Тамильский',
      'te': 'Телугу',
      'th': 'Тайский',
      'tr': 'Турецкий',
      'uk': 'Украинский',
      'ur': 'Урду',
      'vi': 'Вьетнамский',
      'cy': 'Валлийский',
      'other': '$code',
    });
    return '$_temp0';
  }

  @override
  String get textUtilMode => 'Режим';

  @override
  String get textUtilModeText => 'Текст';

  @override
  String get textUtilHint => 'Введите текст…';

  @override
  String get textUtilHintBase64 =>
      'Введите текст или Base64 для преобразования…';

  @override
  String textUtilWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'слова',
      many: 'слов',
      few: 'слова',
      one: 'слово',
    );
    return '$_temp0';
  }

  @override
  String textUtilCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'символа',
      many: 'символов',
      few: 'символа',
      one: 'символ',
    );
    return '$_temp0';
  }

  @override
  String get textUtilNoSpaces => 'без пробелов';

  @override
  String get textUtilUpper => 'ВЕРХНИЙ РЕГИСТР';

  @override
  String get textUtilLower => 'нижний регистр';

  @override
  String get textUtilTitle => 'Каждое Слово С Заглавной';

  @override
  String get textUtilSentence => 'Как в предложениях';

  @override
  String get textUtilEncode => 'Закодировать';

  @override
  String get textUtilDecode => 'Декодировать';

  @override
  String get textUtilOutput => 'Результат';

  @override
  String get textUtilInvalidBase64 => 'Это не корректный Base64.';

  @override
  String get clipEmptyClipboard => 'Буфер обмена пуст или не содержит текста.';

  @override
  String clipSaved(String text) {
    return 'Сохранено: $text';
  }

  @override
  String get clipAddManualTitle => 'Добавить текст вручную';

  @override
  String get clipAddHint => 'Введите или вставьте текст…';

  @override
  String get clipClearUnpinned => 'Очистить незакреплённые';

  @override
  String get clipClearHistoryTitle => 'Очистить историю?';

  @override
  String get clipClearHistoryBody =>
      'Удалить все незакреплённые записи? Закреплённые останутся.';

  @override
  String get clipSearchHint => 'Поиск по записям…';

  @override
  String get clipFilterAll => 'Все';

  @override
  String get clipFilterPinned => 'Закреплённые';

  @override
  String get clipFilterLinks => 'Ссылки';

  @override
  String get clipFilterText => 'Текст';

  @override
  String get clipFilterCode => 'Код';

  @override
  String clipSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString сохранено',
      many: '$countString сохранено',
      few: '$countString сохранены',
      one: '$countString сохранена',
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
      other: '$countString закреплено',
      many: '$countString закреплено',
      few: '$countString закреплены',
      one: '$countString закреплена',
    );
    return '$_temp0';
  }

  @override
  String get clipAddText => 'Добавить текст';

  @override
  String get clipLabel => 'Метка';

  @override
  String get clipAddLabelTitle => 'Добавить метку';

  @override
  String get clipLabelHint => 'например, рабочая почта';

  @override
  String get clipEmptyTitle => 'Записей пока нет';

  @override
  String get clipEmptyMessage =>
      'Скопируйте любой текст на телефоне и нажмите «Вставить», чтобы сохранить его здесь навсегда.';

  @override
  String get clipPasteFromClipboard => 'Вставить из буфера';

  @override
  String get clipTypeLink => 'Ссылка';

  @override
  String get clipTypeEmail => 'Почта';

  @override
  String get clipTypePhone => 'Телефон';

  @override
  String get clipTypeCode => 'Код';

  @override
  String get clipTypeText => 'Текст';

  @override
  String get clipJustNow => 'только что';

  @override
  String clipMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count мин назад',
    );
    return '$_temp0';
  }

  @override
  String clipHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ч назад',
    );
    return '$_temp0';
  }

  @override
  String clipDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня назад',
      many: '$count дней назад',
      few: '$count дня назад',
      one: '$count день назад',
    );
    return '$_temp0';
  }

  @override
  String get clipPin => 'Закрепить';

  @override
  String get clipUnpin => 'Открепить';

  @override
  String get calcDivideByZero => 'На ноль делить нельзя';

  @override
  String get calcCheckExpression => 'Проверьте выражение';

  @override
  String get calcCopyResult => 'Копировать результат';

  @override
  String get calcPlus => 'Плюс';

  @override
  String get calcMinus => 'Минус';

  @override
  String get calcTimes => 'Умножить';

  @override
  String get calcDivide => 'Разделить';

  @override
  String get calcPercent => 'Процент';

  @override
  String get calcParentheses => 'Скобки';

  @override
  String get calcEquals => 'Равно';

  @override
  String get calcDecimalPoint => 'Десятичная точка';

  @override
  String get ageTabAge => 'Возраст';

  @override
  String get ageTabBetween => 'Между датами';

  @override
  String get ageDateOfBirth => 'Дата рождения';

  @override
  String get ageFrom => 'Начальная дата';

  @override
  String get ageTo => 'Конечная дата';

  @override
  String get ageFutureDate => 'Эта дата ещё не наступила.';

  @override
  String ageYearsUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'года',
      many: 'лет',
      few: 'года',
      one: 'год',
    );
    return '$_temp0';
  }

  @override
  String ageDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'дня',
      many: 'дней',
      few: 'дня',
      one: 'день',
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
      other: '$countString года',
      many: '$countString лет',
      few: '$countString года',
      one: '$countString год',
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
      other: '$countString месяца',
      many: '$countString месяцев',
      few: '$countString месяца',
      one: '$countString месяц',
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
      other: '$countString дня',
      many: '$countString дней',
      few: '$countString дня',
      one: '$countString день',
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
      other: '$countString недели',
      many: '$countString недель',
      few: '$countString недели',
      one: '$countString неделя',
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
      other: 'через $countString дня',
      many: 'через $countString дней',
      few: 'через $countString дня',
      one: 'через $countString день',
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
  String get ageNextBirthday => 'Следующий день рождения';

  @override
  String get ageBirthdayToday => 'Сегодня 🎉';

  @override
  String get ageTotalMonths => 'Всего месяцев';

  @override
  String get ageTotalWeeks => 'Всего недель';

  @override
  String get ageTotalDays => 'Всего дней';

  @override
  String get ageWeeksLabel => 'Недели';

  @override
  String get ageWeekdays => 'Будни (пн–пт)';

  @override
  String get ageHours => 'Часы';

  @override
  String get ageIncludingEnd => 'Включая последний день';

  @override
  String get unitFrom => 'Из';

  @override
  String get unitTo => 'В';

  @override
  String get unitEnterValue => 'Введите значение';

  @override
  String get unitSwap => 'Поменять единицы';

  @override
  String unitCategoryName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'length': 'Длина',
      'weight': 'Вес',
      'temperature': 'Температура',
      'area': 'Площадь',
      'volume': 'Объём',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String unitName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'millimeter': 'Миллиметр',
      'centimeter': 'Сантиметр',
      'meter': 'Метр',
      'kilometer': 'Километр',
      'inch': 'Дюйм',
      'foot': 'Фут',
      'mile': 'Миля',
      'gram': 'Грамм',
      'kilogram': 'Килограмм',
      'ounce': 'Унция',
      'pound': 'Фунт',
      'celsius': 'Цельсий',
      'fahrenheit': 'Фаренгейт',
      'kelvin': 'Кельвин',
      'squareMeter': 'Квадратный метр',
      'squareFoot': 'Квадратный фут',
      'acre': 'Акр',
      'hectare': 'Гектар',
      'milliliter': 'Миллилитр',
      'liter': 'Литр',
      'gallonUs': 'Галлон (США)',
      'fluidOunce': 'Жидкая унция',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String get loanAmount => 'Сумма кредита';

  @override
  String get loanInterestRate => 'Годовая ставка';

  @override
  String get loanTenure => 'Срок';

  @override
  String get loanTenureMonths => 'Срок (мес.)';

  @override
  String get loanTenureYears => 'Срок (лет)';

  @override
  String get loanToggleMonths => 'Мес.';

  @override
  String get loanToggleYears => 'Годы';

  @override
  String get loanEmpty =>
      'Введите корректные данные кредита, чтобы рассчитать платёж';

  @override
  String get loanMonthlyEmi => 'Ежемесячный платёж';

  @override
  String get loanPrincipal => 'Основной долг';

  @override
  String get loanTotalInterest => 'Всего процентов';

  @override
  String get loanTotalPayment => 'Всего выплат';

  @override
  String get loanBreakdown => 'Структура';

  @override
  String get loanInterest => 'Проценты';

  @override
  String loanInterestShare(String percent) {
    return 'проценты: $percent';
  }

  @override
  String get loanSchedule => 'График платежей';

  @override
  String loanMonths(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString месяца',
      many: '$countString месяцев',
      few: '$countString месяца',
      one: '$countString месяц',
    );
    return '$_temp0';
  }

  @override
  String get loanColMonth => 'Мес.';

  @override
  String get loanColBalance => 'Остаток';

  @override
  String get loanShowAll => 'Показать все месяцы';

  @override
  String get loanShowLess => 'Свернуть';

  @override
  String get clockSearchHint => 'Поиск города или страны…';

  @override
  String get clockPinned => 'Закреплённые';

  @override
  String get clockAllCities => 'Все города';

  @override
  String clockOnWidget(int shown, int total) {
    final intl.NumberFormat shownNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String shownString = shownNumberFormat.format(shown);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'В виджете: $shownString из $totalString';
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

    return 'В виджете: $shownString из $maxString макс. (увеличьте, чтобы видеть больше)';
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

    return 'Виджет на главном экране по умолчанию показывает первые $defaultRowsString — потяните нижний край, чтобы видеть до $maxRowsString.';
  }

  @override
  String get clockPin => 'Закрепить';

  @override
  String get clockUnpin => 'Открепить';

  @override
  String get clockNoResults => 'Подходящих городов нет';

  @override
  String get speedSelectingServer => 'Выбор сервера…';

  @override
  String get speedPhasePing => 'Измерение пинга';

  @override
  String get speedPhaseDownload => 'Проверка скорости загрузки';

  @override
  String get speedPhaseUpload => 'Проверка скорости отдачи';

  @override
  String get speedDownloadSpeed => 'Скорость загрузки';

  @override
  String get speedUploadSpeed => 'Скорость отдачи';

  @override
  String get speedRunAgain => 'Ещё раз';

  @override
  String get speedGo => 'ПУСК';

  @override
  String speedMeasuredVia(String server) {
    return 'Измерено через $server';
  }

  @override
  String get speedPoweredBy => 'Используются серверы Cloudflare';

  @override
  String get speedIdleHint =>
      'Нажмите кнопку, чтобы измерить пинг и скорость загрузки и отдачи.';

  @override
  String get speedPing => 'Пинг';

  @override
  String get speedResultsTitle => 'Результаты теста';

  @override
  String get speedDownload => 'Загрузка';

  @override
  String get speedUpload => 'Отдача';

  @override
  String speedConnectedIp(String ip) {
    return 'Ваш IP: $ip';
  }

  @override
  String get speedErrorOffline =>
      'Нет подключения к интернету. Проверьте Wi-Fi или мобильный интернет.';

  @override
  String get speedErrorTimeout =>
      'Время теста истекло. Возможно, соединение нестабильно.';

  @override
  String get speedErrorFailed => 'Тест не удался. Попробуйте ещё раз.';

  @override
  String get pingErrorHostNotFound =>
      'Хост не найден. Проверьте адрес и подключение к интернету.';

  @override
  String get pingErrorNoData => 'Для этого адреса нет данных.';

  @override
  String get pingTabMyIp => 'Мой IP';

  @override
  String get pingTabLookup => 'Поиск';

  @override
  String get pingTabPing => 'Пинг';

  @override
  String get pingYourPublicIp => 'Ваш внешний IP-адрес';

  @override
  String get pingFieldCity => 'Город';

  @override
  String get pingFieldRegion => 'Регион';

  @override
  String get pingFieldCountry => 'Страна';

  @override
  String get pingFieldIsp => 'Провайдер';

  @override
  String get pingFieldTimezone => 'Часовой пояс';

  @override
  String get pingFieldLocation => 'Координаты';

  @override
  String get pingFieldIp => 'IP-адрес';

  @override
  String get pingIpCopied => 'IP-адрес скопирован';

  @override
  String get pingCopyIp => 'Копировать IP';

  @override
  String get pingLookupHint => 'IP-адрес или имя хоста';

  @override
  String get pingLookupButton => 'Найти';

  @override
  String get pingHostHint => 'Имя хоста (например, google.com)';

  @override
  String get pingStartButton => 'Пинг';

  @override
  String pingHeader(String host, String ip) {
    return 'Пинг $host ($ip) через TCP-порт 443';
  }

  @override
  String get pingStatAvg => 'Среднее';

  @override
  String get pingStatLoss => 'Потери';

  @override
  String get pingStatSent => 'Отправлено';

  @override
  String get pingTimeout => 'Тайм-аут';

  @override
  String get compassN => 'С';

  @override
  String get compassNE => 'СВ';

  @override
  String get compassE => 'В';

  @override
  String get compassSE => 'ЮВ';

  @override
  String get compassS => 'Ю';

  @override
  String get compassSW => 'ЮЗ';

  @override
  String get compassW => 'З';

  @override
  String get compassNW => 'СЗ';

  @override
  String get compassNorth => 'Север';

  @override
  String get compassNortheast => 'Северо-восток';

  @override
  String get compassEast => 'Восток';

  @override
  String get compassSoutheast => 'Юго-восток';

  @override
  String get compassSouth => 'Юг';

  @override
  String get compassSouthwest => 'Юго-запад';

  @override
  String get compassWest => 'Запад';

  @override
  String get compassNorthwest => 'Северо-запад';

  @override
  String compassSemantics(String degrees, String direction) {
    return 'Направление $degrees°, $direction';
  }

  @override
  String get compassHeadingMagnetic => 'Магнитный азимут';

  @override
  String get compassUnavailable =>
      'На этом устройстве нет магнитометра, поэтому компас не работает.';

  @override
  String get locationSavedHeader => 'Сохранённые места';

  @override
  String locationSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString места',
      many: '$countString мест',
      few: '$countString места',
      one: '$countString место',
      zero: 'Пока нет',
    );
    return '$_temp0';
  }

  @override
  String locationEmpty(String save) {
    return 'Сохранённых мест пока нет.\nНажмите «$save», чтобы запомнить, где вы находитесь.';
  }

  @override
  String locationDeleted(String name) {
    return 'Место «$name» удалено';
  }

  @override
  String get locationSaveDialogTitle => 'Сохранить место';

  @override
  String get locationNameLabel => 'Название';

  @override
  String get locationNameHint => 'например, Дом, Работа…';

  @override
  String get locationNoteLabel => 'Заметка (необязательно)';

  @override
  String get locationCurrent => 'Текущее местоположение';

  @override
  String get locationRefresh => 'Обновить местоположение';

  @override
  String get locationLocating => 'Определение местоположения…';

  @override
  String get locationServicesOff =>
      'Геолокация выключена. Включите её, чтобы увидеть, где вы.';

  @override
  String get locationPermissionDenied =>
      'Разрешите доступ к геолокации, чтобы увидеть, где вы.';

  @override
  String get locationPermissionDeniedForever =>
      'Доступ к геолокации запрещён. Разрешите его в настройках, чтобы пользоваться этим инструментом.';

  @override
  String get locationErrorTimeout =>
      'Не удалось поймать сигнал GPS. Подойдите к окну или выйдите на улицу и попробуйте снова.';

  @override
  String get locationAllow => 'Разрешить';

  @override
  String locationAccuracy(String meters) {
    return 'Точность: ±$meters м';
  }

  @override
  String get locationCoordsCopied => 'Координаты скопированы';

  @override
  String get locationCopyCoords => 'Копировать координаты';

  @override
  String get locationOpenInMaps => 'Открыть на карте';

  @override
  String get passwordYours => 'Ваш пароль';

  @override
  String get passwordSelectType => 'Выберите хотя бы один тип символов';

  @override
  String get passwordStrength => 'Надёжность';

  @override
  String get passwordWeak => 'Слабый';

  @override
  String get passwordFair => 'Средний';

  @override
  String get passwordGood => 'Хороший';

  @override
  String get passwordStrong => 'Надёжный';

  @override
  String get passwordLength => 'Длина';

  @override
  String passwordChars(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString символа',
      many: '$countString символов',
      few: '$countString символа',
      one: '$countString символ',
    );
    return '$_temp0';
  }

  @override
  String get passwordInclude => 'Включить';

  @override
  String get passwordUppercase => 'Заглавные';

  @override
  String get passwordLowercase => 'Строчные';

  @override
  String get passwordNumbers => 'Цифры';

  @override
  String get passwordSymbols => 'Символы';

  @override
  String get passwordCopied => 'Пароль скопирован';

  @override
  String get passwordGenerate => 'Создать новый';

  @override
  String get hashModeText => 'Текст';

  @override
  String get hashModeFile => 'Файл';

  @override
  String get hashAlgorithm => 'Алгоритм';

  @override
  String get hashInputHint => 'Введите текст для хеширования…';

  @override
  String get hashPickFile => 'Нажмите, чтобы выбрать файл';

  @override
  String get hashChange => 'Изменить';

  @override
  String get hashHashing => 'Вычисление…';

  @override
  String get hashGenerate => 'Вычислить хеш';

  @override
  String get hashFileError => 'Не удалось прочитать файл. Попробуйте другой.';

  @override
  String get hashCopied => 'Хеш скопирован';

  @override
  String get hashCopy => 'Копировать хеш';

  @override
  String get colorPickerFormats => 'Форматы цвета';

  @override
  String get colorPickerHexLabel => 'Цвет HEX';

  @override
  String get colorPickerHexInvalid => 'Введите 6 hex-цифр (0–9, A–F)';

  @override
  String get colorPickerApply => 'Применить цвет';

  @override
  String colorPickerCopied(String format) {
    return '$format скопирован';
  }

  @override
  String get colorPickerPalette => 'Быстрая палитра';

  @override
  String colorPickerSwatch(String hex) {
    return 'Цвет $hex';
  }

  @override
  String get imgCompressPickHint => 'Нажмите, чтобы выбрать или снять фото';

  @override
  String imgCompressSupported(String formats) {
    return 'Поддерживаются $formats';
  }

  @override
  String get imgCompressChange => 'Сменить фото';

  @override
  String get imgCompressModeQuality => 'По качеству';

  @override
  String get imgCompressModeTarget => 'По размеру';

  @override
  String get imgCompressQuality => 'Качество';

  @override
  String get imgCompressSmallest => 'Меньше файл';

  @override
  String get imgCompressBestQuality => 'Лучше качество';

  @override
  String get imgCompressQualityNote =>
      'Большие фото также уменьшаются примерно до 1920×1080.';

  @override
  String imgCompressTargetUnder(String size) {
    return 'До $size';
  }

  @override
  String get imgCompressTargetHint =>
      'Сохраняет лучшее качество в пределах лимита — удобно для анкет и госуслуг.';

  @override
  String get imgCompressButton => 'Сжать фото';

  @override
  String get imgCompressCompressing => 'Сжатие…';

  @override
  String get imgCompressSuccess => 'Фото сжато!';

  @override
  String imgCompressFitsTarget(String size) {
    return 'Готово — меньше $size';
  }

  @override
  String imgCompressMissedTarget(String size) {
    return 'Не удалось уложиться в $size. Это самая маленькая версия, которую удалось получить.';
  }

  @override
  String get imgCompressStatOriginal => 'Исходный';

  @override
  String get imgCompressStatCompressed => 'Сжатый';

  @override
  String get imgCompressStatSaved => 'Экономия';

  @override
  String get imgCompressFailed =>
      'Не удалось сжать это фото. Попробуйте другое.';

  @override
  String get imgResizePresetPassport => 'Паспорт 35×45 мм';

  @override
  String imgResizePresetSquare(String size) {
    return 'Квадрат $size';
  }

  @override
  String imgResizePresetStory(String size) {
    return 'История $size';
  }

  @override
  String imgResizePresetMax(String name, String px) {
    return '$name (макс. $px)';
  }

  @override
  String get imgResizeChoosePhotos => 'Выбрать фото';

  @override
  String imgResizeSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выбрано $count фото',
      many: 'Выбрано $count фото',
      few: 'Выбрано $count фото',
      one: 'Выбрано $count фото',
    );
    return '$_temp0';
  }

  @override
  String get imgResizePickHint =>
      'Выберите одно или несколько — или поделитесь ими с приложением';

  @override
  String get imgResizeChoose => 'Выбрать';

  @override
  String get imgResizeChange => 'Изменить';

  @override
  String get imgResizePresets => 'Шаблоны';

  @override
  String get imgResizeModePercent => 'Процент';

  @override
  String get imgResizeModeMaxSide => 'Макс. сторона';

  @override
  String get imgResizeModeExact => 'Точно';

  @override
  String get imgResizeWidth => 'Ширина (px)';

  @override
  String get imgResizeHeight => 'Высота (px)';

  @override
  String get imgResizeCrop => 'Обрезать по размеру (без растяжения)';

  @override
  String get imgResizeFormat => 'Формат';

  @override
  String get imgResizeQuality => 'Качество';

  @override
  String get imgResizeButton => 'Изменить размер';

  @override
  String imgResizeSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Сохранить $count фото в галерею',
      many: 'Сохранить $count фото в галерею',
      few: 'Сохранить $count фото в галерею',
      one: 'Сохранить $count фото в галерею',
    );
    return '$_temp0';
  }

  @override
  String get imgResizeChangeSettings => 'Изменить настройки';

  @override
  String imgResizeInvalidSize(int min, int max) {
    return 'Введите ширину и высоту от $min до $max.';
  }

  @override
  String imgResizeFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Не удалось прочитать $count фото.',
      many: 'Не удалось прочитать $count фото.',
      few: 'Не удалось прочитать $count фото.',
      one: 'Не удалось прочитать $count фото.',
    );
    return '$_temp0';
  }

  @override
  String imgResizeSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото сохранены в галерею',
      many: '$count фото сохранены в галерею',
      few: '$count фото сохранены в галерею',
      one: '$count фото сохранено в галерею',
    );
    return '$_temp0';
  }

  @override
  String get imgEnhanceEmptyTitle => 'Редактируйте фото';

  @override
  String get imgEnhanceEmptyBody =>
      'Настройте яркость, контраст, насыщенность и резкость, применяйте фильтры, поворачивайте и отражайте — всё на устройстве.';

  @override
  String get imgEnhanceFineControls => 'Точная настройка';

  @override
  String get imgEnhanceApplying => 'Применение…';

  @override
  String get imgEnhanceChange => 'Сменить';

  @override
  String get imgEnhancePresets => 'Фильтры';

  @override
  String get imgEnhanceTransform => 'Трансформация';

  @override
  String get imgEnhanceAdjustments => 'Коррекция';

  @override
  String get imgEnhanceRotate => 'Повернуть';

  @override
  String get imgEnhanceFlipH => 'Отразить по горизонтали';

  @override
  String get imgEnhanceFlipV => 'Отразить по вертикали';

  @override
  String get imgEnhanceBrightness => 'Яркость';

  @override
  String get imgEnhanceContrast => 'Контраст';

  @override
  String get imgEnhanceSaturation => 'Насыщенность';

  @override
  String get imgEnhanceSharpen => 'Резкость';

  @override
  String get imgEnhanceBlur => 'Размытие';

  @override
  String get imgEnhanceQuality => 'Качество';

  @override
  String get imgEnhanceApply => 'Применить';

  @override
  String get imgEnhanceFailed =>
      'Не удалось применить правки. Попробуйте другое фото.';

  @override
  String imgEnhanceResult(String before, String after, String change) {
    return 'Готово! $before → $after ($change)';
  }

  @override
  String get imgEnhancePresetOriginal => 'Оригинал';

  @override
  String get imgEnhancePresetVivid => 'Яркий';

  @override
  String get imgEnhancePresetCool => 'Холодный';

  @override
  String get imgEnhancePresetWarm => 'Тёплый';

  @override
  String get imgEnhancePresetDramatic => 'Драма';

  @override
  String get imgEnhancePresetFade => 'Блёклый';

  @override
  String get imgEnhancePresetVintage => 'Винтаж';

  @override
  String get imgEnhancePresetNoir => 'Нуар';

  @override
  String get upscalerNewImage => 'Новое фото';

  @override
  String get upscalerIntro =>
      'Увеличивайте фото до 4× с помощью ИИ на устройстве. Работает офлайн после однократной загрузки модели — облачный режим для лиц по желанию.';

  @override
  String get upscalerBadgeOnDevice => 'ИИ на устройстве';

  @override
  String get upscalerBadgeOffline => 'Работает офлайн';

  @override
  String get upscalerBadgeUpTo4x => 'До 4× больше';

  @override
  String get upscalerBadgeGpu => 'Ускорение GPU';

  @override
  String get upscalerBestResults =>
      'Лучше всего: фото низкого разрешения, старые сканы, миниатюры и сжатые JPEG.';

  @override
  String get upscalerChangeImage => 'Сменить фото';

  @override
  String get upscalerTabOriginal => 'Оригинал';

  @override
  String get upscalerTabUpscaled => 'Увеличено ИИ';

  @override
  String get upscalerStageStarting => 'Запуск…';

  @override
  String get upscalerStageConnecting => 'Подключение к серверу ИИ…';

  @override
  String get upscalerStageOnDevice => 'Обработка на устройстве…';

  @override
  String get upscalerStageCloudUnavailable =>
      'Облако недоступно — обработка на устройстве…';

  @override
  String get upscalerStageUploading => 'Загрузка фото…';

  @override
  String get upscalerStageRestoringFaces => 'ИИ восстанавливает лица и детали…';

  @override
  String get upscalerStagePreparing => 'Подготовка фото…';

  @override
  String get upscalerStageLoadingModel => 'Загрузка модели ИИ…';

  @override
  String get upscalerStageDownloadingModel =>
      'Скачивание модели ИИ (один раз)…';

  @override
  String get upscalerStageFallback => 'Обычное увеличение…';

  @override
  String get upscalerStageDecoding => 'Чтение фото…';

  @override
  String upscalerStageResizing(String from, String to) {
    return 'Уменьшение исходника ($from → $to)…';
  }

  @override
  String get upscalerStageDenoising => 'Шумоподавление…';

  @override
  String upscalerStageUpscaling(String factor) {
    return 'Увеличение ($factor×)…';
  }

  @override
  String upscalerStageAiTiles(String done, String total) {
    return 'Увеличение ИИ… ($done/$total)';
  }

  @override
  String get upscalerStageSharpening => 'Повышение резкости…';

  @override
  String get upscalerStageColour => 'Коррекция цвета…';

  @override
  String get upscalerStageSaving => 'Сохранение…';

  @override
  String get upscalerStageDone => 'Готово!';

  @override
  String get upscalerLoadingModelHint =>
      'Загрузка модели ИИ (только в первый раз)';

  @override
  String get upscalerTime4x =>
      'Увеличение 4× может занять 15–60 с в зависимости от размера фото.';

  @override
  String get upscalerTime2x => 'Увеличение 2× обычно занимает 5–20 с.';

  @override
  String upscalerDoneIn(String seconds) {
    return 'Увеличено за $seconds с';
  }

  @override
  String get upscalerStatResolution => 'Разрешение';

  @override
  String get upscalerStatFileSize => 'Размер файла';

  @override
  String get upscalerStatScale => 'Масштаб';

  @override
  String get upscalerShareSubject => 'Фото, увеличенное ИИ';

  @override
  String get upscalerFallbackModelUnavailable =>
      'Модели ИИ нужен интернет один раз — использовано обычное увеличение';

  @override
  String get upscalerFallbackModelFailed =>
      'Модель ИИ не запускается на этом устройстве — использовано обычное увеличение';

  @override
  String get upscalerFallbackCloud =>
      'Облачный сервер недоступен — обработано на устройстве';

  @override
  String get upscalerSettings => 'Настройки ИИ';

  @override
  String get upscalerFactorLabel => 'Коэффициент увеличения';

  @override
  String get upscalerFactor2xDesc => 'Быстро — подходит для большинства фото';

  @override
  String get upscalerFactor4xDesc => 'Лучшее качество — медленнее';

  @override
  String get upscalerOptimiseFor => 'Оптимизировать для';

  @override
  String get upscalerModeAuto => 'Авто';

  @override
  String get upscalerModePhoto => 'Фото';

  @override
  String get upscalerModeIllustration => 'Иллюстрация';

  @override
  String get upscalerModeFace => 'Детали лица';

  @override
  String get upscalerDenoise => 'Шумоподавление';

  @override
  String get upscalerDenoiseTip => 'Убирает JPEG-шум перед увеличением';

  @override
  String get upscalerSharpen => 'Резкость после';

  @override
  String get upscalerSharpenTip => 'Добавляет чёткости после увеличения';

  @override
  String get upscalerCloudTitle => 'Улучшение лиц в облаке';

  @override
  String get upscalerCloudOn => 'Фото загружается на наш сервер для обработки.';

  @override
  String get upscalerCloudOff => 'Выкл. — фото остаются на устройстве.';

  @override
  String get upscalerCloudDialogTitle => 'Отправлять фото в облако?';

  @override
  String get upscalerCloudDialogBody =>
      'В облачном режиме выбранное фото загружается на наш сервер увеличения по зашифрованному соединению, чтобы обработать его более мощной моделью ИИ (GFPGAN + Real-ESRGAN).\n\n• Отправляется только фото, которое вы выбрали для увеличения.\n• Фото обрабатывается в памяти и не хранится после возврата результата.\n• Никакие данные аккаунта или личные данные не передаются.\n\nЭтот режим можно отключить в любое время. Режим на устройстве полностью работает офлайн.';

  @override
  String get upscalerCloudKeepLocal => 'Оставить на устройстве';

  @override
  String get upscalerCloudEnable => 'Включить облако';

  @override
  String get upscalerUpscale => 'Увеличить с ИИ';

  @override
  String get upscalerUpscaleAgain => 'Увеличить снова с новыми настройками';

  @override
  String get upscalerFailed => 'Не удалось увеличить';

  @override
  String get upscalerErrorTooLarge =>
      'Фото слишком большое. Попробуйте фото поменьше или увеличение 2×.';

  @override
  String get upscalerErrorUnreadable =>
      'Не удалось прочитать фото. Используйте файл JPG или PNG.';

  @override
  String get upscalerErrorNetwork =>
      'Превышено время ожидания сети. Проверьте подключение или отключите облачный режим.';

  @override
  String get videoPickHint => 'Нажмите, чтобы выбрать видео';

  @override
  String videoProbeInfo(String format, String duration) {
    return 'Формат: $format · Длительность: $duration';
  }

  @override
  String get videoOutputFormat => 'Выходной формат';

  @override
  String get videoFmtMostCompatible => 'Самый совместимый';

  @override
  String get videoFmtApple => 'Apple / QuickTime';

  @override
  String get videoFmtFlexible => 'Гибкий контейнер';

  @override
  String get videoFmtLegacy => 'Старый формат';

  @override
  String get videoFmtGif => 'Анимация (без звука)';

  @override
  String get videoFmtAudioOnly => 'Только аудио';

  @override
  String get videoFmtAudioAac => 'Только аудио (AAC)';

  @override
  String get videoFmtAudioRaw => 'Только аудио (raw)';

  @override
  String get videoFmtWav => 'Аудио без сжатия';

  @override
  String videoConvertingPercent(int percent) {
    return 'Конвертация… $percent%';
  }

  @override
  String get videoConvertingWait => 'Конвертация… это может занять время';

  @override
  String get videoDone => 'Конвертация завершена!';

  @override
  String get videoErrorUnsupported =>
      'Не удалось конвертировать. Возможно, этот формат не поддерживается на вашем устройстве.';

  @override
  String get videoConvertAnother => 'Конвертировать ещё';

  @override
  String get videoPickButton => 'Выбрать видео';

  @override
  String videoConvertTo(String format) {
    return 'Конвертировать в $format';
  }

  @override
  String get docScanAndroidOnly =>
      'Сканер документов доступен только на Android.';

  @override
  String docScanNeedsPlayServices(String details) {
    return 'Не удалось запустить сканер. Нужны сервисы Google Play — убедитесь, что они обновлены. ($details)';
  }

  @override
  String get docScanStartFailed =>
      'Не удалось запустить сканер. Попробуйте ещё раз.';

  @override
  String get docScanPdfSaved =>
      'PDF сохранён в «Загрузки» — он есть в разделе «Мои файлы»';

  @override
  String docScanPagesSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'В галерею сохранено $count страницы',
      many: 'В галерею сохранено $count страниц',
      few: 'В галерею сохранено $count страницы',
      one: 'В галерею сохранена $count страница',
    );
    return '$_temp0';
  }

  @override
  String get docScanHeadline => 'Сканируйте бумагу в чистый PDF';

  @override
  String get docScanIntro =>
      'Края определяются автоматически. Добавляйте сколько угодно страниц, обрезайте, поворачивайте и применяйте фильтры перед сохранением.';

  @override
  String get docScanScanning => 'Сканирование…';

  @override
  String get docScanStart => 'Начать сканирование';

  @override
  String get docScanScannedPages => 'Отсканированные страницы';

  @override
  String docScanPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '$count страница',
    );
    return '$_temp0';
  }

  @override
  String get docScanSavePdf => 'Сохранить PDF';

  @override
  String get docScanSharePdf => 'Поделиться PDF';

  @override
  String get docScanCopyText => 'Скопировать текст';

  @override
  String get docScanSaveJpg => 'Сохранить как JPG';

  @override
  String get docScanAnother => 'Сканировать другой документ';

  @override
  String get pdfToolsChoosePdf => 'Выбрать PDF';

  @override
  String get pdfToolsChooseHint =>
      'Или отправьте PDF в Utility Toolbox из любого приложения';

  @override
  String get pdfToolsReading => 'Чтение…';

  @override
  String get pdfToolsLockedShort => 'Защищён паролем';

  @override
  String pdfToolsPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '$count страница',
    );
    return '$_temp0';
  }

  @override
  String get pdfToolsChange => 'Изменить';

  @override
  String get pdfToolsResultReady => 'Ваш PDF готов';

  @override
  String get pdfToolsSaveDownloads => 'Сохранить в «Загрузки»';

  @override
  String get pdfToolsStartOver => 'Начать заново';

  @override
  String get pdfToolsSavedToDownloads =>
      'Сохранено в «Загрузки» — файл есть в разделе «Мои файлы»';

  @override
  String get pdfToolsSharedInstead => 'Вместо этого открыто меню «Поделиться»';

  @override
  String get pdfToolsRangeEmpty => 'Укажите хотя бы одну страницу.';

  @override
  String pdfToolsRangeInvalid(String part) {
    return '«$part» — это не страница и не диапазон (например, 1-3, 5).';
  }

  @override
  String pdfToolsRangeOutside(String part, int count) {
    return '«$part» вне диапазона 1–$count.';
  }

  @override
  String get pdfToolsInvalidPdf => 'Похоже, это не корректный PDF-файл.';

  @override
  String pdfToolsLockedUnlockFirst(String tool) {
    return 'Этот PDF защищён паролем. Сначала снимите защиту в «$tool».';
  }

  @override
  String pdfToolsPagesLabel(int count) {
    return 'Страницы (1–$count)';
  }

  @override
  String pdfToolsPagesHint(String example) {
    return 'например, $example';
  }

  @override
  String pdfToolsPageN(int number) {
    return 'Страница $number';
  }

  @override
  String get pdfToolsDownload => 'Скачать';

  @override
  String get pdfToolsSavedNotification =>
      'Сохранено в «Загрузки» — откройте через уведомление.';

  @override
  String get pdfToolsShareToSave =>
      'Открыто меню «Поделиться» — выберите, куда сохранить файл.';

  @override
  String pdfToolsSelectedFile(String name) {
    return 'Выбрано: $name';
  }

  @override
  String pdfToolsSize(String size) {
    return 'Размер: $size';
  }

  @override
  String get pdfToolsDragToReorder => 'Перетащите, чтобы изменить порядок';

  @override
  String get pdfHomeTitle => 'Инструменты PDF';

  @override
  String get pdfHomeSection => 'PDF-инструменты';

  @override
  String get pdfHomeSubtitle =>
      'Создавайте, объединяйте и оптимизируйте документы';

  @override
  String get pdfPasswordEnter => 'Введите пароль.';

  @override
  String pdfPasswordTooShort(int count) {
    return 'Используйте не менее $count символов.';
  }

  @override
  String get pdfPasswordMismatch => 'Пароли не совпадают.';

  @override
  String get pdfPasswordWrong => 'Неверный пароль.';

  @override
  String get pdfPasswordLockFailed => 'Не удалось защитить этот PDF.';

  @override
  String get pdfPasswordUnlockFailed => 'Не удалось снять защиту с этого PDF.';

  @override
  String get pdfPasswordLockedDone => 'Ваш PDF защищён';

  @override
  String get pdfPasswordRemovedDone => 'Пароль удалён';

  @override
  String get pdfPasswordAlreadyLocked =>
      'У этого PDF уже есть пароль. Сначала снимите его.';

  @override
  String get pdfPasswordNotLocked => 'У этого PDF нет пароля — снимать нечего.';

  @override
  String get pdfPasswordNew => 'Новый пароль';

  @override
  String get pdfPasswordCurrent => 'Текущий пароль';

  @override
  String get pdfPasswordRepeat => 'Повторите пароль';

  @override
  String get pdfPasswordShow => 'Показать пароль';

  @override
  String get pdfPasswordHide => 'Скрыть пароль';

  @override
  String get pdfPasswordWarning =>
      'Сохраните пароль — восстановить его невозможно. Шифрование AES-256.';

  @override
  String get pdfSplitExtract => 'Извлечь страницы';

  @override
  String get pdfSplitRemove => 'Удалить страницы';

  @override
  String get pdfSplitPagesHelp =>
      'Используйте запятые и диапазоны. «8-» — со страницы 8 до конца.';

  @override
  String get pdfSplitRemovesAll => 'Так будут удалены все страницы.';

  @override
  String get pdfSplitFailed => 'Не удалось разделить этот PDF.';

  @override
  String get pdfToImagesFailed => 'Не удалось обработать этот PDF.';

  @override
  String pdfToImagesSaved(int saved, int total) {
    return 'В галерею сохранено изображений: $saved из $total';
  }

  @override
  String get pdfToImagesAllPages => 'Все страницы';

  @override
  String get pdfToImagesConvert => 'Преобразовать в JPG';

  @override
  String pdfToImagesRendered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Обработано $count страницы…',
      many: 'Обработано $count страниц…',
      few: 'Обработано $count страницы…',
      one: 'Обработана $count страница…',
    );
    return '$_temp0';
  }

  @override
  String pdfToImagesRenderedOf(int count, int total) {
    return 'Обработано страниц: $count из $total…';
  }

  @override
  String pdfToImagesSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Сохранить $count изображения в галерею',
      many: 'Сохранить $count изображений в галерею',
      few: 'Сохранить $count изображения в галерею',
      one: 'Сохранить $count изображение в галерею',
    );
    return '$_temp0';
  }

  @override
  String get pdfCompressButton => 'Сжать';

  @override
  String get pdfCompressWorking => 'Сжатие PDF…';

  @override
  String pdfCompressOriginalSize(String size) {
    return 'Исходный размер: $size';
  }

  @override
  String get pdfCompressIntro =>
      'Выберите PDF-файл. Лучше всего сжимаются документы с большим количеством изображений.';

  @override
  String get pdfCompressLow => 'Низкое';

  @override
  String get pdfCompressMedium => 'Среднее';

  @override
  String get pdfCompressHigh => 'Высокое';

  @override
  String get pdfCompressFailed => 'Не удалось сжать этот PDF.';

  @override
  String pdfCompressBefore(String size) {
    return 'До: $size';
  }

  @override
  String pdfCompressAfter(String size) {
    return 'После: $size';
  }

  @override
  String get pdfMergeButton => 'Объединить';

  @override
  String get pdfMergeWorking => 'Объединение PDF…';

  @override
  String get pdfMergePick => 'Выбрать PDF-файлы';

  @override
  String get pdfMergeIntro =>
      'Выберите не менее двух PDF-файлов для объединения.';

  @override
  String get pdfMergeFailed =>
      'Не удалось объединить PDF. Возможно, один из файлов не читается.';

  @override
  String pdfMergeResult(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Объединённый PDF ($count страницы)',
      many: 'Объединённый PDF ($count страниц)',
      few: 'Объединённый PDF ($count страницы)',
      one: 'Объединённый PDF ($count страница)',
    );
    return '$_temp0';
  }

  @override
  String get imageToPdfCreate => 'Создать PDF';

  @override
  String get imageToPdfWorking => 'Создание PDF…';

  @override
  String get imageToPdfPick => 'Выбрать изображения';

  @override
  String get imageToPdfIntro => 'Выберите одно или несколько изображений.';

  @override
  String get imageToPdfFailed =>
      'Не удалось создать PDF. Попробуйте другие изображения.';

  @override
  String imageToPdfReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF готов ($count страницы)',
      many: 'PDF готов ($count страниц)',
      few: 'PDF готов ($count страницы)',
      one: 'PDF готов ($count страница)',
    );
    return '$_temp0';
  }

  @override
  String get qrScanNoCodeInPhoto =>
      'На этом фото не найден QR-код или штрихкод.';

  @override
  String get qrScanPhotoFailed => 'Не удалось прочитать это фото.';

  @override
  String qrScanResultTitle(String type) {
    return 'Отсканировано ($type)';
  }

  @override
  String get qrScanFromPhoto => 'Сканировать с фото';

  @override
  String get qrScanCameraNeeded =>
      'Для сканирования QR-кодов и штрихкодов нужен доступ к камере.';

  @override
  String get qrScanCameraError =>
      'Не удалось запустить камеру. Закройте другие приложения камеры и попробуйте снова.';

  @override
  String get qrScanTorchOn => 'Включить фонарик';

  @override
  String get qrScanTorchOff => 'Выключить фонарик';

  @override
  String get qrScanTypeLink => 'Ссылка';

  @override
  String get qrScanTypeWifi => 'Wi‑Fi';

  @override
  String get qrScanTypeContact => 'Контакт';

  @override
  String get qrScanTypeText => 'Текст';

  @override
  String get qrGenInputLabel => 'Текст или URL';

  @override
  String get qrGenInputHint => 'Введите содержимое для кода';

  @override
  String get qrGenPreviewLabel => 'Предпросмотр QR-кода';

  @override
  String get qrGenEmpty => 'Введите текст выше, чтобы увидеть QR-код.';

  @override
  String get qrGenSaveGallery => 'Сохранить в галерею';

  @override
  String get qrHomeTitle => 'QR и штрихкоды';

  @override
  String get qrHomeTabScan => 'Сканировать';

  @override
  String get qrHomeTabCreate => 'Создать';

  @override
  String get qrHomeScanTitle => 'Сканируйте код';

  @override
  String get qrHomeScanBody =>
      'Наведите камеру на QR-код или штрихкод — он считается мгновенно.';

  @override
  String get qrHomeBadgeInstant => 'Мгновенно';

  @override
  String get qrHomeBadgeHistory => 'История сохраняется';

  @override
  String get qrHomeStartScan => 'Начать сканирование';

  @override
  String get qrHomeCreateTitle => 'Создайте код';

  @override
  String get qrHomeCreateBody =>
      'Создайте QR-код из текста или ссылки, затем сохраните или отправьте его.';

  @override
  String get qrHomeBadgeShare => 'Делитесь где угодно';

  @override
  String get qrHomeBadgeImage => 'Сохранить как картинку';

  @override
  String get qrHomeOpenGenerator => 'Открыть генератор';

  @override
  String get qrHistoryTitle => 'История сканирования';

  @override
  String get qrHistoryMore => 'Другие параметры';

  @override
  String get qrHistoryEmpty => 'Здесь появятся отсканированные коды.';

  @override
  String get wifiQrPlaceholder => 'Введите данные Wi‑Fi,\nчтобы создать QR-код';

  @override
  String get wifiQrPreviewLabel => 'QR-код Wi‑Fi';

  @override
  String get wifiQrNetworkDetails => 'Данные сети';

  @override
  String get wifiQrSsidLabel => 'Имя сети (SSID)';

  @override
  String get wifiQrSsidHint => 'Домашний Wi‑Fi';

  @override
  String get wifiQrPasswordLabel => 'Пароль';

  @override
  String get wifiQrPasswordHint => 'Введите пароль';

  @override
  String get wifiQrShowPassword => 'Показать пароль';

  @override
  String get wifiQrHidePassword => 'Скрыть пароль';

  @override
  String get wifiQrSecurity => 'Защита';

  @override
  String get wifiQrSecurityNone => 'Нет (открытая)';

  @override
  String get wifiQrHidden => 'Скрытая сеть';

  @override
  String get wifiQrHiddenHint => 'Включите, если имя сети не транслируется';

  @override
  String get wifiQrSaveImage => 'Сохранить изображение';

  @override
  String get wifiQrInfo =>
      'Любой, кто отсканирует этот QR-код, автоматически подключится к вашей сети Wi‑Fi.';

  @override
  String get wifiQrShareText =>
      'Отсканируйте этот QR-код, чтобы подключиться к моему Wi‑Fi!';

  @override
  String get ocrCameraDenied =>
      'Доступ к камере запрещён. Разрешите его в настройках.';

  @override
  String get ocrCameraRequired => 'Чтобы сделать фото, нужен доступ к камере.';

  @override
  String get ocrTimeout =>
      'Распознавание заняло слишком много времени — модель текста, возможно, ещё загружается. Подключитесь к Wi‑Fi или попробуйте снова.';

  @override
  String get ocrFailed =>
      'Не удалось распознать текст на этом изображении. Попробуйте более чёткое фото.';

  @override
  String get ocrPreparing => 'Подготовка изображения…';

  @override
  String get ocrScanning => 'Распознавание текста…';

  @override
  String get ocrScriptLabel => 'Письменность';

  @override
  String get ocrScriptHint =>
      'Выберите алфавит текста. Арабский, урду и бенгальский пока не распознаются.';

  @override
  String get ocrScriptLatin => 'Латиница (английский, немецкий…)';

  @override
  String get ocrScriptDevanagari => 'Деванагари (хинди, маратхи…)';

  @override
  String get ocrScriptChinese => 'Китайский';

  @override
  String get ocrScriptJapanese => 'Японский';

  @override
  String get ocrScriptKorean => 'Корейский';

  @override
  String get ocrIdleTitle => 'Извлекайте текст из любого изображения';

  @override
  String get ocrIdleBody =>
      'Наведите камеру или выберите фото — текст распознаётся мгновенно прямо на устройстве.';

  @override
  String get ocrBadgeOnDevice => 'ИИ на устройстве';

  @override
  String get ocrBadgeLocal => 'Обработка локально';

  @override
  String get ocrBadgeBlocks => 'Копирование по блокам';

  @override
  String get ocrUseCamera => 'Камера';

  @override
  String get ocrChooseGallery => 'Выбрать из галереи';

  @override
  String get ocrOnDeviceNote => 'На устройстве · без загрузки';

  @override
  String get ocrTabImage => 'Изображение';

  @override
  String get ocrTabText => 'Текст';

  @override
  String get ocrTapBlockHint => 'Нажмите на выделенный блок, чтобы скопировать';

  @override
  String get ocrBlockTitle => 'Текст блока';

  @override
  String ocrBlockLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count строки · нажмите, чтобы скопировать',
      many: '$count строк · нажмите, чтобы скопировать',
      few: '$count строки · нажмите, чтобы скопировать',
      one: '$count строка · нажмите, чтобы скопировать',
    );
    return '$_temp0';
  }

  @override
  String get ocrCopyBlock => 'Копировать блок';

  @override
  String get ocrBlockCopied => 'Блок скопирован';

  @override
  String get ocrCopyEntireBlock => 'Копировать весь блок';

  @override
  String get ocrCopyLine => 'Копировать строку';

  @override
  String get ocrNoText => 'Текст не найден — попробуйте более чёткое фото.';

  @override
  String get ocrQuickCopy => 'Быстрое копирование по разделам';

  @override
  String ocrBlockNCopied(int number) {
    return 'Блок $number скопирован';
  }

  @override
  String get ocrDoneEditing => 'Готово';

  @override
  String get ocrEditText => 'Редактировать текст';

  @override
  String get ocrAllCopied => 'Весь текст скопирован';

  @override
  String get ocrCopyAll => 'Копировать всё';

  @override
  String get ocrScanAgain => 'Скан';

  @override
  String ocrStatLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count строки',
      many: '$count строк',
      few: '$count строки',
      one: '$count строка',
    );
    return '$_temp0';
  }

  @override
  String ocrStatWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слова',
      many: '$count слов',
      few: '$count слова',
      one: '$count слово',
    );
    return '$_temp0';
  }

  @override
  String ocrStatChars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count символа',
      many: '$count символов',
      few: '$count символа',
      one: '$count символ',
    );
    return '$_temp0';
  }

  @override
  String get wordPdfNoText =>
      'В этом документе не найден текст для извлечения.';

  @override
  String get wordPdfInfo =>
      'Преобразует файлы .docx в PDF. Текст сохраняется; сложная вёрстка (таблицы, картинки) может отличаться.';

  @override
  String get wordPdfOpeningPicker => 'Открытие выбора файла…';

  @override
  String wordPdfConverting(int percent) {
    return 'Преобразование… $percent%';
  }

  @override
  String get wordPdfDone => 'Преобразование завершено';

  @override
  String get wordPdfTapToPick => 'Нажмите, чтобы выбрать файл .docx';

  @override
  String get wordPdfSupports => 'Поддерживается формат .docx';

  @override
  String get wordPdfFailed =>
      'Не удалось преобразовать. Возможно, файл повреждён или это не документ .docx.';

  @override
  String get wordPdfFontsOffline =>
      'В этом PDF нет части текста (например, кириллицы, арабского, урду, хинди или бенгальского). Шрифт скачивается один раз — подключитесь к интернету и преобразуйте снова.';

  @override
  String get wordPdfConvertAnother => 'Преобразовать ещё';

  @override
  String get wordPdfPick => 'Выбрать файл .docx';

  @override
  String get wordPdfStep1Title => 'Выберите файл Word';

  @override
  String get wordPdfStep1Desc => 'Выберите файл .docx в памяти устройства.';

  @override
  String get wordPdfStep2Title => 'Автоматическое преобразование';

  @override
  String get wordPdfStep2Desc =>
      'Текст извлекается и раскладывается по страницам PDF формата A4.';

  @override
  String get wordPdfStep3Title => 'Отправьте или сохраните';

  @override
  String get wordPdfStep3Desc =>
      'Отправьте PDF в любое приложение, по почте или в облако.';

  @override
  String get wordPdfReady => 'PDF готов';
}
