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

  @override
  String get toolBgRemoverTitle => 'Hintergrund entfernen';

  @override
  String get toolBgRemoverDesc =>
      'Personen und Objekte mit einem Tipp freistellen';

  @override
  String get toolBgRemoverKeywords =>
      'Hintergrund entfernen, freistellen, Ausschneiden, transparent, Sticker, Passbild, weißer Hintergrund, remove background, remove bg, cutout, png';

  @override
  String get toolBmiTitle => 'BMI-Rechner';

  @override
  String get toolBmiDesc => 'Body-Mass-Index und gesundes Gewicht';

  @override
  String get toolBmiKeywords =>
      'BMI, Body-Mass-Index, Gewicht, Größe, Idealgewicht, Übergewicht, Gesundheit, Fitness, bmi, body mass index, weight, height, ideal weight, obesity';

  @override
  String get toolBubbleLevelTitle => 'Wasserwaage';

  @override
  String get toolBubbleLevelDesc =>
      'Prüfen, ob Regale und Bilder gerade hängen';

  @override
  String get toolBubbleLevelKeywords =>
      'Wasserwaage, Libelle, Neigung, Winkel, gerade, waagerecht, level, spirit level, bubble level, angle, tilt';

  @override
  String get toolCurrencyTitle => 'Währungsrechner';

  @override
  String get toolCurrencyDesc => 'Aktuelle Kurse für über 150 Währungen';

  @override
  String get toolCurrencyKeywords =>
      'Währung, Wechselkurs, Geld, umrechnen, Dollar, Euro, Devisen, Franken, Lira, currency, exchange rate, money, convert, forex';

  @override
  String get toolDirectChatTitle => 'Direktchat';

  @override
  String get toolDirectChatDesc =>
      'Per WhatsApp schreiben, ohne Nummer zu speichern';

  @override
  String get toolDirectChatKeywords =>
      'WhatsApp, Direktchat, Nachricht, Nummer nicht speichern, Chat ohne Kontakt, whatsapp, direct chat, message, unsaved number, click to chat, wa.me, send message, chat';

  @override
  String get toolFlashlightTitle => 'Taschenlampe';

  @override
  String get toolFlashlightDesc => 'Helle Lampe mit SOS und Stroboskop';

  @override
  String get toolFlashlightKeywords =>
      'Taschenlampe, Licht, Lampe, Blitz, Leuchte, Stroboskop, flashlight, torch, light, led, sos, strobe, flash';

  @override
  String get toolOrganizePdfTitle => 'PDF organisieren';

  @override
  String get toolOrganizePdfDesc => 'Seiten neu anordnen, drehen oder löschen';

  @override
  String get toolOrganizePdfKeywords =>
      'organisieren, sortieren, neu anordnen, drehen, seiten löschen, seiten entfernen, organize, organise, reorder, rotate, delete pages, remove pages, arrange, sort, pdf';

  @override
  String get toolPdfToTextTitle => 'PDF zu Text';

  @override
  String get toolPdfToTextDesc => 'Den gesamten Text aus einer PDF kopieren';

  @override
  String get toolPdfToTextKeywords =>
      'text extrahieren, text kopieren, pdf in text, umwandeln, pdf lesen, pdf to text, extract text, copy text, txt, read pdf, convert, pdf to word';

  @override
  String get toolPercentageTitle => 'Prozent & Rabatt';

  @override
  String get toolPercentageDesc =>
      'Prozent, Rabatt, Trinkgeld und Steuer im Nu';

  @override
  String get toolPercentageKeywords =>
      'Prozent, Prozentrechner, Rabatt, Preisnachlass, Trinkgeld, Rechnung teilen, Mehrwertsteuer, MwSt, Steuer, percentage, percent, discount, tip, split bill, tax, vat';

  @override
  String get toolSignPdfTitle => 'PDF unterschreiben';

  @override
  String get toolSignPdfDesc =>
      'Unterschrift zeichnen und auf jeder Seite platzieren';

  @override
  String get toolSignPdfKeywords =>
      'unterschreiben, unterschrift, signatur, e-signatur, ausfüllen und unterschreiben, sign, signature, e-sign, esign, fill and sign, autograph, pdf';

  @override
  String get toolStopwatchTitle => 'Stoppuhr & Timer';

  @override
  String get toolStopwatchDesc => 'Stoppuhr mit Runden und Countdown-Timer';

  @override
  String get toolStopwatchKeywords =>
      'Stoppuhr, Timer, Countdown, Runde, Wecker, Uhr, Küchentimer, Training, Kurzzeitmesser, stopwatch, timer, lap, alarm';

  @override
  String get toolWatermarkPdfTitle => 'Wasserzeichen & Seitenzahlen';

  @override
  String get toolWatermarkPdfDesc =>
      'Text oder Seitenzahlen auf jede Seite stempeln';

  @override
  String get toolWatermarkPdfKeywords =>
      'wasserzeichen, stempel, seitenzahlen, nummerieren, vertraulich, entwurf, fußzeile, kopfzeile, watermark, stamp, page numbers, number pages, confidential, draft, footer, header, pdf';

  @override
  String get bmiMetric => 'Metrisch (cm, kg)';

  @override
  String get bmiImperial => 'Imperial (ft, lb)';

  @override
  String get bmiHeight => 'Größe';

  @override
  String get bmiWeight => 'Gewicht';

  @override
  String get bmiFeet => 'Fuß';

  @override
  String get bmiInches => 'Zoll';

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
  String get bmiAge => 'Alter (optional)';

  @override
  String get bmiSex => 'Geschlecht (optional)';

  @override
  String get bmiMale => 'Männlich';

  @override
  String get bmiFemale => 'Weiblich';

  @override
  String get bmiYourBmi => 'Dein BMI';

  @override
  String get bmiUnderweight => 'Untergewicht';

  @override
  String get bmiNormal => 'Normalgewicht';

  @override
  String get bmiOverweight => 'Übergewicht';

  @override
  String get bmiObese => 'Adipositas';

  @override
  String bmiHealthyRange(String min, String max) {
    return 'Gesundes Gewicht für deine Größe: $min – $max';
  }

  @override
  String bmiToLose(String amount) {
    return 'Etwa $amount über dem gesunden Bereich';
  }

  @override
  String bmiToGain(String amount) {
    return 'Etwa $amount unter dem gesunden Bereich';
  }

  @override
  String bmiIdealWeight(String weight) {
    return 'Geschätztes Idealgewicht: $weight';
  }

  @override
  String get bmiChildNote =>
      'Bei Kindern und Jugendlichen unter 18 wird der BMI mit altersabhängigen Wachstumskurven bewertet. Diese Werte nutzen die Bereiche für Erwachsene.';

  @override
  String get bmiDisclaimer =>
      'Der BMI ist ein grober Richtwert, keine medizinische Diagnose.';

  @override
  String get bmiEnterValues => 'Gib deine Größe und dein Gewicht ein';

  @override
  String get currencyAmount => 'Betrag';

  @override
  String get currencyFrom => 'Von';

  @override
  String get currencyTo => 'Nach';

  @override
  String get currencySwap => 'Währungen tauschen';

  @override
  String get currencyChoose => 'Währung wählen';

  @override
  String get currencySearchHint => 'Währung oder Code suchen';

  @override
  String get currencyAll => 'Alle Währungen';

  @override
  String currencyRatesFrom(String date) {
    return 'Kurse vom $date';
  }

  @override
  String get currencyRefresh => 'Kurse aktualisieren';

  @override
  String get currencyUpdating => 'Kurse werden aktualisiert…';

  @override
  String get currencyOfflineCached =>
      'Aktualisierung fehlgeschlagen. Gespeicherte Kurse werden angezeigt.';

  @override
  String get currencyNoRatesTitle => 'Noch keine Kurse geladen';

  @override
  String get currencyNoRatesBody =>
      'Verbinde dich einmal mit dem Internet, um Wechselkurse zu laden. Danach funktioniert der Rechner auch offline.';

  @override
  String get currencyRetry => 'Erneut versuchen';

  @override
  String get currencyOtherFavorites => 'Deine Lieblingswährungen';

  @override
  String get currencyFavoritesHint =>
      'Tippe in der Liste auf ☆ neben einer Währung, um sie hier hinzuzufügen.';

  @override
  String get currencyCopy => 'Ergebnis kopieren';

  @override
  String get currencyCopied => 'Kopiert';

  @override
  String get currencyNoMatch => 'Keine Währung gefunden';

  @override
  String get currencyDisclaimer =>
      'Die Kurse dienen nur zur Orientierung und können vom Kurs deiner Bank abweichen.';

  @override
  String get directChatPhone => 'Telefonnummer';

  @override
  String get directChatCountryCode => 'Ländervorwahl';

  @override
  String get directChatSearchCountry => 'Land oder Vorwahl suchen';

  @override
  String get directChatNoCountry => 'Kein Land gefunden';

  @override
  String get directChatMessage => 'Nachricht (optional)';

  @override
  String get directChatOpen => 'In WhatsApp öffnen';

  @override
  String get directChatPaste => 'Nummer einfügen';

  @override
  String get directChatPasteNone => 'Keine Telefonnummer in der Zwischenablage';

  @override
  String get directChatTooShort => 'Die Nummer scheint zu kurz';

  @override
  String get directChatTooLong => 'Die Nummer scheint zu lang';

  @override
  String directChatWillOpen(String number) {
    return 'Chat mit $number';
  }

  @override
  String get directChatOpenFailed =>
      'Chat konnte nicht geöffnet werden. Ist WhatsApp installiert?';

  @override
  String get directChatHint =>
      'Schreib jeder Nummer, ohne sie in deinen Kontakten zu speichern.';

  @override
  String get directChatNotAffiliated =>
      'Unabhängiges Tool. Nicht mit WhatsApp oder Meta verbunden.';

  @override
  String get percentageTabPercent => 'Prozent';

  @override
  String get percentageTabDiscount => 'Rabatt';

  @override
  String get percentageTabTip => 'Trinkgeld';

  @override
  String get percentageTabTax => 'Steuer / MwSt.';

  @override
  String get percentageOfTitle => 'Prozent einer Zahl';

  @override
  String get percentageFieldPercent => 'Prozentsatz';

  @override
  String get percentageFieldNumber => 'Zahl';

  @override
  String percentageOfResult(String percent, String number) {
    return '$percent von $number';
  }

  @override
  String get percentageWhatTitle => 'Wie viel Prozent?';

  @override
  String get percentageFieldPart => 'Wert';

  @override
  String get percentageFieldTotal => 'Gesamtwert';

  @override
  String percentageWhatResult(String part, String total) {
    return '$part von $total';
  }

  @override
  String get percentageChangeTitle => 'Prozentuale Änderung';

  @override
  String get percentageFieldOld => 'Alter Wert';

  @override
  String get percentageFieldNew => 'Neuer Wert';

  @override
  String percentageIncrease(String percent) {
    return 'Anstieg um $percent';
  }

  @override
  String percentageDecrease(String percent) {
    return 'Rückgang um $percent';
  }

  @override
  String get percentageNoChange => 'Keine Änderung';

  @override
  String get percentageDifference => 'Differenz';

  @override
  String get percentagePrice => 'Originalpreis';

  @override
  String get percentageDiscount => 'Rabatt';

  @override
  String get percentageExtraDiscount => 'Zusatzrabatt (optional)';

  @override
  String get percentageYouPay => 'Du zahlst';

  @override
  String get percentageYouSave => 'Du sparst';

  @override
  String get percentageTotalDiscount => 'Rabatt gesamt';

  @override
  String get percentageBill => 'Rechnungsbetrag';

  @override
  String get percentageTip => 'Trinkgeld';

  @override
  String get percentageCustom => 'Eigener Wert';

  @override
  String get percentagePeople => 'Personen';

  @override
  String get percentageAddPerson => 'Person hinzufügen';

  @override
  String get percentageRemovePerson => 'Person entfernen';

  @override
  String get percentageTipAmount => 'Trinkgeldbetrag';

  @override
  String get percentageTotal => 'Gesamt';

  @override
  String get percentagePerPerson => 'Pro Person';

  @override
  String get percentageTaxRate => 'Steuersatz';

  @override
  String get percentageAddTax => 'Steuer aufschlagen';

  @override
  String get percentageRemoveTax => 'Steuer herausrechnen';

  @override
  String get percentagePriceExclTax => 'Nettopreis';

  @override
  String get percentagePriceInclTax => 'Bruttopreis';

  @override
  String get percentageBeforeTax => 'Netto';

  @override
  String get percentageTaxAmount => 'Steuer';

  @override
  String get percentageAfterTax => 'Brutto gesamt';

  @override
  String get percentageEnterValues =>
      'Gib Zahlen ein, um das Ergebnis zu sehen';

  @override
  String get commonSave => 'Speichern';

  @override
  String get commonShare => 'Teilen';

  @override
  String get commonCopy => 'Kopieren';

  @override
  String get commonCopied => 'Kopiert';

  @override
  String get commonRetry => 'Erneut versuchen';

  @override
  String get commonDone => 'Fertig';

  @override
  String get commonDelete => 'Löschen';

  @override
  String get commonUndo => 'Rückgängig';

  @override
  String get commonOpen => 'Öffnen';

  @override
  String get commonReset => 'Zurücksetzen';

  @override
  String get commonClose => 'Schließen';

  @override
  String get commonOpenSettings => 'Einstellungen öffnen';

  @override
  String get commonChoosePhoto => 'Foto auswählen';

  @override
  String get commonChooseFile => 'Datei auswählen';

  @override
  String get commonCamera => 'Kamera';

  @override
  String get commonGallery => 'Galerie';

  @override
  String get commonWorking => 'Wird bearbeitet…';

  @override
  String get commonSavedToGallery => 'In der Galerie gespeichert';

  @override
  String get commonSavedToDownloads => 'In Downloads gespeichert';

  @override
  String get commonSaveFailed => 'Datei konnte nicht gespeichert werden';

  @override
  String get commonErrorGeneric =>
      'Etwas ist schiefgelaufen. Bitte versuche es erneut.';

  @override
  String get commonErrorOffline => 'Keine Internetverbindung';

  @override
  String get commonErrorTimeout =>
      'Zeitüberschreitung. Bitte versuche es erneut.';

  @override
  String get commonPermissionNeeded =>
      'Berechtigung erforderlich. Erlaube sie in den Einstellungen.';

  @override
  String get commonResult => 'Ergebnis';

  @override
  String get commonStart => 'Start';

  @override
  String get commonStop => 'Stopp';

  @override
  String get commonClearAll => 'Alles löschen';

  @override
  String get commonPaste => 'Einfügen';

  @override
  String get commonSearch => 'Suchen';

  @override
  String get organizePdfHint =>
      'Tippe auf Seiten, um sie auszuwählen. Halte eine Seite gedrückt und ziehe sie, um sie zu verschieben.';

  @override
  String organizePdfSelected(int count) {
    return '$count ausgewählt';
  }

  @override
  String get organizePdfRotateLeft => 'Nach links drehen';

  @override
  String get organizePdfRotateRight => 'Nach rechts drehen';

  @override
  String get organizePdfDelete => 'Löschen';

  @override
  String get organizePdfSelectAll => 'Alle auswählen';

  @override
  String get organizePdfClearSelection => 'Auswahl aufheben';

  @override
  String organizePdfDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten gelöscht',
      one: '1 Seite gelöscht',
    );
    return '$_temp0';
  }

  @override
  String get organizePdfUndo => 'Rückgängig';

  @override
  String get organizePdfKeepOne => 'Eine PDF braucht mindestens eine Seite.';

  @override
  String get organizePdfNoChanges =>
      'Noch keine Änderungen – verschiebe, drehe oder lösche zuerst Seiten.';

  @override
  String get organizePdfReset => 'Alle Änderungen zurücksetzen';

  @override
  String get organizePdfMoveEarlier => 'Nach vorne verschieben';

  @override
  String get organizePdfMoveLater => 'Nach hinten verschieben';

  @override
  String get organizePdfSave => 'PDF speichern';

  @override
  String get organizePdfFailed => 'Diese PDF konnte nicht gespeichert werden.';

  @override
  String get organizePdfResult => 'Deine neu geordnete PDF ist fertig';

  @override
  String pdfToTextReading(int current, int total) {
    return 'Seite $current von $total wird gelesen…';
  }

  @override
  String pdfToTextWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Wörter',
      one: '1 Wort',
    );
    return '$_temp0';
  }

  @override
  String get pdfToTextCopyAll => 'Alles kopieren';

  @override
  String get pdfToTextCopied => 'Text kopiert';

  @override
  String get pdfToTextSaveTxt => 'Als .txt speichern';

  @override
  String get pdfToTextEmptyPage => 'Kein Text auf dieser Seite';

  @override
  String get pdfToTextScannedTitle => 'Kein Text gefunden';

  @override
  String get pdfToTextScannedBody =>
      'Diese PDF besteht offenbar aus Scans oder Fotos, daher gibt es keinen Text zum Kopieren. Wir können stattdessen die Wörter auf Seite 1 aus dem Bild lesen.';

  @override
  String pdfToTextOpenOcr(String tool) {
    return 'Seite 1 mit „$tool“ lesen';
  }

  @override
  String get pdfToTextFailed =>
      'Der Text dieser PDF konnte nicht gelesen werden.';

  @override
  String pdfToTextPartlyScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten enthalten keinen Text (vielleicht gescannt).',
      one: '1 Seite enthält keinen Text (vielleicht gescannt).',
    );
    return '$_temp0';
  }

  @override
  String get pdfEditChoosePdf => 'PDF auswählen';

  @override
  String get pdfEditChooseHint =>
      'Oder teile eine PDF aus einer beliebigen App mit Utility Toolbox';

  @override
  String get pdfEditChange => 'Ändern';

  @override
  String get pdfEditReading => 'Wird gelesen…';

  @override
  String pdfEditPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten',
      one: '1 Seite',
    );
    return '$_temp0';
  }

  @override
  String pdfEditPageN(int number) {
    return 'Seite $number';
  }

  @override
  String get pdfEditInvalidPdf =>
      'Diese Datei scheint keine gültige PDF zu sein.';

  @override
  String get pdfEditLocked =>
      'Diese PDF ist passwortgeschützt. Entferne zuerst das Passwort und versuche es dann erneut.';

  @override
  String get pdfEditLockedShort => 'Passwortgeschützt';

  @override
  String get pdfEditPreviewFailed =>
      'Diese Seite konnte nicht angezeigt werden.';

  @override
  String get pdfEditResultReady => 'Deine PDF ist fertig';

  @override
  String get pdfEditSaveDownloads => 'In Downloads speichern';

  @override
  String get pdfEditShare => 'Teilen';

  @override
  String get pdfEditStartOver => 'Neu beginnen';

  @override
  String get pdfEditSavedToDownloads =>
      'In Downloads gespeichert – du findest sie unter „Meine Dateien“';

  @override
  String get pdfEditSharedInstead =>
      'Stattdessen wurde das Teilen-Menü geöffnet';

  @override
  String get pdfEditSaveFailed =>
      'Die Datei konnte nicht erstellt werden. Bitte versuche es erneut.';

  @override
  String get signPdfStepPdf => 'PDF auswählen';

  @override
  String get signPdfStepSignature => 'Unterschrift erstellen';

  @override
  String get signPdfStepPlace => 'Tippe auf eine Seite, um zu unterschreiben';

  @override
  String get signPdfDraw => 'Unterschrift zeichnen';

  @override
  String get signPdfDrawAgain => 'Neu zeichnen';

  @override
  String get signPdfUseSaved => 'Gespeicherte Unterschrift verwenden';

  @override
  String get signPdfDeleteSaved => 'Gespeicherte Unterschrift löschen';

  @override
  String get signPdfSavedDeleted => 'Gespeicherte Unterschrift gelöscht';

  @override
  String get signPdfDrawTitle => 'Unterschrift zeichnen';

  @override
  String get signPdfDrawHint => 'Hier mit dem Finger unterschreiben';

  @override
  String get signPdfUndo => 'Rückgängig';

  @override
  String get signPdfInkBlack => 'Schwarz';

  @override
  String get signPdfInkBlue => 'Blau';

  @override
  String get signPdfRemember => 'Unterschrift für das nächste Mal speichern';

  @override
  String get signPdfDone => 'Diese Unterschrift verwenden';

  @override
  String get signPdfEmpty => 'Zeichne zuerst deine Unterschrift.';

  @override
  String get signPdfSignatureLabel => 'Deine Unterschrift';

  @override
  String get signPdfPlaceHint =>
      'Ziehen zum Verschieben, mit zwei Fingern oder dem Regler die Größe ändern. Tippe auf die Seite, um die Unterschrift dorthin zu setzen.';

  @override
  String get signPdfSize => 'Größe';

  @override
  String get signPdfPlaceConfirm => 'Hier platzieren';

  @override
  String get signPdfRemoveFromPage => 'Von dieser Seite entfernen';

  @override
  String get signPdfAllPages => 'Auf allen Seiten einfügen';

  @override
  String signPdfAllPagesDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Unterschrift auf allen $count Seiten eingefügt',
      one: 'Unterschrift auf 1 Seite eingefügt',
    );
    return '$_temp0';
  }

  @override
  String get signPdfClearAll => 'Alle entfernen';

  @override
  String signPdfPlacedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Auf $count Seiten unterschrieben',
      one: 'Auf 1 Seite unterschrieben',
      zero: 'Noch keine Seite unterschrieben',
    );
    return '$_temp0';
  }

  @override
  String get signPdfSave => 'Unterschriebene PDF speichern';

  @override
  String get signPdfNoPlacement =>
      'Tippe zuerst auf eine Seite, um die Unterschrift zu platzieren.';

  @override
  String get signPdfFailed => 'Diese PDF konnte nicht unterschrieben werden.';

  @override
  String get signPdfResult => 'Deine unterschriebene PDF ist fertig';

  @override
  String get watermarkPdfModeText => 'Text-Wasserzeichen';

  @override
  String get watermarkPdfModeNumbers => 'Seitenzahlen';

  @override
  String get watermarkPdfText => 'Wasserzeichen-Text';

  @override
  String get watermarkPdfDefaultText => 'VERTRAULICH';

  @override
  String get watermarkPdfTextEmpty => 'Gib zuerst den Wasserzeichen-Text ein.';

  @override
  String get watermarkPdfSize => 'Textgröße';

  @override
  String get watermarkPdfOpacity => 'Deckkraft';

  @override
  String get watermarkPdfLayout => 'Anordnung';

  @override
  String get watermarkPdfDiagonal => 'Diagonal';

  @override
  String get watermarkPdfCenter => 'Mitte';

  @override
  String get watermarkPdfTiled => 'Gekachelt';

  @override
  String get watermarkPdfColor => 'Farbe';

  @override
  String get watermarkPdfColorGrey => 'Grau';

  @override
  String get watermarkPdfColorRed => 'Rot';

  @override
  String get watermarkPdfColorBlue => 'Blau';

  @override
  String get watermarkPdfColorBlack => 'Schwarz';

  @override
  String get watermarkPdfColorGreen => 'Grün';

  @override
  String get watermarkPdfFormat => 'Format';

  @override
  String watermarkPdfPageLabel(String number) {
    return 'Seite $number';
  }

  @override
  String get watermarkPdfPosition => 'Position';

  @override
  String get watermarkPdfBottomCenter => 'Unten mittig';

  @override
  String get watermarkPdfBottomRight => 'Unten rechts';

  @override
  String get watermarkPdfTopRight => 'Oben rechts';

  @override
  String get watermarkPdfStartAt => 'Beginnen bei';

  @override
  String get watermarkPdfDecrease => 'Verringern';

  @override
  String get watermarkPdfIncrease => 'Erhöhen';

  @override
  String get watermarkPdfPreview => 'Vorschau (Seite 1)';

  @override
  String get watermarkPdfApplyText => 'Wasserzeichen hinzufügen';

  @override
  String get watermarkPdfApplyNumbers => 'Seitenzahlen hinzufügen';

  @override
  String get watermarkPdfFailed => 'Diese PDF konnte nicht bearbeitet werden.';

  @override
  String get bgRemoverPickTitle => 'Foto auswählen';

  @override
  String get bgRemoverPickBody =>
      'Klappt am besten mit Personen, Haustieren und Gegenständen. Dein Foto wird auf dem Handy verarbeitet.';

  @override
  String get bgRemoverGallery => 'Aus Galerie wählen';

  @override
  String get bgRemoverCamera => 'Foto aufnehmen';

  @override
  String get bgRemoverPreparing => 'Foto wird vorbereitet…';

  @override
  String get bgRemoverWorking => 'Hintergrund wird entfernt…';

  @override
  String get bgRemoverDownloading =>
      'Die Hintergrundentfernung wird eingerichtet. Das passiert nur einmal und braucht Internet…';

  @override
  String get bgRemoverDownloadFailed =>
      'Die Hintergrundentfernung ist noch nicht bereit, die Google Play-Dienste laden sie noch herunter. Prüfe deine Internetverbindung und versuche es in einer Minute erneut.';

  @override
  String get bgRemoverNoSubject =>
      'Auf diesem Foto wurde keine Person und kein Objekt erkannt. Versuche ein Foto mit einem klaren Motiv.';

  @override
  String get bgRemoverOpenFailed =>
      'Dieses Foto konnte nicht geöffnet werden. Versuche ein anderes.';

  @override
  String get bgRemoverFailed =>
      'Beim Entfernen des Hintergrunds ist etwas schiefgelaufen. Bitte versuche es erneut.';

  @override
  String get bgRemoverRetry => 'Erneut versuchen';

  @override
  String get bgRemoverAnotherPhoto => 'Anderes Foto wählen';

  @override
  String get bgRemoverNewPhoto => 'Neues Foto';

  @override
  String get bgRemoverBefore => 'Vorher';

  @override
  String get bgRemoverAfter => 'Nachher';

  @override
  String get bgRemoverCompare => 'Vorher und nachher vergleichen';

  @override
  String get bgRemoverCompareHint => 'Zum Vergleichen den Regler ziehen';

  @override
  String get bgRemoverBgTransparent => 'Transparent';

  @override
  String get bgRemoverBgWhite => 'Weiß';

  @override
  String get bgRemoverBgBlack => 'Schwarz';

  @override
  String get bgRemoverBgBlue => 'Blau';

  @override
  String get bgRemoverBgRed => 'Rot';

  @override
  String get bgRemoverBgYellow => 'Gelb';

  @override
  String get bgRemoverBgBlur => 'Unscharf';

  @override
  String get bgRemoverSave => 'In Galerie speichern';

  @override
  String get bgRemoverSaved => 'In deiner Galerie gespeichert';

  @override
  String get bgRemoverSaveFailed =>
      'Das Bild konnte nicht gespeichert werden. Bitte versuche es erneut.';

  @override
  String get bgRemoverPngHint => 'PNG mit transparentem Hintergrund';

  @override
  String get bgRemoverJpgHint => 'JPG mit gewähltem Hintergrund';

  @override
  String get bubbleLevelSurfaceHint => 'Lege das Handy flach auf die Fläche';

  @override
  String get bubbleLevelUprightHint =>
      'Halte die Kante des Handys an die Fläche';

  @override
  String get bubbleLevelLevel => 'Waagerecht';

  @override
  String bubbleLevelAngleLabel(String angle) {
    return 'Neigung $angle Grad';
  }

  @override
  String bubbleLevelAxes(String x, String y) {
    return 'Links–rechts $x° · Vorne–hinten $y°';
  }

  @override
  String get bubbleLevelCalibrate => 'Kalibrieren';

  @override
  String get bubbleLevelReset => 'Zurücksetzen';

  @override
  String get bubbleLevelCalibrateTitle => 'Wasserwaage kalibrieren?';

  @override
  String get bubbleLevelCalibrateBody =>
      'Lege das Handy auf eine Fläche, die sicher waagerecht ist (oder halte es an eine gerade Kante), und tippe auf „Kalibrieren“. Die aktuelle Lage zeigt dann 0°.';

  @override
  String get bubbleLevelCalibrated => 'Kalibriert. Diese Lage zeigt jetzt 0°.';

  @override
  String get bubbleLevelResetDone => 'Kalibrierung gelöscht';

  @override
  String get bubbleLevelUnavailable =>
      'Dieses Handy hat keinen Bewegungssensor, daher funktioniert die Wasserwaage hier nicht.';

  @override
  String get flashlightOn => 'Licht ist an';

  @override
  String get flashlightOff => 'Licht ist aus';

  @override
  String get flashlightTurnOn => 'Licht einschalten';

  @override
  String get flashlightTurnOff => 'Licht ausschalten';

  @override
  String get flashlightModeSteady => 'Dauerlicht';

  @override
  String get flashlightModeSos => 'SOS';

  @override
  String get flashlightModeStrobe => 'Stroboskop';

  @override
  String get flashlightSosHint =>
      'Blinkt immer wieder das Notsignal ··· ––– ···';

  @override
  String flashlightStrobeSpeed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Blitze pro Sekunde',
      one: '1 Blitz pro Sekunde',
    );
    return '$_temp0';
  }

  @override
  String get flashlightUseScreen => 'Bildschirm als Licht';

  @override
  String get flashlightUseScreenHint =>
      'Bildschirm statt Blitz leuchten lassen';

  @override
  String get flashlightNoTorch =>
      'Dieses Handy hat keinen Blitz, deshalb leuchtet stattdessen der Bildschirm.';

  @override
  String get flashlightTorchBusy =>
      'Der Blitz ist belegt (vielleicht nutzt eine andere App die Kamera), deshalb leuchtet der Bildschirm.';

  @override
  String get flashlightScreenColor => 'Farbe des Bildschirmlichts';

  @override
  String get flashlightColorWhite => 'Weiß';

  @override
  String get flashlightColorWarm => 'Warmweiß';

  @override
  String get flashlightColorRed => 'Rot';

  @override
  String get flashlightColorGreen => 'Grün';

  @override
  String get flashlightColorBlue => 'Blau';

  @override
  String get flashlightTapToTurnOff => 'Zum Ausschalten irgendwo tippen';

  @override
  String get stopwatchTabStopwatch => 'Stoppuhr';

  @override
  String get stopwatchTabTimer => 'Timer';

  @override
  String get stopwatchStart => 'Start';

  @override
  String get stopwatchPause => 'Pause';

  @override
  String get stopwatchResume => 'Weiter';

  @override
  String get stopwatchLap => 'Runde';

  @override
  String get stopwatchReset => 'Zurücksetzen';

  @override
  String stopwatchLapNumber(int number) {
    return 'Runde $number';
  }

  @override
  String stopwatchCurrentLap(int number, String time) {
    return 'Runde $number: $time';
  }

  @override
  String get stopwatchBest => 'Schnellste';

  @override
  String get stopwatchWorst => 'Langsamste';

  @override
  String get stopwatchNoLaps =>
      'Tippe während der Messung auf „Runde“, um Rundenzeiten zu speichern.';

  @override
  String get stopwatchTimerQuickStart => 'Schnellstart';

  @override
  String stopwatchTimerMinutes(int minutes) {
    return '$minutes Min.';
  }

  @override
  String get stopwatchTimerCustom => 'Eigene Zeit einstellen';

  @override
  String get stopwatchTimerPickTitle => 'Timer einstellen';

  @override
  String get stopwatchTimerHours => 'Std.';

  @override
  String get stopwatchTimerMinutesUnit => 'Min.';

  @override
  String get stopwatchTimerSeconds => 'Sek.';

  @override
  String get stopwatchTimerAddMinute => '+1 Min.';

  @override
  String get stopwatchTimerPaused => 'Pausiert';

  @override
  String stopwatchTimerRemaining(String time) {
    return 'Noch $time';
  }

  @override
  String get stopwatchTimerTimesUp => 'Zeit ist um!';

  @override
  String stopwatchTimerFinishedBody(String duration) {
    return 'Dein $duration-Timer ist abgelaufen.';
  }

  @override
  String get stopwatchTimerRestart => 'Neu starten';

  @override
  String get stopwatchTimerDone => 'Fertig';

  @override
  String get stopwatchTimerKeepOpen =>
      'Lass diesen Bildschirm geöffnet: Das Handy vibriert, wenn die Zeit um ist.';

  @override
  String get translateHeroTitle => 'Sprechen oder tippen zum Übersetzen';

  @override
  String get translateBadgeOnDevice => 'KI auf dem Gerät';

  @override
  String get translateBadgeOffline => 'Funktioniert offline';

  @override
  String get translateFrom => 'Von';

  @override
  String get translateTo => 'Nach';

  @override
  String get translateSwap => 'Sprachen tauschen';

  @override
  String get translateHint =>
      'Text eingeben oder zum Sprechen aufs Mikrofon tippen…';

  @override
  String get translateHintListening =>
      'Ich höre zu… sprich ganz normal, zum Beenden aufs Mikrofon tippen';

  @override
  String translateListeningIn(String language) {
    return 'Höre auf $language… zum Beenden und Übersetzen aufs Mikrofon tippen.';
  }

  @override
  String get translateSameLanguage =>
      'Ausgangs- und Zielsprache müssen sich unterscheiden.';

  @override
  String get translateButton => 'Übersetzen';

  @override
  String get translateTranslating => 'Wird übersetzt…';

  @override
  String get translateStopAndTranslate => 'Stoppen & übersetzen';

  @override
  String get translateDownloadingModel => 'Sprachmodell wird heruntergeladen…';

  @override
  String get translateResultLabel => 'Übersetzung';

  @override
  String get translatePlayAudio => 'Audio abspielen';

  @override
  String get translateGenerating => 'Wird erstellt…';

  @override
  String get translateShareAudio => 'Audiodatei teilen';

  @override
  String get translateGenerateAudio => 'Audiodatei erstellen';

  @override
  String get translateAudioReady =>
      'Audiodatei bereit – teile sie, um sie zu senden oder zu speichern.';

  @override
  String get translateMicStop => 'Zuhören beenden & übersetzen';

  @override
  String get translateMicStart => 'Sprechen zum Übersetzen';

  @override
  String get translateMicBlocked =>
      'Der Mikrofonzugriff ist blockiert. Aktiviere ihn in den Einstellungen, um die Spracheingabe zu nutzen.';

  @override
  String get translateMicNeeded =>
      'Für die Spracheingabe wird die Mikrofonberechtigung benötigt.';

  @override
  String get translateSpeechUnavailable =>
      'Spracherkennung ist auf diesem Gerät nicht verfügbar.';

  @override
  String get translateNoSpeech =>
      'Nichts verstanden. Bitte sprich noch einmal.';

  @override
  String get translateVoiceFailed =>
      'Die Spracheingabe wurde beendet. Bitte versuche es erneut.';

  @override
  String get translateDownloadFailed =>
      'Die Sprachmodelle konnten nicht heruntergeladen werden. Prüfe deine Internetverbindung.';

  @override
  String get translateFailed =>
      'Übersetzung fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get translateAudioFailed =>
      'Auf diesem Gerät konnte keine Audiodatei erstellt werden.';

  @override
  String translateLanguageName(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'af': 'Afrikaans',
      'sq': 'Albanisch',
      'ar': 'Arabisch',
      'be': 'Belarussisch',
      'bn': 'Bengalisch',
      'bg': 'Bulgarisch',
      'ca': 'Katalanisch',
      'zh': 'Chinesisch (vereinfacht)',
      'hr': 'Kroatisch',
      'cs': 'Tschechisch',
      'da': 'Dänisch',
      'nl': 'Niederländisch',
      'en': 'Englisch',
      'eo': 'Esperanto',
      'et': 'Estnisch',
      'fi': 'Finnisch',
      'fr': 'Französisch',
      'gl': 'Galicisch',
      'ka': 'Georgisch',
      'de': 'Deutsch',
      'el': 'Griechisch',
      'gu': 'Gujarati',
      'ht': 'Haitianisch',
      'he': 'Hebräisch',
      'hi': 'Hindi',
      'hu': 'Ungarisch',
      'is': 'Isländisch',
      'id': 'Indonesisch',
      'ga': 'Irisch',
      'it': 'Italienisch',
      'ja': 'Japanisch',
      'kn': 'Kannada',
      'ko': 'Koreanisch',
      'lv': 'Lettisch',
      'lt': 'Litauisch',
      'mk': 'Mazedonisch',
      'ms': 'Malaiisch',
      'mt': 'Maltesisch',
      'mr': 'Marathi',
      'no': 'Norwegisch',
      'fa': 'Persisch (Farsi)',
      'pl': 'Polnisch',
      'pt': 'Portugiesisch',
      'ro': 'Rumänisch',
      'ru': 'Russisch',
      'sk': 'Slowakisch',
      'sl': 'Slowenisch',
      'es': 'Spanisch',
      'sw': 'Suaheli',
      'sv': 'Schwedisch',
      'tl': 'Tagalog (Filipino)',
      'ta': 'Tamil',
      'te': 'Telugu',
      'th': 'Thailändisch',
      'tr': 'Türkisch',
      'uk': 'Ukrainisch',
      'ur': 'Urdu',
      'vi': 'Vietnamesisch',
      'cy': 'Walisisch',
      'other': '$code',
    });
    return '$_temp0';
  }

  @override
  String get textUtilMode => 'Modus';

  @override
  String get textUtilModeText => 'Text';

  @override
  String get textUtilHint => 'Text hier eingeben…';

  @override
  String get textUtilHintBase64 => 'Text oder Base64 zum Umwandeln eingeben…';

  @override
  String textUtilWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wörter',
      one: 'Wort',
    );
    return '$_temp0';
  }

  @override
  String textUtilCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zeichen',
      one: 'Zeichen',
    );
    return '$_temp0';
  }

  @override
  String get textUtilNoSpaces => 'ohne Leerzeichen';

  @override
  String get textUtilUpper => 'GROSSBUCHSTABEN';

  @override
  String get textUtilLower => 'kleinbuchstaben';

  @override
  String get textUtilTitle => 'Jedes Wort Groß';

  @override
  String get textUtilSentence => 'Satzanfang groß';

  @override
  String get textUtilEncode => 'Kodieren';

  @override
  String get textUtilDecode => 'Dekodieren';

  @override
  String get textUtilOutput => 'Ausgabe';

  @override
  String get textUtilInvalidBase64 => 'Das ist kein gültiges Base64.';

  @override
  String get clipEmptyClipboard =>
      'Die Zwischenablage ist leer oder enthält keinen Text.';

  @override
  String clipSaved(String text) {
    return 'Gespeichert: $text';
  }

  @override
  String get clipAddManualTitle => 'Text manuell hinzufügen';

  @override
  String get clipAddHint => 'Text hier eingeben oder einfügen…';

  @override
  String get clipClearUnpinned => 'Nicht angeheftete löschen';

  @override
  String get clipClearHistoryTitle => 'Verlauf löschen?';

  @override
  String get clipClearHistoryBody =>
      'Alle nicht angehefteten Einträge entfernen? Angeheftete bleiben erhalten.';

  @override
  String get clipSearchHint => 'Clips durchsuchen…';

  @override
  String get clipFilterAll => 'Alle';

  @override
  String get clipFilterPinned => 'Angeheftet';

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
      other: '$countString gespeichert',
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
      other: '$countString angeheftet',
    );
    return '$_temp0';
  }

  @override
  String get clipAddText => 'Text hinzufügen';

  @override
  String get clipLabel => 'Label';

  @override
  String get clipAddLabelTitle => 'Label hinzufügen';

  @override
  String get clipLabelHint => 'z. B. Arbeits-E-Mail';

  @override
  String get clipEmptyTitle => 'Noch keine Clips';

  @override
  String get clipEmptyMessage =>
      'Kopiere einen beliebigen Text auf deinem Handy und tippe dann auf „Einfügen“, um ihn hier dauerhaft zu speichern.';

  @override
  String get clipPasteFromClipboard => 'Aus Zwischenablage einfügen';

  @override
  String get clipTypeLink => 'Link';

  @override
  String get clipTypeEmail => 'E-Mail';

  @override
  String get clipTypePhone => 'Telefon';

  @override
  String get clipTypeCode => 'Code';

  @override
  String get clipTypeText => 'Text';

  @override
  String get clipJustNow => 'gerade eben';

  @override
  String clipMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Min.',
    );
    return '$_temp0';
  }

  @override
  String clipHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Std.',
    );
    return '$_temp0';
  }

  @override
  String clipDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Tagen',
      one: 'vor 1 Tag',
    );
    return '$_temp0';
  }

  @override
  String get clipPin => 'Anheften';

  @override
  String get clipUnpin => 'Loslösen';

  @override
  String get calcDivideByZero => 'Division durch null nicht möglich';

  @override
  String get calcCheckExpression => 'Ausdruck prüfen';

  @override
  String get calcCopyResult => 'Ergebnis kopieren';

  @override
  String get calcPlus => 'Plus';

  @override
  String get calcMinus => 'Minus';

  @override
  String get calcTimes => 'Mal';

  @override
  String get calcDivide => 'Geteilt durch';

  @override
  String get calcPercent => 'Prozent';

  @override
  String get calcParentheses => 'Klammern';

  @override
  String get calcEquals => 'Gleich';

  @override
  String get calcDecimalPoint => 'Dezimaltrennzeichen';

  @override
  String get ageTabAge => 'Alter';

  @override
  String get ageTabBetween => 'Zwischen Daten';

  @override
  String get ageDateOfBirth => 'Geburtsdatum';

  @override
  String get ageFrom => 'Von';

  @override
  String get ageTo => 'Bis';

  @override
  String get ageFutureDate => 'Dieses Datum liegt in der Zukunft.';

  @override
  String ageYearsUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Jahre',
      one: 'Jahr',
    );
    return '$_temp0';
  }

  @override
  String ageDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tage',
      one: 'Tag',
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
      other: '$countString Jahre',
      one: '1 Jahr',
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
      other: '$countString Monate',
      one: '1 Monat',
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
      other: '$countString Tage',
      one: '1 Tag',
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
      other: '$countString Wochen',
      one: '1 Woche',
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
      other: 'in $countString Tagen',
      one: 'in 1 Tag',
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
  String get ageNextBirthday => 'Nächster Geburtstag';

  @override
  String get ageBirthdayToday => 'Heute 🎉';

  @override
  String get ageTotalMonths => 'Monate insgesamt';

  @override
  String get ageTotalWeeks => 'Wochen insgesamt';

  @override
  String get ageTotalDays => 'Tage insgesamt';

  @override
  String get ageWeeksLabel => 'Wochen';

  @override
  String get ageWeekdays => 'Werktage (Mo–Fr)';

  @override
  String get ageHours => 'Stunden';

  @override
  String get ageIncludingEnd => 'Inkl. Enddatum';

  @override
  String get unitFrom => 'Von';

  @override
  String get unitTo => 'In';

  @override
  String get unitEnterValue => 'Wert eingeben';

  @override
  String get unitSwap => 'Einheiten tauschen';

  @override
  String unitCategoryName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'length': 'Länge',
      'weight': 'Gewicht',
      'temperature': 'Temperatur',
      'area': 'Fläche',
      'volume': 'Volumen',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String unitName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'millimeter': 'Millimeter',
      'centimeter': 'Zentimeter',
      'meter': 'Meter',
      'kilometer': 'Kilometer',
      'inch': 'Zoll',
      'foot': 'Fuß',
      'mile': 'Meile',
      'gram': 'Gramm',
      'kilogram': 'Kilogramm',
      'ounce': 'Unze',
      'pound': 'Pfund',
      'celsius': 'Celsius',
      'fahrenheit': 'Fahrenheit',
      'kelvin': 'Kelvin',
      'squareMeter': 'Quadratmeter',
      'squareFoot': 'Quadratfuß',
      'acre': 'Acre',
      'hectare': 'Hektar',
      'milliliter': 'Milliliter',
      'liter': 'Liter',
      'gallonUs': 'Gallone (US)',
      'fluidOunce': 'Flüssigunze',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String get loanAmount => 'Kreditbetrag';

  @override
  String get loanInterestRate => 'Jährlicher Zinssatz';

  @override
  String get loanTenure => 'Laufzeit';

  @override
  String get loanTenureMonths => 'Laufzeit (Monate)';

  @override
  String get loanTenureYears => 'Laufzeit (Jahre)';

  @override
  String get loanToggleMonths => 'Monate';

  @override
  String get loanToggleYears => 'Jahre';

  @override
  String get loanEmpty =>
      'Gib oben gültige Kreditdaten ein, um die Monatsrate zu berechnen';

  @override
  String get loanMonthlyEmi => 'Monatliche Rate';

  @override
  String get loanPrincipal => 'Tilgung';

  @override
  String get loanTotalInterest => 'Zinsen gesamt';

  @override
  String get loanTotalPayment => 'Gesamtbetrag';

  @override
  String get loanBreakdown => 'Aufteilung';

  @override
  String get loanInterest => 'Zinsen';

  @override
  String loanInterestShare(String percent) {
    return '$percent Zinsen';
  }

  @override
  String get loanSchedule => 'Tilgungsplan';

  @override
  String loanMonths(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Monate',
      one: '1 Monat',
    );
    return '$_temp0';
  }

  @override
  String get loanColMonth => 'Mon.';

  @override
  String get loanColBalance => 'Restschuld';

  @override
  String get loanShowAll => 'Alle Monate anzeigen';

  @override
  String get loanShowLess => 'Weniger anzeigen';

  @override
  String get clockSearchHint => 'Stadt oder Land suchen…';

  @override
  String get clockPinned => 'Angeheftet';

  @override
  String get clockAllCities => 'Alle Städte';

  @override
  String clockOnWidget(int shown, int total) {
    final intl.NumberFormat shownNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String shownString = shownNumberFormat.format(shown);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Im Widget: $shownString von $totalString';
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

    return 'Im Widget: $shownString von bis zu $maxString (vergrößern, um mehr zu sehen)';
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

    return 'Das Startbildschirm-Widget zeigt standardmäßig die ersten $defaultRowsString – zieh den unteren Rand nach unten, um bis zu $maxRowsString anzuzeigen.';
  }

  @override
  String get clockPin => 'Anheften';

  @override
  String get clockUnpin => 'Loslösen';

  @override
  String get clockNoResults => 'Keine passenden Städte';

  @override
  String get speedSelectingServer => 'Server wird ausgewählt…';

  @override
  String get speedPhasePing => 'Ping wird gemessen';

  @override
  String get speedPhaseDownload => 'Download-Geschwindigkeit wird getestet';

  @override
  String get speedPhaseUpload => 'Upload-Geschwindigkeit wird getestet';

  @override
  String get speedDownloadSpeed => 'Download-Geschwindigkeit';

  @override
  String get speedUploadSpeed => 'Upload-Geschwindigkeit';

  @override
  String get speedRunAgain => 'Nochmal';

  @override
  String get speedGo => 'LOS';

  @override
  String speedMeasuredVia(String server) {
    return 'Gemessen über $server';
  }

  @override
  String get speedPoweredBy => 'Nutzt die Speedtest-Server von Cloudflare';

  @override
  String get speedIdleHint =>
      'Tippe auf die Schaltfläche, um Ping, Download- und Upload-Geschwindigkeit zu messen.';

  @override
  String get speedPing => 'Ping';

  @override
  String get speedResultsTitle => 'Ergebnisse des Speedtests';

  @override
  String get speedDownload => 'Download';

  @override
  String get speedUpload => 'Upload';

  @override
  String speedConnectedIp(String ip) {
    return 'Deine IP: $ip';
  }

  @override
  String get speedErrorOffline =>
      'Keine Internetverbindung. Prüfe WLAN oder mobile Daten.';

  @override
  String get speedErrorTimeout =>
      'Zeitüberschreitung beim Test. Deine Verbindung ist möglicherweise instabil.';

  @override
  String get speedErrorFailed =>
      'Der Test ist fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get pingErrorHostNotFound =>
      'Host nicht gefunden. Prüfe die Adresse und deine Internetverbindung.';

  @override
  String get pingErrorNoData =>
      'Für diese Adresse sind keine Informationen verfügbar.';

  @override
  String get pingTabMyIp => 'Meine IP';

  @override
  String get pingTabLookup => 'Abfrage';

  @override
  String get pingTabPing => 'Ping';

  @override
  String get pingYourPublicIp => 'Deine öffentliche IP-Adresse';

  @override
  String get pingFieldCity => 'Stadt';

  @override
  String get pingFieldRegion => 'Region';

  @override
  String get pingFieldCountry => 'Land';

  @override
  String get pingFieldIsp => 'Anbieter';

  @override
  String get pingFieldTimezone => 'Zeitzone';

  @override
  String get pingFieldLocation => 'Koordinaten';

  @override
  String get pingFieldIp => 'IP-Adresse';

  @override
  String get pingIpCopied => 'IP-Adresse kopiert';

  @override
  String get pingCopyIp => 'IP kopieren';

  @override
  String get pingLookupHint => 'IP-Adresse oder Hostname';

  @override
  String get pingLookupButton => 'Abfragen';

  @override
  String get pingHostHint => 'Hostname (z. B. google.com)';

  @override
  String get pingStartButton => 'Pingen';

  @override
  String pingHeader(String host, String ip) {
    return 'Ping an $host ($ip) über TCP-Port 443';
  }

  @override
  String get pingStatAvg => 'Mittel';

  @override
  String get pingStatLoss => 'Verlust';

  @override
  String get pingStatSent => 'Gesendet';

  @override
  String get pingTimeout => 'Timeout';

  @override
  String get compassN => 'N';

  @override
  String get compassNE => 'NO';

  @override
  String get compassE => 'O';

  @override
  String get compassSE => 'SO';

  @override
  String get compassS => 'S';

  @override
  String get compassSW => 'SW';

  @override
  String get compassW => 'W';

  @override
  String get compassNW => 'NW';

  @override
  String get compassNorth => 'Norden';

  @override
  String get compassNortheast => 'Nordosten';

  @override
  String get compassEast => 'Osten';

  @override
  String get compassSoutheast => 'Südosten';

  @override
  String get compassSouth => 'Süden';

  @override
  String get compassSouthwest => 'Südwesten';

  @override
  String get compassWest => 'Westen';

  @override
  String get compassNorthwest => 'Nordwesten';

  @override
  String compassSemantics(String degrees, String direction) {
    return 'Richtung $degrees°, $direction';
  }

  @override
  String get compassHeadingMagnetic => 'Magnetische Richtung';

  @override
  String get compassUnavailable =>
      'Dieses Gerät hat keinen Magnetsensor, daher funktioniert der Kompass nicht.';

  @override
  String get locationSavedHeader => 'Gespeicherte Orte';

  @override
  String locationSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString gespeichert',
      one: '1 gespeichert',
      zero: 'Noch keine',
    );
    return '$_temp0';
  }

  @override
  String locationEmpty(String save) {
    return 'Noch keine Orte gespeichert.\nTippe auf „$save“, um deinen Standort zu merken.';
  }

  @override
  String locationDeleted(String name) {
    return '„$name“ gelöscht';
  }

  @override
  String get locationSaveDialogTitle => 'Ort speichern';

  @override
  String get locationNameLabel => 'Name';

  @override
  String get locationNameHint => 'z. B. Zuhause, Büro…';

  @override
  String get locationNoteLabel => 'Notiz (optional)';

  @override
  String get locationCurrent => 'Aktueller Standort';

  @override
  String get locationRefresh => 'Standort aktualisieren';

  @override
  String get locationLocating => 'Standort wird ermittelt…';

  @override
  String get locationServicesOff =>
      'Die Standortermittlung ist aus. Schalte sie ein, um deinen Standort zu sehen.';

  @override
  String get locationPermissionDenied =>
      'Erlaube den Standortzugriff, um deinen Standort zu sehen.';

  @override
  String get locationPermissionDeniedForever =>
      'Der Standortzugriff ist blockiert. Erlaube ihn in den Einstellungen, um dieses Tool zu nutzen.';

  @override
  String get locationErrorTimeout =>
      'Kein GPS-Signal. Geh in die Nähe eines Fensters oder nach draußen und versuche es erneut.';

  @override
  String get locationAllow => 'Zugriff erlauben';

  @override
  String locationAccuracy(String meters) {
    return 'Genauigkeit: ±$meters m';
  }

  @override
  String get locationCoordsCopied => 'Koordinaten kopiert';

  @override
  String get locationCopyCoords => 'Koordinaten kopieren';

  @override
  String get locationOpenInMaps => 'In Karten öffnen';

  @override
  String get passwordYours => 'Dein Passwort';

  @override
  String get passwordSelectType => 'Wähle mindestens eine Zeichenart';

  @override
  String get passwordStrength => 'Stärke';

  @override
  String get passwordWeak => 'Schwach';

  @override
  String get passwordFair => 'Mittel';

  @override
  String get passwordGood => 'Gut';

  @override
  String get passwordStrong => 'Stark';

  @override
  String get passwordLength => 'Länge';

  @override
  String passwordChars(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Zeichen',
      one: '1 Zeichen',
    );
    return '$_temp0';
  }

  @override
  String get passwordInclude => 'Enthält';

  @override
  String get passwordUppercase => 'Großbuchstaben';

  @override
  String get passwordLowercase => 'Kleinbuchstaben';

  @override
  String get passwordNumbers => 'Ziffern';

  @override
  String get passwordSymbols => 'Sonderzeichen';

  @override
  String get passwordCopied => 'Passwort kopiert';

  @override
  String get passwordGenerate => 'Neu erzeugen';

  @override
  String get hashModeText => 'Text';

  @override
  String get hashModeFile => 'Datei';

  @override
  String get hashAlgorithm => 'Algorithmus';

  @override
  String get hashInputHint => 'Text zum Hashen eingeben…';

  @override
  String get hashPickFile => 'Tippe, um eine Datei auszuwählen';

  @override
  String get hashChange => 'Ändern';

  @override
  String get hashHashing => 'Wird berechnet…';

  @override
  String get hashGenerate => 'Hash erzeugen';

  @override
  String get hashFileError =>
      'Diese Datei konnte nicht gelesen werden. Versuche eine andere.';

  @override
  String get hashCopied => 'Hash kopiert';

  @override
  String get hashCopy => 'Hash kopieren';

  @override
  String get colorPickerFormats => 'Farbformate';

  @override
  String get colorPickerHexLabel => 'HEX-Farbe';

  @override
  String get colorPickerHexInvalid => '6 Hex-Ziffern eingeben (0–9, A–F)';

  @override
  String get colorPickerApply => 'Farbe übernehmen';

  @override
  String colorPickerCopied(String format) {
    return '$format kopiert';
  }

  @override
  String get colorPickerPalette => 'Schnellpalette';

  @override
  String colorPickerSwatch(String hex) {
    return 'Farbe $hex';
  }

  @override
  String get imgCompressPickHint =>
      'Tippen, um ein Foto zu wählen oder aufzunehmen';

  @override
  String imgCompressSupported(String formats) {
    return 'Unterstützt $formats';
  }

  @override
  String get imgCompressChange => 'Foto ändern';

  @override
  String get imgCompressModeQuality => 'Nach Qualität';

  @override
  String get imgCompressModeTarget => 'Zielgröße';

  @override
  String get imgCompressQuality => 'Qualität';

  @override
  String get imgCompressSmallest => 'Kleinste Datei';

  @override
  String get imgCompressBestQuality => 'Beste Qualität';

  @override
  String get imgCompressQualityNote =>
      'Große Fotos werden zusätzlich auf etwa 1920×1080 verkleinert.';

  @override
  String imgCompressTargetUnder(String size) {
    return 'Unter $size';
  }

  @override
  String get imgCompressTargetHint =>
      'Behält die beste Qualität, die ins Limit passt – praktisch für Bewerbungs- und Behördenformulare.';

  @override
  String get imgCompressButton => 'Foto komprimieren';

  @override
  String get imgCompressCompressing => 'Wird komprimiert…';

  @override
  String get imgCompressSuccess => 'Erfolgreich komprimiert!';

  @override
  String imgCompressFitsTarget(String size) {
    return 'Fertig – unter $size';
  }

  @override
  String imgCompressMissedTarget(String size) {
    return 'Unter $size war nicht möglich. Das ist die kleinste Version, die wir erstellen konnten.';
  }

  @override
  String get imgCompressStatOriginal => 'Original';

  @override
  String get imgCompressStatCompressed => 'Komprimiert';

  @override
  String get imgCompressStatSaved => 'Gespart';

  @override
  String get imgCompressFailed =>
      'Dieses Foto konnte nicht komprimiert werden. Versuche ein anderes.';

  @override
  String get imgResizePresetPassport => 'Passfoto 35×45 mm';

  @override
  String imgResizePresetSquare(String size) {
    return 'Quadrat $size';
  }

  @override
  String imgResizePresetStory(String size) {
    return 'Story $size';
  }

  @override
  String imgResizePresetMax(String name, String px) {
    return '$name (max. $px)';
  }

  @override
  String get imgResizeChoosePhotos => 'Fotos wählen';

  @override
  String imgResizeSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos ausgewählt',
      one: '1 Foto ausgewählt',
    );
    return '$_temp0';
  }

  @override
  String get imgResizePickHint =>
      'Eins oder mehrere wählen – oder mit der App teilen';

  @override
  String get imgResizeChoose => 'Wählen';

  @override
  String get imgResizeChange => 'Ändern';

  @override
  String get imgResizePresets => 'Vorlagen';

  @override
  String get imgResizeModePercent => 'Prozent';

  @override
  String get imgResizeModeMaxSide => 'Max. Seite';

  @override
  String get imgResizeModeExact => 'Exakt';

  @override
  String get imgResizeWidth => 'Breite (px)';

  @override
  String get imgResizeHeight => 'Höhe (px)';

  @override
  String get imgResizeCrop => 'Zuschneiden (nicht verzerren)';

  @override
  String get imgResizeFormat => 'Format';

  @override
  String get imgResizeQuality => 'Qualität';

  @override
  String get imgResizeButton => 'Skalieren';

  @override
  String imgResizeSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos in Galerie speichern',
      one: '1 Foto in Galerie speichern',
    );
    return '$_temp0';
  }

  @override
  String get imgResizeChangeSettings => 'Einstellungen ändern';

  @override
  String imgResizeInvalidSize(int min, int max) {
    return 'Gib eine Breite und Höhe zwischen $min und $max ein.';
  }

  @override
  String imgResizeFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos konnten nicht gelesen werden.',
      one: '1 Foto konnte nicht gelesen werden.',
    );
    return '$_temp0';
  }

  @override
  String imgResizeSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos in der Galerie gespeichert',
      one: '1 Foto in der Galerie gespeichert',
    );
    return '$_temp0';
  }

  @override
  String get imgEnhanceEmptyTitle => 'Fotos bearbeiten';

  @override
  String get imgEnhanceEmptyBody =>
      'Helligkeit, Kontrast, Sättigung und Schärfe anpassen, Vorlagen anwenden, drehen und spiegeln – alles auf deinem Gerät.';

  @override
  String get imgEnhanceFineControls => 'Feinregler';

  @override
  String get imgEnhanceApplying => 'Wird angewendet…';

  @override
  String get imgEnhanceChange => 'Ändern';

  @override
  String get imgEnhancePresets => 'Vorlagen';

  @override
  String get imgEnhanceTransform => 'Transformieren';

  @override
  String get imgEnhanceAdjustments => 'Anpassungen';

  @override
  String get imgEnhanceRotate => 'Drehen';

  @override
  String get imgEnhanceFlipH => 'Horizontal spiegeln';

  @override
  String get imgEnhanceFlipV => 'Vertikal spiegeln';

  @override
  String get imgEnhanceBrightness => 'Helligkeit';

  @override
  String get imgEnhanceContrast => 'Kontrast';

  @override
  String get imgEnhanceSaturation => 'Sättigung';

  @override
  String get imgEnhanceSharpen => 'Schärfen';

  @override
  String get imgEnhanceBlur => 'Weichzeichnen';

  @override
  String get imgEnhanceQuality => 'Qualität';

  @override
  String get imgEnhanceApply => 'Anwenden';

  @override
  String get imgEnhanceFailed =>
      'Die Änderungen konnten nicht angewendet werden. Versuche ein anderes Foto.';

  @override
  String imgEnhanceResult(String before, String after, String change) {
    return 'Fertig! $before → $after ($change)';
  }

  @override
  String get imgEnhancePresetOriginal => 'Original';

  @override
  String get imgEnhancePresetVivid => 'Lebhaft';

  @override
  String get imgEnhancePresetCool => 'Kühl';

  @override
  String get imgEnhancePresetWarm => 'Warm';

  @override
  String get imgEnhancePresetDramatic => 'Dramatisch';

  @override
  String get imgEnhancePresetFade => 'Verblasst';

  @override
  String get imgEnhancePresetVintage => 'Vintage';

  @override
  String get imgEnhancePresetNoir => 'Noir';

  @override
  String get upscalerNewImage => 'Neues Foto';

  @override
  String get upscalerIntro =>
      'Vergrößere Fotos bis zu 4× mit KI auf dem Gerät. Funktioniert nach einem einmaligen Modell-Download offline – optionaler Cloud-Modus für Gesichter.';

  @override
  String get upscalerBadgeOnDevice => 'KI auf dem Gerät';

  @override
  String get upscalerBadgeOffline => 'Funktioniert offline';

  @override
  String get upscalerBadgeUpTo4x => 'Bis zu 4× größer';

  @override
  String get upscalerBadgeGpu => 'GPU-beschleunigt';

  @override
  String get upscalerBestResults =>
      'Beste Ergebnisse: Fotos mit niedriger Auflösung, alte Scans, Vorschaubilder und komprimierte JPEGs.';

  @override
  String get upscalerChangeImage => 'Foto ändern';

  @override
  String get upscalerTabOriginal => 'Original';

  @override
  String get upscalerTabUpscaled => 'KI-vergrößert';

  @override
  String get upscalerStageStarting => 'Wird gestartet…';

  @override
  String get upscalerStageConnecting => 'Verbindung zum KI-Server…';

  @override
  String get upscalerStageOnDevice => 'Verarbeitung auf diesem Gerät…';

  @override
  String get upscalerStageCloudUnavailable =>
      'Cloud nicht erreichbar – Verarbeitung auf diesem Gerät…';

  @override
  String get upscalerStageUploading => 'Foto wird hochgeladen…';

  @override
  String get upscalerStageRestoringFaces =>
      'KI stellt Gesichter und Details wieder her…';

  @override
  String get upscalerStagePreparing => 'Foto wird vorbereitet…';

  @override
  String get upscalerStageLoadingModel => 'KI-Modell wird geladen…';

  @override
  String get upscalerStageDownloadingModel =>
      'KI-Modell wird heruntergeladen (einmalig)…';

  @override
  String get upscalerStageFallback => 'Standard-Vergrößerung wird verwendet…';

  @override
  String get upscalerStageDecoding => 'Foto wird gelesen…';

  @override
  String upscalerStageResizing(String from, String to) {
    return 'Eingabe wird skaliert ($from → $to)…';
  }

  @override
  String get upscalerStageDenoising => 'Rauschen wird reduziert…';

  @override
  String upscalerStageUpscaling(String factor) {
    return 'Vergrößern ($factor×)…';
  }

  @override
  String upscalerStageAiTiles(String done, String total) {
    return 'KI-Vergrößerung… ($done/$total)';
  }

  @override
  String get upscalerStageSharpening => 'Wird geschärft…';

  @override
  String get upscalerStageColour => 'Farben werden angepasst…';

  @override
  String get upscalerStageSaving => 'Wird gespeichert…';

  @override
  String get upscalerStageDone => 'Fertig!';

  @override
  String get upscalerLoadingModelHint =>
      'KI-Modell wird geladen (nur beim ersten Mal)';

  @override
  String get upscalerTime4x =>
      '4×-Vergrößerung kann je nach Fotogröße 15–60 s dauern.';

  @override
  String get upscalerTime2x => '2×-Vergrößerung dauert meist 5–20 s.';

  @override
  String upscalerDoneIn(String seconds) {
    return 'Vergrößert in $seconds s';
  }

  @override
  String get upscalerStatResolution => 'Auflösung';

  @override
  String get upscalerStatFileSize => 'Dateigröße';

  @override
  String get upscalerStatScale => 'Faktor';

  @override
  String get upscalerShareSubject => 'KI-vergrößertes Foto';

  @override
  String get upscalerFallbackModelUnavailable =>
      'Das KI-Modell braucht einmal Internet – Standard-Vergrößerung verwendet';

  @override
  String get upscalerFallbackModelFailed =>
      'Das KI-Modell läuft auf diesem Gerät nicht – Standard-Vergrößerung verwendet';

  @override
  String get upscalerFallbackCloud =>
      'Cloud-Server nicht erreichbar – auf diesem Gerät verarbeitet';

  @override
  String get upscalerSettings => 'KI-Einstellungen';

  @override
  String get upscalerFactorLabel => 'Vergrößerungsfaktor';

  @override
  String get upscalerFactor2xDesc => 'Schnell – ideal für die meisten Fotos';

  @override
  String get upscalerFactor4xDesc => 'Beste Qualität – langsamer';

  @override
  String get upscalerOptimiseFor => 'Optimieren für';

  @override
  String get upscalerModeAuto => 'Auto';

  @override
  String get upscalerModePhoto => 'Foto';

  @override
  String get upscalerModeIllustration => 'Illustration';

  @override
  String get upscalerModeFace => 'Gesichtsdetails';

  @override
  String get upscalerDenoise => 'Vorentrauschen';

  @override
  String get upscalerDenoiseTip => 'Reduziert JPEG-Rauschen vor dem Vergrößern';

  @override
  String get upscalerSharpen => 'Nachschärfen';

  @override
  String get upscalerSharpenTip => 'Sorgt nach dem Vergrößern für mehr Schärfe';

  @override
  String get upscalerCloudTitle => 'Gesichtsverbesserung in der Cloud';

  @override
  String get upscalerCloudOn =>
      'Dein Foto wird zur Verarbeitung auf unseren Server hochgeladen.';

  @override
  String get upscalerCloudOff => 'Aus – Fotos bleiben auf diesem Gerät.';

  @override
  String get upscalerCloudDialogTitle => 'Fotos in die Cloud senden?';

  @override
  String get upscalerCloudDialogBody =>
      'Im Cloud-Modus wird das ausgewählte Foto über eine verschlüsselte Verbindung auf unseren Vergrößerungsserver hochgeladen und dort mit einem größeren KI-Modell (GFPGAN + Real-ESRGAN) verarbeitet.\n\n• Nur das Foto, das du vergrößern möchtest, wird gesendet.\n• Das Foto wird im Arbeitsspeicher verarbeitet und nach der Rückgabe des Ergebnisses nicht gespeichert.\n• Es werden kein Konto und keine persönlichen Daten mitgesendet.\n\nDu kannst das jederzeit ausschalten. Der Gerätemodus funktioniert komplett offline.';

  @override
  String get upscalerCloudKeepLocal => 'Auf dem Gerät bleiben';

  @override
  String get upscalerCloudEnable => 'Cloud aktivieren';

  @override
  String get upscalerUpscale => 'Mit KI vergrößern';

  @override
  String get upscalerUpscaleAgain =>
      'Mit neuen Einstellungen erneut vergrößern';

  @override
  String get upscalerFailed => 'Vergrößerung fehlgeschlagen';

  @override
  String get upscalerErrorTooLarge =>
      'Das Foto ist zu groß. Versuche ein kleineres Foto oder 2×-Vergrößerung.';

  @override
  String get upscalerErrorUnreadable =>
      'Dieses Foto konnte nicht gelesen werden. Verwende eine JPG- oder PNG-Datei.';

  @override
  String get upscalerErrorNetwork =>
      'Zeitüberschreitung im Netzwerk. Prüfe deine Verbindung oder schalte den Cloud-Modus aus.';

  @override
  String get videoPickHint => 'Tippen, um ein Video zu wählen';

  @override
  String videoProbeInfo(String format, String duration) {
    return 'Format: $format · Dauer: $duration';
  }

  @override
  String get videoOutputFormat => 'Ausgabeformat';

  @override
  String get videoFmtMostCompatible => 'Am kompatibelsten';

  @override
  String get videoFmtApple => 'Apple / QuickTime';

  @override
  String get videoFmtFlexible => 'Flexibler Container';

  @override
  String get videoFmtLegacy => 'Älteres Format';

  @override
  String get videoFmtGif => 'Animiert (ohne Ton)';

  @override
  String get videoFmtAudioOnly => 'Nur Audio';

  @override
  String get videoFmtAudioAac => 'Nur Audio (AAC)';

  @override
  String get videoFmtAudioRaw => 'Nur Audio (roh)';

  @override
  String get videoFmtWav => 'Unkomprimiertes Audio';

  @override
  String videoConvertingPercent(int percent) {
    return 'Wird konvertiert… $percent%';
  }

  @override
  String get videoConvertingWait => 'Wird konvertiert… das kann etwas dauern';

  @override
  String get videoDone => 'Konvertierung abgeschlossen!';

  @override
  String get videoErrorUnsupported =>
      'Konvertierung fehlgeschlagen. Dieses Format wird auf deinem Gerät eventuell nicht unterstützt.';

  @override
  String get videoConvertAnother => 'Weiteres konvertieren';

  @override
  String get videoPickButton => 'Videodatei wählen';

  @override
  String videoConvertTo(String format) {
    return 'In $format umwandeln';
  }

  @override
  String get docScanAndroidOnly =>
      'Der Dokumentenscanner ist nur unter Android verfügbar.';

  @override
  String docScanNeedsPlayServices(String details) {
    return 'Der Scanner konnte nicht starten. Er benötigt die Google Play-Dienste – bitte aktualisieren. ($details)';
  }

  @override
  String get docScanStartFailed =>
      'Der Scanner konnte nicht starten. Bitte versuche es erneut.';

  @override
  String get docScanPdfSaved =>
      'PDF in Downloads gespeichert – du findest es unter „Meine Dateien“';

  @override
  String docScanPagesSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten in der Galerie gespeichert',
      one: '1 Seite in der Galerie gespeichert',
    );
    return '$_temp0';
  }

  @override
  String get docScanHeadline => 'Papier zu einem sauberen PDF scannen';

  @override
  String get docScanIntro =>
      'Ränder werden automatisch erkannt. Füge beliebig viele Seiten hinzu, zuschneiden, drehen und Filter anwenden – vor dem Speichern.';

  @override
  String get docScanScanning => 'Wird gescannt…';

  @override
  String get docScanStart => 'Scannen starten';

  @override
  String get docScanScannedPages => 'Gescannte Seiten';

  @override
  String docScanPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten',
      one: '1 Seite',
    );
    return '$_temp0';
  }

  @override
  String get docScanSavePdf => 'PDF speichern';

  @override
  String get docScanSharePdf => 'PDF teilen';

  @override
  String get docScanCopyText => 'Text kopieren';

  @override
  String get docScanSaveJpg => 'Als JPG speichern';

  @override
  String get docScanAnother => 'Weiteres Dokument scannen';

  @override
  String get pdfToolsChoosePdf => 'PDF auswählen';

  @override
  String get pdfToolsChooseHint =>
      'Oder teile ein PDF aus einer beliebigen App mit Utility Toolbox';

  @override
  String get pdfToolsReading => 'Wird gelesen…';

  @override
  String get pdfToolsLockedShort => 'Passwortgeschützt';

  @override
  String pdfToolsPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten',
      one: '1 Seite',
    );
    return '$_temp0';
  }

  @override
  String get pdfToolsChange => 'Ändern';

  @override
  String get pdfToolsResultReady => 'Dein PDF ist fertig';

  @override
  String get pdfToolsSaveDownloads => 'In Downloads speichern';

  @override
  String get pdfToolsStartOver => 'Neu beginnen';

  @override
  String get pdfToolsSavedToDownloads =>
      'In Downloads gespeichert – du findest es unter „Meine Dateien“';

  @override
  String get pdfToolsSharedInstead =>
      'Stattdessen wurde das Teilen-Menü geöffnet';

  @override
  String get pdfToolsRangeEmpty => 'Gib mindestens eine Seite ein.';

  @override
  String pdfToolsRangeInvalid(String part) {
    return '„$part“ ist keine Seite und kein Bereich (z. B. 1-3, 5).';
  }

  @override
  String pdfToolsRangeOutside(String part, int count) {
    return '„$part“ liegt außerhalb von 1–$count.';
  }

  @override
  String get pdfToolsInvalidPdf =>
      'Diese Datei scheint kein gültiges PDF zu sein.';

  @override
  String pdfToolsLockedUnlockFirst(String tool) {
    return 'Dieses PDF ist passwortgeschützt. Entsperre es zuerst mit „$tool“.';
  }

  @override
  String pdfToolsPagesLabel(int count) {
    return 'Seiten (1–$count)';
  }

  @override
  String pdfToolsPagesHint(String example) {
    return 'z. B. $example';
  }

  @override
  String pdfToolsPageN(int number) {
    return 'Seite $number';
  }

  @override
  String get pdfToolsDownload => 'Herunterladen';

  @override
  String get pdfToolsSavedNotification =>
      'In Downloads gespeichert – über die Benachrichtigung öffnen.';

  @override
  String get pdfToolsShareToSave =>
      'Teilen-Menü geöffnet – wähle, wo die Datei gespeichert werden soll.';

  @override
  String pdfToolsSelectedFile(String name) {
    return 'Ausgewählt: $name';
  }

  @override
  String pdfToolsSize(String size) {
    return 'Größe: $size';
  }

  @override
  String get pdfToolsDragToReorder => 'Zum Sortieren ziehen';

  @override
  String get pdfHomeTitle => 'PDF-Werkzeuge';

  @override
  String get pdfHomeSection => 'PDF-Tools';

  @override
  String get pdfHomeSubtitle =>
      'Dokumente erstellen, kombinieren und optimieren';

  @override
  String get pdfPasswordEnter => 'Gib ein Passwort ein.';

  @override
  String pdfPasswordTooShort(int count) {
    return 'Verwende mindestens $count Zeichen.';
  }

  @override
  String get pdfPasswordMismatch => 'Die Passwörter stimmen nicht überein.';

  @override
  String get pdfPasswordWrong => 'Das Passwort ist falsch.';

  @override
  String get pdfPasswordLockFailed =>
      'Dieses PDF konnte nicht gesperrt werden.';

  @override
  String get pdfPasswordUnlockFailed =>
      'Dieses PDF konnte nicht entsperrt werden.';

  @override
  String get pdfPasswordLockedDone => 'Dein PDF ist gesperrt';

  @override
  String get pdfPasswordRemovedDone => 'Passwort entfernt';

  @override
  String get pdfPasswordAlreadyLocked =>
      'Dieses PDF hat bereits ein Passwort. Entsperre es zuerst.';

  @override
  String get pdfPasswordNotLocked =>
      'Dieses PDF hat kein Passwort – es gibt nichts zu entsperren.';

  @override
  String get pdfPasswordNew => 'Neues Passwort';

  @override
  String get pdfPasswordCurrent => 'Aktuelles Passwort';

  @override
  String get pdfPasswordRepeat => 'Passwort wiederholen';

  @override
  String get pdfPasswordShow => 'Passwort anzeigen';

  @override
  String get pdfPasswordHide => 'Passwort verbergen';

  @override
  String get pdfPasswordWarning =>
      'Bewahre das Passwort sicher auf – es lässt sich nicht wiederherstellen. Verschlüsselt mit AES-256.';

  @override
  String get pdfSplitExtract => 'Seiten extrahieren';

  @override
  String get pdfSplitRemove => 'Seiten entfernen';

  @override
  String get pdfSplitPagesHelp =>
      'Kommas und Bereiche verwenden. „8-“ heißt ab Seite 8 bis zum Ende.';

  @override
  String get pdfSplitRemovesAll => 'Damit würden alle Seiten entfernt.';

  @override
  String get pdfSplitFailed => 'Dieses PDF konnte nicht geteilt werden.';

  @override
  String get pdfToImagesFailed => 'Dieses PDF konnte nicht umgewandelt werden.';

  @override
  String pdfToImagesSaved(int saved, int total) {
    return '$saved von $total Bildern in der Galerie gespeichert';
  }

  @override
  String get pdfToImagesAllPages => 'Alle Seiten';

  @override
  String get pdfToImagesConvert => 'In JPG umwandeln';

  @override
  String pdfToImagesRendered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten umgewandelt…',
      one: '1 Seite umgewandelt…',
    );
    return '$_temp0';
  }

  @override
  String pdfToImagesRenderedOf(int count, int total) {
    return '$count von $total Seiten umgewandelt…';
  }

  @override
  String pdfToImagesSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bilder in Galerie speichern',
      one: '1 Bild in Galerie speichern',
    );
    return '$_temp0';
  }

  @override
  String get pdfCompressButton => 'Komprimieren';

  @override
  String get pdfCompressWorking => 'PDF wird komprimiert…';

  @override
  String pdfCompressOriginalSize(String size) {
    return 'Originalgröße: $size';
  }

  @override
  String get pdfCompressIntro =>
      'Wähle eine PDF-Datei. Die Komprimierung wirkt am besten bei bildlastigen Dokumenten.';

  @override
  String get pdfCompressLow => 'Niedrig';

  @override
  String get pdfCompressMedium => 'Mittel';

  @override
  String get pdfCompressHigh => 'Hoch';

  @override
  String get pdfCompressFailed => 'Dieses PDF konnte nicht komprimiert werden.';

  @override
  String pdfCompressBefore(String size) {
    return 'Vorher: $size';
  }

  @override
  String pdfCompressAfter(String size) {
    return 'Nachher: $size';
  }

  @override
  String get pdfMergeButton => 'Zusammenführen';

  @override
  String get pdfMergeWorking => 'PDFs werden zusammengeführt…';

  @override
  String get pdfMergePick => 'PDF-Dateien auswählen';

  @override
  String get pdfMergeIntro =>
      'Wähle mindestens zwei PDF-Dateien zum Zusammenführen.';

  @override
  String get pdfMergeFailed =>
      'Die PDFs konnten nicht zusammengeführt werden. Eine der Dateien ist evtl. nicht lesbar.';

  @override
  String pdfMergeResult(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zusammengeführtes PDF ($count Seiten)',
      one: 'Zusammengeführtes PDF (1 Seite)',
    );
    return '$_temp0';
  }

  @override
  String get imageToPdfCreate => 'PDF erstellen';

  @override
  String get imageToPdfWorking => 'PDF wird erstellt…';

  @override
  String get imageToPdfPick => 'Bilder auswählen';

  @override
  String get imageToPdfIntro => 'Wähle ein oder mehrere Bilder zum Umwandeln.';

  @override
  String get imageToPdfFailed =>
      'PDF konnte nicht erstellt werden. Bitte versuche andere Bilder.';

  @override
  String imageToPdfReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF fertig ($count Seiten)',
      one: 'PDF fertig (1 Seite)',
    );
    return '$_temp0';
  }

  @override
  String get qrScanNoCodeInPhoto =>
      'In diesem Foto wurde kein QR-Code oder Barcode gefunden.';

  @override
  String get qrScanPhotoFailed => 'Dieses Foto konnte nicht gelesen werden.';

  @override
  String qrScanResultTitle(String type) {
    return 'Gescannt ($type)';
  }

  @override
  String get qrScanFromPhoto => 'Aus Foto scannen';

  @override
  String get qrScanCameraNeeded =>
      'Zum Scannen von QR-Codes und Barcodes wird Kamerazugriff benötigt.';

  @override
  String get qrScanCameraError =>
      'Die Kamera konnte nicht starten. Schließe andere Kamera-Apps und versuche es erneut.';

  @override
  String get qrScanTorchOn => 'Taschenlampe einschalten';

  @override
  String get qrScanTorchOff => 'Taschenlampe ausschalten';

  @override
  String get qrScanTypeLink => 'Link';

  @override
  String get qrScanTypeWifi => 'WLAN';

  @override
  String get qrScanTypeContact => 'Kontakt';

  @override
  String get qrScanTypeText => 'Text';

  @override
  String get qrGenInputLabel => 'Text oder URL';

  @override
  String get qrGenInputHint => 'Inhalt zum Codieren eingeben';

  @override
  String get qrGenPreviewLabel => 'QR-Code-Vorschau';

  @override
  String get qrGenEmpty =>
      'Gib oben Text ein, um die Vorschau deines QR-Codes zu sehen.';

  @override
  String get qrGenSaveGallery => 'In Galerie speichern';

  @override
  String get qrHomeTitle => 'QR & Barcode';

  @override
  String get qrHomeTabScan => 'Scannen';

  @override
  String get qrHomeTabCreate => 'Erstellen';

  @override
  String get qrHomeScanTitle => 'Code scannen';

  @override
  String get qrHomeScanBody =>
      'Richte die Kamera auf einen QR-Code oder Barcode, um ihn sofort zu scannen.';

  @override
  String get qrHomeBadgeInstant => 'Sofort';

  @override
  String get qrHomeBadgeHistory => 'Verlauf gespeichert';

  @override
  String get qrHomeStartScan => 'Scannen starten';

  @override
  String get qrHomeCreateTitle => 'Code erstellen';

  @override
  String get qrHomeCreateBody =>
      'Erstelle einen QR-Code aus Text oder einer URL und speichere oder teile ihn.';

  @override
  String get qrHomeBadgeShare => 'Überall teilen';

  @override
  String get qrHomeBadgeImage => 'Als Bild speichern';

  @override
  String get qrHomeOpenGenerator => 'Generator öffnen';

  @override
  String get qrHistoryTitle => 'Scanverlauf';

  @override
  String get qrHistoryMore => 'Weitere Optionen';

  @override
  String get qrHistoryEmpty => 'Gescannte Codes erscheinen hier.';

  @override
  String get wifiQrPlaceholder =>
      'WLAN-Daten eingeben,\num den QR-Code zu erstellen';

  @override
  String get wifiQrPreviewLabel => 'WLAN-QR-Code';

  @override
  String get wifiQrNetworkDetails => 'Netzwerkdaten';

  @override
  String get wifiQrSsidLabel => 'Netzwerkname (SSID)';

  @override
  String get wifiQrSsidHint => 'Mein WLAN';

  @override
  String get wifiQrPasswordLabel => 'Passwort';

  @override
  String get wifiQrPasswordHint => 'Passwort eingeben';

  @override
  String get wifiQrShowPassword => 'Passwort anzeigen';

  @override
  String get wifiQrHidePassword => 'Passwort verbergen';

  @override
  String get wifiQrSecurity => 'Sicherheit';

  @override
  String get wifiQrSecurityNone => 'Keine (offen)';

  @override
  String get wifiQrHidden => 'Verstecktes Netzwerk';

  @override
  String get wifiQrHiddenHint =>
      'Aktivieren, wenn der Netzwerkname nicht gesendet wird';

  @override
  String get wifiQrSaveImage => 'Bild speichern';

  @override
  String get wifiQrInfo =>
      'Wer diesen QR-Code scannt, verbindet sich automatisch mit deinem WLAN.';

  @override
  String get wifiQrShareText =>
      'Scanne diesen QR-Code, um dich mit meinem WLAN zu verbinden!';

  @override
  String get ocrCameraDenied =>
      'Kamerazugriff verweigert. Öffne die Einstellungen, um ihn zu erlauben.';

  @override
  String get ocrCameraRequired =>
      'Zum Fotografieren wird die Kameraberechtigung benötigt.';

  @override
  String get ocrTimeout =>
      'Das Lesen hat zu lange gedauert – das Textmodell wird evtl. noch geladen. Verbinde dich einmal mit WLAN oder versuche es erneut.';

  @override
  String get ocrFailed =>
      'Aus diesem Bild konnte kein Text gelesen werden. Versuche ein schärferes Foto.';

  @override
  String get ocrPreparing => 'Bild wird vorbereitet…';

  @override
  String get ocrScanning => 'Text wird gelesen…';

  @override
  String get ocrScriptLabel => 'Schriftsystem';

  @override
  String get ocrScriptHint =>
      'Wähle das Alphabet deines Textes. Arabisch, Urdu und Bengalisch werden noch nicht erkannt.';

  @override
  String get ocrScriptLatin => 'Lateinisch (Deutsch, Englisch…)';

  @override
  String get ocrScriptDevanagari => 'Devanagari (Hindi, Marathi…)';

  @override
  String get ocrScriptChinese => 'Chinesisch';

  @override
  String get ocrScriptJapanese => 'Japanisch';

  @override
  String get ocrScriptKorean => 'Koreanisch';

  @override
  String get ocrIdleTitle => 'Text aus jedem Bild herausholen';

  @override
  String get ocrIdleBody =>
      'Richte die Kamera aus oder wähle ein Foto – der Text wird sofort auf dem Gerät erkannt.';

  @override
  String get ocrBadgeOnDevice => 'KI auf dem Gerät';

  @override
  String get ocrBadgeLocal => 'Lokal verarbeitet';

  @override
  String get ocrBadgeBlocks => 'Blockweise kopieren';

  @override
  String get ocrUseCamera => 'Kamera verwenden';

  @override
  String get ocrChooseGallery => 'Aus Galerie wählen';

  @override
  String get ocrOnDeviceNote => 'Auf dem Gerät · kein Upload';

  @override
  String get ocrTabImage => 'Bild';

  @override
  String get ocrTabText => 'Text';

  @override
  String get ocrTapBlockHint =>
      'Tippe auf einen markierten Block, um ihn zu kopieren';

  @override
  String get ocrBlockTitle => 'Blocktext';

  @override
  String ocrBlockLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Zeilen · zum Kopieren tippen',
      one: '1 Zeile · zum Kopieren tippen',
    );
    return '$_temp0';
  }

  @override
  String get ocrCopyBlock => 'Block kopieren';

  @override
  String get ocrBlockCopied => 'Block kopiert';

  @override
  String get ocrCopyEntireBlock => 'Ganzen Block kopieren';

  @override
  String get ocrCopyLine => 'Zeile kopieren';

  @override
  String get ocrNoText => 'Kein Text erkannt – versuche ein schärferes Foto.';

  @override
  String get ocrQuickCopy => 'Schnell kopieren nach Abschnitt';

  @override
  String ocrBlockNCopied(int number) {
    return 'Block $number kopiert';
  }

  @override
  String get ocrDoneEditing => 'Bearbeitung fertig';

  @override
  String get ocrEditText => 'Text bearbeiten';

  @override
  String get ocrAllCopied => 'Gesamter Text kopiert';

  @override
  String get ocrCopyAll => 'Alles kopieren';

  @override
  String get ocrScanAgain => 'Scannen';

  @override
  String ocrStatLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Zeilen',
      one: '1 Zeile',
    );
    return '$_temp0';
  }

  @override
  String ocrStatWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Wörter',
      one: '1 Wort',
    );
    return '$_temp0';
  }

  @override
  String ocrStatChars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Zeichen',
      one: '1 Zeichen',
    );
    return '$_temp0';
  }

  @override
  String get wordPdfNoText =>
      'In diesem Dokument wurde kein auslesbarer Text gefunden.';

  @override
  String get wordPdfInfo =>
      'Wandelt .docx-Dateien in PDF um. Der Text bleibt erhalten; komplexe Layouts (Tabellen, Bilder) können abweichen.';

  @override
  String get wordPdfOpeningPicker => 'Dateiauswahl wird geöffnet…';

  @override
  String wordPdfConverting(int percent) {
    return 'Wird umgewandelt… $percent %';
  }

  @override
  String get wordPdfDone => 'Umwandlung abgeschlossen';

  @override
  String get wordPdfTapToPick => 'Tippen, um eine .docx-Datei zu wählen';

  @override
  String get wordPdfSupports => 'Unterstützt das .docx-Format';

  @override
  String get wordPdfFailed =>
      'Umwandlung fehlgeschlagen. Die Datei ist evtl. beschädigt oder kein .docx-Dokument.';

  @override
  String get wordPdfFontsOffline =>
      'In diesem PDF fehlt Text (z. B. Arabisch, Urdu, Hindi, Bengalisch oder Kyrillisch). Die Schrift wird einmalig geladen – verbinde dich mit dem Internet und wandle erneut um.';

  @override
  String get wordPdfConvertAnother => 'Weitere Datei umwandeln';

  @override
  String get wordPdfPick => '.docx-Datei wählen';

  @override
  String get wordPdfStep1Title => 'Word-Datei auswählen';

  @override
  String get wordPdfStep1Desc =>
      'Wähle eine .docx-Datei aus dem Gerätespeicher.';

  @override
  String get wordPdfStep2Title => 'Automatische Umwandlung';

  @override
  String get wordPdfStep2Desc =>
      'Der Text wird ausgelesen und auf A4-PDF-Seiten gesetzt.';

  @override
  String get wordPdfStep3Title => 'Teilen oder speichern';

  @override
  String get wordPdfStep3Desc =>
      'Teile das PDF mit jeder App, per E-Mail oder in die Cloud.';

  @override
  String get wordPdfReady => 'PDF fertig';
}
