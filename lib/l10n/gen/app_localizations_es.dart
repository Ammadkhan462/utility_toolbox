// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Utility Toolbox';

  @override
  String get navTools => 'Herramientas';

  @override
  String get navFiles => 'Mis archivos';

  @override
  String get settingsTooltip => 'Ajustes';

  @override
  String get searchHint => 'Buscar: comprimir pdf, escanear, jpg…';

  @override
  String get quickActions => 'Accesos rápidos';

  @override
  String get favorites => 'Favoritos';

  @override
  String get recent => 'Recientes';

  @override
  String searchNoResults(String query) {
    return 'Ninguna herramienta coincide con “$query”';
  }

  @override
  String get toolMenuAddFavorite => 'Agregar a favoritos';

  @override
  String get toolMenuRemoveFavorite => 'Quitar de favoritos';

  @override
  String get toolMenuPinShortcut => 'Agregar a pantalla de inicio';

  @override
  String get pinShortcutRequested =>
      'Confirma para agregar el acceso directo a tu pantalla de inicio';

  @override
  String get pinShortcutUnsupported =>
      'Tu pantalla de inicio no admite accesos directos';

  @override
  String get newBadge => 'NUEVO';

  @override
  String get catScan => 'Escáner y QR';

  @override
  String get catPdf => 'PDF';

  @override
  String get catImage => 'Fotos e imágenes';

  @override
  String get catText => 'Texto y traducción';

  @override
  String get catCalc => 'Calcular y convertir';

  @override
  String get catNetwork => 'Internet';

  @override
  String get catDevice => 'Dispositivo y ubicación';

  @override
  String get catSecurity => 'Seguridad';

  @override
  String get catMedia => 'Video y audio';

  @override
  String get toolDocScannerTitle => 'Escáner de documentos';

  @override
  String get toolDocScannerDesc => 'Escanea papel a PDF con bordes auto';

  @override
  String get toolDocScannerKeywords =>
      'scan paper, camscanner, document, pdf scanner, receipt, escáner, escanear, escanear documentos, escaner pdf, documento, papel, recibo, factura, ticket, cámara';

  @override
  String get toolQrScannerTitle => 'Escanear QR y barras';

  @override
  String get toolQrScannerDesc => 'Con la cámara o desde una foto';

  @override
  String get toolQrScannerKeywords =>
      'qr reader, barcode, scan code, lector qr, escanear qr, código de barras, codigo qr, lector de códigos, escáner qr';

  @override
  String get toolQrGeneratorTitle => 'Crear código QR';

  @override
  String get toolQrGeneratorDesc => 'Enlaces, texto, contactos y más';

  @override
  String get toolQrGeneratorKeywords =>
      'qr maker, generate qr, barcode generator, generador qr, crear qr, hacer qr, generar código qr, código de barras';

  @override
  String get toolOcrTitle => 'Imagen a texto';

  @override
  String get toolOcrDesc => 'Copia texto de cualquier foto (OCR)';

  @override
  String get toolOcrKeywords =>
      'ocr, text scanner, extract text, copy text from image, escáner de texto, extraer texto, copiar texto de imagen, foto a texto, imagen a texto';

  @override
  String get toolWifiQrTitle => 'QR de WiFi';

  @override
  String get toolWifiQrDesc => 'Comparte el WiFi sin escribir la clave';

  @override
  String get toolWifiQrKeywords =>
      'wifi password, share wifi, contraseña wifi, clave wifi, compartir wifi, wifi qr';

  @override
  String get toolImageToPdfTitle => 'Imagen a PDF';

  @override
  String get toolImageToPdfDesc => 'Une tus fotos en un solo PDF';

  @override
  String get toolImageToPdfKeywords =>
      'jpg to pdf, photo to pdf, picture to pdf, jpg a pdf, foto a pdf, imagen a pdf, convertir foto a pdf';

  @override
  String get toolMergePdfTitle => 'Unir PDF';

  @override
  String get toolMergePdfDesc => 'Junta varios PDF en uno';

  @override
  String get toolMergePdfKeywords =>
      'join pdf, combine pdf, unir pdf, juntar pdf, combinar pdf, fusionar pdf';

  @override
  String get toolCompressPdfTitle => 'Comprimir PDF';

  @override
  String get toolCompressPdfDesc => 'Haz un PDF más liviano para enviarlo';

  @override
  String get toolCompressPdfKeywords =>
      'reduce pdf size, shrink pdf, comprimir pdf, reducir tamaño pdf, achicar pdf, pdf más liviano, bajar peso pdf';

  @override
  String get toolSplitPdfTitle => 'Dividir PDF';

  @override
  String get toolSplitPdfDesc => 'Extrae o elimina páginas';

  @override
  String get toolSplitPdfKeywords =>
      'extract pages, delete pages, cut pdf, dividir pdf, separar pdf, extraer páginas, eliminar páginas, cortar pdf';

  @override
  String get toolPdfToImagesTitle => 'PDF a JPG';

  @override
  String get toolPdfToImagesDesc => 'Guarda cada página como imagen';

  @override
  String get toolPdfToImagesKeywords =>
      'pdf to image, pdf to png, pdf pages, pdf a imagen, pdf a jpg, pdf a png, páginas pdf';

  @override
  String get toolProtectPdfTitle => 'Bloquear PDF';

  @override
  String get toolProtectPdfDesc => 'Ponle contraseña a un PDF';

  @override
  String get toolProtectPdfKeywords =>
      'password pdf, encrypt pdf, secure pdf, proteger pdf, contraseña pdf, cifrar pdf, pdf con clave';

  @override
  String get toolUnlockPdfTitle => 'Desbloquear PDF';

  @override
  String get toolUnlockPdfDesc => 'Quita una contraseña que conoces';

  @override
  String get toolUnlockPdfKeywords =>
      'remove pdf password, decrypt pdf, quitar contraseña pdf, desbloquear pdf, eliminar clave pdf';

  @override
  String get toolWordToPdfTitle => 'Word a PDF';

  @override
  String get toolWordToPdfDesc => 'Convierte documentos .docx';

  @override
  String get toolWordToPdfKeywords =>
      'doc to pdf, docx, word, word a pdf, doc a pdf, convertir word a pdf, documento';

  @override
  String get toolImageCompressorTitle => 'Comprimir foto';

  @override
  String get toolImageCompressorDesc => 'Archivo más chico, misma calidad';

  @override
  String get toolImageCompressorKeywords =>
      'reduce image size, compress jpg, kb, comprimir imagen, reducir tamaño foto, comprimir jpg, bajar peso foto, achicar imagen';

  @override
  String get toolImageResizerTitle => 'Redimensionar foto';

  @override
  String get toolImageResizerDesc => 'Tamaño exacto, JPG, PNG o WEBP';

  @override
  String get toolImageResizerKeywords =>
      'resize image, jpg to png, png to jpg, webp, passport size, cambiar tamaño imagen, redimensionar, jpg a png, png a jpg, foto tamaño pasaporte, foto carnet';

  @override
  String get toolImageEnhancerTitle => 'Editor de fotos';

  @override
  String get toolImageEnhancerDesc => 'Filtros, recorte, brillo y más';

  @override
  String get toolImageEnhancerKeywords =>
      'edit photo, filter, crop, rotate, editar foto, filtros, recortar, rotar, brillo';

  @override
  String get toolAiUpscalerTitle => 'Mejorar con IA';

  @override
  String get toolAiUpscalerDesc => 'Amplía fotos hasta 4× más nítidas';

  @override
  String get toolAiUpscalerKeywords =>
      'enhance, hd, increase resolution, blurry, ai upscaler, mejorar calidad, aumentar resolución, foto borrosa, ampliar foto, ia';

  @override
  String get toolTranslationTitle => 'Traductor';

  @override
  String get toolTranslationDesc => 'Sin internet, con voz y audio';

  @override
  String get toolTranslationKeywords =>
      'translator, language, dictionary, traductor, traducir, idioma, diccionario, traductor sin internet, inglés español';

  @override
  String get toolTextUtilitiesTitle => 'Herramientas de texto';

  @override
  String get toolTextUtilitiesDesc => 'Cuenta palabras, mayúsculas, Base64';

  @override
  String get toolTextUtilitiesKeywords =>
      'word counter, uppercase, lowercase, base64, contador de palabras, mayúsculas, minúsculas, contar caracteres';

  @override
  String get toolSmartClipboardTitle => 'Portapapeles';

  @override
  String get toolSmartClipboardDesc => 'Guarda, fija y busca lo que copias';

  @override
  String get toolSmartClipboardKeywords =>
      'copy paste, notes, clipboard history, copiar pegar, notas, historial del portapapeles, portapapeles';

  @override
  String get toolCalculatorTitle => 'Calculadora';

  @override
  String get toolCalculatorDesc => 'Calculadora diaria con historial';

  @override
  String get toolCalculatorKeywords =>
      'calc, math, percent, calculadora, matemáticas, porcentaje, sacar porcentaje';

  @override
  String get toolAgeCalculatorTitle => 'Edad y fechas';

  @override
  String get toolAgeCalculatorDesc => 'Edad exacta y días entre fechas';

  @override
  String get toolAgeCalculatorKeywords =>
      'birthday, date difference, days counter, calcular edad, cumpleaños, diferencia de fechas, contador de días, cuántos días';

  @override
  String get toolUnitConverterTitle => 'Conversor de unidades';

  @override
  String get toolUnitConverterDesc => 'Longitud, peso, temperatura y más';

  @override
  String get toolUnitConverterKeywords =>
      'convert units, cm to inch, kg to lb, celsius, convertir unidades, cm a pulgadas, kg a libras, conversor, fahrenheit';

  @override
  String get toolLoanCalculatorTitle => 'Préstamos y cuotas';

  @override
  String get toolLoanCalculatorDesc => 'Cuota mensual e interés total';

  @override
  String get toolLoanCalculatorKeywords =>
      'emi, mortgage, interest, installment, préstamo, crédito, hipoteca, interés, cuotas, simulador de crédito';

  @override
  String get toolTimezoneTitle => 'Reloj mundial';

  @override
  String get toolTimezoneDesc => 'La hora en cualquier ciudad, con widget';

  @override
  String get toolTimezoneKeywords =>
      'time zone, clock, city time, zona horaria, reloj, hora mundial, diferencia horaria';

  @override
  String get toolColorPickerTitle => 'Selector de color';

  @override
  String get toolColorPickerDesc => 'HEX, RGB, HSL y CMYK';

  @override
  String get toolColorPickerKeywords =>
      'color code, hex, palette, código de color, paleta, colores';

  @override
  String get toolSpeedTestTitle => 'Test de velocidad';

  @override
  String get toolSpeedTestDesc => 'Descarga, subida y ping';

  @override
  String get toolSpeedTestKeywords =>
      'wifi speed, internet speed, mbps, velocidad de internet, test de velocidad, velocidad wifi, medir internet';

  @override
  String get toolIpPingTitle => 'IP y ping';

  @override
  String get toolIpPingDesc => 'Tu dirección IP y si un host responde';

  @override
  String get toolIpPingKeywords =>
      'my ip, ping, network, mi ip, dirección ip, red';

  @override
  String get toolCompassTitle => 'Brújula';

  @override
  String get toolCompassDesc => 'Rumbo y dirección';

  @override
  String get toolCompassKeywords =>
      'direction, north, qibla, brújula, dirección, norte, compás';

  @override
  String get toolLocationSaverTitle => 'Guardar ubicación';

  @override
  String get toolLocationSaverDesc => 'Recuerda y comparte puntos GPS';

  @override
  String get toolLocationSaverKeywords =>
      'parking, gps, map, coordinates, estacionamiento, dónde estacioné, mapa, coordenadas, ubicación';

  @override
  String get toolPasswordGeneratorTitle => 'Generar contraseñas';

  @override
  String get toolPasswordGeneratorDesc => 'Contraseñas aleatorias y seguras';

  @override
  String get toolPasswordGeneratorKeywords =>
      'secure password, random, contraseña segura, generador de contraseñas, aleatoria, clave';

  @override
  String get toolHashGeneratorTitle => 'Generador de hash';

  @override
  String get toolHashGeneratorDesc => 'MD5, SHA-1, SHA-256 de texto o archivos';

  @override
  String get toolHashGeneratorKeywords =>
      'checksum, md5, sha256, hash, suma de verificación';

  @override
  String get toolVideoConverterTitle => 'Convertir video';

  @override
  String get toolVideoConverterDesc => 'Video a MP3, GIF, MP4 y más';

  @override
  String get toolVideoConverterKeywords =>
      'video to mp3, gif maker, audio extract, video a mp3, crear gif, extraer audio, convertidor de video';

  @override
  String get filesEmptyTitle => 'Aún no hay archivos';

  @override
  String get filesEmptyBody =>
      'Los PDF, imágenes y otros archivos que crees aparecerán aquí para abrirlos o compartirlos de nuevo.';

  @override
  String get fileOpen => 'Abrir';

  @override
  String get fileShare => 'Compartir';

  @override
  String get fileRemoveFromList => 'Quitar de la lista';

  @override
  String get fileOpenFailed =>
      'No se pudo abrir este archivo. Quizá se movió o se borró.';

  @override
  String get filesClearList => 'Vaciar lista';

  @override
  String get filesClearConfirm =>
      '¿Vaciar la lista? Tus archivos seguirán en el dispositivo.';

  @override
  String get incomingSheetTitle => '¿Qué quieres hacer?';

  @override
  String incomingImages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count imágenes',
      one: '1 imagen',
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
  String get incomingText => 'Texto compartido';

  @override
  String get incomingDocument => 'Documento de Word';

  @override
  String get incomingVideo => 'Video';

  @override
  String get incomingUnsupported => 'Este tipo de archivo aún no es compatible';

  @override
  String get incomingFailed => 'No se pudo leer el archivo compartido';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsAppearance => 'Apariencia';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get themeSystem => 'Automático';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get languageSystem => 'Idioma del sistema';

  @override
  String get settingsPurchases => 'Compras';

  @override
  String get removeAdsTitle => 'Quitar anuncios';

  @override
  String get removeAdsSubtitle => 'Pago único, sin suscripción';

  @override
  String get restorePurchasesTitle => 'Restaurar compras';

  @override
  String get restorePurchasesSubtitle =>
      'Recupera una compra en este dispositivo';

  @override
  String get settingsSupport => 'Ayuda y privacidad';

  @override
  String get shareAppTitle => 'Compartir app';

  @override
  String get shareAppSubtitle => 'Recomienda Utility Toolbox a un amigo';

  @override
  String shareAppMessage(String url) {
    return 'Uso Utility Toolbox para escanear documentos, editar PDF, leer códigos QR y traducir sin internet. Gratis: $url';
  }

  @override
  String get rateAppTitle => 'Calificar la app';

  @override
  String get rateAppSubtitle => 'Una reseña rápida nos ayuda mucho';

  @override
  String get privacyPolicyTitle => 'Política de privacidad';

  @override
  String get privacyPolicySubtitle => 'A qué accede la app y por qué';

  @override
  String get privacyChoicesTitle => 'Privacidad de anuncios';

  @override
  String get privacyChoicesSubtitle =>
      'Cambia tu consentimiento para anuncios personalizados';

  @override
  String versionLabel(String version) {
    return 'Versión $version';
  }

  @override
  String get onboardingSkip => 'Omitir';

  @override
  String get onboardingNext => 'Siguiente';

  @override
  String get onboardingStart => 'Comenzar';

  @override
  String get onboarding1Title => 'Todas las herramientas,\nuna sola app';

  @override
  String get onboarding1Body =>
      'Escanea documentos, edita PDF, lee códigos QR, traduce y cambia el tamaño de fotos, sin instalar diez apps.';

  @override
  String get onboarding2Title => 'Funciona desde\ncualquier app';

  @override
  String get onboarding2Body =>
      'Comparte una foto o un PDF con Utility Toolbox, selecciona texto para traducirlo o mantén presionado el ícono para ver accesos directos.';

  @override
  String get onboarding3Title => 'Rápida, sin internet\ny privada';

  @override
  String get onboarding3Body =>
      'Casi todo funciona en tu teléfono. Tus archivos nunca se suben, salvo que tú actives una opción en la nube.';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonClear => 'Borrar';

  @override
  String get toolBgRemoverTitle => 'Quitar fondo';

  @override
  String get toolBgRemoverDesc => 'Recorta personas y objetos con un toque';

  @override
  String get toolBgRemoverKeywords =>
      'quitar fondo, borrar fondo, eliminar fondo, recortar, transparente, sticker, foto carnet, fondo blanco, remove background, remove bg, cutout, png';

  @override
  String get toolBmiTitle => 'Calculadora de IMC';

  @override
  String get toolBmiDesc => 'Tu índice de masa corporal y peso saludable';

  @override
  String get toolBmiKeywords =>
      'IMC, índice de masa corporal, peso, altura, estatura, peso ideal, obesidad, salud, bmi, body mass index, weight, height, ideal weight, obesity';

  @override
  String get toolBubbleLevelTitle => 'Nivel de burbuja';

  @override
  String get toolBubbleLevelDesc =>
      'Comprueba que estantes y cuadros estén rectos';

  @override
  String get toolBubbleLevelKeywords =>
      'nivel, nivel de burbuja, recto, ángulo, inclinación, inclinómetro, level, spirit level, bubble level, tilt';

  @override
  String get toolCurrencyTitle => 'Conversor de divisas';

  @override
  String get toolCurrencyDesc => 'Tipos de cambio de más de 150 divisas';

  @override
  String get toolCurrencyKeywords =>
      'moneda, divisa, tipo de cambio, dinero, convertir, dólar, euro, peso, cambio, currency, exchange rate, money, convert, forex';

  @override
  String get toolDirectChatTitle => 'Chat directo';

  @override
  String get toolDirectChatDesc => 'Escribe por WhatsApp sin guardar el número';

  @override
  String get toolDirectChatKeywords =>
      'whatsapp, chat directo, mensaje, número sin guardar, enviar mensaje, direct chat, message, unsaved number, click to chat, wa.me, send message, chat';

  @override
  String get toolFlashlightTitle => 'Linterna';

  @override
  String get toolFlashlightDesc => 'Linterna potente con SOS y estroboscopio';

  @override
  String get toolFlashlightKeywords =>
      'linterna, luz, lámpara, flash, estroboscopio, foco, flashlight, torch, light, led, sos, strobe';

  @override
  String get toolOrganizePdfTitle => 'Organizar PDF';

  @override
  String get toolOrganizePdfDesc => 'Reordena, gira o elimina páginas';

  @override
  String get toolOrganizePdfKeywords =>
      'organizar, reordenar, girar, rotar, eliminar páginas, quitar páginas, ordenar, organize, organise, reorder, rotate, delete pages, remove pages, arrange, sort, pdf';

  @override
  String get toolPdfToTextTitle => 'PDF a texto';

  @override
  String get toolPdfToTextDesc => 'Copia todo el texto de un PDF';

  @override
  String get toolPdfToTextKeywords =>
      'extraer texto, copiar texto, pdf a txt, convertir, leer pdf, pdf to text, extract text, copy text, txt, read pdf, convert, pdf to word';

  @override
  String get toolPercentageTitle => 'Porcentaje y descuento';

  @override
  String get toolPercentageDesc =>
      'Porcentajes, descuentos, propinas e IVA al instante';

  @override
  String get toolPercentageKeywords =>
      'porcentaje, por ciento, descuento, rebaja, precio final, propina, dividir cuenta, IVA, impuesto, percentage, percent, discount, tip, split bill, tax, vat';

  @override
  String get toolSignPdfTitle => 'Firmar PDF';

  @override
  String get toolSignPdfDesc =>
      'Dibuja tu firma y colócala en cualquier página';

  @override
  String get toolSignPdfKeywords =>
      'firmar, firma, firma electrónica, rellenar y firmar, rúbrica, sign, signature, e-sign, esign, fill and sign, autograph, pdf';

  @override
  String get toolStopwatchTitle => 'Cronómetro y temporizador';

  @override
  String get toolStopwatchDesc => 'Cronómetro con vueltas y cuenta atrás';

  @override
  String get toolStopwatchKeywords =>
      'cronómetro, temporizador, cuenta atrás, vuelta, alarma, reloj, temporizador de cocina, entrenamiento, stopwatch, timer, countdown, lap';

  @override
  String get toolWatermarkPdfTitle => 'Marca de agua y números de página';

  @override
  String get toolWatermarkPdfDesc =>
      'Añade texto o números de página en cada página';

  @override
  String get toolWatermarkPdfKeywords =>
      'marca de agua, sello, números de página, numerar páginas, confidencial, borrador, pie de página, watermark, stamp, page numbers, number pages, confidential, draft, footer, header, pdf';

  @override
  String get bmiMetric => 'Métrico (cm, kg)';

  @override
  String get bmiImperial => 'Imperial (pie, lb)';

  @override
  String get bmiHeight => 'Altura';

  @override
  String get bmiWeight => 'Peso';

  @override
  String get bmiFeet => 'Pies';

  @override
  String get bmiInches => 'Pulgadas';

  @override
  String get bmiUnitCm => 'cm';

  @override
  String get bmiUnitKg => 'kg';

  @override
  String get bmiUnitLb => 'lb';

  @override
  String get bmiUnitFt => 'pie';

  @override
  String get bmiUnitIn => 'pulg';

  @override
  String get bmiAge => 'Edad (opcional)';

  @override
  String get bmiSex => 'Sexo (opcional)';

  @override
  String get bmiMale => 'Hombre';

  @override
  String get bmiFemale => 'Mujer';

  @override
  String get bmiYourBmi => 'Tu IMC';

  @override
  String get bmiUnderweight => 'Bajo peso';

  @override
  String get bmiNormal => 'Peso saludable';

  @override
  String get bmiOverweight => 'Sobrepeso';

  @override
  String get bmiObese => 'Obesidad';

  @override
  String bmiHealthyRange(String min, String max) {
    return 'Peso saludable para tu altura: $min – $max';
  }

  @override
  String bmiToLose(String amount) {
    return 'Unos $amount por encima del rango saludable';
  }

  @override
  String bmiToGain(String amount) {
    return 'Unos $amount por debajo del rango saludable';
  }

  @override
  String bmiIdealWeight(String weight) {
    return 'Peso ideal estimado: $weight';
  }

  @override
  String get bmiChildNote =>
      'En menores de 18 años, el IMC se interpreta con tablas de crecimiento por edad. Estos resultados usan los rangos de adultos.';

  @override
  String get bmiDisclaimer =>
      'El IMC es una guía general, no un diagnóstico médico.';

  @override
  String get bmiEnterValues => 'Escribe tu altura y tu peso';

  @override
  String get currencyAmount => 'Importe';

  @override
  String get currencyFrom => 'De';

  @override
  String get currencyTo => 'A';

  @override
  String get currencySwap => 'Intercambiar divisas';

  @override
  String get currencyChoose => 'Elegir divisa';

  @override
  String get currencySearchHint => 'Buscar divisa o código';

  @override
  String get currencyAll => 'Todas las divisas';

  @override
  String currencyRatesFrom(String date) {
    return 'Tipos del $date';
  }

  @override
  String get currencyRefresh => 'Actualizar tipos';

  @override
  String get currencyUpdating => 'Actualizando tipos…';

  @override
  String get currencyOfflineCached =>
      'No se pudo actualizar. Se muestran los tipos guardados.';

  @override
  String get currencyNoRatesTitle => 'Aún no hay tipos descargados';

  @override
  String get currencyNoRatesBody =>
      'Conéctate a internet una vez para descargar los tipos de cambio. Después, el conversor también funciona sin conexión.';

  @override
  String get currencyRetry => 'Reintentar';

  @override
  String get currencyOtherFavorites => 'Tus divisas favoritas';

  @override
  String get currencyFavoritesHint =>
      'Toca ☆ junto a una divisa de la lista para añadirla aquí.';

  @override
  String get currencyCopy => 'Copiar resultado';

  @override
  String get currencyCopied => 'Copiado';

  @override
  String get currencyNoMatch => 'No se encontró ninguna divisa';

  @override
  String get currencyDisclaimer =>
      'Los tipos son orientativos y pueden diferir de los de tu banco.';

  @override
  String get directChatPhone => 'Número de teléfono';

  @override
  String get directChatCountryCode => 'Código de país';

  @override
  String get directChatSearchCountry => 'Buscar país o código';

  @override
  String get directChatNoCountry => 'No se encontró ningún país';

  @override
  String get directChatMessage => 'Mensaje (opcional)';

  @override
  String get directChatOpen => 'Abrir en WhatsApp';

  @override
  String get directChatPaste => 'Pegar número';

  @override
  String get directChatPasteNone => 'No hay ningún número en el portapapeles';

  @override
  String get directChatTooShort => 'El número parece demasiado corto';

  @override
  String get directChatTooLong => 'El número parece demasiado largo';

  @override
  String directChatWillOpen(String number) {
    return 'Chat con $number';
  }

  @override
  String get directChatOpenFailed =>
      'No se pudo abrir el chat. ¿Tienes WhatsApp instalado?';

  @override
  String get directChatHint =>
      'Escribe a cualquier número sin guardarlo en tus contactos.';

  @override
  String get directChatNotAffiliated =>
      'Herramienta independiente. Sin relación con WhatsApp ni Meta.';

  @override
  String get percentageTabPercent => 'Porcentaje';

  @override
  String get percentageTabDiscount => 'Descuento';

  @override
  String get percentageTabTip => 'Propina';

  @override
  String get percentageTabTax => 'Impuesto / IVA';

  @override
  String get percentageOfTitle => 'Porcentaje de un número';

  @override
  String get percentageFieldPercent => 'Porcentaje';

  @override
  String get percentageFieldNumber => 'Número';

  @override
  String percentageOfResult(String percent, String number) {
    return '$percent de $number';
  }

  @override
  String get percentageWhatTitle => '¿Qué porcentaje es?';

  @override
  String get percentageFieldPart => 'Valor';

  @override
  String get percentageFieldTotal => 'Total';

  @override
  String percentageWhatResult(String part, String total) {
    return '$part de $total';
  }

  @override
  String get percentageChangeTitle => 'Variación porcentual';

  @override
  String get percentageFieldOld => 'Valor anterior';

  @override
  String get percentageFieldNew => 'Valor nuevo';

  @override
  String percentageIncrease(String percent) {
    return 'Aumento del $percent';
  }

  @override
  String percentageDecrease(String percent) {
    return 'Disminución del $percent';
  }

  @override
  String get percentageNoChange => 'Sin cambios';

  @override
  String get percentageDifference => 'Diferencia';

  @override
  String get percentagePrice => 'Precio original';

  @override
  String get percentageDiscount => 'Descuento';

  @override
  String get percentageExtraDiscount => 'Descuento adicional (opcional)';

  @override
  String get percentageYouPay => 'Pagas';

  @override
  String get percentageYouSave => 'Ahorras';

  @override
  String get percentageTotalDiscount => 'Descuento total';

  @override
  String get percentageBill => 'Importe de la cuenta';

  @override
  String get percentageTip => 'Propina';

  @override
  String get percentageCustom => 'Otro';

  @override
  String get percentagePeople => 'Personas';

  @override
  String get percentageAddPerson => 'Añadir una persona';

  @override
  String get percentageRemovePerson => 'Quitar una persona';

  @override
  String get percentageTipAmount => 'Importe de la propina';

  @override
  String get percentageTotal => 'Total';

  @override
  String get percentagePerPerson => 'Paga cada persona';

  @override
  String get percentageTaxRate => 'Tipo de impuesto';

  @override
  String get percentageAddTax => 'Sumar impuesto';

  @override
  String get percentageRemoveTax => 'Quitar impuesto';

  @override
  String get percentagePriceExclTax => 'Precio sin impuesto';

  @override
  String get percentagePriceInclTax => 'Precio con impuesto';

  @override
  String get percentageBeforeTax => 'Sin impuesto';

  @override
  String get percentageTaxAmount => 'Impuesto';

  @override
  String get percentageAfterTax => 'Total con impuesto';

  @override
  String get percentageEnterValues => 'Escribe números para ver el resultado';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonShare => 'Compartir';

  @override
  String get commonCopy => 'Copiar';

  @override
  String get commonCopied => 'Copiado';

  @override
  String get commonRetry => 'Reintentar';

  @override
  String get commonDone => 'Listo';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonUndo => 'Deshacer';

  @override
  String get commonOpen => 'Abrir';

  @override
  String get commonReset => 'Restablecer';

  @override
  String get commonClose => 'Cerrar';

  @override
  String get commonOpenSettings => 'Abrir ajustes';

  @override
  String get commonChoosePhoto => 'Elegir foto';

  @override
  String get commonChooseFile => 'Elegir archivo';

  @override
  String get commonCamera => 'Cámara';

  @override
  String get commonGallery => 'Galería';

  @override
  String get commonWorking => 'Procesando…';

  @override
  String get commonSavedToGallery => 'Guardado en la galería';

  @override
  String get commonSavedToDownloads => 'Guardado en Descargas';

  @override
  String get commonSaveFailed => 'No se pudo guardar el archivo';

  @override
  String get commonErrorGeneric => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String get commonErrorOffline => 'Sin conexión a internet';

  @override
  String get commonErrorTimeout =>
      'Se agotó el tiempo de espera. Inténtalo de nuevo.';

  @override
  String get commonPermissionNeeded =>
      'Se necesita permiso. Actívalo en Ajustes.';

  @override
  String get commonResult => 'Resultado';

  @override
  String get commonStart => 'Iniciar';

  @override
  String get commonStop => 'Detener';

  @override
  String get commonClearAll => 'Borrar todo';

  @override
  String get commonPaste => 'Pegar';

  @override
  String get commonSearch => 'Buscar';

  @override
  String get organizePdfHint =>
      'Toca las páginas para seleccionarlas. Mantén pulsada una página y arrástrala para moverla.';

  @override
  String organizePdfSelected(int count) {
    return '$count seleccionadas';
  }

  @override
  String get organizePdfRotateLeft => 'Girar a la izquierda';

  @override
  String get organizePdfRotateRight => 'Girar a la derecha';

  @override
  String get organizePdfDelete => 'Eliminar';

  @override
  String get organizePdfSelectAll => 'Seleccionar todo';

  @override
  String get organizePdfClearSelection => 'Quitar selección';

  @override
  String organizePdfDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas eliminadas',
      one: '1 página eliminada',
    );
    return '$_temp0';
  }

  @override
  String get organizePdfUndo => 'Deshacer';

  @override
  String get organizePdfKeepOne => 'Un PDF necesita al menos una página.';

  @override
  String get organizePdfNoChanges =>
      'Aún no hay cambios: mueve, gira o elimina páginas primero.';

  @override
  String get organizePdfReset => 'Deshacer todos los cambios';

  @override
  String get organizePdfMoveEarlier => 'Mover antes';

  @override
  String get organizePdfMoveLater => 'Mover después';

  @override
  String get organizePdfSave => 'Guardar PDF';

  @override
  String get organizePdfFailed => 'No se pudo guardar este PDF.';

  @override
  String get organizePdfResult => 'Tu PDF organizado está listo';

  @override
  String pdfToTextReading(int current, int total) {
    return 'Leyendo la página $current de $total…';
  }

  @override
  String pdfToTextWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palabras',
      one: '1 palabra',
    );
    return '$_temp0';
  }

  @override
  String get pdfToTextCopyAll => 'Copiar todo';

  @override
  String get pdfToTextCopied => 'Texto copiado';

  @override
  String get pdfToTextSaveTxt => 'Guardar como .txt';

  @override
  String get pdfToTextEmptyPage => 'No hay texto en esta página';

  @override
  String get pdfToTextScannedTitle => 'No se encontró texto';

  @override
  String get pdfToTextScannedBody =>
      'Este PDF parece un escaneo o fotos, así que no hay texto que copiar. En su lugar, podemos leer las palabras de la página 1 a partir de la imagen.';

  @override
  String pdfToTextOpenOcr(String tool) {
    return 'Leer la página 1 con $tool';
  }

  @override
  String get pdfToTextFailed => 'No se pudo leer el texto de este PDF.';

  @override
  String pdfToTextPartlyScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas no tienen texto (pueden estar escaneadas).',
      one: '1 página no tiene texto (puede estar escaneada).',
    );
    return '$_temp0';
  }

  @override
  String get pdfEditChoosePdf => 'Elige un PDF';

  @override
  String get pdfEditChooseHint =>
      'O comparte un PDF con Utility Toolbox desde cualquier app';

  @override
  String get pdfEditChange => 'Cambiar';

  @override
  String get pdfEditReading => 'Leyendo…';

  @override
  String pdfEditPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '1 página',
    );
    return '$_temp0';
  }

  @override
  String pdfEditPageN(int number) {
    return 'Página $number';
  }

  @override
  String get pdfEditInvalidPdf => 'Este archivo no parece un PDF válido.';

  @override
  String get pdfEditLocked =>
      'Este PDF está protegido con contraseña. Quita primero la contraseña y vuelve a intentarlo.';

  @override
  String get pdfEditLockedShort => 'Protegido con contraseña';

  @override
  String get pdfEditPreviewFailed => 'No se pudo mostrar esta página.';

  @override
  String get pdfEditResultReady => 'Tu PDF está listo';

  @override
  String get pdfEditSaveDownloads => 'Guardar en Descargas';

  @override
  String get pdfEditShare => 'Compartir';

  @override
  String get pdfEditStartOver => 'Empezar de nuevo';

  @override
  String get pdfEditSavedToDownloads =>
      'Guardado en Descargas: lo encontrarás en Mis archivos';

  @override
  String get pdfEditSharedInstead =>
      'Se abrió el menú para compartir en su lugar';

  @override
  String get pdfEditSaveFailed =>
      'No se pudo crear el archivo. Inténtalo de nuevo.';

  @override
  String get signPdfStepPdf => 'Elige tu PDF';

  @override
  String get signPdfStepSignature => 'Crea tu firma';

  @override
  String get signPdfStepPlace => 'Toca una página para colocar tu firma';

  @override
  String get signPdfDraw => 'Dibujar firma';

  @override
  String get signPdfDrawAgain => 'Dibujar de nuevo';

  @override
  String get signPdfUseSaved => 'Usar firma guardada';

  @override
  String get signPdfDeleteSaved => 'Eliminar firma guardada';

  @override
  String get signPdfSavedDeleted => 'Firma guardada eliminada';

  @override
  String get signPdfDrawTitle => 'Dibuja tu firma';

  @override
  String get signPdfDrawHint => 'Firma aquí con el dedo';

  @override
  String get signPdfUndo => 'Deshacer';

  @override
  String get signPdfInkBlack => 'Negro';

  @override
  String get signPdfInkBlue => 'Azul';

  @override
  String get signPdfRemember => 'Guardar la firma para la próxima vez';

  @override
  String get signPdfDone => 'Usar esta firma';

  @override
  String get signPdfEmpty => 'Primero dibuja tu firma.';

  @override
  String get signPdfSignatureLabel => 'Tu firma';

  @override
  String get signPdfPlaceHint =>
      'Arrastra para mover; pellizca o usa el control para cambiar el tamaño. Toca la página para llevar la firma allí.';

  @override
  String get signPdfSize => 'Tamaño';

  @override
  String get signPdfPlaceConfirm => 'Colocar aquí';

  @override
  String get signPdfRemoveFromPage => 'Quitar de esta página';

  @override
  String get signPdfAllPages => 'Añadir a todas las páginas';

  @override
  String signPdfAllPagesDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Firma añadida a las $count páginas',
      one: 'Firma añadida a 1 página',
    );
    return '$_temp0';
  }

  @override
  String get signPdfClearAll => 'Quitar todas';

  @override
  String signPdfPlacedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Firmado en $count páginas',
      one: 'Firmado en 1 página',
      zero: 'Aún no hay páginas firmadas',
    );
    return '$_temp0';
  }

  @override
  String get signPdfSave => 'Guardar PDF firmado';

  @override
  String get signPdfNoPlacement =>
      'Primero toca una página para colocar tu firma.';

  @override
  String get signPdfFailed => 'No se pudo firmar este PDF.';

  @override
  String get signPdfResult => 'Tu PDF firmado está listo';

  @override
  String get watermarkPdfModeText => 'Marca de agua de texto';

  @override
  String get watermarkPdfModeNumbers => 'Números de página';

  @override
  String get watermarkPdfText => 'Texto de la marca de agua';

  @override
  String get watermarkPdfDefaultText => 'CONFIDENCIAL';

  @override
  String get watermarkPdfTextEmpty =>
      'Primero escribe el texto de la marca de agua.';

  @override
  String get watermarkPdfSize => 'Tamaño del texto';

  @override
  String get watermarkPdfOpacity => 'Opacidad';

  @override
  String get watermarkPdfLayout => 'Disposición';

  @override
  String get watermarkPdfDiagonal => 'Diagonal';

  @override
  String get watermarkPdfCenter => 'Centro';

  @override
  String get watermarkPdfTiled => 'En mosaico';

  @override
  String get watermarkPdfColor => 'Color';

  @override
  String get watermarkPdfColorGrey => 'Gris';

  @override
  String get watermarkPdfColorRed => 'Rojo';

  @override
  String get watermarkPdfColorBlue => 'Azul';

  @override
  String get watermarkPdfColorBlack => 'Negro';

  @override
  String get watermarkPdfColorGreen => 'Verde';

  @override
  String get watermarkPdfFormat => 'Formato';

  @override
  String watermarkPdfPageLabel(String number) {
    return 'Página $number';
  }

  @override
  String get watermarkPdfPosition => 'Posición';

  @override
  String get watermarkPdfBottomCenter => 'Abajo al centro';

  @override
  String get watermarkPdfBottomRight => 'Abajo a la derecha';

  @override
  String get watermarkPdfTopRight => 'Arriba a la derecha';

  @override
  String get watermarkPdfStartAt => 'Empezar en';

  @override
  String get watermarkPdfDecrease => 'Disminuir';

  @override
  String get watermarkPdfIncrease => 'Aumentar';

  @override
  String get watermarkPdfPreview => 'Vista previa (página 1)';

  @override
  String get watermarkPdfApplyText => 'Añadir marca de agua';

  @override
  String get watermarkPdfApplyNumbers => 'Añadir números de página';

  @override
  String get watermarkPdfFailed => 'No se pudo modificar este PDF.';

  @override
  String get bgRemoverPickTitle => 'Elige una foto';

  @override
  String get bgRemoverPickBody =>
      'Funciona mejor con personas, mascotas y objetos. Tu foto se procesa en tu teléfono.';

  @override
  String get bgRemoverGallery => 'Elegir de la galería';

  @override
  String get bgRemoverCamera => 'Hacer una foto';

  @override
  String get bgRemoverPreparing => 'Preparando la foto…';

  @override
  String get bgRemoverWorking => 'Quitando el fondo…';

  @override
  String get bgRemoverDownloading =>
      'Preparando la herramienta para quitar fondos. Solo pasa una vez y necesita internet…';

  @override
  String get bgRemoverDownloadFailed =>
      'La herramienta aún no está lista: los servicios de Google Play todavía la están descargando. Revisa tu conexión a internet y vuelve a intentarlo en un minuto.';

  @override
  String get bgRemoverNoSubject =>
      'No se encontró ninguna persona ni objeto en esta foto. Prueba con una foto con un sujeto claro.';

  @override
  String get bgRemoverOpenFailed =>
      'No se pudo abrir esta foto. Prueba con otra.';

  @override
  String get bgRemoverFailed =>
      'Algo salió mal al quitar el fondo. Inténtalo de nuevo.';

  @override
  String get bgRemoverRetry => 'Reintentar';

  @override
  String get bgRemoverAnotherPhoto => 'Elegir otra foto';

  @override
  String get bgRemoverNewPhoto => 'Nueva foto';

  @override
  String get bgRemoverBefore => 'Antes';

  @override
  String get bgRemoverAfter => 'Después';

  @override
  String get bgRemoverCompare => 'Comparar antes y después';

  @override
  String get bgRemoverCompareHint => 'Arrastra el control para comparar';

  @override
  String get bgRemoverBgTransparent => 'Transparente';

  @override
  String get bgRemoverBgWhite => 'Blanco';

  @override
  String get bgRemoverBgBlack => 'Negro';

  @override
  String get bgRemoverBgBlue => 'Azul';

  @override
  String get bgRemoverBgRed => 'Rojo';

  @override
  String get bgRemoverBgYellow => 'Amarillo';

  @override
  String get bgRemoverBgBlur => 'Desenfoque';

  @override
  String get bgRemoverSave => 'Guardar en la galería';

  @override
  String get bgRemoverSaved => 'Guardada en tu galería';

  @override
  String get bgRemoverSaveFailed =>
      'No se pudo guardar la imagen. Inténtalo de nuevo.';

  @override
  String get bgRemoverPngHint => 'PNG con fondo transparente';

  @override
  String get bgRemoverJpgHint => 'JPG con el fondo elegido';

  @override
  String get bubbleLevelSurfaceHint =>
      'Apoya el teléfono plano sobre la superficie';

  @override
  String get bubbleLevelUprightHint =>
      'Apoya el borde del teléfono en la superficie';

  @override
  String get bubbleLevelLevel => 'Nivelado';

  @override
  String bubbleLevelAngleLabel(String angle) {
    return 'Inclinación de $angle grados';
  }

  @override
  String bubbleLevelAxes(String x, String y) {
    return 'Izquierda–derecha $x° · Delante–atrás $y°';
  }

  @override
  String get bubbleLevelCalibrate => 'Calibrar';

  @override
  String get bubbleLevelReset => 'Restablecer';

  @override
  String get bubbleLevelCalibrateTitle => '¿Calibrar el nivel?';

  @override
  String get bubbleLevelCalibrateBody =>
      'Coloca el teléfono sobre una superficie que sepas que está nivelada (o apóyalo en un borde recto) y toca Calibrar. La posición actual marcará 0°.';

  @override
  String get bubbleLevelCalibrated =>
      'Calibrado. Esta posición ahora marca 0°.';

  @override
  String get bubbleLevelResetDone => 'Calibración borrada';

  @override
  String get bubbleLevelUnavailable =>
      'Este teléfono no tiene sensor de movimiento, así que el nivel no puede funcionar.';

  @override
  String get flashlightOn => 'Luz encendida';

  @override
  String get flashlightOff => 'Luz apagada';

  @override
  String get flashlightTurnOn => 'Encender la luz';

  @override
  String get flashlightTurnOff => 'Apagar la luz';

  @override
  String get flashlightModeSteady => 'Fija';

  @override
  String get flashlightModeSos => 'SOS';

  @override
  String get flashlightModeStrobe => 'Estrobo';

  @override
  String get flashlightSosHint =>
      'Emite la señal de socorro ··· ––– ··· una y otra vez';

  @override
  String flashlightStrobeSpeed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count destellos por segundo',
      one: '1 destello por segundo',
    );
    return '$_temp0';
  }

  @override
  String get flashlightUseScreen => 'Usar la pantalla como luz';

  @override
  String get flashlightUseScreenHint =>
      'Ilumina la pantalla en lugar del flash';

  @override
  String get flashlightNoTorch =>
      'Este teléfono no tiene flash, así que se iluminará la pantalla.';

  @override
  String get flashlightTorchBusy =>
      'El flash está ocupado (quizá otra app usa la cámara), así que se iluminará la pantalla.';

  @override
  String get flashlightScreenColor => 'Color de la luz de pantalla';

  @override
  String get flashlightColorWhite => 'Blanco';

  @override
  String get flashlightColorWarm => 'Blanco cálido';

  @override
  String get flashlightColorRed => 'Rojo';

  @override
  String get flashlightColorGreen => 'Verde';

  @override
  String get flashlightColorBlue => 'Azul';

  @override
  String get flashlightTapToTurnOff => 'Toca en cualquier lugar para apagar';

  @override
  String get stopwatchTabStopwatch => 'Cronómetro';

  @override
  String get stopwatchTabTimer => 'Temporizador';

  @override
  String get stopwatchStart => 'Iniciar';

  @override
  String get stopwatchPause => 'Pausar';

  @override
  String get stopwatchResume => 'Reanudar';

  @override
  String get stopwatchLap => 'Vuelta';

  @override
  String get stopwatchReset => 'Reiniciar';

  @override
  String stopwatchLapNumber(int number) {
    return 'Vuelta $number';
  }

  @override
  String stopwatchCurrentLap(int number, String time) {
    return 'Vuelta $number: $time';
  }

  @override
  String get stopwatchBest => 'Más rápida';

  @override
  String get stopwatchWorst => 'Más lenta';

  @override
  String get stopwatchNoLaps =>
      'Toca Vuelta mientras corre el cronómetro para guardar tiempos de vuelta.';

  @override
  String get stopwatchTimerQuickStart => 'Inicio rápido';

  @override
  String stopwatchTimerMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get stopwatchTimerCustom => 'Elegir otro tiempo';

  @override
  String get stopwatchTimerPickTitle => 'Configurar temporizador';

  @override
  String get stopwatchTimerHours => 'horas';

  @override
  String get stopwatchTimerMinutesUnit => 'min';

  @override
  String get stopwatchTimerSeconds => 's';

  @override
  String get stopwatchTimerAddMinute => '+1 min';

  @override
  String get stopwatchTimerPaused => 'En pausa';

  @override
  String stopwatchTimerRemaining(String time) {
    return 'Quedan $time';
  }

  @override
  String get stopwatchTimerTimesUp => '¡Se acabó el tiempo!';

  @override
  String stopwatchTimerFinishedBody(String duration) {
    return 'Tu temporizador de $duration ha terminado.';
  }

  @override
  String get stopwatchTimerRestart => 'Reiniciar';

  @override
  String get stopwatchTimerDone => 'Listo';

  @override
  String get stopwatchTimerKeepOpen =>
      'Mantén esta pantalla abierta: el teléfono vibrará cuando acabe el tiempo.';

  @override
  String get translateHeroTitle => 'Habla o escribe para traducir';

  @override
  String get translateBadgeOnDevice => 'IA en el dispositivo';

  @override
  String get translateBadgeOffline => 'Funciona sin conexión';

  @override
  String get translateFrom => 'De';

  @override
  String get translateTo => 'A';

  @override
  String get translateSwap => 'Intercambiar idiomas';

  @override
  String get translateHint =>
      'Escribe un texto o toca el micrófono para hablar…';

  @override
  String get translateHintListening =>
      'Escuchando… habla con naturalidad y toca el micrófono para detener';

  @override
  String translateListeningIn(String language) {
    return 'Escuchando en $language… toca el micrófono para detener y traducir.';
  }

  @override
  String get translateSameLanguage =>
      'El idioma de origen y el de destino deben ser distintos.';

  @override
  String get translateButton => 'Traducir';

  @override
  String get translateTranslating => 'Traduciendo…';

  @override
  String get translateStopAndTranslate => 'Detener y traducir';

  @override
  String get translateDownloadingModel => 'Descargando el modelo de idioma…';

  @override
  String get translateResultLabel => 'Traducción';

  @override
  String get translatePlayAudio => 'Reproducir audio';

  @override
  String get translateGenerating => 'Generando…';

  @override
  String get translateShareAudio => 'Compartir archivo de audio';

  @override
  String get translateGenerateAudio => 'Generar archivo de audio';

  @override
  String get translateAudioReady =>
      'Archivo de audio listo: compártelo para enviarlo o guardarlo.';

  @override
  String get translateMicStop => 'Dejar de escuchar y traducir';

  @override
  String get translateMicStart => 'Habla para traducir';

  @override
  String get translateMicBlocked =>
      'El acceso al micrófono está bloqueado. Actívalo en Ajustes para usar la entrada de voz.';

  @override
  String get translateMicNeeded =>
      'Se necesita permiso del micrófono para la entrada de voz.';

  @override
  String get translateSpeechUnavailable =>
      'El reconocimiento de voz no está disponible en este dispositivo.';

  @override
  String get translateNoSpeech => 'No se ha oído nada. Vuelve a intentarlo.';

  @override
  String get translateVoiceFailed =>
      'La entrada de voz se detuvo. Inténtalo de nuevo.';

  @override
  String get translateDownloadFailed =>
      'No se pudieron descargar los modelos de idioma. Revisa tu conexión a internet.';

  @override
  String get translateFailed => 'La traducción falló. Inténtalo de nuevo.';

  @override
  String get translateAudioFailed =>
      'No se pudo crear un archivo de audio en este dispositivo.';

  @override
  String translateLanguageName(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'af': 'Afrikáans',
      'sq': 'Albanés',
      'ar': 'Árabe',
      'be': 'Bielorruso',
      'bn': 'Bengalí',
      'bg': 'Búlgaro',
      'ca': 'Catalán',
      'zh': 'Chino (simplificado)',
      'hr': 'Croata',
      'cs': 'Checo',
      'da': 'Danés',
      'nl': 'Neerlandés',
      'en': 'Inglés',
      'eo': 'Esperanto',
      'et': 'Estonio',
      'fi': 'Finés',
      'fr': 'Francés',
      'gl': 'Gallego',
      'ka': 'Georgiano',
      'de': 'Alemán',
      'el': 'Griego',
      'gu': 'Guyaratí',
      'ht': 'Criollo haitiano',
      'he': 'Hebreo',
      'hi': 'Hindi',
      'hu': 'Húngaro',
      'is': 'Islandés',
      'id': 'Indonesio',
      'ga': 'Irlandés',
      'it': 'Italiano',
      'ja': 'Japonés',
      'kn': 'Canarés',
      'ko': 'Coreano',
      'lv': 'Letón',
      'lt': 'Lituano',
      'mk': 'Macedonio',
      'ms': 'Malayo',
      'mt': 'Maltés',
      'mr': 'Maratí',
      'no': 'Noruego',
      'fa': 'Persa (farsi)',
      'pl': 'Polaco',
      'pt': 'Portugués',
      'ro': 'Rumano',
      'ru': 'Ruso',
      'sk': 'Eslovaco',
      'sl': 'Esloveno',
      'es': 'Español',
      'sw': 'Suajili',
      'sv': 'Sueco',
      'tl': 'Tagalo (filipino)',
      'ta': 'Tamil',
      'te': 'Telugu',
      'th': 'Tailandés',
      'tr': 'Turco',
      'uk': 'Ucraniano',
      'ur': 'Urdu',
      'vi': 'Vietnamita',
      'cy': 'Galés',
      'other': '$code',
    });
    return '$_temp0';
  }

  @override
  String get textUtilMode => 'Modo';

  @override
  String get textUtilModeText => 'Texto';

  @override
  String get textUtilHint => 'Escribe el texto aquí…';

  @override
  String get textUtilHintBase64 => 'Escribe texto o Base64 para convertir…';

  @override
  String textUtilWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'palabras',
      one: 'palabra',
    );
    return '$_temp0';
  }

  @override
  String textUtilCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'caracteres',
      one: 'carácter',
    );
    return '$_temp0';
  }

  @override
  String get textUtilNoSpaces => 'sin espacios';

  @override
  String get textUtilUpper => 'MAYÚSCULAS';

  @override
  String get textUtilLower => 'minúsculas';

  @override
  String get textUtilTitle => 'Tipo Título';

  @override
  String get textUtilSentence => 'Tipo oración';

  @override
  String get textUtilEncode => 'Codificar';

  @override
  String get textUtilDecode => 'Decodificar';

  @override
  String get textUtilOutput => 'Resultado';

  @override
  String get textUtilInvalidBase64 => 'No es un Base64 válido.';

  @override
  String get clipEmptyClipboard =>
      'El portapapeles está vacío o no contiene texto.';

  @override
  String clipSaved(String text) {
    return 'Guardado: $text';
  }

  @override
  String get clipAddManualTitle => 'Añadir texto manualmente';

  @override
  String get clipAddHint => 'Escribe o pega el texto aquí…';

  @override
  String get clipClearUnpinned => 'Borrar no fijados';

  @override
  String get clipClearHistoryTitle => '¿Borrar el historial?';

  @override
  String get clipClearHistoryBody =>
      '¿Quitar todos los elementos no fijados? Los fijados se conservan.';

  @override
  String get clipSearchHint => 'Buscar clips…';

  @override
  String get clipFilterAll => 'Todos';

  @override
  String get clipFilterPinned => 'Fijados';

  @override
  String get clipFilterLinks => 'Enlaces';

  @override
  String get clipFilterText => 'Texto';

  @override
  String get clipFilterCode => 'Código';

  @override
  String clipSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString guardados',
      one: '1 guardado',
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
      other: '$countString fijados',
      one: '1 fijado',
    );
    return '$_temp0';
  }

  @override
  String get clipAddText => 'Añadir texto';

  @override
  String get clipLabel => 'Etiqueta';

  @override
  String get clipAddLabelTitle => 'Añadir etiqueta';

  @override
  String get clipLabelHint => 'p. ej., correo del trabajo';

  @override
  String get clipEmptyTitle => 'Aún no hay clips';

  @override
  String get clipEmptyMessage =>
      'Copia cualquier texto en tu teléfono y toca Pegar para guardarlo aquí para siempre.';

  @override
  String get clipPasteFromClipboard => 'Pegar del portapapeles';

  @override
  String get clipTypeLink => 'Enlace';

  @override
  String get clipTypeEmail => 'Correo';

  @override
  String get clipTypePhone => 'Teléfono';

  @override
  String get clipTypeCode => 'Código';

  @override
  String get clipTypeText => 'Texto';

  @override
  String get clipJustNow => 'ahora mismo';

  @override
  String clipMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count min',
    );
    return '$_temp0';
  }

  @override
  String clipHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count h',
    );
    return '$_temp0';
  }

  @override
  String clipDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hace $count días',
      one: 'hace 1 día',
    );
    return '$_temp0';
  }

  @override
  String get clipPin => 'Fijar';

  @override
  String get clipUnpin => 'Dejar de fijar';

  @override
  String get calcDivideByZero => 'No se puede dividir entre cero';

  @override
  String get calcCheckExpression => 'Revisa la expresión';

  @override
  String get calcCopyResult => 'Copiar resultado';

  @override
  String get calcPlus => 'Más';

  @override
  String get calcMinus => 'Menos';

  @override
  String get calcTimes => 'Por';

  @override
  String get calcDivide => 'Entre';

  @override
  String get calcPercent => 'Por ciento';

  @override
  String get calcParentheses => 'Paréntesis';

  @override
  String get calcEquals => 'Igual';

  @override
  String get calcDecimalPoint => 'Punto decimal';

  @override
  String get ageTabAge => 'Edad';

  @override
  String get ageTabBetween => 'Entre fechas';

  @override
  String get ageDateOfBirth => 'Fecha de nacimiento';

  @override
  String get ageFrom => 'Desde';

  @override
  String get ageTo => 'Hasta';

  @override
  String get ageFutureDate => 'Esa fecha está en el futuro.';

  @override
  String ageYearsUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'años',
      one: 'año',
    );
    return '$_temp0';
  }

  @override
  String ageDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'días',
      one: 'día',
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
      other: '$countString años',
      one: '1 año',
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
      other: '$countString meses',
      one: '1 mes',
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
      other: '$countString días',
      one: '1 día',
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
      other: '$countString semanas',
      one: '1 semana',
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
      other: 'en $countString días',
      one: 'en 1 día',
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
  String get ageNextBirthday => 'Próximo cumpleaños';

  @override
  String get ageBirthdayToday => 'Hoy 🎉';

  @override
  String get ageTotalMonths => 'Meses en total';

  @override
  String get ageTotalWeeks => 'Semanas en total';

  @override
  String get ageTotalDays => 'Días en total';

  @override
  String get ageWeeksLabel => 'Semanas';

  @override
  String get ageWeekdays => 'Días laborables (lun–vie)';

  @override
  String get ageHours => 'Horas';

  @override
  String get ageIncludingEnd => 'Incluyendo la fecha final';

  @override
  String get unitFrom => 'De';

  @override
  String get unitTo => 'A';

  @override
  String get unitEnterValue => 'Introduce un valor';

  @override
  String get unitSwap => 'Intercambiar unidades';

  @override
  String unitCategoryName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'length': 'Longitud',
      'weight': 'Peso',
      'temperature': 'Temperatura',
      'area': 'Superficie',
      'volume': 'Volumen',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String unitName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'millimeter': 'Milímetro',
      'centimeter': 'Centímetro',
      'meter': 'Metro',
      'kilometer': 'Kilómetro',
      'inch': 'Pulgada',
      'foot': 'Pie',
      'mile': 'Milla',
      'gram': 'Gramo',
      'kilogram': 'Kilogramo',
      'ounce': 'Onza',
      'pound': 'Libra',
      'celsius': 'Celsius',
      'fahrenheit': 'Fahrenheit',
      'kelvin': 'Kelvin',
      'squareMeter': 'Metro cuadrado',
      'squareFoot': 'Pie cuadrado',
      'acre': 'Acre',
      'hectare': 'Hectárea',
      'milliliter': 'Mililitro',
      'liter': 'Litro',
      'gallonUs': 'Galón (EE. UU.)',
      'fluidOunce': 'Onza líquida',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String get loanAmount => 'Importe del préstamo';

  @override
  String get loanInterestRate => 'Tasa de interés anual';

  @override
  String get loanTenure => 'Plazo';

  @override
  String get loanTenureMonths => 'Plazo (meses)';

  @override
  String get loanTenureYears => 'Plazo (años)';

  @override
  String get loanToggleMonths => 'Meses';

  @override
  String get loanToggleYears => 'Años';

  @override
  String get loanEmpty =>
      'Introduce datos válidos del préstamo para calcular la cuota mensual';

  @override
  String get loanMonthlyEmi => 'Cuota mensual';

  @override
  String get loanPrincipal => 'Capital';

  @override
  String get loanTotalInterest => 'Interés total';

  @override
  String get loanTotalPayment => 'Pago total';

  @override
  String get loanBreakdown => 'Desglose';

  @override
  String get loanInterest => 'Interés';

  @override
  String loanInterestShare(String percent) {
    return '$percent de interés';
  }

  @override
  String get loanSchedule => 'Tabla de amortización';

  @override
  String loanMonths(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString meses',
      one: '1 mes',
    );
    return '$_temp0';
  }

  @override
  String get loanColMonth => 'Mes';

  @override
  String get loanColBalance => 'Saldo';

  @override
  String get loanShowAll => 'Ver todos los meses';

  @override
  String get loanShowLess => 'Ver menos';

  @override
  String get clockSearchHint => 'Buscar ciudad o país…';

  @override
  String get clockPinned => 'Fijadas';

  @override
  String get clockAllCities => 'Todas las ciudades';

  @override
  String clockOnWidget(int shown, int total) {
    final intl.NumberFormat shownNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String shownString = shownNumberFormat.format(shown);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'En el widget: $shownString de $totalString';
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

    return 'En el widget: $shownString de hasta $maxString (cambia el tamaño para ver más)';
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

    return 'El widget de la pantalla de inicio muestra las primeras $defaultRowsString por defecto; arrastra su borde inferior para ver hasta $maxRowsString.';
  }

  @override
  String get clockPin => 'Fijar';

  @override
  String get clockUnpin => 'Dejar de fijar';

  @override
  String get clockNoResults => 'No hay ciudades que coincidan';

  @override
  String get speedSelectingServer => 'Seleccionando servidor…';

  @override
  String get speedPhasePing => 'Midiendo el ping';

  @override
  String get speedPhaseDownload => 'Probando la velocidad de descarga';

  @override
  String get speedPhaseUpload => 'Probando la velocidad de subida';

  @override
  String get speedDownloadSpeed => 'Velocidad de descarga';

  @override
  String get speedUploadSpeed => 'Velocidad de subida';

  @override
  String get speedRunAgain => 'Repetir';

  @override
  String get speedGo => 'IR';

  @override
  String speedMeasuredVia(String server) {
    return 'Medido a través de $server';
  }

  @override
  String get speedPoweredBy =>
      'Usa los servidores de prueba de velocidad de Cloudflare';

  @override
  String get speedIdleHint =>
      'Toca el botón para medir el ping y la velocidad de descarga y subida.';

  @override
  String get speedPing => 'Ping';

  @override
  String get speedResultsTitle => 'Resultados de la prueba';

  @override
  String get speedDownload => 'Descarga';

  @override
  String get speedUpload => 'Subida';

  @override
  String speedConnectedIp(String ip) {
    return 'Tu IP: $ip';
  }

  @override
  String get speedErrorOffline =>
      'Sin conexión a internet. Revisa el Wi-Fi o los datos móviles.';

  @override
  String get speedErrorTimeout =>
      'La prueba tardó demasiado. Tu conexión puede ser inestable.';

  @override
  String get speedErrorFailed => 'La prueba falló. Inténtalo de nuevo.';

  @override
  String get pingErrorHostNotFound =>
      'No se encontró el host. Revisa la dirección y tu conexión a internet.';

  @override
  String get pingErrorNoData =>
      'No hay información disponible para esta dirección.';

  @override
  String get pingTabMyIp => 'Mi IP';

  @override
  String get pingTabLookup => 'Consultar';

  @override
  String get pingTabPing => 'Ping';

  @override
  String get pingYourPublicIp => 'Tu IP pública';

  @override
  String get pingFieldCity => 'Ciudad';

  @override
  String get pingFieldRegion => 'Región';

  @override
  String get pingFieldCountry => 'País';

  @override
  String get pingFieldIsp => 'Proveedor';

  @override
  String get pingFieldTimezone => 'Zona horaria';

  @override
  String get pingFieldLocation => 'Coordenadas';

  @override
  String get pingFieldIp => 'Dirección IP';

  @override
  String get pingIpCopied => 'Dirección IP copiada';

  @override
  String get pingCopyIp => 'Copiar IP';

  @override
  String get pingLookupHint => 'Dirección IP o nombre de host';

  @override
  String get pingLookupButton => 'Consultar';

  @override
  String get pingHostHint => 'Nombre de host (p. ej., google.com)';

  @override
  String get pingStartButton => 'Probar';

  @override
  String pingHeader(String host, String ip) {
    return 'Ping a $host ($ip) por el puerto TCP 443';
  }

  @override
  String get pingStatAvg => 'Media';

  @override
  String get pingStatLoss => 'Pérdida';

  @override
  String get pingStatSent => 'Enviados';

  @override
  String get pingTimeout => 'Sin respuesta';

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
  String get compassSW => 'SO';

  @override
  String get compassW => 'O';

  @override
  String get compassNW => 'NO';

  @override
  String get compassNorth => 'Norte';

  @override
  String get compassNortheast => 'Noreste';

  @override
  String get compassEast => 'Este';

  @override
  String get compassSoutheast => 'Sureste';

  @override
  String get compassSouth => 'Sur';

  @override
  String get compassSouthwest => 'Suroeste';

  @override
  String get compassWest => 'Oeste';

  @override
  String get compassNorthwest => 'Noroeste';

  @override
  String compassSemantics(String degrees, String direction) {
    return 'Rumbo $degrees°, $direction';
  }

  @override
  String get compassHeadingMagnetic => 'Rumbo magnético';

  @override
  String get compassUnavailable =>
      'Este dispositivo no tiene magnetómetro, así que la brújula no puede funcionar.';

  @override
  String get locationSavedHeader => 'Ubicaciones guardadas';

  @override
  String locationSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString guardadas',
      one: '1 guardada',
      zero: 'Ninguna',
    );
    return '$_temp0';
  }

  @override
  String locationEmpty(String save) {
    return 'Aún no hay ubicaciones guardadas.\nToca «$save» para guardar dónde estás.';
  }

  @override
  String locationDeleted(String name) {
    return 'Se eliminó «$name»';
  }

  @override
  String get locationSaveDialogTitle => 'Guardar ubicación';

  @override
  String get locationNameLabel => 'Nombre';

  @override
  String get locationNameHint => 'p. ej., Casa, Oficina…';

  @override
  String get locationNoteLabel => 'Nota (opcional)';

  @override
  String get locationCurrent => 'Ubicación actual';

  @override
  String get locationRefresh => 'Actualizar ubicación';

  @override
  String get locationLocating => 'Buscando tu ubicación…';

  @override
  String get locationServicesOff =>
      'La ubicación está desactivada. Actívala para ver dónde estás.';

  @override
  String get locationPermissionDenied =>
      'Permite el acceso a la ubicación para ver dónde estás.';

  @override
  String get locationPermissionDeniedForever =>
      'El acceso a la ubicación está bloqueado. Permítelo en Ajustes para usar esta herramienta.';

  @override
  String get locationErrorTimeout =>
      'No se pudo obtener señal GPS. Acércate a una ventana o sal al exterior e inténtalo de nuevo.';

  @override
  String get locationAllow => 'Permitir acceso';

  @override
  String locationAccuracy(String meters) {
    return 'Precisión: ±$meters m';
  }

  @override
  String get locationCoordsCopied => 'Coordenadas copiadas';

  @override
  String get locationCopyCoords => 'Copiar coordenadas';

  @override
  String get locationOpenInMaps => 'Abrir en Mapas';

  @override
  String get passwordYours => 'Tu contraseña';

  @override
  String get passwordSelectType => 'Elige al menos un tipo de carácter';

  @override
  String get passwordStrength => 'Seguridad';

  @override
  String get passwordWeak => 'Débil';

  @override
  String get passwordFair => 'Aceptable';

  @override
  String get passwordGood => 'Buena';

  @override
  String get passwordStrong => 'Fuerte';

  @override
  String get passwordLength => 'Longitud';

  @override
  String passwordChars(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString caracteres',
      one: '1 carácter',
    );
    return '$_temp0';
  }

  @override
  String get passwordInclude => 'Incluir';

  @override
  String get passwordUppercase => 'Mayúsculas';

  @override
  String get passwordLowercase => 'Minúsculas';

  @override
  String get passwordNumbers => 'Números';

  @override
  String get passwordSymbols => 'Símbolos';

  @override
  String get passwordCopied => 'Contraseña copiada';

  @override
  String get passwordGenerate => 'Generar otra';

  @override
  String get hashModeText => 'Texto';

  @override
  String get hashModeFile => 'Archivo';

  @override
  String get hashAlgorithm => 'Algoritmo';

  @override
  String get hashInputHint => 'Escribe el texto para calcular el hash…';

  @override
  String get hashPickFile => 'Toca para elegir un archivo';

  @override
  String get hashChange => 'Cambiar';

  @override
  String get hashHashing => 'Calculando…';

  @override
  String get hashGenerate => 'Generar hash';

  @override
  String get hashFileError => 'No se pudo leer este archivo. Prueba con otro.';

  @override
  String get hashCopied => 'Hash copiado';

  @override
  String get hashCopy => 'Copiar hash';

  @override
  String get colorPickerFormats => 'Formatos de color';

  @override
  String get colorPickerHexLabel => 'Color HEX';

  @override
  String get colorPickerHexInvalid =>
      'Ingresa 6 dígitos hexadecimales (0–9, A–F)';

  @override
  String get colorPickerApply => 'Aplicar color';

  @override
  String colorPickerCopied(String format) {
    return '$format copiado';
  }

  @override
  String get colorPickerPalette => 'Paleta rápida';

  @override
  String colorPickerSwatch(String hex) {
    return 'Color $hex';
  }

  @override
  String get imgCompressPickHint => 'Toca para elegir o tomar una foto';

  @override
  String imgCompressSupported(String formats) {
    return 'Admite $formats';
  }

  @override
  String get imgCompressChange => 'Cambiar foto';

  @override
  String get imgCompressModeQuality => 'Por calidad';

  @override
  String get imgCompressModeTarget => 'Tamaño objetivo';

  @override
  String get imgCompressQuality => 'Calidad';

  @override
  String get imgCompressSmallest => 'Archivo más pequeño';

  @override
  String get imgCompressBestQuality => 'Mejor calidad';

  @override
  String get imgCompressQualityNote =>
      'Las fotos grandes también se reducen a unos 1920×1080.';

  @override
  String imgCompressTargetUnder(String size) {
    return 'Menos de $size';
  }

  @override
  String get imgCompressTargetHint =>
      'Mantiene la mejor calidad que cabe en el límite: ideal para formularios de empleo y trámites.';

  @override
  String get imgCompressButton => 'Comprimir foto';

  @override
  String get imgCompressCompressing => 'Comprimiendo…';

  @override
  String get imgCompressSuccess => '¡Comprimida con éxito!';

  @override
  String imgCompressFitsTarget(String size) {
    return 'Listo: menos de $size';
  }

  @override
  String imgCompressMissedTarget(String size) {
    return 'No se pudo bajar de $size. Esta es la versión más pequeña que pudimos crear.';
  }

  @override
  String get imgCompressStatOriginal => 'Original';

  @override
  String get imgCompressStatCompressed => 'Comprimida';

  @override
  String get imgCompressStatSaved => 'Ahorro';

  @override
  String get imgCompressFailed =>
      'No se pudo comprimir esta foto. Prueba con otra.';

  @override
  String get imgResizePresetPassport => 'Pasaporte 35×45 mm';

  @override
  String imgResizePresetSquare(String size) {
    return 'Cuadrado $size';
  }

  @override
  String imgResizePresetStory(String size) {
    return 'Historia $size';
  }

  @override
  String imgResizePresetMax(String name, String px) {
    return '$name (máx. $px)';
  }

  @override
  String get imgResizeChoosePhotos => 'Elegir fotos';

  @override
  String imgResizeSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos seleccionadas',
      one: '1 foto seleccionada',
    );
    return '$_temp0';
  }

  @override
  String get imgResizePickHint =>
      'Elige una o varias, o compártelas con la app';

  @override
  String get imgResizeChoose => 'Elegir';

  @override
  String get imgResizeChange => 'Cambiar';

  @override
  String get imgResizePresets => 'Ajustes predefinidos';

  @override
  String get imgResizeModePercent => 'Porcentaje';

  @override
  String get imgResizeModeMaxSide => 'Lado máx.';

  @override
  String get imgResizeModeExact => 'Exacto';

  @override
  String get imgResizeWidth => 'Ancho (px)';

  @override
  String get imgResizeHeight => 'Alto (px)';

  @override
  String get imgResizeCrop => 'Recortar para ajustar (sin estirar)';

  @override
  String get imgResizeFormat => 'Formato';

  @override
  String get imgResizeQuality => 'Calidad';

  @override
  String get imgResizeButton => 'Redimensionar';

  @override
  String imgResizeSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Guardar $count fotos en la galería',
      one: 'Guardar 1 foto en la galería',
    );
    return '$_temp0';
  }

  @override
  String get imgResizeChangeSettings => 'Cambiar ajustes';

  @override
  String imgResizeInvalidSize(int min, int max) {
    return 'Ingresa un ancho y un alto entre $min y $max.';
  }

  @override
  String imgResizeFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'No se pudieron leer $count fotos.',
      one: 'No se pudo leer 1 foto.',
    );
    return '$_temp0';
  }

  @override
  String imgResizeSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se guardaron $count fotos en la galería',
      one: 'Se guardó 1 foto en la galería',
    );
    return '$_temp0';
  }

  @override
  String get imgEnhanceEmptyTitle => 'Edita tus fotos';

  @override
  String get imgEnhanceEmptyBody =>
      'Ajusta brillo, contraste, saturación y nitidez, aplica filtros, gira y voltea, todo en tu dispositivo.';

  @override
  String get imgEnhanceFineControls => 'Controles finos';

  @override
  String get imgEnhanceApplying => 'Aplicando…';

  @override
  String get imgEnhanceChange => 'Cambiar';

  @override
  String get imgEnhancePresets => 'Filtros';

  @override
  String get imgEnhanceTransform => 'Transformar';

  @override
  String get imgEnhanceAdjustments => 'Ajustes';

  @override
  String get imgEnhanceRotate => 'Girar';

  @override
  String get imgEnhanceFlipH => 'Voltear horizontal';

  @override
  String get imgEnhanceFlipV => 'Voltear vertical';

  @override
  String get imgEnhanceBrightness => 'Brillo';

  @override
  String get imgEnhanceContrast => 'Contraste';

  @override
  String get imgEnhanceSaturation => 'Saturación';

  @override
  String get imgEnhanceSharpen => 'Nitidez';

  @override
  String get imgEnhanceBlur => 'Desenfoque';

  @override
  String get imgEnhanceQuality => 'Calidad';

  @override
  String get imgEnhanceApply => 'Aplicar';

  @override
  String get imgEnhanceFailed =>
      'No se pudieron aplicar los cambios. Prueba con otra foto.';

  @override
  String imgEnhanceResult(String before, String after, String change) {
    return '¡Listo! $before → $after ($change)';
  }

  @override
  String get imgEnhancePresetOriginal => 'Original';

  @override
  String get imgEnhancePresetVivid => 'Vívido';

  @override
  String get imgEnhancePresetCool => 'Frío';

  @override
  String get imgEnhancePresetWarm => 'Cálido';

  @override
  String get imgEnhancePresetDramatic => 'Dramático';

  @override
  String get imgEnhancePresetFade => 'Desvanecido';

  @override
  String get imgEnhancePresetVintage => 'Vintage';

  @override
  String get imgEnhancePresetNoir => 'Noir';

  @override
  String get upscalerNewImage => 'Nueva foto';

  @override
  String get upscalerIntro =>
      'Amplía fotos hasta 4× con IA en el dispositivo. Funciona sin conexión tras descargar el modelo una sola vez; modo nube opcional para rostros.';

  @override
  String get upscalerBadgeOnDevice => 'IA en el dispositivo';

  @override
  String get upscalerBadgeOffline => 'Funciona sin conexión';

  @override
  String get upscalerBadgeUpTo4x => 'Hasta 4× más grande';

  @override
  String get upscalerBadgeGpu => 'Acelerado por GPU';

  @override
  String get upscalerBestResults =>
      'Mejores resultados: fotos de baja resolución, escaneos antiguos, miniaturas y JPEG comprimidos.';

  @override
  String get upscalerChangeImage => 'Cambiar foto';

  @override
  String get upscalerTabOriginal => 'Original';

  @override
  String get upscalerTabUpscaled => 'Ampliada con IA';

  @override
  String get upscalerStageStarting => 'Iniciando…';

  @override
  String get upscalerStageConnecting => 'Conectando con el servidor de IA…';

  @override
  String get upscalerStageOnDevice => 'Procesando en este dispositivo…';

  @override
  String get upscalerStageCloudUnavailable =>
      'Nube no disponible: procesando en este dispositivo…';

  @override
  String get upscalerStageUploading => 'Subiendo foto…';

  @override
  String get upscalerStageRestoringFaces =>
      'La IA está restaurando rostros y detalles…';

  @override
  String get upscalerStagePreparing => 'Preparando foto…';

  @override
  String get upscalerStageLoadingModel => 'Cargando modelo de IA…';

  @override
  String get upscalerStageDownloadingModel =>
      'Descargando modelo de IA (una sola vez)…';

  @override
  String get upscalerStageFallback => 'Usando ampliación estándar…';

  @override
  String get upscalerStageDecoding => 'Leyendo foto…';

  @override
  String upscalerStageResizing(String from, String to) {
    return 'Redimensionando entrada ($from → $to)…';
  }

  @override
  String get upscalerStageDenoising => 'Reduciendo ruido…';

  @override
  String upscalerStageUpscaling(String factor) {
    return 'Ampliando ($factor×)…';
  }

  @override
  String upscalerStageAiTiles(String done, String total) {
    return 'Ampliando con IA… ($done/$total)';
  }

  @override
  String get upscalerStageSharpening => 'Aumentando nitidez…';

  @override
  String get upscalerStageColour => 'Ajustando colores…';

  @override
  String get upscalerStageSaving => 'Guardando…';

  @override
  String get upscalerStageDone => '¡Listo!';

  @override
  String get upscalerLoadingModelHint =>
      'Cargando el modelo de IA (solo la primera vez)';

  @override
  String get upscalerTime4x =>
      'La ampliación 4× puede tardar de 15 a 60 s según el tamaño de la foto.';

  @override
  String get upscalerTime2x => 'La ampliación 2× suele tardar de 5 a 20 s.';

  @override
  String upscalerDoneIn(String seconds) {
    return 'Ampliada en $seconds s';
  }

  @override
  String get upscalerStatResolution => 'Resolución';

  @override
  String get upscalerStatFileSize => 'Tamaño';

  @override
  String get upscalerStatScale => 'Escala';

  @override
  String get upscalerShareSubject => 'Foto ampliada con IA';

  @override
  String get upscalerFallbackModelUnavailable =>
      'El modelo de IA necesita internet una vez; se usó la ampliación estándar';

  @override
  String get upscalerFallbackModelFailed =>
      'El modelo de IA no pudo ejecutarse en este dispositivo; se usó la ampliación estándar';

  @override
  String get upscalerFallbackCloud =>
      'Servidor en la nube no disponible; se procesó en este dispositivo';

  @override
  String get upscalerSettings => 'Ajustes de IA';

  @override
  String get upscalerFactorLabel => 'Factor de ampliación';

  @override
  String get upscalerFactor2xDesc =>
      'Rápido: ideal para la mayoría de las fotos';

  @override
  String get upscalerFactor4xDesc => 'Mejor calidad: más lento';

  @override
  String get upscalerOptimiseFor => 'Optimizar para';

  @override
  String get upscalerModeAuto => 'Auto';

  @override
  String get upscalerModePhoto => 'Foto';

  @override
  String get upscalerModeIllustration => 'Ilustración';

  @override
  String get upscalerModeFace => 'Detalle facial';

  @override
  String get upscalerDenoise => 'Reducir ruido antes';

  @override
  String get upscalerDenoiseTip => 'Reduce el ruido JPEG antes de ampliar';

  @override
  String get upscalerSharpen => 'Nitidez después';

  @override
  String get upscalerSharpenTip => 'Añade nitidez después de ampliar';

  @override
  String get upscalerCloudTitle => 'Mejora de rostros en la nube';

  @override
  String get upscalerCloudOn =>
      'Tu foto se sube a nuestro servidor para procesarla.';

  @override
  String get upscalerCloudOff =>
      'Desactivado: las fotos se quedan en este dispositivo.';

  @override
  String get upscalerCloudDialogTitle => '¿Enviar fotos a la nube?';

  @override
  String get upscalerCloudDialogBody =>
      'El modo nube sube la foto que elegiste a nuestro servidor de ampliación mediante una conexión cifrada, para procesarla con un modelo de IA más grande (GFPGAN + Real-ESRGAN).\n\n• Solo se envía la foto que eliges ampliar.\n• La foto se procesa en memoria y no se conserva después de devolver el resultado.\n• No se envía ninguna cuenta ni dato personal.\n\nPuedes desactivarlo cuando quieras. El modo en el dispositivo funciona totalmente sin conexión.';

  @override
  String get upscalerCloudKeepLocal => 'Seguir en el dispositivo';

  @override
  String get upscalerCloudEnable => 'Activar nube';

  @override
  String get upscalerUpscale => 'Ampliar con IA';

  @override
  String get upscalerUpscaleAgain => 'Ampliar de nuevo con los nuevos ajustes';

  @override
  String get upscalerFailed => 'Error al ampliar';

  @override
  String get upscalerErrorTooLarge =>
      'La foto es demasiado grande. Prueba con una más pequeña o con ampliación 2×.';

  @override
  String get upscalerErrorUnreadable =>
      'No se pudo leer esta foto. Usa un archivo JPG o PNG.';

  @override
  String get upscalerErrorNetwork =>
      'Se agotó el tiempo de red. Revisa tu conexión o desactiva el modo nube.';

  @override
  String get videoPickHint => 'Toca para elegir un video';

  @override
  String videoProbeInfo(String format, String duration) {
    return 'Formato: $format · Duración: $duration';
  }

  @override
  String get videoOutputFormat => 'Formato de salida';

  @override
  String get videoFmtMostCompatible => 'El más compatible';

  @override
  String get videoFmtApple => 'Apple / QuickTime';

  @override
  String get videoFmtFlexible => 'Contenedor flexible';

  @override
  String get videoFmtLegacy => 'Formato antiguo';

  @override
  String get videoFmtGif => 'Animado (sin audio)';

  @override
  String get videoFmtAudioOnly => 'Solo audio';

  @override
  String get videoFmtAudioAac => 'Solo audio (AAC)';

  @override
  String get videoFmtAudioRaw => 'Solo audio (sin contenedor)';

  @override
  String get videoFmtWav => 'Audio sin comprimir';

  @override
  String videoConvertingPercent(int percent) {
    return 'Convirtiendo… $percent%';
  }

  @override
  String get videoConvertingWait => 'Convirtiendo… puede tardar un poco';

  @override
  String get videoDone => '¡Conversión completa!';

  @override
  String get videoErrorUnsupported =>
      'Error en la conversión. Es posible que tu dispositivo no admita este formato.';

  @override
  String get videoConvertAnother => 'Convertir otro';

  @override
  String get videoPickButton => 'Elegir archivo de video';

  @override
  String videoConvertTo(String format) {
    return 'Convertir a $format';
  }

  @override
  String get docScanAndroidOnly =>
      'El escáner de documentos solo está disponible en Android.';

  @override
  String docScanNeedsPlayServices(String details) {
    return 'No se pudo iniciar el escáner. Necesita los servicios de Google Play; asegúrate de que estén actualizados. ($details)';
  }

  @override
  String get docScanStartFailed =>
      'No se pudo iniciar el escáner. Inténtalo de nuevo.';

  @override
  String get docScanPdfSaved =>
      'PDF guardado en Descargas: encuéntralo en Mis archivos';

  @override
  String docScanPagesSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas guardadas en la galería',
      one: '1 página guardada en la galería',
    );
    return '$_temp0';
  }

  @override
  String get docScanHeadline => 'Escanea papel y obtén un PDF limpio';

  @override
  String get docScanIntro =>
      'Los bordes se detectan automáticamente. Añade todas las páginas que quieras, recorta, gira y aplica filtros antes de guardar.';

  @override
  String get docScanScanning => 'Escaneando…';

  @override
  String get docScanStart => 'Empezar a escanear';

  @override
  String get docScanScannedPages => 'Páginas escaneadas';

  @override
  String docScanPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '1 página',
    );
    return '$_temp0';
  }

  @override
  String get docScanSavePdf => 'Guardar PDF';

  @override
  String get docScanSharePdf => 'Compartir PDF';

  @override
  String get docScanCopyText => 'Copiar texto';

  @override
  String get docScanSaveJpg => 'Guardar como JPG';

  @override
  String get docScanAnother => 'Escanear otro documento';

  @override
  String get pdfToolsChoosePdf => 'Elegir un PDF';

  @override
  String get pdfToolsChooseHint =>
      'O comparte un PDF con Utility Toolbox desde cualquier app';

  @override
  String get pdfToolsReading => 'Leyendo…';

  @override
  String get pdfToolsLockedShort => 'Protegido con contraseña';

  @override
  String pdfToolsPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '1 página',
    );
    return '$_temp0';
  }

  @override
  String get pdfToolsChange => 'Cambiar';

  @override
  String get pdfToolsResultReady => 'Tu PDF está listo';

  @override
  String get pdfToolsSaveDownloads => 'Guardar en Descargas';

  @override
  String get pdfToolsStartOver => 'Empezar de nuevo';

  @override
  String get pdfToolsSavedToDownloads =>
      'Guardado en Descargas: encuéntralo en Mis archivos';

  @override
  String get pdfToolsSharedInstead =>
      'Se abrió el menú de compartir en su lugar';

  @override
  String get pdfToolsRangeEmpty => 'Introduce al menos una página.';

  @override
  String pdfToolsRangeInvalid(String part) {
    return '«$part» no es una página ni un rango (p. ej., 1-3, 5).';
  }

  @override
  String pdfToolsRangeOutside(String part, int count) {
    return '«$part» está fuera de 1–$count.';
  }

  @override
  String get pdfToolsInvalidPdf => 'Este archivo no parece un PDF válido.';

  @override
  String pdfToolsLockedUnlockFirst(String tool) {
    return 'Este PDF está protegido con contraseña. Desbloquéalo primero con «$tool».';
  }

  @override
  String pdfToolsPagesLabel(int count) {
    return 'Páginas (1–$count)';
  }

  @override
  String pdfToolsPagesHint(String example) {
    return 'p. ej., $example';
  }

  @override
  String pdfToolsPageN(int number) {
    return 'Página $number';
  }

  @override
  String get pdfToolsDownload => 'Descargar';

  @override
  String get pdfToolsSavedNotification =>
      'Guardado en Descargas: ábrelo desde la notificación.';

  @override
  String get pdfToolsShareToSave =>
      'Se abrió el menú de compartir: elige dónde guardar el archivo.';

  @override
  String pdfToolsSelectedFile(String name) {
    return 'Seleccionado: $name';
  }

  @override
  String pdfToolsSize(String size) {
    return 'Tamaño: $size';
  }

  @override
  String get pdfToolsDragToReorder => 'Arrastra para reordenar';

  @override
  String get pdfHomeTitle => 'Herramientas PDF';

  @override
  String get pdfHomeSection => 'Herramientas PDF';

  @override
  String get pdfHomeSubtitle => 'Crea, combina y optimiza tus documentos';

  @override
  String get pdfPasswordEnter => 'Introduce una contraseña.';

  @override
  String pdfPasswordTooShort(int count) {
    return 'Usa al menos $count caracteres.';
  }

  @override
  String get pdfPasswordMismatch => 'Las contraseñas no coinciden.';

  @override
  String get pdfPasswordWrong => 'La contraseña no es correcta.';

  @override
  String get pdfPasswordLockFailed => 'No se pudo bloquear este PDF.';

  @override
  String get pdfPasswordUnlockFailed => 'No se pudo desbloquear este PDF.';

  @override
  String get pdfPasswordLockedDone => 'Tu PDF está bloqueado';

  @override
  String get pdfPasswordRemovedDone => 'Contraseña eliminada';

  @override
  String get pdfPasswordAlreadyLocked =>
      'Este PDF ya tiene contraseña. Desbloquéalo primero.';

  @override
  String get pdfPasswordNotLocked =>
      'Este PDF no tiene contraseña: no hay nada que desbloquear.';

  @override
  String get pdfPasswordNew => 'Nueva contraseña';

  @override
  String get pdfPasswordCurrent => 'Contraseña actual';

  @override
  String get pdfPasswordRepeat => 'Repite la contraseña';

  @override
  String get pdfPasswordShow => 'Mostrar contraseña';

  @override
  String get pdfPasswordHide => 'Ocultar contraseña';

  @override
  String get pdfPasswordWarning =>
      'Guarda bien esta contraseña: no se puede recuperar. Cifrado con AES-256.';

  @override
  String get pdfSplitExtract => 'Extraer páginas';

  @override
  String get pdfSplitRemove => 'Quitar páginas';

  @override
  String get pdfSplitPagesHelp =>
      'Usa comas y rangos. «8-» significa desde la página 8 hasta el final.';

  @override
  String get pdfSplitRemovesAll => 'Eso quitaría todas las páginas.';

  @override
  String get pdfSplitFailed => 'No se pudo dividir este PDF.';

  @override
  String get pdfToImagesFailed => 'No se pudo procesar este PDF.';

  @override
  String pdfToImagesSaved(int saved, int total) {
    return 'Se guardaron $saved de $total imágenes en la galería';
  }

  @override
  String get pdfToImagesAllPages => 'Todas las páginas';

  @override
  String get pdfToImagesConvert => 'Convertir a JPG';

  @override
  String pdfToImagesRendered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas procesadas…',
      one: '1 página procesada…',
    );
    return '$_temp0';
  }

  @override
  String pdfToImagesRenderedOf(int count, int total) {
    return '$count de $total páginas procesadas…';
  }

  @override
  String pdfToImagesSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Guardar $count imágenes en la galería',
      one: 'Guardar 1 imagen en la galería',
    );
    return '$_temp0';
  }

  @override
  String get pdfCompressButton => 'Comprimir';

  @override
  String get pdfCompressWorking => 'Comprimiendo PDF…';

  @override
  String pdfCompressOriginalSize(String size) {
    return 'Tamaño original: $size';
  }

  @override
  String get pdfCompressIntro =>
      'Elige un archivo PDF. La compresión funciona mejor con documentos con muchas imágenes.';

  @override
  String get pdfCompressLow => 'Baja';

  @override
  String get pdfCompressMedium => 'Media';

  @override
  String get pdfCompressHigh => 'Alta';

  @override
  String get pdfCompressFailed => 'No se pudo comprimir este PDF.';

  @override
  String pdfCompressBefore(String size) {
    return 'Antes: $size';
  }

  @override
  String pdfCompressAfter(String size) {
    return 'Después: $size';
  }

  @override
  String get pdfMergeButton => 'Unir';

  @override
  String get pdfMergeWorking => 'Uniendo PDF…';

  @override
  String get pdfMergePick => 'Elegir archivos PDF';

  @override
  String get pdfMergeIntro => 'Selecciona al menos dos archivos PDF para unir.';

  @override
  String get pdfMergeFailed =>
      'No se pudieron unir los PDF. Puede que uno de los archivos no se pueda leer.';

  @override
  String pdfMergeResult(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF unido ($count páginas)',
      one: 'PDF unido (1 página)',
    );
    return '$_temp0';
  }

  @override
  String get imageToPdfCreate => 'Crear PDF';

  @override
  String get imageToPdfWorking => 'Creando PDF…';

  @override
  String get imageToPdfPick => 'Elegir imágenes';

  @override
  String get imageToPdfIntro =>
      'Selecciona una o varias imágenes para convertir.';

  @override
  String get imageToPdfFailed =>
      'No se pudo crear el PDF. Prueba con otras imágenes.';

  @override
  String imageToPdfReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF listo ($count páginas)',
      one: 'PDF listo (1 página)',
    );
    return '$_temp0';
  }

  @override
  String get qrScanNoCodeInPhoto =>
      'No se encontró ningún código QR ni de barras en esta foto.';

  @override
  String get qrScanPhotoFailed => 'No se pudo leer esta foto.';

  @override
  String qrScanResultTitle(String type) {
    return 'Escaneado ($type)';
  }

  @override
  String get qrScanFromPhoto => 'Escanear desde una foto';

  @override
  String get qrScanCameraNeeded =>
      'Se necesita acceso a la cámara para escanear códigos QR y de barras.';

  @override
  String get qrScanCameraError =>
      'No se pudo iniciar la cámara. Cierra otras apps de cámara e inténtalo de nuevo.';

  @override
  String get qrScanTorchOn => 'Encender la linterna';

  @override
  String get qrScanTorchOff => 'Apagar la linterna';

  @override
  String get qrScanTypeLink => 'Enlace';

  @override
  String get qrScanTypeWifi => 'Wi‑Fi';

  @override
  String get qrScanTypeContact => 'Contacto';

  @override
  String get qrScanTypeText => 'Texto';

  @override
  String get qrGenInputLabel => 'Texto o URL';

  @override
  String get qrGenInputHint => 'Escribe el contenido a codificar';

  @override
  String get qrGenPreviewLabel => 'Vista previa del código QR';

  @override
  String get qrGenEmpty => 'Escribe un texto arriba para ver tu código QR.';

  @override
  String get qrGenSaveGallery => 'Guardar en galería';

  @override
  String get qrHomeTitle => 'QR y código de barras';

  @override
  String get qrHomeTabScan => 'Escanear';

  @override
  String get qrHomeTabCreate => 'Crear';

  @override
  String get qrHomeScanTitle => 'Escanea un código';

  @override
  String get qrHomeScanBody =>
      'Apunta la cámara a un código QR o de barras para escanearlo al instante.';

  @override
  String get qrHomeBadgeInstant => 'Al instante';

  @override
  String get qrHomeBadgeHistory => 'Historial guardado';

  @override
  String get qrHomeStartScan => 'Empezar a escanear';

  @override
  String get qrHomeCreateTitle => 'Crea un código';

  @override
  String get qrHomeCreateBody =>
      'Crea un código QR a partir de texto o una URL y guárdalo o compártelo.';

  @override
  String get qrHomeBadgeShare => 'Comparte donde quieras';

  @override
  String get qrHomeBadgeImage => 'Guardar como imagen';

  @override
  String get qrHomeOpenGenerator => 'Abrir generador';

  @override
  String get qrHistoryTitle => 'Historial de escaneos';

  @override
  String get qrHistoryMore => 'Más opciones';

  @override
  String get qrHistoryEmpty => 'Los códigos escaneados aparecerán aquí.';

  @override
  String get wifiQrPlaceholder =>
      'Introduce los datos del Wi‑Fi\npara generar el QR';

  @override
  String get wifiQrPreviewLabel => 'Código QR de Wi‑Fi';

  @override
  String get wifiQrNetworkDetails => 'Datos de la red';

  @override
  String get wifiQrSsidLabel => 'Nombre de la red (SSID)';

  @override
  String get wifiQrSsidHint => 'Wi‑Fi de casa';

  @override
  String get wifiQrPasswordLabel => 'Contraseña';

  @override
  String get wifiQrPasswordHint => 'Escribe la contraseña';

  @override
  String get wifiQrShowPassword => 'Mostrar contraseña';

  @override
  String get wifiQrHidePassword => 'Ocultar contraseña';

  @override
  String get wifiQrSecurity => 'Seguridad';

  @override
  String get wifiQrSecurityNone => 'Ninguna (abierta)';

  @override
  String get wifiQrHidden => 'Red oculta';

  @override
  String get wifiQrHiddenHint => 'Actívalo si el nombre de la red no se emite';

  @override
  String get wifiQrSaveImage => 'Guardar imagen';

  @override
  String get wifiQrInfo =>
      'Quien escanee este código QR se conectará automáticamente a tu Wi‑Fi.';

  @override
  String get wifiQrShareText =>
      '¡Escanea este código QR para conectarte a mi Wi‑Fi!';

  @override
  String get ocrCameraDenied =>
      'Permiso de cámara denegado. Abre Ajustes para permitir el acceso.';

  @override
  String get ocrCameraRequired =>
      'Se necesita permiso de cámara para hacer una foto.';

  @override
  String get ocrTimeout =>
      'La lectura tardó demasiado: puede que el modelo de texto aún se esté descargando. Conéctate a una red Wi‑Fi una vez o inténtalo de nuevo.';

  @override
  String get ocrFailed =>
      'No se pudo leer el texto de esta imagen. Prueba con una foto más nítida.';

  @override
  String get ocrPreparing => 'Preparando imagen…';

  @override
  String get ocrScanning => 'Leyendo texto…';

  @override
  String get ocrScriptLabel => 'Sistema de escritura';

  @override
  String get ocrScriptHint =>
      'Elige el alfabeto de tu texto. El árabe, el urdu y el bengalí aún no se pueden leer.';

  @override
  String get ocrScriptLatin => 'Latino (español, inglés…)';

  @override
  String get ocrScriptDevanagari => 'Devanagari (hindi, maratí…)';

  @override
  String get ocrScriptChinese => 'Chino';

  @override
  String get ocrScriptJapanese => 'Japonés';

  @override
  String get ocrScriptKorean => 'Coreano';

  @override
  String get ocrIdleTitle => 'Extrae texto de cualquier imagen';

  @override
  String get ocrIdleBody =>
      'Apunta la cámara o elige una foto: el texto se extrae al instante en tu dispositivo.';

  @override
  String get ocrBadgeOnDevice => 'IA en el dispositivo';

  @override
  String get ocrBadgeLocal => 'Procesado localmente';

  @override
  String get ocrBadgeBlocks => 'Copia por bloques';

  @override
  String get ocrUseCamera => 'Usar cámara';

  @override
  String get ocrChooseGallery => 'Elegir de la galería';

  @override
  String get ocrOnDeviceNote => 'En el dispositivo · sin subir nada';

  @override
  String get ocrTabImage => 'Imagen';

  @override
  String get ocrTabText => 'Texto';

  @override
  String get ocrTapBlockHint => 'Toca un bloque resaltado para copiarlo';

  @override
  String get ocrBlockTitle => 'Texto del bloque';

  @override
  String ocrBlockLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count líneas · toca para copiar',
      one: '1 línea · toca para copiar',
    );
    return '$_temp0';
  }

  @override
  String get ocrCopyBlock => 'Copiar bloque';

  @override
  String get ocrBlockCopied => 'Bloque copiado';

  @override
  String get ocrCopyEntireBlock => 'Copiar el bloque entero';

  @override
  String get ocrCopyLine => 'Copiar línea';

  @override
  String get ocrNoText =>
      'No se detectó texto: prueba con una foto más nítida.';

  @override
  String get ocrQuickCopy => 'Copia rápida por sección';

  @override
  String ocrBlockNCopied(int number) {
    return 'Bloque $number copiado';
  }

  @override
  String get ocrDoneEditing => 'Terminar edición';

  @override
  String get ocrEditText => 'Editar texto';

  @override
  String get ocrAllCopied => 'Todo el texto copiado';

  @override
  String get ocrCopyAll => 'Copiar todo';

  @override
  String get ocrScanAgain => 'Escanear';

  @override
  String ocrStatLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count líneas',
      one: '1 línea',
    );
    return '$_temp0';
  }

  @override
  String ocrStatWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palabras',
      one: '1 palabra',
    );
    return '$_temp0';
  }

  @override
  String ocrStatChars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count caracteres',
      one: '1 carácter',
    );
    return '$_temp0';
  }

  @override
  String get wordPdfNoText =>
      'No se encontró texto extraíble en este documento.';

  @override
  String get wordPdfInfo =>
      'Convierte archivos .docx a PDF. Se conserva el texto; los diseños complejos (tablas, imágenes) pueden variar.';

  @override
  String get wordPdfOpeningPicker => 'Abriendo el selector de archivos…';

  @override
  String wordPdfConverting(int percent) {
    return 'Convirtiendo… $percent %';
  }

  @override
  String get wordPdfDone => 'Conversión completada';

  @override
  String get wordPdfTapToPick => 'Toca para elegir un archivo .docx';

  @override
  String get wordPdfSupports => 'Compatible con el formato .docx';

  @override
  String get wordPdfFailed =>
      'La conversión falló. Puede que el archivo esté dañado o no sea un .docx.';

  @override
  String get wordPdfFontsOffline =>
      'Falta parte del texto (p. ej., árabe, urdu, hindi, bengalí o cirílico) en este PDF. Su fuente se descarga una sola vez: conéctate a internet y vuelve a convertir.';

  @override
  String get wordPdfConvertAnother => 'Convertir otro';

  @override
  String get wordPdfPick => 'Elegir archivo .docx';

  @override
  String get wordPdfStep1Title => 'Elige tu archivo de Word';

  @override
  String get wordPdfStep1Desc =>
      'Selecciona un archivo .docx del almacenamiento del dispositivo.';

  @override
  String get wordPdfStep2Title => 'Conversión automática';

  @override
  String get wordPdfStep2Desc =>
      'El texto se extrae y se maqueta en páginas PDF A4.';

  @override
  String get wordPdfStep3Title => 'Comparte o guarda';

  @override
  String get wordPdfStep3Desc =>
      'Comparte el PDF con cualquier app, correo o almacenamiento en la nube.';

  @override
  String get wordPdfReady => 'PDF listo';
}
