// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Utility Toolbox';

  @override
  String get navTools => 'Tools';

  @override
  String get navFiles => 'Meine Dateien';

  @override
  String get settingsTooltip => 'Einstellungen';

  @override
  String get searchHint => 'Suchen: pdf verkleinern, scannen, jpg…';

  @override
  String get quickActions => 'Schnellzugriff';

  @override
  String get favorites => 'Favoriten';

  @override
  String get recent => 'Zuletzt verwendet';

  @override
  String searchNoResults(String query) {
    return 'Keine Tools für „$query“';
  }

  @override
  String get toolMenuAddFavorite => 'Zu Favoriten hinzufügen';

  @override
  String get toolMenuRemoveFavorite => 'Aus Favoriten entfernen';

  @override
  String get toolMenuPinShortcut => 'Zum Startbildschirm hinzufügen';

  @override
  String get pinShortcutRequested =>
      'Bestätige, um die Verknüpfung zum Startbildschirm hinzuzufügen';

  @override
  String get pinShortcutUnsupported =>
      'Dein Startbildschirm unterstützt keine Verknüpfungen';

  @override
  String get newBadge => 'NEU';

  @override
  String get catScan => 'Scan & QR';

  @override
  String get catPdf => 'PDF';

  @override
  String get catImage => 'Foto & Bild';

  @override
  String get catText => 'Text & Übersetzen';

  @override
  String get catCalc => 'Rechnen & Umrechnen';

  @override
  String get catNetwork => 'Internet';

  @override
  String get catDevice => 'Gerät & Standort';

  @override
  String get catSecurity => 'Sicherheit';

  @override
  String get catMedia => 'Video & Audio';

  @override
  String get toolDocScannerTitle => 'Dokumentenscanner';

  @override
  String get toolDocScannerDesc => 'Papier als PDF, Ränder automatisch';

  @override
  String get toolDocScannerKeywords =>
      'dokument scannen, dokumentenscanner, scanner, scannen, einscannen, beleg, quittung, kassenbon, camscanner, scan paper, document, pdf scanner, receipt';

  @override
  String get toolQrScannerTitle => 'QR & Barcode scannen';

  @override
  String get toolQrScannerDesc => 'Mit der Kamera oder aus einem Foto';

  @override
  String get toolQrScannerKeywords =>
      'qr code scanner, qr code lesen, qr leser, strichcode, code scannen, qr reader, barcode, scan code';

  @override
  String get toolQrGeneratorTitle => 'QR-Code erstellen';

  @override
  String get toolQrGeneratorDesc => 'Links, Text, Kontakte und mehr';

  @override
  String get toolQrGeneratorKeywords =>
      'qr code generator, qr code erstellen, barcode erstellen, qr maker, generate qr, barcode generator';

  @override
  String get toolOcrTitle => 'Bild zu Text';

  @override
  String get toolOcrDesc => 'Text aus jedem Foto kopieren (OCR)';

  @override
  String get toolOcrKeywords =>
      'ocr, texterkennung, text scannen, text aus bild, text kopieren, text scanner, extract text, copy text from image';

  @override
  String get toolWifiQrTitle => 'WLAN-QR-Code';

  @override
  String get toolWifiQrDesc => 'WLAN teilen, ohne Passwort einzutippen';

  @override
  String get toolWifiQrKeywords =>
      'wlan passwort, wlan teilen, wlan qr code, wifi passwort, wifi password, share wifi';

  @override
  String get toolImageToPdfTitle => 'Bild zu PDF';

  @override
  String get toolImageToPdfDesc => 'Fotos in ein PDF umwandeln';

  @override
  String get toolImageToPdfKeywords =>
      'jpg in pdf, foto in pdf, bild in pdf, bilder zu pdf, jpg to pdf, photo to pdf, picture to pdf';

  @override
  String get toolMergePdfTitle => 'PDF zusammenfügen';

  @override
  String get toolMergePdfDesc => 'Mehrere PDFs zu einem verbinden';

  @override
  String get toolMergePdfKeywords =>
      'pdf zusammenfügen, pdf verbinden, pdf kombinieren, join pdf, combine pdf';

  @override
  String get toolCompressPdfTitle => 'PDF komprimieren';

  @override
  String get toolCompressPdfDesc => 'PDF verkleinern zum Versenden';

  @override
  String get toolCompressPdfKeywords =>
      'pdf verkleinern, pdf größe reduzieren, pdf komprimieren, reduce pdf size, shrink pdf';

  @override
  String get toolSplitPdfTitle => 'PDF teilen';

  @override
  String get toolSplitPdfDesc => 'Seiten extrahieren oder löschen';

  @override
  String get toolSplitPdfKeywords =>
      'pdf aufteilen, pdf trennen, seiten extrahieren, seiten löschen, extract pages, delete pages, cut pdf';

  @override
  String get toolPdfToImagesTitle => 'PDF zu JPG';

  @override
  String get toolPdfToImagesDesc => 'Jede Seite als Bild speichern';

  @override
  String get toolPdfToImagesKeywords =>
      'pdf in bild, pdf in jpg, pdf in png, pdf to image, pdf to png, pdf pages';

  @override
  String get toolProtectPdfTitle => 'PDF sperren';

  @override
  String get toolProtectPdfDesc => 'PDF mit Passwort schützen';

  @override
  String get toolProtectPdfKeywords =>
      'pdf passwort, pdf verschlüsseln, pdf schützen, password pdf, encrypt pdf, secure pdf';

  @override
  String get toolUnlockPdfTitle => 'PDF entsperren';

  @override
  String get toolUnlockPdfDesc => 'Bekanntes Passwort entfernen';

  @override
  String get toolUnlockPdfKeywords =>
      'pdf passwort entfernen, pdf entschlüsseln, remove pdf password, decrypt pdf';

  @override
  String get toolWordToPdfTitle => 'Word zu PDF';

  @override
  String get toolWordToPdfDesc => '.docx-Dokumente umwandeln';

  @override
  String get toolWordToPdfKeywords =>
      'word in pdf, doc in pdf, docx, doc to pdf, word';

  @override
  String get toolImageCompressorTitle => 'Foto komprimieren';

  @override
  String get toolImageCompressorDesc => 'Kleinere Datei, gleiche Optik';

  @override
  String get toolImageCompressorKeywords =>
      'bild verkleinern, foto komprimieren, bildgröße reduzieren, jpg komprimieren, kb, reduce image size, compress jpg';

  @override
  String get toolImageResizerTitle => 'Größe & Format';

  @override
  String get toolImageResizerDesc => 'Exakte Größe, JPG, PNG oder WEBP';

  @override
  String get toolImageResizerKeywords =>
      'bildgröße ändern, bild skalieren, jpg in png, png in jpg, passbild, webp, resize image, jpg to png, png to jpg, passport size';

  @override
  String get toolImageEnhancerTitle => 'Foto-Editor';

  @override
  String get toolImageEnhancerDesc => 'Filter, Zuschneiden, Helligkeit & mehr';

  @override
  String get toolImageEnhancerKeywords =>
      'foto bearbeiten, bildbearbeitung, filter, zuschneiden, drehen, edit photo, crop, rotate';

  @override
  String get toolAiUpscalerTitle => 'KI-Upscaler';

  @override
  String get toolAiUpscalerDesc => 'Fotos bis zu 4× größer und schärfer';

  @override
  String get toolAiUpscalerKeywords =>
      'bild verbessern, hd, auflösung erhöhen, unscharf, ki, ai, enhance, increase resolution, blurry';

  @override
  String get toolTranslationTitle => 'Übersetzer';

  @override
  String get toolTranslationDesc => 'Offline, mit Spracheingabe & Vorlesen';

  @override
  String get toolTranslationKeywords =>
      'übersetzer, übersetzen, sprache, wörterbuch, translator, language, dictionary';

  @override
  String get toolTextUtilitiesTitle => 'Text-Tools';

  @override
  String get toolTextUtilitiesDesc => 'Wörter zählen, Groß/klein, Base64';

  @override
  String get toolTextUtilitiesKeywords =>
      'wörter zählen, wortzähler, großbuchstaben, kleinbuchstaben, base64, word counter, uppercase, lowercase';

  @override
  String get toolSmartClipboardTitle => 'Zwischenablage';

  @override
  String get toolSmartClipboardDesc => 'Kopiertes speichern, anheften, suchen';

  @override
  String get toolSmartClipboardKeywords =>
      'kopieren einfügen, notizen, verlauf zwischenablage, copy paste, notes, clipboard history';

  @override
  String get toolCalculatorTitle => 'Taschenrechner';

  @override
  String get toolCalculatorDesc => 'Rechner für jeden Tag, mit Verlauf';

  @override
  String get toolCalculatorKeywords =>
      'rechner, mathe, prozent, prozentrechner, calc, math, percent';

  @override
  String get toolAgeCalculatorTitle => 'Alter & Datum';

  @override
  String get toolAgeCalculatorDesc => 'Genaues Alter, Tage zwischen Daten';

  @override
  String get toolAgeCalculatorKeywords =>
      'geburtstag, alter berechnen, datumsdifferenz, tagerechner, tage zählen, birthday, date difference, days counter';

  @override
  String get toolUnitConverterTitle => 'Einheitenrechner';

  @override
  String get toolUnitConverterDesc => 'Länge, Gewicht, Temperatur und mehr';

  @override
  String get toolUnitConverterKeywords =>
      'einheiten umrechnen, umrechner, cm in zoll, kg in pfund, celsius, convert units, cm to inch, kg to lb';

  @override
  String get toolLoanCalculatorTitle => 'Kredit & Rate';

  @override
  String get toolLoanCalculatorDesc => 'Monatsrate und Zinsen gesamt';

  @override
  String get toolLoanCalculatorKeywords =>
      'kreditrechner, ratenrechner, zinsen, baufinanzierung, emi, mortgage, interest, installment';

  @override
  String get toolTimezoneTitle => 'Weltuhr';

  @override
  String get toolTimezoneDesc => 'Uhrzeit jeder Stadt, mit Widget';

  @override
  String get toolTimezoneKeywords =>
      'zeitzone, uhr, uhrzeit stadt, weltzeit, time zone, clock, city time';

  @override
  String get toolColorPickerTitle => 'Farbwähler';

  @override
  String get toolColorPickerDesc => 'HEX, RGB, HSL und CMYK';

  @override
  String get toolColorPickerKeywords =>
      'farbcode, farbpipette, hex, rgb, palette, color code';

  @override
  String get toolSpeedTestTitle => 'Internet-Speedtest';

  @override
  String get toolSpeedTestDesc => 'Download, Upload und Ping';

  @override
  String get toolSpeedTestKeywords =>
      'speedtest, internetgeschwindigkeit, wlan geschwindigkeit, mbit, mbps, wifi speed, internet speed';

  @override
  String get toolIpPingTitle => 'IP & Ping';

  @override
  String get toolIpPingDesc => 'Deine IP-Adresse und Host-Erreichbarkeit';

  @override
  String get toolIpPingKeywords =>
      'meine ip, ip adresse, ping, netzwerk, my ip, network';

  @override
  String get toolCompassTitle => 'Kompass';

  @override
  String get toolCompassDesc => 'Richtung und Kurs';

  @override
  String get toolCompassKeywords =>
      'richtung, norden, himmelsrichtung, qibla, direction, north';

  @override
  String get toolLocationSaverTitle => 'Standort speichern';

  @override
  String get toolLocationSaverDesc => 'GPS-Orte merken und teilen';

  @override
  String get toolLocationSaverKeywords =>
      'parkplatz, auto finden, gps, karte, koordinaten, standort, parking, map, coordinates';

  @override
  String get toolPasswordGeneratorTitle => 'Passwort-Generator';

  @override
  String get toolPasswordGeneratorDesc => 'Starke Zufallspasswörter';

  @override
  String get toolPasswordGeneratorKeywords =>
      'sicheres passwort, passwort erstellen, zufall, secure password, random';

  @override
  String get toolHashGeneratorTitle => 'Hash-Generator';

  @override
  String get toolHashGeneratorDesc => 'MD5, SHA-1, SHA-256 für Text/Dateien';

  @override
  String get toolHashGeneratorKeywords =>
      'prüfsumme, hash, checksum, md5, sha256';

  @override
  String get toolVideoConverterTitle => 'Video-Konverter';

  @override
  String get toolVideoConverterDesc => 'Video zu MP3, GIF, MP4 und mehr';

  @override
  String get toolVideoConverterKeywords =>
      'video in mp3, gif erstellen, audio extrahieren, video umwandeln, video to mp3, gif maker, audio extract';

  @override
  String get filesEmptyTitle => 'Noch keine Dateien';

  @override
  String get filesEmptyBody =>
      'PDFs, Bilder und andere Dateien, die du erstellst, erscheinen hier, damit du sie wieder öffnen oder teilen kannst.';

  @override
  String get fileOpen => 'Öffnen';

  @override
  String get fileShare => 'Teilen';

  @override
  String get fileRemoveFromList => 'Aus Liste entfernen';

  @override
  String get fileOpenFailed =>
      'Datei konnte nicht geöffnet werden. Vielleicht wurde sie verschoben oder gelöscht.';

  @override
  String get filesClearList => 'Liste leeren';

  @override
  String get filesClearConfirm =>
      'Liste leeren? Deine Dateien bleiben auf dem Gerät.';

  @override
  String get incomingSheetTitle => 'Was möchtest du tun?';

  @override
  String incomingImages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bilder',
      one: '1 Bild',
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
  String get incomingText => 'Geteilter Text';

  @override
  String get incomingDocument => 'Word-Dokument';

  @override
  String get incomingVideo => 'Video';

  @override
  String get incomingUnsupported =>
      'Dieser Dateityp wird noch nicht unterstützt';

  @override
  String get incomingFailed => 'Geteilte Datei konnte nicht gelesen werden';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsAppearance => 'Darstellung';

  @override
  String get settingsTheme => 'Design';

  @override
  String get themeSystem => 'Auto';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get languageSystem => 'Systemsprache';

  @override
  String get settingsPurchases => 'Käufe';

  @override
  String get removeAdsTitle => 'Werbung entfernen';

  @override
  String get removeAdsSubtitle => 'Einmalkauf, kein Abo';

  @override
  String get restorePurchasesTitle => 'Käufe wiederherstellen';

  @override
  String get restorePurchasesSubtitle =>
      'Einen Kauf auf diesem Gerät zurückholen';

  @override
  String get settingsSupport => 'Hilfe & Datenschutz';

  @override
  String get shareAppTitle => 'App teilen';

  @override
  String get shareAppSubtitle => 'Erzähl Freunden von Utility Toolbox';

  @override
  String shareAppMessage(String url) {
    return 'Ich nutze Utility Toolbox, um Dokumente zu scannen, PDFs zu bearbeiten, QR-Codes zu lesen und offline zu übersetzen. Kostenlos: $url';
  }

  @override
  String get rateAppTitle => 'App bewerten';

  @override
  String get rateAppSubtitle => 'Eine kurze Bewertung hilft sehr';

  @override
  String get privacyPolicyTitle => 'Datenschutzerklärung';

  @override
  String get privacyPolicySubtitle => 'Worauf die App zugreift und warum';

  @override
  String get privacyChoicesTitle => 'Datenschutz bei Werbung';

  @override
  String get privacyChoicesSubtitle =>
      'Einwilligung für personalisierte Werbung ändern';

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get onboardingSkip => 'Überspringen';

  @override
  String get onboardingNext => 'Weiter';

  @override
  String get onboardingStart => 'Los geht’s';

  @override
  String get onboarding1Title => 'Alle Tools,\neine App';

  @override
  String get onboarding1Body =>
      'Dokumente scannen, PDFs bearbeiten, QR-Codes lesen, übersetzen und Fotos verkleinern – ohne zehn Apps zu installieren.';

  @override
  String get onboarding2Title => 'Klappt aus\njeder App';

  @override
  String get onboarding2Body =>
      'Teile ein Foto oder PDF mit Utility Toolbox, markiere Text zum Übersetzen oder halte das App-Symbol gedrückt für Verknüpfungen.';

  @override
  String get onboarding3Title => 'Schnell, offline\nund privat';

  @override
  String get onboarding3Body =>
      'Fast alles läuft auf deinem Handy. Deine Dateien werden nie hochgeladen, außer du schaltest selbst eine Cloud-Option ein.';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonClear => 'Löschen';
}
