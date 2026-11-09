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
}
