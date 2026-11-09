// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Utility Toolbox';

  @override
  String get navTools => 'Outils';

  @override
  String get navFiles => 'Mes fichiers';

  @override
  String get settingsTooltip => 'Paramètres';

  @override
  String get searchHint => 'Rechercher : compresser pdf, scanner, jpg…';

  @override
  String get quickActions => 'Actions rapides';

  @override
  String get favorites => 'Favoris';

  @override
  String get recent => 'Récents';

  @override
  String searchNoResults(String query) {
    return 'Aucun outil pour « $query »';
  }

  @override
  String get toolMenuAddFavorite => 'Ajouter aux favoris';

  @override
  String get toolMenuRemoveFavorite => 'Retirer des favoris';

  @override
  String get toolMenuPinShortcut => 'Ajouter à l’écran d’accueil';

  @override
  String get pinShortcutRequested =>
      'Confirmez pour ajouter le raccourci à l’écran d’accueil';

  @override
  String get pinShortcutUnsupported =>
      'Votre écran d’accueil ne gère pas les raccourcis';

  @override
  String get newBadge => 'NOUVEAU';

  @override
  String get catScan => 'Scan & QR';

  @override
  String get catPdf => 'PDF';

  @override
  String get catImage => 'Photo & image';

  @override
  String get catText => 'Texte & traduction';

  @override
  String get catCalc => 'Calcul & conversion';

  @override
  String get catNetwork => 'Internet';

  @override
  String get catDevice => 'Appareil & position';

  @override
  String get catSecurity => 'Sécurité';

  @override
  String get catMedia => 'Vidéo & audio';

  @override
  String get toolDocScannerTitle => 'Scanner document';

  @override
  String get toolDocScannerDesc => 'Papier vers PDF, bords détectés';

  @override
  String get toolDocScannerKeywords =>
      'scanner, scanner document, numériser, scanner pdf, scan, reçu, ticket, facture, camscanner, scan paper, document, pdf scanner, receipt';

  @override
  String get toolQrScannerTitle => 'Scan QR & code-barres';

  @override
  String get toolQrScannerDesc => 'Avec l’appareil photo ou une image';

  @override
  String get toolQrScannerKeywords =>
      'lecteur qr, lire qr code, scanner qr code, code-barres, code barre, flasher qr, qr reader, barcode, scan code';

  @override
  String get toolQrGeneratorTitle => 'Créer un QR code';

  @override
  String get toolQrGeneratorDesc => 'Liens, texte, contacts et plus';

  @override
  String get toolQrGeneratorKeywords =>
      'générateur qr, créer qr code, faire un qr code, générer code-barres, qr maker, generate qr, barcode generator';

  @override
  String get toolOcrTitle => 'Image en texte';

  @override
  String get toolOcrDesc => 'Copiez le texte d’une photo (OCR)';

  @override
  String get toolOcrKeywords =>
      'ocr, extraire texte, photo en texte, image en texte, scanner texte, copier texte image, reconnaissance de texte, text scanner, extract text, copy text from image';

  @override
  String get toolWifiQrTitle => 'QR code WiFi';

  @override
  String get toolWifiQrDesc => 'Partagez le WiFi sans saisir de code';

  @override
  String get toolWifiQrKeywords =>
      'mot de passe wifi, partager wifi, code wifi, qr wifi, wifi password, share wifi';

  @override
  String get toolImageToPdfTitle => 'Image en PDF';

  @override
  String get toolImageToPdfDesc => 'Vos photos en un seul PDF';

  @override
  String get toolImageToPdfKeywords =>
      'jpg en pdf, photo en pdf, image en pdf, convertir photo en pdf, jpg to pdf, photo to pdf, picture to pdf';

  @override
  String get toolMergePdfTitle => 'Fusionner PDF';

  @override
  String get toolMergePdfDesc => 'Plusieurs PDF en un seul';

  @override
  String get toolMergePdfKeywords =>
      'fusionner pdf, assembler pdf, combiner pdf, regrouper pdf, join pdf, combine pdf';

  @override
  String get toolCompressPdfTitle => 'Compresser PDF';

  @override
  String get toolCompressPdfDesc => 'Réduisez un PDF pour l’envoyer';

  @override
  String get toolCompressPdfKeywords =>
      'réduire taille pdf, alléger pdf, compresser pdf, reduce pdf size, shrink pdf';

  @override
  String get toolSplitPdfTitle => 'Diviser PDF';

  @override
  String get toolSplitPdfDesc => 'Extraire ou supprimer des pages';

  @override
  String get toolSplitPdfKeywords =>
      'séparer pdf, diviser pdf, extraire pages, supprimer pages, couper pdf, extract pages, delete pages, cut pdf';

  @override
  String get toolPdfToImagesTitle => 'PDF en JPG';

  @override
  String get toolPdfToImagesDesc => 'Chaque page en image';

  @override
  String get toolPdfToImagesKeywords =>
      'pdf en image, pdf en jpg, pdf en png, pdf to image, pdf to png, pdf pages';

  @override
  String get toolProtectPdfTitle => 'Verrouiller PDF';

  @override
  String get toolProtectPdfDesc => 'Protégez un PDF par mot de passe';

  @override
  String get toolProtectPdfKeywords =>
      'protéger pdf, mot de passe pdf, crypter pdf, sécuriser pdf, password pdf, encrypt pdf, secure pdf';

  @override
  String get toolUnlockPdfTitle => 'Déverrouiller PDF';

  @override
  String get toolUnlockPdfDesc => 'Retirez un mot de passe connu';

  @override
  String get toolUnlockPdfKeywords =>
      'supprimer mot de passe pdf, enlever mot de passe pdf, décrypter pdf, remove pdf password, decrypt pdf';

  @override
  String get toolWordToPdfTitle => 'Word en PDF';

  @override
  String get toolWordToPdfDesc => 'Convertir des fichiers .docx';

  @override
  String get toolWordToPdfKeywords =>
      'word en pdf, doc en pdf, docx, doc to pdf, word';

  @override
  String get toolImageCompressorTitle => 'Compresser photo';

  @override
  String get toolImageCompressorDesc => 'Fichier plus léger, même rendu';

  @override
  String get toolImageCompressorKeywords =>
      'réduire taille photo, compresser image, compresser jpg, alléger photo, ko, reduce image size, compress jpg, kb';

  @override
  String get toolImageResizerTitle => 'Taille & format';

  @override
  String get toolImageResizerDesc => 'Taille exacte, JPG, PNG ou WEBP';

  @override
  String get toolImageResizerKeywords =>
      'redimensionner image, changer taille photo, jpg en png, png en jpg, photo d’identité, resize image, jpg to png, png to jpg, webp, passport size';

  @override
  String get toolImageEnhancerTitle => 'Éditeur photo';

  @override
  String get toolImageEnhancerDesc => 'Filtres, recadrage, luminosité et plus';

  @override
  String get toolImageEnhancerKeywords =>
      'retoucher photo, modifier photo, filtre, recadrer, pivoter, edit photo, filter, crop, rotate';

  @override
  String get toolAiUpscalerTitle => 'Agrandir photo IA';

  @override
  String get toolAiUpscalerDesc => 'Photos jusqu’à 4× plus grandes et nettes';

  @override
  String get toolAiUpscalerKeywords =>
      'améliorer photo, hd, augmenter résolution, photo floue, ia, ai, enhance, increase resolution, blurry';

  @override
  String get toolTranslationTitle => 'Traduire';

  @override
  String get toolTranslationDesc => 'Hors ligne, avec voix et lecture';

  @override
  String get toolTranslationKeywords =>
      'traducteur, traduction, traduire, langue, dictionnaire, translator, language, dictionary';

  @override
  String get toolTextUtilitiesTitle => 'Outils texte';

  @override
  String get toolTextUtilitiesDesc => 'Compter les mots, casse, Base64';

  @override
  String get toolTextUtilitiesKeywords =>
      'compteur de mots, compter mots, majuscules, minuscules, base64, word counter, uppercase, lowercase';

  @override
  String get toolSmartClipboardTitle => 'Presse-papiers';

  @override
  String get toolSmartClipboardDesc =>
      'Gardez, épinglez et cherchez vos copies';

  @override
  String get toolSmartClipboardKeywords =>
      'copier coller, notes, historique presse-papiers, copy paste, clipboard history';

  @override
  String get toolCalculatorTitle => 'Calculatrice';

  @override
  String get toolCalculatorDesc => 'Calculatrice avec historique';

  @override
  String get toolCalculatorKeywords =>
      'calcul, calculette, maths, pourcentage, calc, math, percent';

  @override
  String get toolAgeCalculatorTitle => 'Âge & date';

  @override
  String get toolAgeCalculatorDesc => 'Âge exact et jours entre deux dates';

  @override
  String get toolAgeCalculatorKeywords =>
      'anniversaire, calcul âge, différence de dates, compteur de jours, birthday, date difference, days counter';

  @override
  String get toolUnitConverterTitle => 'Conversion d’unités';

  @override
  String get toolUnitConverterDesc => 'Longueur, poids, température et plus';

  @override
  String get toolUnitConverterKeywords =>
      'convertisseur, convertir unités, cm en pouce, kg en livre, celsius, fahrenheit, convert units, cm to inch, kg to lb';

  @override
  String get toolLoanCalculatorTitle => 'Prêt & mensualités';

  @override
  String get toolLoanCalculatorDesc => 'Mensualité et intérêts totaux';

  @override
  String get toolLoanCalculatorKeywords =>
      'simulateur prêt, crédit, mensualité, emprunt, taux, intérêts, emi, mortgage, interest, installment';

  @override
  String get toolTimezoneTitle => 'Horloge mondiale';

  @override
  String get toolTimezoneDesc => 'L’heure partout, avec un widget';

  @override
  String get toolTimezoneKeywords =>
      'fuseau horaire, horloge, heure ville, heure mondiale, time zone, clock, city time';

  @override
  String get toolColorPickerTitle => 'Pipette couleur';

  @override
  String get toolColorPickerDesc => 'HEX, RGB, HSL et CMYK';

  @override
  String get toolColorPickerKeywords =>
      'code couleur, couleur, hex, rgb, palette, color code';

  @override
  String get toolSpeedTestTitle => 'Test débit internet';

  @override
  String get toolSpeedTestDesc => 'Téléchargement, envoi et ping';

  @override
  String get toolSpeedTestKeywords =>
      'test de débit, vitesse internet, vitesse wifi, speedtest, mbps, wifi speed, internet speed';

  @override
  String get toolIpPingTitle => 'IP & ping';

  @override
  String get toolIpPingDesc => 'Votre adresse IP et ping d’un hôte';

  @override
  String get toolIpPingKeywords =>
      'mon ip, adresse ip, ping, réseau, my ip, network';

  @override
  String get toolCompassTitle => 'Boussole';

  @override
  String get toolCompassDesc => 'Cap et orientation';

  @override
  String get toolCompassKeywords =>
      'direction, nord, orientation, qibla, north';

  @override
  String get toolLocationSaverTitle => 'Enregistrer position';

  @override
  String get toolLocationSaverDesc => 'Gardez et partagez vos lieux GPS';

  @override
  String get toolLocationSaverKeywords =>
      'parking, garer voiture, gps, carte, coordonnées, position, map, coordinates';

  @override
  String get toolPasswordGeneratorTitle => 'Générer mot de passe';

  @override
  String get toolPasswordGeneratorDesc => 'Mots de passe forts et aléatoires';

  @override
  String get toolPasswordGeneratorKeywords =>
      'mot de passe sécurisé, générateur mot de passe, aléatoire, secure password, random';

  @override
  String get toolHashGeneratorTitle => 'Générateur de hash';

  @override
  String get toolHashGeneratorDesc =>
      'MD5, SHA-1, SHA-256 de texte ou fichiers';

  @override
  String get toolHashGeneratorKeywords =>
      'somme de contrôle, empreinte, hash, checksum, md5, sha256';

  @override
  String get toolVideoConverterTitle => 'Convertir vidéo';

  @override
  String get toolVideoConverterDesc => 'Vidéo en MP3, GIF, MP4 et plus';

  @override
  String get toolVideoConverterKeywords =>
      'vidéo en mp3, créer gif, extraire audio, convertisseur vidéo, video to mp3, gif maker, audio extract';

  @override
  String get filesEmptyTitle => 'Aucun fichier pour l’instant';

  @override
  String get filesEmptyBody =>
      'Les PDF, images et autres fichiers que vous créez apparaîtront ici pour les ouvrir ou les partager à nouveau.';

  @override
  String get fileOpen => 'Ouvrir';

  @override
  String get fileShare => 'Partager';

  @override
  String get fileRemoveFromList => 'Retirer de la liste';

  @override
  String get fileOpenFailed =>
      'Impossible d’ouvrir ce fichier. Il a peut-être été déplacé ou supprimé.';

  @override
  String get filesClearList => 'Vider la liste';

  @override
  String get filesClearConfirm =>
      'Vider la liste ? Vos fichiers restent sur l’appareil.';

  @override
  String get incomingSheetTitle => 'Que voulez-vous faire ?';

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
      other: '$count PDF',
      one: '1 PDF',
    );
    return '$_temp0';
  }

  @override
  String get incomingText => 'Texte partagé';

  @override
  String get incomingDocument => 'Document Word';

  @override
  String get incomingVideo => 'Vidéo';

  @override
  String get incomingUnsupported =>
      'Ce type de fichier n’est pas encore pris en charge';

  @override
  String get incomingFailed => 'Impossible de lire le fichier partagé';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsAppearance => 'Apparence';

  @override
  String get settingsTheme => 'Thème';

  @override
  String get themeSystem => 'Auto';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get languageSystem => 'Langue du système';

  @override
  String get settingsPurchases => 'Achats';

  @override
  String get removeAdsTitle => 'Supprimer les pubs';

  @override
  String get removeAdsSubtitle => 'Achat unique, sans abonnement';

  @override
  String get restorePurchasesTitle => 'Restaurer les achats';

  @override
  String get restorePurchasesSubtitle => 'Récupérer un achat sur cet appareil';

  @override
  String get settingsSupport => 'Aide & confidentialité';

  @override
  String get shareAppTitle => 'Partager l’appli';

  @override
  String get shareAppSubtitle => 'Parlez d’Utility Toolbox à un ami';

  @override
  String shareAppMessage(String url) {
    return 'J’utilise Utility Toolbox pour scanner des documents, modifier des PDF, lire des QR codes et traduire hors ligne. Gratuit : $url';
  }

  @override
  String get rateAppTitle => 'Noter l’appli';

  @override
  String get rateAppSubtitle => 'Un petit avis aide beaucoup';

  @override
  String get privacyPolicyTitle => 'Politique de confidentialité';

  @override
  String get privacyPolicySubtitle => 'Ce que l’appli utilise et pourquoi';

  @override
  String get privacyChoicesTitle => 'Confidentialité des pubs';

  @override
  String get privacyChoicesSubtitle =>
      'Modifier votre accord pour les pubs personnalisées';

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get onboardingSkip => 'Passer';

  @override
  String get onboardingNext => 'Suivant';

  @override
  String get onboardingStart => 'C’est parti';

  @override
  String get onboarding1Title => 'Tous les outils,\nune seule appli';

  @override
  String get onboarding1Body =>
      'Scannez des documents, modifiez des PDF, lisez des QR codes, traduisez et redimensionnez des photos — sans installer dix applis.';

  @override
  String get onboarding2Title => 'Marche depuis\ntoutes vos applis';

  @override
  String get onboarding2Body =>
      'Partagez une photo ou un PDF vers Utility Toolbox, sélectionnez du texte pour le traduire, ou appuyez longuement sur l’icône pour les raccourcis.';

  @override
  String get onboarding3Title => 'Rapide, hors ligne\net privé';

  @override
  String get onboarding3Body =>
      'Presque tout fonctionne sur votre téléphone. Vos fichiers ne sont jamais envoyés, sauf si vous activez vous-même une option cloud.';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonClear => 'Effacer';
}
