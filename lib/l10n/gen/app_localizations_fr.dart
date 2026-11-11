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

  @override
  String get toolBgRemoverTitle => 'Supprimer l’arrière-plan';

  @override
  String get toolBgRemoverDesc => 'Détourez personnes et objets en un geste';

  @override
  String get toolBgRemoverKeywords =>
      'supprimer arrière-plan, effacer fond, détourage, détourer, transparent, autocollant, photo d’identité, fond blanc, remove background, remove bg, cutout, png';

  @override
  String get toolBmiTitle => 'Calcul de l’IMC';

  @override
  String get toolBmiDesc => 'Votre indice de masse corporelle et poids santé';

  @override
  String get toolBmiKeywords =>
      'IMC, indice de masse corporelle, poids, taille, poids idéal, obésité, santé, bmi, body mass index, weight, height, ideal weight, obesity';

  @override
  String get toolBubbleLevelTitle => 'Niveau à bulle';

  @override
  String get toolBubbleLevelDesc =>
      'Vérifiez que étagères et cadres sont droits';

  @override
  String get toolBubbleLevelKeywords =>
      'niveau, niveau à bulle, droit, angle, inclinaison, inclinomètre, level, spirit level, bubble level, tilt';

  @override
  String get toolCurrencyTitle => 'Convertisseur de devises';

  @override
  String get toolCurrencyDesc => 'Taux de change de plus de 150 devises';

  @override
  String get toolCurrencyKeywords =>
      'devise, monnaie, taux de change, argent, convertir, dollar, euro, dirham, dinar, franc, currency, exchange rate, money, convert, forex';

  @override
  String get toolDirectChatTitle => 'Chat direct';

  @override
  String get toolDirectChatDesc =>
      'Écrire sur WhatsApp sans enregistrer le numéro';

  @override
  String get toolDirectChatKeywords =>
      'whatsapp, chat direct, message, numéro non enregistré, envoyer un message, direct chat, unsaved number, click to chat, wa.me, send message, chat';

  @override
  String get toolFlashlightTitle => 'Lampe torche';

  @override
  String get toolFlashlightDesc => 'Lampe puissante avec SOS et stroboscope';

  @override
  String get toolFlashlightKeywords =>
      'lampe torche, lampe de poche, lumière, flash, stroboscope, torche, flashlight, torch, light, led, sos, strobe';

  @override
  String get toolOrganizePdfTitle => 'Organiser un PDF';

  @override
  String get toolOrganizePdfDesc =>
      'Réorganisez, faites pivoter ou supprimez des pages';

  @override
  String get toolOrganizePdfKeywords =>
      'organiser, réorganiser, pivoter, tourner, supprimer des pages, trier, organize, organise, reorder, rotate, delete pages, remove pages, arrange, sort, pdf';

  @override
  String get toolPdfToTextTitle => 'PDF en texte';

  @override
  String get toolPdfToTextDesc => 'Copiez tout le texte d’un PDF';

  @override
  String get toolPdfToTextKeywords =>
      'extraire le texte, copier le texte, pdf en txt, convertir, lire pdf, pdf to text, extract text, copy text, txt, read pdf, convert, pdf to word';

  @override
  String get toolPercentageTitle => 'Pourcentage et remise';

  @override
  String get toolPercentageDesc =>
      'Pourcentages, remises, pourboires et TVA en un instant';

  @override
  String get toolPercentageKeywords =>
      'pourcentage, pour cent, remise, réduction, soldes, pourboire, partager l’addition, TVA, taxe, percentage, percent, discount, tip, split bill, tax, vat';

  @override
  String get toolSignPdfTitle => 'Signer un PDF';

  @override
  String get toolSignPdfDesc =>
      'Dessinez votre signature et placez-la sur n’importe quelle page';

  @override
  String get toolSignPdfKeywords =>
      'signer, signature, signature électronique, remplir et signer, parapher, sign, signature, e-sign, esign, fill and sign, autograph, pdf';

  @override
  String get toolStopwatchTitle => 'Chronomètre et minuteur';

  @override
  String get toolStopwatchDesc => 'Chronomètre avec tours et compte à rebours';

  @override
  String get toolStopwatchKeywords =>
      'chronomètre, minuteur, compte à rebours, tour, alarme, horloge, minuteur de cuisine, sport, stopwatch, timer, countdown, lap';

  @override
  String get toolWatermarkPdfTitle => 'Filigrane et numéros de page';

  @override
  String get toolWatermarkPdfDesc =>
      'Ajoutez un texte ou des numéros sur chaque page';

  @override
  String get toolWatermarkPdfKeywords =>
      'filigrane, tampon, numéros de page, numéroter, confidentiel, brouillon, pied de page, en-tête, watermark, stamp, page numbers, number pages, confidential, draft, footer, header, pdf';

  @override
  String get bmiMetric => 'Métrique (cm, kg)';

  @override
  String get bmiImperial => 'Impérial (ft, lb)';

  @override
  String get bmiHeight => 'Taille';

  @override
  String get bmiWeight => 'Poids';

  @override
  String get bmiFeet => 'Pieds';

  @override
  String get bmiInches => 'Pouces';

  @override
  String get bmiUnitCm => 'cm';

  @override
  String get bmiUnitKg => 'kg';

  @override
  String get bmiUnitLb => 'lb';

  @override
  String get bmiUnitFt => 'pi';

  @override
  String get bmiUnitIn => 'po';

  @override
  String get bmiAge => 'Âge (facultatif)';

  @override
  String get bmiSex => 'Sexe (facultatif)';

  @override
  String get bmiMale => 'Homme';

  @override
  String get bmiFemale => 'Femme';

  @override
  String get bmiYourBmi => 'Votre IMC';

  @override
  String get bmiUnderweight => 'Insuffisance pondérale';

  @override
  String get bmiNormal => 'Poids normal';

  @override
  String get bmiOverweight => 'Surpoids';

  @override
  String get bmiObese => 'Obésité';

  @override
  String bmiHealthyRange(String min, String max) {
    return 'Poids santé pour votre taille : $min – $max';
  }

  @override
  String bmiToLose(String amount) {
    return 'Environ $amount au-dessus de la zone santé';
  }

  @override
  String bmiToGain(String amount) {
    return 'Environ $amount en dessous de la zone santé';
  }

  @override
  String bmiIdealWeight(String weight) {
    return 'Poids idéal estimé : $weight';
  }

  @override
  String get bmiChildNote =>
      'Chez les moins de 18 ans, l’IMC se lit avec des courbes de croissance selon l’âge. Ces résultats utilisent les seuils adultes.';

  @override
  String get bmiDisclaimer =>
      'L’IMC est un repère général, pas un diagnostic médical.';

  @override
  String get bmiEnterValues => 'Saisissez votre taille et votre poids';

  @override
  String get currencyAmount => 'Montant';

  @override
  String get currencyFrom => 'De';

  @override
  String get currencyTo => 'Vers';

  @override
  String get currencySwap => 'Inverser les devises';

  @override
  String get currencyChoose => 'Choisir la devise';

  @override
  String get currencySearchHint => 'Rechercher une devise ou un code';

  @override
  String get currencyAll => 'Toutes les devises';

  @override
  String currencyRatesFrom(String date) {
    return 'Taux du $date';
  }

  @override
  String get currencyRefresh => 'Actualiser les taux';

  @override
  String get currencyUpdating => 'Mise à jour des taux…';

  @override
  String get currencyOfflineCached =>
      'Mise à jour impossible. Taux enregistrés affichés.';

  @override
  String get currencyNoRatesTitle => 'Taux pas encore téléchargés';

  @override
  String get currencyNoRatesBody =>
      'Connectez-vous une fois à Internet pour télécharger les taux de change. Ensuite, le convertisseur fonctionne aussi hors ligne.';

  @override
  String get currencyRetry => 'Réessayer';

  @override
  String get currencyOtherFavorites => 'Vos devises favorites';

  @override
  String get currencyFavoritesHint =>
      'Touchez ☆ à côté d’une devise dans la liste pour l’ajouter ici.';

  @override
  String get currencyCopy => 'Copier le résultat';

  @override
  String get currencyCopied => 'Copié';

  @override
  String get currencyNoMatch => 'Aucune devise trouvée';

  @override
  String get currencyDisclaimer =>
      'Les taux sont indicatifs et peuvent différer de ceux de votre banque.';

  @override
  String get directChatPhone => 'Numéro de téléphone';

  @override
  String get directChatCountryCode => 'Indicatif du pays';

  @override
  String get directChatSearchCountry => 'Rechercher un pays ou un indicatif';

  @override
  String get directChatNoCountry => 'Aucun pays trouvé';

  @override
  String get directChatMessage => 'Message (facultatif)';

  @override
  String get directChatOpen => 'Ouvrir dans WhatsApp';

  @override
  String get directChatPaste => 'Coller le numéro';

  @override
  String get directChatPasteNone =>
      'Aucun numéro de téléphone dans le presse-papiers';

  @override
  String get directChatTooShort => 'Ce numéro semble trop court';

  @override
  String get directChatTooLong => 'Ce numéro semble trop long';

  @override
  String directChatWillOpen(String number) {
    return 'Discussion avec $number';
  }

  @override
  String get directChatOpenFailed =>
      'Impossible d’ouvrir la discussion. WhatsApp est-il installé ?';

  @override
  String get directChatHint =>
      'Écrivez à n’importe quel numéro sans l’enregistrer dans vos contacts.';

  @override
  String get directChatNotAffiliated =>
      'Outil indépendant, sans lien avec WhatsApp ou Meta.';

  @override
  String get percentageTabPercent => 'Pourcentage';

  @override
  String get percentageTabDiscount => 'Remise';

  @override
  String get percentageTabTip => 'Pourboire';

  @override
  String get percentageTabTax => 'Taxe / TVA';

  @override
  String get percentageOfTitle => 'Pourcentage d’un nombre';

  @override
  String get percentageFieldPercent => 'Pourcentage';

  @override
  String get percentageFieldNumber => 'Nombre';

  @override
  String percentageOfResult(String percent, String number) {
    return '$percent de $number';
  }

  @override
  String get percentageWhatTitle => 'Quel pourcentage ?';

  @override
  String get percentageFieldPart => 'Valeur';

  @override
  String get percentageFieldTotal => 'Total';

  @override
  String percentageWhatResult(String part, String total) {
    return '$part sur $total';
  }

  @override
  String get percentageChangeTitle => 'Variation en pourcentage';

  @override
  String get percentageFieldOld => 'Ancienne valeur';

  @override
  String get percentageFieldNew => 'Nouvelle valeur';

  @override
  String percentageIncrease(String percent) {
    return 'Hausse de $percent';
  }

  @override
  String percentageDecrease(String percent) {
    return 'Baisse de $percent';
  }

  @override
  String get percentageNoChange => 'Aucun changement';

  @override
  String get percentageDifference => 'Différence';

  @override
  String get percentagePrice => 'Prix initial';

  @override
  String get percentageDiscount => 'Remise';

  @override
  String get percentageExtraDiscount => 'Remise supplémentaire (facultatif)';

  @override
  String get percentageYouPay => 'Vous payez';

  @override
  String get percentageYouSave => 'Vous économisez';

  @override
  String get percentageTotalDiscount => 'Remise totale';

  @override
  String get percentageBill => 'Montant de l’addition';

  @override
  String get percentageTip => 'Pourboire';

  @override
  String get percentageCustom => 'Autre';

  @override
  String get percentagePeople => 'Personnes';

  @override
  String get percentageAddPerson => 'Ajouter une personne';

  @override
  String get percentageRemovePerson => 'Retirer une personne';

  @override
  String get percentageTipAmount => 'Montant du pourboire';

  @override
  String get percentageTotal => 'Total';

  @override
  String get percentagePerPerson => 'Chacun paie';

  @override
  String get percentageTaxRate => 'Taux de taxe';

  @override
  String get percentageAddTax => 'Ajouter la taxe';

  @override
  String get percentageRemoveTax => 'Retirer la taxe';

  @override
  String get percentagePriceExclTax => 'Prix HT';

  @override
  String get percentagePriceInclTax => 'Prix TTC';

  @override
  String get percentageBeforeTax => 'Hors taxe';

  @override
  String get percentageTaxAmount => 'Taxe';

  @override
  String get percentageAfterTax => 'Total TTC';

  @override
  String get percentageEnterValues =>
      'Saisissez des nombres pour voir le résultat';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonShare => 'Partager';

  @override
  String get commonCopy => 'Copier';

  @override
  String get commonCopied => 'Copié';

  @override
  String get commonRetry => 'Réessayer';

  @override
  String get commonDone => 'Terminé';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonUndo => 'Annuler';

  @override
  String get commonOpen => 'Ouvrir';

  @override
  String get commonReset => 'Réinitialiser';

  @override
  String get commonClose => 'Fermer';

  @override
  String get commonOpenSettings => 'Ouvrir les paramètres';

  @override
  String get commonChoosePhoto => 'Choisir une photo';

  @override
  String get commonChooseFile => 'Choisir un fichier';

  @override
  String get commonCamera => 'Appareil photo';

  @override
  String get commonGallery => 'Galerie';

  @override
  String get commonWorking => 'Traitement…';

  @override
  String get commonSavedToGallery => 'Enregistré dans la galerie';

  @override
  String get commonSavedToDownloads => 'Enregistré dans Téléchargements';

  @override
  String get commonSaveFailed => 'Impossible d\'enregistrer le fichier';

  @override
  String get commonErrorGeneric =>
      'Une erreur s\'est produite. Veuillez réessayer.';

  @override
  String get commonErrorOffline => 'Pas de connexion Internet';

  @override
  String get commonErrorTimeout => 'Délai dépassé. Veuillez réessayer.';

  @override
  String get commonPermissionNeeded =>
      'Autorisation requise. Activez-la dans les paramètres.';

  @override
  String get commonResult => 'Résultat';

  @override
  String get commonStart => 'Démarrer';

  @override
  String get commonStop => 'Arrêter';

  @override
  String get commonClearAll => 'Tout effacer';

  @override
  String get commonPaste => 'Coller';

  @override
  String get commonSearch => 'Rechercher';

  @override
  String get organizePdfHint =>
      'Touchez les pages pour les sélectionner. Maintenez une page appuyée puis faites-la glisser pour la déplacer.';

  @override
  String organizePdfSelected(int count) {
    return '$count sélectionnée(s)';
  }

  @override
  String get organizePdfRotateLeft => 'Pivoter à gauche';

  @override
  String get organizePdfRotateRight => 'Pivoter à droite';

  @override
  String get organizePdfDelete => 'Supprimer';

  @override
  String get organizePdfSelectAll => 'Tout sélectionner';

  @override
  String get organizePdfClearSelection => 'Désélectionner';

  @override
  String organizePdfDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages supprimées',
      one: '1 page supprimée',
    );
    return '$_temp0';
  }

  @override
  String get organizePdfUndo => 'Annuler';

  @override
  String get organizePdfKeepOne => 'Un PDF doit contenir au moins une page.';

  @override
  String get organizePdfNoChanges =>
      'Aucune modification — déplacez, faites pivoter ou supprimez d’abord des pages.';

  @override
  String get organizePdfReset => 'Annuler toutes les modifications';

  @override
  String get organizePdfMoveEarlier => 'Déplacer avant';

  @override
  String get organizePdfMoveLater => 'Déplacer après';

  @override
  String get organizePdfSave => 'Enregistrer le PDF';

  @override
  String get organizePdfFailed => 'Impossible d’enregistrer ce PDF.';

  @override
  String get organizePdfResult => 'Votre PDF réorganisé est prêt';

  @override
  String pdfToTextReading(int current, int total) {
    return 'Lecture de la page $current sur $total…';
  }

  @override
  String pdfToTextWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mots',
      one: '1 mot',
    );
    return '$_temp0';
  }

  @override
  String get pdfToTextCopyAll => 'Tout copier';

  @override
  String get pdfToTextCopied => 'Texte copié';

  @override
  String get pdfToTextSaveTxt => 'Enregistrer en .txt';

  @override
  String get pdfToTextEmptyPage => 'Aucun texte sur cette page';

  @override
  String get pdfToTextScannedTitle => 'Aucun texte trouvé';

  @override
  String get pdfToTextScannedBody =>
      'Ce PDF semble être un scan ou des photos : il n’y a pas de texte à copier. Nous pouvons plutôt lire les mots de la page 1 à partir de l’image.';

  @override
  String pdfToTextOpenOcr(String tool) {
    return 'Lire la page 1 avec $tool';
  }

  @override
  String get pdfToTextFailed => 'Impossible de lire le texte de ce PDF.';

  @override
  String pdfToTextPartlyScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count pages ne contiennent pas de texte (elles sont peut-être scannées).',
      one: '1 page ne contient pas de texte (elle est peut-être scannée).',
    );
    return '$_temp0';
  }

  @override
  String get pdfEditChoosePdf => 'Choisir un PDF';

  @override
  String get pdfEditChooseHint =>
      'Ou partagez un PDF vers Utility Toolbox depuis n’importe quelle appli';

  @override
  String get pdfEditChange => 'Changer';

  @override
  String get pdfEditReading => 'Lecture…';

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
  String get pdfEditInvalidPdf =>
      'Ce fichier ne semble pas être un PDF valide.';

  @override
  String get pdfEditLocked =>
      'Ce PDF est protégé par un mot de passe. Retirez d’abord le mot de passe, puis réessayez.';

  @override
  String get pdfEditLockedShort => 'Protégé par mot de passe';

  @override
  String get pdfEditPreviewFailed => 'Impossible d’afficher cette page.';

  @override
  String get pdfEditResultReady => 'Votre PDF est prêt';

  @override
  String get pdfEditSaveDownloads => 'Enregistrer dans Téléchargements';

  @override
  String get pdfEditShare => 'Partager';

  @override
  String get pdfEditStartOver => 'Recommencer';

  @override
  String get pdfEditSavedToDownloads =>
      'Enregistré dans Téléchargements — retrouvez-le dans Mes fichiers';

  @override
  String get pdfEditSharedInstead =>
      'Le menu de partage a été ouvert à la place';

  @override
  String get pdfEditSaveFailed =>
      'Impossible de créer le fichier. Veuillez réessayer.';

  @override
  String get signPdfStepPdf => 'Choisissez votre PDF';

  @override
  String get signPdfStepSignature => 'Créez votre signature';

  @override
  String get signPdfStepPlace =>
      'Touchez une page pour y placer votre signature';

  @override
  String get signPdfDraw => 'Dessiner la signature';

  @override
  String get signPdfDrawAgain => 'Redessiner';

  @override
  String get signPdfUseSaved => 'Utiliser la signature enregistrée';

  @override
  String get signPdfDeleteSaved => 'Supprimer la signature enregistrée';

  @override
  String get signPdfSavedDeleted => 'Signature enregistrée supprimée';

  @override
  String get signPdfDrawTitle => 'Dessinez votre signature';

  @override
  String get signPdfDrawHint => 'Signez ici avec votre doigt';

  @override
  String get signPdfUndo => 'Annuler';

  @override
  String get signPdfInkBlack => 'Noir';

  @override
  String get signPdfInkBlue => 'Bleu';

  @override
  String get signPdfRemember =>
      'Enregistrer la signature pour la prochaine fois';

  @override
  String get signPdfDone => 'Utiliser cette signature';

  @override
  String get signPdfEmpty => 'Dessinez d’abord votre signature.';

  @override
  String get signPdfSignatureLabel => 'Votre signature';

  @override
  String get signPdfPlaceHint =>
      'Faites glisser pour déplacer, pincez ou utilisez le curseur pour redimensionner. Touchez la page pour y placer la signature.';

  @override
  String get signPdfSize => 'Taille';

  @override
  String get signPdfPlaceConfirm => 'Placer ici';

  @override
  String get signPdfRemoveFromPage => 'Retirer de cette page';

  @override
  String get signPdfAllPages => 'Ajouter à toutes les pages';

  @override
  String signPdfAllPagesDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Signature ajoutée aux $count pages',
      one: 'Signature ajoutée à 1 page',
    );
    return '$_temp0';
  }

  @override
  String get signPdfClearAll => 'Tout retirer';

  @override
  String signPdfPlacedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Signé sur $count pages',
      one: 'Signé sur 1 page',
      zero: 'Aucune page signée pour l’instant',
    );
    return '$_temp0';
  }

  @override
  String get signPdfSave => 'Enregistrer le PDF signé';

  @override
  String get signPdfNoPlacement =>
      'Touchez d’abord une page pour y placer votre signature.';

  @override
  String get signPdfFailed => 'Impossible de signer ce PDF.';

  @override
  String get signPdfResult => 'Votre PDF signé est prêt';

  @override
  String get watermarkPdfModeText => 'Filigrane texte';

  @override
  String get watermarkPdfModeNumbers => 'Numéros de page';

  @override
  String get watermarkPdfText => 'Texte du filigrane';

  @override
  String get watermarkPdfDefaultText => 'CONFIDENTIEL';

  @override
  String get watermarkPdfTextEmpty =>
      'Saisissez d’abord le texte du filigrane.';

  @override
  String get watermarkPdfSize => 'Taille du texte';

  @override
  String get watermarkPdfOpacity => 'Opacité';

  @override
  String get watermarkPdfLayout => 'Disposition';

  @override
  String get watermarkPdfDiagonal => 'Diagonale';

  @override
  String get watermarkPdfCenter => 'Centre';

  @override
  String get watermarkPdfTiled => 'Mosaïque';

  @override
  String get watermarkPdfColor => 'Couleur';

  @override
  String get watermarkPdfColorGrey => 'Gris';

  @override
  String get watermarkPdfColorRed => 'Rouge';

  @override
  String get watermarkPdfColorBlue => 'Bleu';

  @override
  String get watermarkPdfColorBlack => 'Noir';

  @override
  String get watermarkPdfColorGreen => 'Vert';

  @override
  String get watermarkPdfFormat => 'Format';

  @override
  String watermarkPdfPageLabel(String number) {
    return 'Page $number';
  }

  @override
  String get watermarkPdfPosition => 'Position';

  @override
  String get watermarkPdfBottomCenter => 'En bas au centre';

  @override
  String get watermarkPdfBottomRight => 'En bas à droite';

  @override
  String get watermarkPdfTopRight => 'En haut à droite';

  @override
  String get watermarkPdfStartAt => 'Commencer à';

  @override
  String get watermarkPdfDecrease => 'Diminuer';

  @override
  String get watermarkPdfIncrease => 'Augmenter';

  @override
  String get watermarkPdfPreview => 'Aperçu (page 1)';

  @override
  String get watermarkPdfApplyText => 'Ajouter le filigrane';

  @override
  String get watermarkPdfApplyNumbers => 'Ajouter les numéros de page';

  @override
  String get watermarkPdfFailed => 'Impossible de modifier ce PDF.';

  @override
  String get bgRemoverPickTitle => 'Choisissez une photo';

  @override
  String get bgRemoverPickBody =>
      'Idéal pour les personnes, les animaux et les objets. Votre photo est traitée sur votre téléphone.';

  @override
  String get bgRemoverGallery => 'Choisir dans la galerie';

  @override
  String get bgRemoverCamera => 'Prendre une photo';

  @override
  String get bgRemoverPreparing => 'Préparation de la photo…';

  @override
  String get bgRemoverWorking => 'Suppression de l’arrière-plan…';

  @override
  String get bgRemoverDownloading =>
      'Préparation de l’outil de suppression d’arrière-plan. Cela n’arrive qu’une fois et nécessite Internet…';

  @override
  String get bgRemoverDownloadFailed =>
      'L’outil n’est pas encore prêt : les services Google Play sont toujours en train de le télécharger. Vérifiez votre connexion Internet et réessayez dans une minute.';

  @override
  String get bgRemoverNoSubject =>
      'Aucune personne ni aucun objet trouvé sur cette photo. Essayez une photo avec un sujet bien visible.';

  @override
  String get bgRemoverOpenFailed =>
      'Impossible d’ouvrir cette photo. Essayez-en une autre.';

  @override
  String get bgRemoverFailed =>
      'Un problème est survenu lors de la suppression de l’arrière-plan. Veuillez réessayer.';

  @override
  String get bgRemoverRetry => 'Réessayer';

  @override
  String get bgRemoverAnotherPhoto => 'Choisir une autre photo';

  @override
  String get bgRemoverNewPhoto => 'Nouvelle photo';

  @override
  String get bgRemoverBefore => 'Avant';

  @override
  String get bgRemoverAfter => 'Après';

  @override
  String get bgRemoverCompare => 'Comparer avant et après';

  @override
  String get bgRemoverCompareHint => 'Faites glisser le curseur pour comparer';

  @override
  String get bgRemoverBgTransparent => 'Transparent';

  @override
  String get bgRemoverBgWhite => 'Blanc';

  @override
  String get bgRemoverBgBlack => 'Noir';

  @override
  String get bgRemoverBgBlue => 'Bleu';

  @override
  String get bgRemoverBgRed => 'Rouge';

  @override
  String get bgRemoverBgYellow => 'Jaune';

  @override
  String get bgRemoverBgBlur => 'Flou';

  @override
  String get bgRemoverSave => 'Enregistrer dans la galerie';

  @override
  String get bgRemoverSaved => 'Enregistrée dans votre galerie';

  @override
  String get bgRemoverSaveFailed =>
      'Impossible d’enregistrer l’image. Veuillez réessayer.';

  @override
  String get bgRemoverPngHint => 'PNG avec fond transparent';

  @override
  String get bgRemoverJpgHint => 'JPG avec le fond choisi';

  @override
  String get bubbleLevelSurfaceHint =>
      'Posez le téléphone à plat sur la surface';

  @override
  String get bubbleLevelUprightHint =>
      'Appuyez le bord du téléphone contre la surface';

  @override
  String get bubbleLevelLevel => 'De niveau';

  @override
  String bubbleLevelAngleLabel(String angle) {
    return 'Inclinaison de $angle degrés';
  }

  @override
  String bubbleLevelAxes(String x, String y) {
    return 'Gauche–droite $x° · Avant–arrière $y°';
  }

  @override
  String get bubbleLevelCalibrate => 'Calibrer';

  @override
  String get bubbleLevelReset => 'Réinitialiser';

  @override
  String get bubbleLevelCalibrateTitle => 'Calibrer le niveau ?';

  @override
  String get bubbleLevelCalibrateBody =>
      'Posez le téléphone sur une surface que vous savez de niveau (ou contre un bord droit), puis touchez Calibrer. La position actuelle indiquera 0°.';

  @override
  String get bubbleLevelCalibrated =>
      'Calibré. Cette position indique maintenant 0°.';

  @override
  String get bubbleLevelResetDone => 'Calibrage effacé';

  @override
  String get bubbleLevelUnavailable =>
      'Ce téléphone n’a pas de capteur de mouvement : le niveau ne peut pas fonctionner.';

  @override
  String get flashlightOn => 'Lumière allumée';

  @override
  String get flashlightOff => 'Lumière éteinte';

  @override
  String get flashlightTurnOn => 'Allumer la lumière';

  @override
  String get flashlightTurnOff => 'Éteindre la lumière';

  @override
  String get flashlightModeSteady => 'Continu';

  @override
  String get flashlightModeSos => 'SOS';

  @override
  String get flashlightModeStrobe => 'Stroboscope';

  @override
  String get flashlightSosHint =>
      'Émet en boucle le signal de détresse ··· ––– ···';

  @override
  String flashlightStrobeSpeed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count flashs par seconde',
      one: '1 flash par seconde',
    );
    return '$_temp0';
  }

  @override
  String get flashlightUseScreen => 'Utiliser l’écran comme lumière';

  @override
  String get flashlightUseScreenHint => 'Allume l’écran au lieu du flash';

  @override
  String get flashlightNoTorch =>
      'Ce téléphone n’a pas de flash : l’écran s’allume à la place.';

  @override
  String get flashlightTorchBusy =>
      'Le flash est occupé (une autre appli utilise peut-être l’appareil photo) : l’écran s’allume à la place.';

  @override
  String get flashlightScreenColor => 'Couleur de l’écran';

  @override
  String get flashlightColorWhite => 'Blanc';

  @override
  String get flashlightColorWarm => 'Blanc chaud';

  @override
  String get flashlightColorRed => 'Rouge';

  @override
  String get flashlightColorGreen => 'Vert';

  @override
  String get flashlightColorBlue => 'Bleu';

  @override
  String get flashlightTapToTurnOff => 'Touchez n’importe où pour éteindre';

  @override
  String get stopwatchTabStopwatch => 'Chronomètre';

  @override
  String get stopwatchTabTimer => 'Minuteur';

  @override
  String get stopwatchStart => 'Démarrer';

  @override
  String get stopwatchPause => 'Pause';

  @override
  String get stopwatchResume => 'Reprendre';

  @override
  String get stopwatchLap => 'Tour';

  @override
  String get stopwatchReset => 'Réinitialiser';

  @override
  String stopwatchLapNumber(int number) {
    return 'Tour $number';
  }

  @override
  String stopwatchCurrentLap(int number, String time) {
    return 'Tour $number : $time';
  }

  @override
  String get stopwatchBest => 'Plus rapide';

  @override
  String get stopwatchWorst => 'Plus lent';

  @override
  String get stopwatchNoLaps =>
      'Touchez Tour pendant le chronométrage pour enregistrer les temps au tour.';

  @override
  String get stopwatchTimerQuickStart => 'Démarrage rapide';

  @override
  String stopwatchTimerMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get stopwatchTimerCustom => 'Choisir une durée';

  @override
  String get stopwatchTimerPickTitle => 'Régler le minuteur';

  @override
  String get stopwatchTimerHours => 'heures';

  @override
  String get stopwatchTimerMinutesUnit => 'min';

  @override
  String get stopwatchTimerSeconds => 's';

  @override
  String get stopwatchTimerAddMinute => '+1 min';

  @override
  String get stopwatchTimerPaused => 'En pause';

  @override
  String stopwatchTimerRemaining(String time) {
    return 'Il reste $time';
  }

  @override
  String get stopwatchTimerTimesUp => 'Temps écoulé !';

  @override
  String stopwatchTimerFinishedBody(String duration) {
    return 'Votre minuteur de $duration est terminé.';
  }

  @override
  String get stopwatchTimerRestart => 'Relancer';

  @override
  String get stopwatchTimerDone => 'OK';

  @override
  String get stopwatchTimerKeepOpen =>
      'Gardez cet écran ouvert : le téléphone vibre quand le temps est écoulé.';

  @override
  String get translateHeroTitle => 'Parlez ou tapez pour traduire';

  @override
  String get translateBadgeOnDevice => 'IA sur l’appareil';

  @override
  String get translateBadgeOffline => 'Fonctionne hors ligne';

  @override
  String get translateFrom => 'De';

  @override
  String get translateTo => 'Vers';

  @override
  String get translateSwap => 'Inverser les langues';

  @override
  String get translateHint =>
      'Saisissez du texte ou touchez le micro pour parler…';

  @override
  String get translateHintListening =>
      'Écoute… parlez normalement, touchez le micro pour arrêter';

  @override
  String translateListeningIn(String language) {
    return 'Écoute en $language… touchez le micro pour arrêter et traduire.';
  }

  @override
  String get translateSameLanguage =>
      'Les langues source et cible doivent être différentes.';

  @override
  String get translateButton => 'Traduire';

  @override
  String get translateTranslating => 'Traduction…';

  @override
  String get translateStopAndTranslate => 'Arrêter et traduire';

  @override
  String get translateDownloadingModel => 'Téléchargement du modèle de langue…';

  @override
  String get translateResultLabel => 'Traduction';

  @override
  String get translatePlayAudio => 'Lire l’audio';

  @override
  String get translateGenerating => 'Création…';

  @override
  String get translateShareAudio => 'Partager le fichier audio';

  @override
  String get translateGenerateAudio => 'Créer un fichier audio';

  @override
  String get translateAudioReady =>
      'Fichier audio prêt : partagez-le pour l’envoyer ou l’enregistrer.';

  @override
  String get translateMicStop => 'Arrêter l’écoute et traduire';

  @override
  String get translateMicStart => 'Parlez pour traduire';

  @override
  String get translateMicBlocked =>
      'L’accès au micro est bloqué. Activez-le dans les paramètres pour utiliser la saisie vocale.';

  @override
  String get translateMicNeeded =>
      'L’autorisation du micro est nécessaire pour la saisie vocale.';

  @override
  String get translateSpeechUnavailable =>
      'La reconnaissance vocale n’est pas disponible sur cet appareil.';

  @override
  String get translateNoSpeech => 'Je n’ai rien entendu. Veuillez réessayer.';

  @override
  String get translateVoiceFailed =>
      'La saisie vocale s’est arrêtée. Veuillez réessayer.';

  @override
  String get translateDownloadFailed =>
      'Impossible de télécharger les modèles de langue. Vérifiez votre connexion internet.';

  @override
  String get translateFailed => 'La traduction a échoué. Veuillez réessayer.';

  @override
  String get translateAudioFailed =>
      'Impossible de créer un fichier audio sur cet appareil.';

  @override
  String translateLanguageName(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'af': 'Afrikaans',
      'sq': 'Albanais',
      'ar': 'Arabe',
      'be': 'Biélorusse',
      'bn': 'Bengali',
      'bg': 'Bulgare',
      'ca': 'Catalan',
      'zh': 'Chinois (simplifié)',
      'hr': 'Croate',
      'cs': 'Tchèque',
      'da': 'Danois',
      'nl': 'Néerlandais',
      'en': 'Anglais',
      'eo': 'Espéranto',
      'et': 'Estonien',
      'fi': 'Finnois',
      'fr': 'Français',
      'gl': 'Galicien',
      'ka': 'Géorgien',
      'de': 'Allemand',
      'el': 'Grec',
      'gu': 'Gujarati',
      'ht': 'Créole haïtien',
      'he': 'Hébreu',
      'hi': 'Hindi',
      'hu': 'Hongrois',
      'is': 'Islandais',
      'id': 'Indonésien',
      'ga': 'Irlandais',
      'it': 'Italien',
      'ja': 'Japonais',
      'kn': 'Kannada',
      'ko': 'Coréen',
      'lv': 'Letton',
      'lt': 'Lituanien',
      'mk': 'Macédonien',
      'ms': 'Malais',
      'mt': 'Maltais',
      'mr': 'Marathi',
      'no': 'Norvégien',
      'fa': 'Persan (farsi)',
      'pl': 'Polonais',
      'pt': 'Portugais',
      'ro': 'Roumain',
      'ru': 'Russe',
      'sk': 'Slovaque',
      'sl': 'Slovène',
      'es': 'Espagnol',
      'sw': 'Swahili',
      'sv': 'Suédois',
      'tl': 'Tagalog (filipino)',
      'ta': 'Tamoul',
      'te': 'Télougou',
      'th': 'Thaï',
      'tr': 'Turc',
      'uk': 'Ukrainien',
      'ur': 'Ourdou',
      'vi': 'Vietnamien',
      'cy': 'Gallois',
      'other': '$code',
    });
    return '$_temp0';
  }

  @override
  String get textUtilMode => 'Mode';

  @override
  String get textUtilModeText => 'Texte';

  @override
  String get textUtilHint => 'Saisissez le texte ici…';

  @override
  String get textUtilHintBase64 =>
      'Saisissez du texte ou du Base64 à convertir…';

  @override
  String textUtilWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'mots',
      one: 'mot',
    );
    return '$_temp0';
  }

  @override
  String textUtilCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'caractères',
      one: 'caractère',
    );
    return '$_temp0';
  }

  @override
  String get textUtilNoSpaces => 'sans espaces';

  @override
  String get textUtilUpper => 'MAJUSCULES';

  @override
  String get textUtilLower => 'minuscules';

  @override
  String get textUtilTitle => 'Majuscule À Chaque Mot';

  @override
  String get textUtilSentence => 'Majuscule en début de phrase';

  @override
  String get textUtilEncode => 'Encoder';

  @override
  String get textUtilDecode => 'Décoder';

  @override
  String get textUtilOutput => 'Résultat';

  @override
  String get textUtilInvalidBase64 => 'Ce n’est pas du Base64 valide.';

  @override
  String get clipEmptyClipboard =>
      'Le presse-papiers est vide ou ne contient pas de texte.';

  @override
  String clipSaved(String text) {
    return 'Enregistré : $text';
  }

  @override
  String get clipAddManualTitle => 'Ajouter du texte manuellement';

  @override
  String get clipAddHint => 'Tapez ou collez du texte ici…';

  @override
  String get clipClearUnpinned => 'Effacer les non épinglés';

  @override
  String get clipClearHistoryTitle => 'Effacer l’historique ?';

  @override
  String get clipClearHistoryBody =>
      'Supprimer tous les éléments non épinglés ? Les éléments épinglés sont conservés.';

  @override
  String get clipSearchHint => 'Rechercher des extraits…';

  @override
  String get clipFilterAll => 'Tous';

  @override
  String get clipFilterPinned => 'Épinglés';

  @override
  String get clipFilterLinks => 'Liens';

  @override
  String get clipFilterText => 'Texte';

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
      other: '$countString enregistrés',
      one: '$countString enregistré',
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
      other: '$countString épinglés',
      one: '$countString épinglé',
    );
    return '$_temp0';
  }

  @override
  String get clipAddText => 'Ajouter du texte';

  @override
  String get clipLabel => 'Libellé';

  @override
  String get clipAddLabelTitle => 'Ajouter un libellé';

  @override
  String get clipLabelHint => 'ex. : e-mail pro';

  @override
  String get clipEmptyTitle => 'Aucun extrait pour l’instant';

  @override
  String get clipEmptyMessage =>
      'Copiez n’importe quel texte sur votre téléphone, puis touchez Coller pour l’enregistrer ici durablement.';

  @override
  String get clipPasteFromClipboard => 'Coller depuis le presse-papiers';

  @override
  String get clipTypeLink => 'Lien';

  @override
  String get clipTypeEmail => 'E-mail';

  @override
  String get clipTypePhone => 'Téléphone';

  @override
  String get clipTypeCode => 'Code';

  @override
  String get clipTypeText => 'Texte';

  @override
  String get clipJustNow => 'à l’instant';

  @override
  String clipMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a $count min',
    );
    return '$_temp0';
  }

  @override
  String clipHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a $count h',
    );
    return '$_temp0';
  }

  @override
  String clipDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'il y a $count jours',
      one: 'il y a $count jour',
    );
    return '$_temp0';
  }

  @override
  String get clipPin => 'Épingler';

  @override
  String get clipUnpin => 'Désépingler';

  @override
  String get calcDivideByZero => 'Division par zéro impossible';

  @override
  String get calcCheckExpression => 'Vérifiez l’expression';

  @override
  String get calcCopyResult => 'Copier le résultat';

  @override
  String get calcPlus => 'Plus';

  @override
  String get calcMinus => 'Moins';

  @override
  String get calcTimes => 'Multiplié par';

  @override
  String get calcDivide => 'Divisé par';

  @override
  String get calcPercent => 'Pour cent';

  @override
  String get calcParentheses => 'Parenthèses';

  @override
  String get calcEquals => 'Égal';

  @override
  String get calcDecimalPoint => 'Séparateur décimal';

  @override
  String get ageTabAge => 'Âge';

  @override
  String get ageTabBetween => 'Entre deux dates';

  @override
  String get ageDateOfBirth => 'Date de naissance';

  @override
  String get ageFrom => 'Du';

  @override
  String get ageTo => 'Au';

  @override
  String get ageFutureDate => 'Cette date est dans le futur.';

  @override
  String ageYearsUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ans',
      one: 'an',
    );
    return '$_temp0';
  }

  @override
  String ageDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'jours',
      one: 'jour',
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
      other: '$countString ans',
      one: '$countString an',
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
      other: '$countString mois',
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
      other: '$countString jours',
      one: '$countString jour',
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
      other: '$countString semaines',
      one: '$countString semaine',
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
      other: 'dans $countString jours',
      one: 'dans $countString jour',
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
  String get ageNextBirthday => 'Prochain anniversaire';

  @override
  String get ageBirthdayToday => 'Aujourd’hui 🎉';

  @override
  String get ageTotalMonths => 'Mois au total';

  @override
  String get ageTotalWeeks => 'Semaines au total';

  @override
  String get ageTotalDays => 'Jours au total';

  @override
  String get ageWeeksLabel => 'Semaines';

  @override
  String get ageWeekdays => 'Jours ouvrés (lun–ven)';

  @override
  String get ageHours => 'Heures';

  @override
  String get ageIncludingEnd => 'Date de fin incluse';

  @override
  String get unitFrom => 'De';

  @override
  String get unitTo => 'En';

  @override
  String get unitEnterValue => 'Saisissez une valeur';

  @override
  String get unitSwap => 'Inverser les unités';

  @override
  String unitCategoryName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'length': 'Longueur',
      'weight': 'Poids',
      'temperature': 'Température',
      'area': 'Surface',
      'volume': 'Volume',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String unitName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'millimeter': 'Millimètre',
      'centimeter': 'Centimètre',
      'meter': 'Mètre',
      'kilometer': 'Kilomètre',
      'inch': 'Pouce',
      'foot': 'Pied',
      'mile': 'Mile',
      'gram': 'Gramme',
      'kilogram': 'Kilogramme',
      'ounce': 'Once',
      'pound': 'Livre',
      'celsius': 'Celsius',
      'fahrenheit': 'Fahrenheit',
      'kelvin': 'Kelvin',
      'squareMeter': 'Mètre carré',
      'squareFoot': 'Pied carré',
      'acre': 'Acre',
      'hectare': 'Hectare',
      'milliliter': 'Millilitre',
      'liter': 'Litre',
      'gallonUs': 'Gallon (US)',
      'fluidOunce': 'Once liquide',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String get loanAmount => 'Montant du prêt';

  @override
  String get loanInterestRate => 'Taux d’intérêt annuel';

  @override
  String get loanTenure => 'Durée';

  @override
  String get loanTenureMonths => 'Durée (mois)';

  @override
  String get loanTenureYears => 'Durée (années)';

  @override
  String get loanToggleMonths => 'Mois';

  @override
  String get loanToggleYears => 'Ans';

  @override
  String get loanEmpty =>
      'Saisissez des données de prêt valides pour calculer la mensualité';

  @override
  String get loanMonthlyEmi => 'Mensualité';

  @override
  String get loanPrincipal => 'Capital';

  @override
  String get loanTotalInterest => 'Intérêts totaux';

  @override
  String get loanTotalPayment => 'Coût total';

  @override
  String get loanBreakdown => 'Répartition';

  @override
  String get loanInterest => 'Intérêts';

  @override
  String loanInterestShare(String percent) {
    return '$percent d’intérêts';
  }

  @override
  String get loanSchedule => 'Tableau d’amortissement';

  @override
  String loanMonths(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString mois',
    );
    return '$_temp0';
  }

  @override
  String get loanColMonth => 'Mois';

  @override
  String get loanColBalance => 'Solde';

  @override
  String get loanShowAll => 'Afficher tous les mois';

  @override
  String get loanShowLess => 'Afficher moins';

  @override
  String get clockSearchHint => 'Rechercher une ville ou un pays…';

  @override
  String get clockPinned => 'Épinglées';

  @override
  String get clockAllCities => 'Toutes les villes';

  @override
  String clockOnWidget(int shown, int total) {
    final intl.NumberFormat shownNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String shownString = shownNumberFormat.format(shown);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Sur le widget : $shownString sur $totalString';
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

    return 'Sur le widget : $shownString sur $maxString max. (agrandissez pour en voir plus)';
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

    return 'Le widget de l’écran d’accueil affiche les $defaultRowsString premières par défaut ; tirez son bord inférieur pour en afficher jusqu’à $maxRowsString.';
  }

  @override
  String get clockPin => 'Épingler';

  @override
  String get clockUnpin => 'Désépingler';

  @override
  String get clockNoResults => 'Aucune ville correspondante';

  @override
  String get speedSelectingServer => 'Sélection du serveur…';

  @override
  String get speedPhasePing => 'Mesure du ping';

  @override
  String get speedPhaseDownload => 'Test du débit descendant';

  @override
  String get speedPhaseUpload => 'Test du débit montant';

  @override
  String get speedDownloadSpeed => 'Débit descendant';

  @override
  String get speedUploadSpeed => 'Débit montant';

  @override
  String get speedRunAgain => 'Relancer';

  @override
  String get speedGo => 'GO';

  @override
  String speedMeasuredVia(String server) {
    return 'Mesuré via $server';
  }

  @override
  String get speedPoweredBy => 'Utilise les serveurs de test de Cloudflare';

  @override
  String get speedIdleHint =>
      'Appuyez sur le bouton pour mesurer le ping et les débits descendant et montant.';

  @override
  String get speedPing => 'Ping';

  @override
  String get speedResultsTitle => 'Résultats du test';

  @override
  String get speedDownload => 'Descendant';

  @override
  String get speedUpload => 'Montant';

  @override
  String speedConnectedIp(String ip) {
    return 'Votre IP : $ip';
  }

  @override
  String get speedErrorOffline =>
      'Pas de connexion Internet. Vérifiez le Wi-Fi ou les données mobiles.';

  @override
  String get speedErrorTimeout =>
      'Le test a expiré. Votre connexion est peut-être instable.';

  @override
  String get speedErrorFailed => 'Le test a échoué. Veuillez réessayer.';

  @override
  String get pingErrorHostNotFound =>
      'Hôte introuvable. Vérifiez l\'adresse et votre connexion Internet.';

  @override
  String get pingErrorNoData =>
      'Aucune information disponible pour cette adresse.';

  @override
  String get pingTabMyIp => 'Mon IP';

  @override
  String get pingTabLookup => 'Recherche';

  @override
  String get pingTabPing => 'Ping';

  @override
  String get pingYourPublicIp => 'Votre adresse IP publique';

  @override
  String get pingFieldCity => 'Ville';

  @override
  String get pingFieldRegion => 'Région';

  @override
  String get pingFieldCountry => 'Pays';

  @override
  String get pingFieldIsp => 'Fournisseur';

  @override
  String get pingFieldTimezone => 'Fuseau horaire';

  @override
  String get pingFieldLocation => 'Coordonnées';

  @override
  String get pingFieldIp => 'Adresse IP';

  @override
  String get pingIpCopied => 'Adresse IP copiée';

  @override
  String get pingCopyIp => 'Copier l\'IP';

  @override
  String get pingLookupHint => 'Adresse IP ou nom d\'hôte';

  @override
  String get pingLookupButton => 'Rechercher';

  @override
  String get pingHostHint => 'Nom d\'hôte (ex. google.com)';

  @override
  String get pingStartButton => 'Lancer';

  @override
  String pingHeader(String host, String ip) {
    return 'Ping de $host ($ip) via le port TCP 443';
  }

  @override
  String get pingStatAvg => 'Moyenne';

  @override
  String get pingStatLoss => 'Perte';

  @override
  String get pingStatSent => 'Envoyés';

  @override
  String get pingTimeout => 'Délai dépassé';

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
  String get compassNorth => 'Nord';

  @override
  String get compassNortheast => 'Nord-est';

  @override
  String get compassEast => 'Est';

  @override
  String get compassSoutheast => 'Sud-est';

  @override
  String get compassSouth => 'Sud';

  @override
  String get compassSouthwest => 'Sud-ouest';

  @override
  String get compassWest => 'Ouest';

  @override
  String get compassNorthwest => 'Nord-ouest';

  @override
  String compassSemantics(String degrees, String direction) {
    return 'Cap $degrees°, $direction';
  }

  @override
  String get compassHeadingMagnetic => 'Cap magnétique';

  @override
  String get compassUnavailable =>
      'Cet appareil n\'a pas de magnétomètre : la boussole ne peut pas fonctionner.';

  @override
  String get locationSavedHeader => 'Positions enregistrées';

  @override
  String locationSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString enregistrées',
      one: '1 enregistrée',
      zero: 'Aucune',
    );
    return '$_temp0';
  }

  @override
  String locationEmpty(String save) {
    return 'Aucune position enregistrée.\nAppuyez sur « $save » pour enregistrer l\'endroit où vous êtes.';
  }

  @override
  String locationDeleted(String name) {
    return 'Position « $name » supprimée';
  }

  @override
  String get locationSaveDialogTitle => 'Enregistrer la position';

  @override
  String get locationNameLabel => 'Nom';

  @override
  String get locationNameHint => 'ex. Maison, Bureau…';

  @override
  String get locationNoteLabel => 'Note (facultatif)';

  @override
  String get locationCurrent => 'Position actuelle';

  @override
  String get locationRefresh => 'Actualiser la position';

  @override
  String get locationLocating => 'Localisation en cours…';

  @override
  String get locationServicesOff =>
      'La localisation est désactivée. Activez-la pour voir où vous êtes.';

  @override
  String get locationPermissionDenied =>
      'Autorisez l\'accès à la position pour voir où vous êtes.';

  @override
  String get locationPermissionDeniedForever =>
      'L\'accès à la position est bloqué. Autorisez-le dans les paramètres pour utiliser cet outil.';

  @override
  String get locationErrorTimeout =>
      'Impossible d\'obtenir un signal GPS. Approchez-vous d\'une fenêtre ou sortez, puis réessayez.';

  @override
  String get locationAllow => 'Autoriser';

  @override
  String locationAccuracy(String meters) {
    return 'Précision : ±$meters m';
  }

  @override
  String get locationCoordsCopied => 'Coordonnées copiées';

  @override
  String get locationCopyCoords => 'Copier les coordonnées';

  @override
  String get locationOpenInMaps => 'Ouvrir dans Maps';

  @override
  String get passwordYours => 'Votre mot de passe';

  @override
  String get passwordSelectType => 'Choisissez au moins un type de caractère';

  @override
  String get passwordStrength => 'Robustesse';

  @override
  String get passwordWeak => 'Faible';

  @override
  String get passwordFair => 'Moyen';

  @override
  String get passwordGood => 'Bon';

  @override
  String get passwordStrong => 'Robuste';

  @override
  String get passwordLength => 'Longueur';

  @override
  String passwordChars(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString caractères',
      one: '$countString caractère',
    );
    return '$_temp0';
  }

  @override
  String get passwordInclude => 'Inclure';

  @override
  String get passwordUppercase => 'Majuscules';

  @override
  String get passwordLowercase => 'Minuscules';

  @override
  String get passwordNumbers => 'Chiffres';

  @override
  String get passwordSymbols => 'Symboles';

  @override
  String get passwordCopied => 'Mot de passe copié';

  @override
  String get passwordGenerate => 'Générer';

  @override
  String get hashModeText => 'Texte';

  @override
  String get hashModeFile => 'Fichier';

  @override
  String get hashAlgorithm => 'Algorithme';

  @override
  String get hashInputHint => 'Saisissez le texte à hacher…';

  @override
  String get hashPickFile => 'Appuyez pour choisir un fichier';

  @override
  String get hashChange => 'Changer';

  @override
  String get hashHashing => 'Calcul en cours…';

  @override
  String get hashGenerate => 'Générer le hash';

  @override
  String get hashFileError =>
      'Impossible de lire ce fichier. Essayez-en un autre.';

  @override
  String get hashCopied => 'Hash copié';

  @override
  String get hashCopy => 'Copier le hash';

  @override
  String get colorPickerFormats => 'Formats de couleur';

  @override
  String get colorPickerHexLabel => 'Couleur HEX';

  @override
  String get colorPickerHexInvalid =>
      'Saisissez 6 chiffres hexadécimaux (0–9, A–F)';

  @override
  String get colorPickerApply => 'Appliquer la couleur';

  @override
  String colorPickerCopied(String format) {
    return '$format copié';
  }

  @override
  String get colorPickerPalette => 'Palette rapide';

  @override
  String colorPickerSwatch(String hex) {
    return 'Couleur $hex';
  }

  @override
  String get imgCompressPickHint => 'Touchez pour choisir ou prendre une photo';

  @override
  String imgCompressSupported(String formats) {
    return 'Prend en charge $formats';
  }

  @override
  String get imgCompressChange => 'Changer de photo';

  @override
  String get imgCompressModeQuality => 'Par qualité';

  @override
  String get imgCompressModeTarget => 'Taille cible';

  @override
  String get imgCompressQuality => 'Qualité';

  @override
  String get imgCompressSmallest => 'Fichier le plus léger';

  @override
  String get imgCompressBestQuality => 'Meilleure qualité';

  @override
  String get imgCompressQualityNote =>
      'Les grandes photos sont aussi redimensionnées à environ 1920×1080.';

  @override
  String imgCompressTargetUnder(String size) {
    return 'Moins de $size';
  }

  @override
  String get imgCompressTargetHint =>
      'Garde la meilleure qualité qui respecte la limite — pratique pour les formulaires d\'emploi et administratifs.';

  @override
  String get imgCompressButton => 'Compresser la photo';

  @override
  String get imgCompressCompressing => 'Compression…';

  @override
  String get imgCompressSuccess => 'Compression réussie !';

  @override
  String imgCompressFitsTarget(String size) {
    return 'Terminé — moins de $size';
  }

  @override
  String imgCompressMissedTarget(String size) {
    return 'Impossible de descendre sous $size. Voici la plus petite version possible.';
  }

  @override
  String get imgCompressStatOriginal => 'Original';

  @override
  String get imgCompressStatCompressed => 'Compressé';

  @override
  String get imgCompressStatSaved => 'Gain';

  @override
  String get imgCompressFailed =>
      'Impossible de compresser cette photo. Essayez-en une autre.';

  @override
  String get imgResizePresetPassport => 'Passeport 35×45 mm';

  @override
  String imgResizePresetSquare(String size) {
    return 'Carré $size';
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
  String get imgResizeChoosePhotos => 'Choisir des photos';

  @override
  String imgResizeSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos sélectionnées',
      one: '1 photo sélectionnée',
    );
    return '$_temp0';
  }

  @override
  String get imgResizePickHint =>
      'Choisissez-en une ou plusieurs — ou partagez-les avec l\'appli';

  @override
  String get imgResizeChoose => 'Choisir';

  @override
  String get imgResizeChange => 'Changer';

  @override
  String get imgResizePresets => 'Préréglages';

  @override
  String get imgResizeModePercent => 'Pourcentage';

  @override
  String get imgResizeModeMaxSide => 'Côté max';

  @override
  String get imgResizeModeExact => 'Exact';

  @override
  String get imgResizeWidth => 'Largeur (px)';

  @override
  String get imgResizeHeight => 'Hauteur (px)';

  @override
  String get imgResizeCrop => 'Recadrer (sans étirer)';

  @override
  String get imgResizeFormat => 'Format';

  @override
  String get imgResizeQuality => 'Qualité';

  @override
  String get imgResizeButton => 'Redimensionner';

  @override
  String imgResizeSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Enregistrer $count photos dans la galerie',
      one: 'Enregistrer 1 photo dans la galerie',
    );
    return '$_temp0';
  }

  @override
  String get imgResizeChangeSettings => 'Modifier les réglages';

  @override
  String imgResizeInvalidSize(int min, int max) {
    return 'Saisissez une largeur et une hauteur entre $min et $max.';
  }

  @override
  String imgResizeFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos n\'ont pas pu être lues.',
      one: '1 photo n\'a pas pu être lue.',
    );
    return '$_temp0';
  }

  @override
  String imgResizeSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos enregistrées dans la galerie',
      one: '1 photo enregistrée dans la galerie',
    );
    return '$_temp0';
  }

  @override
  String get imgEnhanceEmptyTitle => 'Retouchez vos photos';

  @override
  String get imgEnhanceEmptyBody =>
      'Réglez la luminosité, le contraste, la saturation et la netteté, appliquez des préréglages, faites pivoter et retournez — le tout sur votre appareil.';

  @override
  String get imgEnhanceFineControls => 'Réglages fins';

  @override
  String get imgEnhanceApplying => 'Application…';

  @override
  String get imgEnhanceChange => 'Changer';

  @override
  String get imgEnhancePresets => 'Préréglages';

  @override
  String get imgEnhanceTransform => 'Transformer';

  @override
  String get imgEnhanceAdjustments => 'Réglages';

  @override
  String get imgEnhanceRotate => 'Pivoter';

  @override
  String get imgEnhanceFlipH => 'Miroir horizontal';

  @override
  String get imgEnhanceFlipV => 'Miroir vertical';

  @override
  String get imgEnhanceBrightness => 'Luminosité';

  @override
  String get imgEnhanceContrast => 'Contraste';

  @override
  String get imgEnhanceSaturation => 'Saturation';

  @override
  String get imgEnhanceSharpen => 'Netteté';

  @override
  String get imgEnhanceBlur => 'Flou';

  @override
  String get imgEnhanceQuality => 'Qualité';

  @override
  String get imgEnhanceApply => 'Appliquer';

  @override
  String get imgEnhanceFailed =>
      'Impossible d\'appliquer les retouches. Essayez une autre photo.';

  @override
  String imgEnhanceResult(String before, String after, String change) {
    return 'Terminé ! $before → $after ($change)';
  }

  @override
  String get imgEnhancePresetOriginal => 'Original';

  @override
  String get imgEnhancePresetVivid => 'Éclatant';

  @override
  String get imgEnhancePresetCool => 'Froid';

  @override
  String get imgEnhancePresetWarm => 'Chaud';

  @override
  String get imgEnhancePresetDramatic => 'Dramatique';

  @override
  String get imgEnhancePresetFade => 'Délavé';

  @override
  String get imgEnhancePresetVintage => 'Vintage';

  @override
  String get imgEnhancePresetNoir => 'Noir';

  @override
  String get upscalerNewImage => 'Nouvelle photo';

  @override
  String get upscalerIntro =>
      'Agrandissez vos photos jusqu\'à 4× grâce à l\'IA sur l\'appareil. Fonctionne hors ligne après un téléchargement unique du modèle — mode cloud facultatif pour les visages.';

  @override
  String get upscalerBadgeOnDevice => 'IA sur l\'appareil';

  @override
  String get upscalerBadgeOffline => 'Fonctionne hors ligne';

  @override
  String get upscalerBadgeUpTo4x => 'Jusqu\'à 4× plus grand';

  @override
  String get upscalerBadgeGpu => 'Accéléré par GPU';

  @override
  String get upscalerBestResults =>
      'Meilleurs résultats : photos basse résolution, anciens scans, miniatures et JPEG compressés.';

  @override
  String get upscalerChangeImage => 'Changer de photo';

  @override
  String get upscalerTabOriginal => 'Original';

  @override
  String get upscalerTabUpscaled => 'Agrandi par IA';

  @override
  String get upscalerStageStarting => 'Démarrage…';

  @override
  String get upscalerStageConnecting => 'Connexion au serveur IA…';

  @override
  String get upscalerStageOnDevice => 'Traitement sur cet appareil…';

  @override
  String get upscalerStageCloudUnavailable =>
      'Cloud indisponible — traitement sur cet appareil…';

  @override
  String get upscalerStageUploading => 'Envoi de la photo…';

  @override
  String get upscalerStageRestoringFaces =>
      'L\'IA restaure les visages et les détails…';

  @override
  String get upscalerStagePreparing => 'Préparation de la photo…';

  @override
  String get upscalerStageLoadingModel => 'Chargement du modèle IA…';

  @override
  String get upscalerStageDownloadingModel =>
      'Téléchargement du modèle IA (une seule fois)…';

  @override
  String get upscalerStageFallback => 'Agrandissement standard en cours…';

  @override
  String get upscalerStageDecoding => 'Lecture de la photo…';

  @override
  String upscalerStageResizing(String from, String to) {
    return 'Redimensionnement de l\'entrée ($from → $to)…';
  }

  @override
  String get upscalerStageDenoising => 'Réduction du bruit…';

  @override
  String upscalerStageUpscaling(String factor) {
    return 'Agrandissement ($factor×)…';
  }

  @override
  String upscalerStageAiTiles(String done, String total) {
    return 'Agrandissement IA… ($done/$total)';
  }

  @override
  String get upscalerStageSharpening => 'Accentuation…';

  @override
  String get upscalerStageColour => 'Réglage des couleurs…';

  @override
  String get upscalerStageSaving => 'Enregistrement…';

  @override
  String get upscalerStageDone => 'Terminé !';

  @override
  String get upscalerLoadingModelHint =>
      'Chargement du modèle IA (première fois seulement)';

  @override
  String get upscalerTime4x =>
      'L\'agrandissement 4× peut prendre 15 à 60 s selon la taille de la photo.';

  @override
  String get upscalerTime2x =>
      'L\'agrandissement 2× prend généralement 5 à 20 s.';

  @override
  String upscalerDoneIn(String seconds) {
    return 'Agrandi en $seconds s';
  }

  @override
  String get upscalerStatResolution => 'Résolution';

  @override
  String get upscalerStatFileSize => 'Taille du fichier';

  @override
  String get upscalerStatScale => 'Échelle';

  @override
  String get upscalerShareSubject => 'Photo agrandie par IA';

  @override
  String get upscalerFallbackModelUnavailable =>
      'Le modèle IA nécessite Internet une seule fois — agrandissement standard utilisé';

  @override
  String get upscalerFallbackModelFailed =>
      'Le modèle IA ne peut pas fonctionner sur cet appareil — agrandissement standard utilisé';

  @override
  String get upscalerFallbackCloud =>
      'Serveur cloud indisponible — traité sur cet appareil';

  @override
  String get upscalerSettings => 'Réglages IA';

  @override
  String get upscalerFactorLabel => 'Facteur d\'agrandissement';

  @override
  String get upscalerFactor2xDesc =>
      'Rapide — idéal pour la plupart des photos';

  @override
  String get upscalerFactor4xDesc => 'Meilleure qualité — plus lent';

  @override
  String get upscalerOptimiseFor => 'Optimiser pour';

  @override
  String get upscalerModeAuto => 'Auto';

  @override
  String get upscalerModePhoto => 'Photo';

  @override
  String get upscalerModeIllustration => 'Illustration';

  @override
  String get upscalerModeFace => 'Détails du visage';

  @override
  String get upscalerDenoise => 'Pré-débruitage';

  @override
  String get upscalerDenoiseTip =>
      'Réduit le bruit JPEG avant l\'agrandissement';

  @override
  String get upscalerSharpen => 'Post-netteté';

  @override
  String get upscalerSharpenTip => 'Ajoute du piqué après l\'agrandissement';

  @override
  String get upscalerCloudTitle => 'Amélioration des visages dans le cloud';

  @override
  String get upscalerCloudOn =>
      'Votre photo est envoyée à notre serveur pour être traitée.';

  @override
  String get upscalerCloudOff =>
      'Désactivé — les photos restent sur cet appareil.';

  @override
  String get upscalerCloudDialogTitle => 'Envoyer les photos dans le cloud ?';

  @override
  String get upscalerCloudDialogBody =>
      'Le mode cloud envoie la photo sélectionnée à notre serveur d\'agrandissement via une connexion chiffrée, afin de la traiter avec un modèle IA plus puissant (GFPGAN + Real-ESRGAN).\n\n• Seule la photo que vous choisissez d\'agrandir est envoyée.\n• La photo est traitée en mémoire et n\'est pas conservée une fois le résultat renvoyé.\n• Aucun compte ni aucune donnée personnelle n\'est envoyé avec elle.\n\nVous pouvez désactiver cette option à tout moment. Le mode sur l\'appareil fonctionne entièrement hors ligne.';

  @override
  String get upscalerCloudKeepLocal => 'Rester sur l\'appareil';

  @override
  String get upscalerCloudEnable => 'Activer le cloud';

  @override
  String get upscalerUpscale => 'Agrandir avec l\'IA';

  @override
  String get upscalerUpscaleAgain =>
      'Agrandir à nouveau avec les nouveaux réglages';

  @override
  String get upscalerFailed => 'Échec de l\'agrandissement';

  @override
  String get upscalerErrorTooLarge =>
      'La photo est trop grande. Essayez une photo plus petite ou l\'agrandissement 2×.';

  @override
  String get upscalerErrorUnreadable =>
      'Impossible de lire cette photo. Utilisez un fichier JPG ou PNG.';

  @override
  String get upscalerErrorNetwork =>
      'Délai réseau dépassé. Vérifiez votre connexion ou désactivez le mode cloud.';

  @override
  String get videoPickHint => 'Touchez pour choisir une vidéo';

  @override
  String videoProbeInfo(String format, String duration) {
    return 'Format : $format · Durée : $duration';
  }

  @override
  String get videoOutputFormat => 'Format de sortie';

  @override
  String get videoFmtMostCompatible => 'Le plus compatible';

  @override
  String get videoFmtApple => 'Apple / QuickTime';

  @override
  String get videoFmtFlexible => 'Conteneur flexible';

  @override
  String get videoFmtLegacy => 'Ancien format';

  @override
  String get videoFmtGif => 'Animé (sans son)';

  @override
  String get videoFmtAudioOnly => 'Audio seul';

  @override
  String get videoFmtAudioAac => 'Audio seul (AAC)';

  @override
  String get videoFmtAudioRaw => 'Audio seul (brut)';

  @override
  String get videoFmtWav => 'Audio non compressé';

  @override
  String videoConvertingPercent(int percent) {
    return 'Conversion… $percent %';
  }

  @override
  String get videoConvertingWait => 'Conversion… cela peut prendre un moment';

  @override
  String get videoDone => 'Conversion terminée !';

  @override
  String get videoErrorUnsupported =>
      'Échec de la conversion. Ce format n\'est peut-être pas pris en charge sur votre appareil.';

  @override
  String get videoConvertAnother => 'Convertir une autre';

  @override
  String get videoPickButton => 'Choisir un fichier vidéo';

  @override
  String videoConvertTo(String format) {
    return 'Convertir en $format';
  }

  @override
  String get docScanAndroidOnly =>
      'Le scanner de documents est disponible uniquement sur Android.';

  @override
  String docScanNeedsPlayServices(String details) {
    return 'Impossible de démarrer le scanner. Il a besoin des services Google Play : vérifiez qu’ils sont à jour. ($details)';
  }

  @override
  String get docScanStartFailed =>
      'Impossible de démarrer le scanner. Veuillez réessayer.';

  @override
  String get docScanPdfSaved =>
      'PDF enregistré dans Téléchargements — retrouvez-le dans Mes fichiers';

  @override
  String docScanPagesSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages enregistrées dans la galerie',
      one: '1 page enregistrée dans la galerie',
      zero: 'Aucune page enregistrée dans la galerie',
    );
    return '$_temp0';
  }

  @override
  String get docScanHeadline => 'Numérisez du papier en un PDF net';

  @override
  String get docScanIntro =>
      'Les bords sont détectés automatiquement. Ajoutez autant de pages que vous voulez, recadrez, faites pivoter et appliquez des filtres avant d’enregistrer.';

  @override
  String get docScanScanning => 'Numérisation…';

  @override
  String get docScanStart => 'Commencer la numérisation';

  @override
  String get docScanScannedPages => 'Pages numérisées';

  @override
  String docScanPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
      zero: '0 page',
    );
    return '$_temp0';
  }

  @override
  String get docScanSavePdf => 'Enregistrer le PDF';

  @override
  String get docScanSharePdf => 'Partager le PDF';

  @override
  String get docScanCopyText => 'Copier le texte';

  @override
  String get docScanSaveJpg => 'Enregistrer en JPG';

  @override
  String get docScanAnother => 'Numériser un autre document';

  @override
  String get pdfToolsChoosePdf => 'Choisir un PDF';

  @override
  String get pdfToolsChooseHint =>
      'Ou partagez un PDF vers Utility Toolbox depuis n’importe quelle app';

  @override
  String get pdfToolsReading => 'Lecture…';

  @override
  String get pdfToolsLockedShort => 'Protégé par mot de passe';

  @override
  String pdfToolsPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
      zero: '0 page',
    );
    return '$_temp0';
  }

  @override
  String get pdfToolsChange => 'Changer';

  @override
  String get pdfToolsResultReady => 'Votre PDF est prêt';

  @override
  String get pdfToolsSaveDownloads => 'Enregistrer dans Téléchargements';

  @override
  String get pdfToolsStartOver => 'Recommencer';

  @override
  String get pdfToolsSavedToDownloads =>
      'Enregistré dans Téléchargements — retrouvez-le dans Mes fichiers';

  @override
  String get pdfToolsSharedInstead =>
      'Le menu de partage a été ouvert à la place';

  @override
  String get pdfToolsRangeEmpty => 'Saisissez au moins une page.';

  @override
  String pdfToolsRangeInvalid(String part) {
    return '« $part » n’est ni une page ni une plage (ex. 1-3, 5).';
  }

  @override
  String pdfToolsRangeOutside(String part, int count) {
    return '« $part » est en dehors de 1–$count.';
  }

  @override
  String get pdfToolsInvalidPdf =>
      'Ce fichier ne semble pas être un PDF valide.';

  @override
  String pdfToolsLockedUnlockFirst(String tool) {
    return 'Ce PDF est protégé par mot de passe. Déverrouillez-le d’abord avec « $tool ».';
  }

  @override
  String pdfToolsPagesLabel(int count) {
    return 'Pages (1–$count)';
  }

  @override
  String pdfToolsPagesHint(String example) {
    return 'ex. $example';
  }

  @override
  String pdfToolsPageN(int number) {
    return 'Page $number';
  }

  @override
  String get pdfToolsDownload => 'Télécharger';

  @override
  String get pdfToolsSavedNotification =>
      'Enregistré dans Téléchargements — ouvrez-le depuis la notification.';

  @override
  String get pdfToolsShareToSave =>
      'Menu de partage ouvert — choisissez où enregistrer le fichier.';

  @override
  String pdfToolsSelectedFile(String name) {
    return 'Sélectionné : $name';
  }

  @override
  String pdfToolsSize(String size) {
    return 'Taille : $size';
  }

  @override
  String get pdfToolsDragToReorder => 'Faites glisser pour réorganiser';

  @override
  String get pdfHomeTitle => 'Boîte à outils PDF';

  @override
  String get pdfHomeSection => 'Outils PDF';

  @override
  String get pdfHomeSubtitle => 'Créez, combinez et optimisez vos documents';

  @override
  String get pdfPasswordEnter => 'Saisissez un mot de passe.';

  @override
  String pdfPasswordTooShort(int count) {
    return 'Utilisez au moins $count caractères.';
  }

  @override
  String get pdfPasswordMismatch => 'Les mots de passe ne correspondent pas.';

  @override
  String get pdfPasswordWrong => 'Ce mot de passe est incorrect.';

  @override
  String get pdfPasswordLockFailed => 'Impossible de verrouiller ce PDF.';

  @override
  String get pdfPasswordUnlockFailed => 'Impossible de déverrouiller ce PDF.';

  @override
  String get pdfPasswordLockedDone => 'Votre PDF est verrouillé';

  @override
  String get pdfPasswordRemovedDone => 'Mot de passe supprimé';

  @override
  String get pdfPasswordAlreadyLocked =>
      'Ce PDF a déjà un mot de passe. Déverrouillez-le d’abord.';

  @override
  String get pdfPasswordNotLocked =>
      'Ce PDF n’a pas de mot de passe — rien à déverrouiller.';

  @override
  String get pdfPasswordNew => 'Nouveau mot de passe';

  @override
  String get pdfPasswordCurrent => 'Mot de passe actuel';

  @override
  String get pdfPasswordRepeat => 'Confirmez le mot de passe';

  @override
  String get pdfPasswordShow => 'Afficher le mot de passe';

  @override
  String get pdfPasswordHide => 'Masquer le mot de passe';

  @override
  String get pdfPasswordWarning =>
      'Conservez ce mot de passe : il est impossible de le récupérer. Chiffrement AES-256.';

  @override
  String get pdfSplitExtract => 'Extraire des pages';

  @override
  String get pdfSplitRemove => 'Supprimer des pages';

  @override
  String get pdfSplitPagesHelp =>
      'Utilisez des virgules et des plages. « 8- » signifie de la page 8 à la fin.';

  @override
  String get pdfSplitRemovesAll => 'Cela supprimerait toutes les pages.';

  @override
  String get pdfSplitFailed => 'Impossible de diviser ce PDF.';

  @override
  String get pdfToImagesFailed => 'Impossible de convertir ce PDF.';

  @override
  String pdfToImagesSaved(int saved, int total) {
    return '$saved image(s) sur $total enregistrée(s) dans la galerie';
  }

  @override
  String get pdfToImagesAllPages => 'Toutes les pages';

  @override
  String get pdfToImagesConvert => 'Convertir en JPG';

  @override
  String pdfToImagesRendered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages converties…',
      one: '1 page convertie…',
      zero: '0 page convertie…',
    );
    return '$_temp0';
  }

  @override
  String pdfToImagesRenderedOf(int count, int total) {
    return '$count page(s) sur $total convertie(s)…';
  }

  @override
  String pdfToImagesSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Enregistrer $count images dans la galerie',
      one: 'Enregistrer 1 image dans la galerie',
    );
    return '$_temp0';
  }

  @override
  String get pdfCompressButton => 'Compresser';

  @override
  String get pdfCompressWorking => 'Compression du PDF…';

  @override
  String pdfCompressOriginalSize(String size) {
    return 'Taille d’origine : $size';
  }

  @override
  String get pdfCompressIntro =>
      'Choisissez un fichier PDF. La compression est plus efficace sur les documents riches en images.';

  @override
  String get pdfCompressLow => 'Faible';

  @override
  String get pdfCompressMedium => 'Moyenne';

  @override
  String get pdfCompressHigh => 'Forte';

  @override
  String get pdfCompressFailed => 'Impossible de compresser ce PDF.';

  @override
  String pdfCompressBefore(String size) {
    return 'Avant : $size';
  }

  @override
  String pdfCompressAfter(String size) {
    return 'Après : $size';
  }

  @override
  String get pdfMergeButton => 'Fusionner';

  @override
  String get pdfMergeWorking => 'Fusion des PDF…';

  @override
  String get pdfMergePick => 'Choisir des fichiers PDF';

  @override
  String get pdfMergeIntro =>
      'Sélectionnez au moins deux fichiers PDF à fusionner.';

  @override
  String get pdfMergeFailed =>
      'Impossible de fusionner les PDF. L’un des fichiers est peut-être illisible.';

  @override
  String pdfMergeResult(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF fusionné ($count pages)',
      one: 'PDF fusionné (1 page)',
    );
    return '$_temp0';
  }

  @override
  String get imageToPdfCreate => 'Créer le PDF';

  @override
  String get imageToPdfWorking => 'Création du PDF…';

  @override
  String get imageToPdfPick => 'Choisir des images';

  @override
  String get imageToPdfIntro =>
      'Sélectionnez une ou plusieurs images à convertir.';

  @override
  String get imageToPdfFailed =>
      'Impossible de créer le PDF. Essayez d’autres images.';

  @override
  String imageToPdfReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF prêt ($count pages)',
      one: 'PDF prêt (1 page)',
    );
    return '$_temp0';
  }

  @override
  String get qrScanNoCodeInPhoto =>
      'Aucun code QR ni code-barres trouvé sur cette photo.';

  @override
  String get qrScanPhotoFailed => 'Impossible de lire cette photo.';

  @override
  String qrScanResultTitle(String type) {
    return 'Scanné ($type)';
  }

  @override
  String get qrScanFromPhoto => 'Scanner depuis une photo';

  @override
  String get qrScanCameraNeeded =>
      'L’accès à la caméra est nécessaire pour scanner les codes QR et les codes-barres.';

  @override
  String get qrScanCameraError =>
      'Impossible de démarrer la caméra. Fermez les autres apps photo et réessayez.';

  @override
  String get qrScanTorchOn => 'Allumer la lampe';

  @override
  String get qrScanTorchOff => 'Éteindre la lampe';

  @override
  String get qrScanTypeLink => 'Lien';

  @override
  String get qrScanTypeWifi => 'Wi‑Fi';

  @override
  String get qrScanTypeContact => 'Contact';

  @override
  String get qrScanTypeText => 'Texte';

  @override
  String get qrGenInputLabel => 'Texte ou URL';

  @override
  String get qrGenInputHint => 'Saisissez le contenu à encoder';

  @override
  String get qrGenPreviewLabel => 'Aperçu du code QR';

  @override
  String get qrGenEmpty =>
      'Saisissez du texte ci-dessus pour prévisualiser votre code QR.';

  @override
  String get qrGenSaveGallery => 'Enregistrer dans la galerie';

  @override
  String get qrHomeTitle => 'QR et code-barres';

  @override
  String get qrHomeTabScan => 'Scanner';

  @override
  String get qrHomeTabCreate => 'Créer';

  @override
  String get qrHomeScanTitle => 'Scanner un code';

  @override
  String get qrHomeScanBody =>
      'Pointez la caméra vers un code QR ou un code-barres pour le scanner instantanément.';

  @override
  String get qrHomeBadgeInstant => 'Instantané';

  @override
  String get qrHomeBadgeHistory => 'Historique enregistré';

  @override
  String get qrHomeStartScan => 'Commencer le scan';

  @override
  String get qrHomeCreateTitle => 'Créer un code';

  @override
  String get qrHomeCreateBody =>
      'Créez un code QR à partir d’un texte ou d’une URL, puis enregistrez-le ou partagez-le.';

  @override
  String get qrHomeBadgeShare => 'Partage partout';

  @override
  String get qrHomeBadgeImage => 'Enregistrer en image';

  @override
  String get qrHomeOpenGenerator => 'Ouvrir le générateur';

  @override
  String get qrHistoryTitle => 'Historique des scans';

  @override
  String get qrHistoryMore => 'Plus d’options';

  @override
  String get qrHistoryEmpty => 'Les codes scannés apparaîtront ici.';

  @override
  String get wifiQrPlaceholder =>
      'Saisissez les infos Wi‑Fi\npour générer le QR';

  @override
  String get wifiQrPreviewLabel => 'Code QR Wi‑Fi';

  @override
  String get wifiQrNetworkDetails => 'Détails du réseau';

  @override
  String get wifiQrSsidLabel => 'Nom du réseau (SSID)';

  @override
  String get wifiQrSsidHint => 'Wi‑Fi de la maison';

  @override
  String get wifiQrPasswordLabel => 'Mot de passe';

  @override
  String get wifiQrPasswordHint => 'Saisissez le mot de passe';

  @override
  String get wifiQrShowPassword => 'Afficher le mot de passe';

  @override
  String get wifiQrHidePassword => 'Masquer le mot de passe';

  @override
  String get wifiQrSecurity => 'Sécurité';

  @override
  String get wifiQrSecurityNone => 'Aucune (ouvert)';

  @override
  String get wifiQrHidden => 'Réseau masqué';

  @override
  String get wifiQrHiddenHint =>
      'Activez si le nom du réseau n’est pas diffusé';

  @override
  String get wifiQrSaveImage => 'Enregistrer l’image';

  @override
  String get wifiQrInfo =>
      'Toute personne qui scanne ce code QR se connectera automatiquement à votre Wi‑Fi.';

  @override
  String get wifiQrShareText =>
      'Scannez ce code QR pour vous connecter à mon Wi‑Fi !';

  @override
  String get ocrCameraDenied =>
      'Accès à la caméra refusé. Ouvrez les Paramètres pour l’autoriser.';

  @override
  String get ocrCameraRequired =>
      'L’autorisation de la caméra est nécessaire pour prendre une photo.';

  @override
  String get ocrTimeout =>
      'La lecture a pris trop de temps — le modèle de texte est peut-être encore en téléchargement. Connectez-vous une fois au Wi‑Fi ou réessayez.';

  @override
  String get ocrFailed =>
      'Impossible de lire le texte de cette image. Essayez une photo plus nette.';

  @override
  String get ocrPreparing => 'Préparation de l’image…';

  @override
  String get ocrScanning => 'Lecture du texte…';

  @override
  String get ocrScriptLabel => 'Écriture du texte';

  @override
  String get ocrScriptHint =>
      'Choisissez l’alphabet de votre texte. L’arabe, l’ourdou et le bengali ne sont pas encore pris en charge.';

  @override
  String get ocrScriptLatin => 'Latin (français, anglais…)';

  @override
  String get ocrScriptDevanagari => 'Devanagari (hindi, marathi…)';

  @override
  String get ocrScriptChinese => 'Chinois';

  @override
  String get ocrScriptJapanese => 'Japonais';

  @override
  String get ocrScriptKorean => 'Coréen';

  @override
  String get ocrIdleTitle => 'Extrayez le texte de n’importe quelle image';

  @override
  String get ocrIdleBody =>
      'Pointez la caméra ou choisissez une photo — le texte est extrait instantanément, sur l’appareil.';

  @override
  String get ocrBadgeOnDevice => 'IA sur l’appareil';

  @override
  String get ocrBadgeLocal => 'Traité localement';

  @override
  String get ocrBadgeBlocks => 'Copie par bloc';

  @override
  String get ocrUseCamera => 'Utiliser la caméra';

  @override
  String get ocrChooseGallery => 'Choisir dans la galerie';

  @override
  String get ocrOnDeviceNote => 'Sur l’appareil · aucun envoi';

  @override
  String get ocrTabImage => 'Image';

  @override
  String get ocrTabText => 'Texte';

  @override
  String get ocrTapBlockHint =>
      'Touchez un bloc en surbrillance pour le copier';

  @override
  String get ocrBlockTitle => 'Texte du bloc';

  @override
  String ocrBlockLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lignes · touchez pour copier',
      one: '1 ligne · touchez pour copier',
    );
    return '$_temp0';
  }

  @override
  String get ocrCopyBlock => 'Copier le bloc';

  @override
  String get ocrBlockCopied => 'Bloc copié';

  @override
  String get ocrCopyEntireBlock => 'Copier tout le bloc';

  @override
  String get ocrCopyLine => 'Copier la ligne';

  @override
  String get ocrNoText => 'Aucun texte détecté — essayez une photo plus nette.';

  @override
  String get ocrQuickCopy => 'Copie rapide par section';

  @override
  String ocrBlockNCopied(int number) {
    return 'Bloc $number copié';
  }

  @override
  String get ocrDoneEditing => 'Terminer la modification';

  @override
  String get ocrEditText => 'Modifier le texte';

  @override
  String get ocrAllCopied => 'Tout le texte a été copié';

  @override
  String get ocrCopyAll => 'Tout copier';

  @override
  String get ocrScanAgain => 'Scanner';

  @override
  String ocrStatLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lignes',
      one: '1 ligne',
      zero: '0 ligne',
    );
    return '$_temp0';
  }

  @override
  String ocrStatWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mots',
      one: '1 mot',
      zero: '0 mot',
    );
    return '$_temp0';
  }

  @override
  String ocrStatChars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count caractères',
      one: '1 caractère',
      zero: '0 caractère',
    );
    return '$_temp0';
  }

  @override
  String get wordPdfNoText => 'Aucun texte extractible dans ce document.';

  @override
  String get wordPdfInfo =>
      'Convertit les fichiers .docx en PDF. Le texte est conservé ; les mises en page complexes (tableaux, images) peuvent différer.';

  @override
  String get wordPdfOpeningPicker => 'Ouverture du sélecteur de fichiers…';

  @override
  String wordPdfConverting(int percent) {
    return 'Conversion… $percent %';
  }

  @override
  String get wordPdfDone => 'Conversion terminée';

  @override
  String get wordPdfTapToPick => 'Touchez pour choisir un fichier .docx';

  @override
  String get wordPdfSupports => 'Format .docx pris en charge';

  @override
  String get wordPdfFailed =>
      'La conversion a échoué. Le fichier est peut-être endommagé ou n’est pas un .docx.';

  @override
  String get wordPdfFontsOffline =>
      'Une partie du texte (arabe, ourdou, hindi, bengali ou cyrillique, par ex.) manque dans ce PDF. Sa police n’est téléchargée qu’une fois : connectez-vous à Internet et reconvertissez.';

  @override
  String get wordPdfConvertAnother => 'Convertir un autre fichier';

  @override
  String get wordPdfPick => 'Choisir un fichier .docx';

  @override
  String get wordPdfStep1Title => 'Choisissez votre fichier Word';

  @override
  String get wordPdfStep1Desc =>
      'Sélectionnez un fichier .docx dans le stockage de l’appareil.';

  @override
  String get wordPdfStep2Title => 'Conversion automatique';

  @override
  String get wordPdfStep2Desc =>
      'Le texte est extrait et mis en page sur des pages PDF A4.';

  @override
  String get wordPdfStep3Title => 'Partagez ou enregistrez';

  @override
  String get wordPdfStep3Desc =>
      'Partagez le PDF vers n’importe quelle app, par e-mail ou dans le cloud.';

  @override
  String get wordPdfReady => 'PDF prêt';
}
