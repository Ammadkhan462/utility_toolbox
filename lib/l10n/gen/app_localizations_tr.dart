// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Utility Toolbox';

  @override
  String get navTools => 'Araçlar';

  @override
  String get navFiles => 'Dosyalarım';

  @override
  String get settingsTooltip => 'Ayarlar';

  @override
  String get searchHint => 'Ara: pdf küçült, tara, jpg…';

  @override
  String get quickActions => 'Hızlı işlemler';

  @override
  String get favorites => 'Favoriler';

  @override
  String get recent => 'Son kullanılanlar';

  @override
  String searchNoResults(String query) {
    return '“$query” ile eşleşen araç yok';
  }

  @override
  String get toolMenuAddFavorite => 'Favorilere ekle';

  @override
  String get toolMenuRemoveFavorite => 'Favorilerden çıkar';

  @override
  String get toolMenuPinShortcut => 'Ana ekrana ekle';

  @override
  String get pinShortcutRequested =>
      'Kısayolu ana ekrana eklemek için onaylayın';

  @override
  String get pinShortcutUnsupported =>
      'Ana ekran uygulamanız kısayolları desteklemiyor';

  @override
  String get newBadge => 'YENİ';

  @override
  String get catScan => 'Tarama & QR';

  @override
  String get catPdf => 'PDF';

  @override
  String get catImage => 'Fotoğraf & resim';

  @override
  String get catText => 'Metin & çeviri';

  @override
  String get catCalc => 'Hesapla & dönüştür';

  @override
  String get catNetwork => 'İnternet';

  @override
  String get catDevice => 'Cihaz & konum';

  @override
  String get catSecurity => 'Güvenlik';

  @override
  String get catMedia => 'Video & ses';

  @override
  String get toolDocScannerTitle => 'Belge Tarayıcı';

  @override
  String get toolDocScannerDesc => 'Kâğıdı PDF\'ye tara, kenarlar otomatik';

  @override
  String get toolDocScannerKeywords =>
      'scan paper, camscanner, document, pdf scanner, receipt, belge tarama, belge tarayıcı, pdf tarayıcı, evrak tarama, tarayıcı, fiş, makbuz, kağıt tara';

  @override
  String get toolQrScannerTitle => 'QR & Barkod Okuyucu';

  @override
  String get toolQrScannerDesc => 'Kameradan veya fotoğraftan';

  @override
  String get toolQrScannerKeywords =>
      'qr reader, barcode, scan code, qr okuyucu, qr kod okuma, karekod, karekod okuyucu, barkod okuyucu, barkod tara, kod tara';

  @override
  String get toolQrGeneratorTitle => 'QR Kod Oluştur';

  @override
  String get toolQrGeneratorDesc => 'Bağlantı, metin, kişi ve daha fazlası';

  @override
  String get toolQrGeneratorKeywords =>
      'qr maker, generate qr, barcode generator, qr kod oluşturma, karekod oluştur, qr yap, barkod oluştur';

  @override
  String get toolOcrTitle => 'Resimden Metne';

  @override
  String get toolOcrDesc => 'Fotoğraftaki yazıyı kopyala (OCR)';

  @override
  String get toolOcrKeywords =>
      'ocr, text scanner, extract text, copy text from image, resimden yazıya, fotoğraftan metin, yazı tarama, metin çıkar, resimdeki yazıyı kopyala';

  @override
  String get toolWifiQrTitle => 'WiFi QR Kodu';

  @override
  String get toolWifiQrDesc => 'Şifre yazmadan WiFi paylaş';

  @override
  String get toolWifiQrKeywords =>
      'wifi password, share wifi, wifi şifresi, wifi paylaş, kablosuz şifre, wi-fi';

  @override
  String get toolImageToPdfTitle => 'Resimden PDF\'ye';

  @override
  String get toolImageToPdfDesc => 'Fotoğrafları tek PDF yap';

  @override
  String get toolImageToPdfKeywords =>
      'jpg to pdf, photo to pdf, picture to pdf, jpg pdf çevirme, fotoğrafı pdf yap, resmi pdf yap, resim pdf dönüştürücü';

  @override
  String get toolMergePdfTitle => 'PDF Birleştir';

  @override
  String get toolMergePdfDesc => 'Birkaç PDF\'yi tek dosya yap';

  @override
  String get toolMergePdfKeywords =>
      'join pdf, combine pdf, pdf birleştirme, pdf birleştir, pdf ekleme';

  @override
  String get toolCompressPdfTitle => 'PDF Küçült';

  @override
  String get toolCompressPdfDesc => 'Göndermek için PDF\'yi küçült';

  @override
  String get toolCompressPdfKeywords =>
      'reduce pdf size, shrink pdf, pdf küçültme, pdf sıkıştır, pdf boyutu küçült, compress pdf';

  @override
  String get toolSplitPdfTitle => 'PDF Böl';

  @override
  String get toolSplitPdfDesc => 'Sayfa çıkar veya sil';

  @override
  String get toolSplitPdfKeywords =>
      'extract pages, delete pages, cut pdf, pdf bölme, pdf ayır, pdf sayfa silme, sayfa çıkar, split pdf';

  @override
  String get toolPdfToImagesTitle => 'PDF\'den JPG\'ye';

  @override
  String get toolPdfToImagesDesc => 'Her sayfayı resim olarak kaydet';

  @override
  String get toolPdfToImagesKeywords =>
      'pdf to image, pdf to png, pdf pages, pdf jpg çevirme, pdf resme çevir, pdf png, pdf to jpg';

  @override
  String get toolProtectPdfTitle => 'PDF Kilitle';

  @override
  String get toolProtectPdfDesc => 'PDF\'ye şifre ekle';

  @override
  String get toolProtectPdfKeywords =>
      'password pdf, encrypt pdf, secure pdf, pdf şifreleme, pdf şifre koy, pdf kilitle';

  @override
  String get toolUnlockPdfTitle => 'PDF Kilidi Aç';

  @override
  String get toolUnlockPdfDesc => 'Bildiğiniz şifreyi kaldırın';

  @override
  String get toolUnlockPdfKeywords =>
      'remove pdf password, decrypt pdf, pdf şifre kaldırma, pdf şifresini aç, pdf kilit açma';

  @override
  String get toolWordToPdfTitle => 'Word\'den PDF\'ye';

  @override
  String get toolWordToPdfDesc => '.docx belgelerini dönüştür';

  @override
  String get toolWordToPdfKeywords =>
      'doc to pdf, docx, word, word pdf çevirme, word\'ü pdf yap, docx pdf';

  @override
  String get toolImageCompressorTitle => 'Fotoğraf Küçült';

  @override
  String get toolImageCompressorDesc => 'Daha küçük dosya, aynı görünüm';

  @override
  String get toolImageCompressorKeywords =>
      'reduce image size, compress jpg, kb, fotoğraf küçültme, resim boyutu küçültme, jpg sıkıştır, fotoğraf sıkıştır';

  @override
  String get toolImageResizerTitle => 'Boyutlandır & Çevir';

  @override
  String get toolImageResizerDesc => 'Tam boyut, JPG, PNG veya WEBP';

  @override
  String get toolImageResizerKeywords =>
      'resize image, jpg to png, png to jpg, webp, passport size, resim boyutlandırma, fotoğraf boyutu değiştir, jpg png çevirme, vesikalık, biyometrik fotoğraf';

  @override
  String get toolImageEnhancerTitle => 'Fotoğraf Düzenle';

  @override
  String get toolImageEnhancerDesc => 'Filtre, kırpma, parlaklık ve dahası';

  @override
  String get toolImageEnhancerKeywords =>
      'edit photo, filter, crop, rotate, fotoğraf düzenleme, filtre, kırp, döndür, parlaklık';

  @override
  String get toolAiUpscalerTitle => 'AI Netleştirici';

  @override
  String get toolAiUpscalerDesc => 'Fotoğrafları 4×\'e kadar net büyüt';

  @override
  String get toolAiUpscalerKeywords =>
      'enhance, hd, increase resolution, blurry, fotoğraf netleştirme, bulanık fotoğraf, çözünürlük artırma, hd yap, yapay zeka';

  @override
  String get toolTranslationTitle => 'Çeviri';

  @override
  String get toolTranslationDesc => 'Çevrimdışı, sesli giriş ve okuma';

  @override
  String get toolTranslationKeywords =>
      'translator, language, dictionary, çeviri, çevirmen, tercüme, dil, sözlük, ingilizce türkçe çeviri';

  @override
  String get toolTextUtilitiesTitle => 'Metin Araçları';

  @override
  String get toolTextUtilitiesDesc => 'Kelime say, harf çevir, Base64';

  @override
  String get toolTextUtilitiesKeywords =>
      'word counter, uppercase, lowercase, base64, kelime sayacı, karakter sayısı, büyük harf, küçük harf';

  @override
  String get toolSmartClipboardTitle => 'Pano Yöneticisi';

  @override
  String get toolSmartClipboardDesc => 'Kopyalananları kaydet, sabitle, ara';

  @override
  String get toolSmartClipboardKeywords =>
      'copy paste, notes, clipboard history, kopyala yapıştır, pano, notlar, pano geçmişi';

  @override
  String get toolCalculatorTitle => 'Hesap Makinesi';

  @override
  String get toolCalculatorDesc => 'Geçmişli günlük hesap makinesi';

  @override
  String get toolCalculatorKeywords =>
      'calc, math, percent, hesap makinesi, hesapla, matematik, yüzde hesaplama';

  @override
  String get toolAgeCalculatorTitle => 'Yaş & Tarih';

  @override
  String get toolAgeCalculatorDesc => 'Tam yaş ve iki tarih arası gün';

  @override
  String get toolAgeCalculatorKeywords =>
      'birthday, date difference, days counter, yaş hesaplama, doğum günü, tarih farkı, gün sayacı, kaç gün kaldı';

  @override
  String get toolUnitConverterTitle => 'Birim Çevirici';

  @override
  String get toolUnitConverterDesc => 'Uzunluk, ağırlık, sıcaklık ve dahası';

  @override
  String get toolUnitConverterKeywords =>
      'convert units, cm to inch, kg to lb, celsius, birim çevirme, cm inç, kg libre, santigrat, ölçü çevirici';

  @override
  String get toolLoanCalculatorTitle => 'Kredi Hesaplama';

  @override
  String get toolLoanCalculatorDesc => 'Aylık taksit ve toplam faiz';

  @override
  String get toolLoanCalculatorKeywords =>
      'emi, mortgage, interest, installment, kredi hesaplama, taksit, faiz, konut kredisi, ihtiyaç kredisi, kredi';

  @override
  String get toolTimezoneTitle => 'Dünya Saati';

  @override
  String get toolTimezoneDesc => 'Her şehirde saat, widget ile';

  @override
  String get toolTimezoneKeywords =>
      'time zone, clock, city time, saat dilimi, dünya saati, şehir saati, saat';

  @override
  String get toolColorPickerTitle => 'Renk Seçici';

  @override
  String get toolColorPickerDesc => 'HEX, RGB, HSL ve CMYK';

  @override
  String get toolColorPickerKeywords =>
      'color code, hex, palette, renk kodu, renk paleti, renk';

  @override
  String get toolSpeedTestTitle => 'İnternet Hız Testi';

  @override
  String get toolSpeedTestDesc => 'İndirme, yükleme ve ping';

  @override
  String get toolSpeedTestKeywords =>
      'wifi speed, internet speed, mbps, speed test, hız testi, internet hızı, wifi hızı, hız ölçme';

  @override
  String get toolIpPingTitle => 'IP & Ping';

  @override
  String get toolIpPingDesc => 'IP adresiniz ve sunucu erişimi';

  @override
  String get toolIpPingKeywords =>
      'my ip, ping, network, ip adresim, ip adresi, ağ, ip öğren';

  @override
  String get toolCompassTitle => 'Pusula';

  @override
  String get toolCompassDesc => 'Yön ve açı';

  @override
  String get toolCompassKeywords =>
      'direction, north, qibla, pusula, yön, kuzey, kıble, kıble bulma';

  @override
  String get toolLocationSaverTitle => 'Konum Kaydet';

  @override
  String get toolLocationSaverDesc => 'GPS noktalarını kaydet ve paylaş';

  @override
  String get toolLocationSaverKeywords =>
      'parking, gps, map, coordinates, park yeri, konum, harita, koordinat, konum paylaş';

  @override
  String get toolPasswordGeneratorTitle => 'Şifre Oluşturucu';

  @override
  String get toolPasswordGeneratorDesc => 'Güçlü rastgele şifreler';

  @override
  String get toolPasswordGeneratorKeywords =>
      'secure password, random, güçlü şifre, şifre oluştur, rastgele şifre, parola';

  @override
  String get toolHashGeneratorTitle => 'Hash Oluşturucu';

  @override
  String get toolHashGeneratorDesc => 'Metin/dosya için MD5, SHA-1, SHA-256';

  @override
  String get toolHashGeneratorKeywords =>
      'checksum, md5, sha256, hash, sağlama toplamı, dosya doğrulama';

  @override
  String get toolVideoConverterTitle => 'Video Dönüştürücü';

  @override
  String get toolVideoConverterDesc => 'Videoyu MP3, GIF, MP4 ve dahasına';

  @override
  String get toolVideoConverterKeywords =>
      'video to mp3, gif maker, audio extract, videoyu mp3 yap, mp3 dönüştürücü, gif yapma, videodan ses çıkarma';

  @override
  String get filesEmptyTitle => 'Henüz dosya yok';

  @override
  String get filesEmptyBody =>
      'Oluşturduğunuz PDF\'ler, resimler ve diğer dosyalar burada görünür; tekrar açabilir veya paylaşabilirsiniz.';

  @override
  String get fileOpen => 'Aç';

  @override
  String get fileShare => 'Paylaş';

  @override
  String get fileRemoveFromList => 'Listeden kaldır';

  @override
  String get fileOpenFailed =>
      'Dosya açılamadı. Taşınmış veya silinmiş olabilir.';

  @override
  String get filesClearList => 'Listeyi temizle';

  @override
  String get filesClearConfirm =>
      'Liste temizlensin mi? Dosyalarınız cihazda kalır.';

  @override
  String get incomingSheetTitle => 'Ne yapmak istersiniz?';

  @override
  String incomingImages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resim',
      one: '1 resim',
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
  String get incomingText => 'Paylaşılan metin';

  @override
  String get incomingDocument => 'Word belgesi';

  @override
  String get incomingVideo => 'Video';

  @override
  String get incomingUnsupported => 'Bu dosya türü henüz desteklenmiyor';

  @override
  String get incomingFailed => 'Paylaşılan dosya okunamadı';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get settingsAppearance => 'Görünüm';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get themeSystem => 'Otomatik';

  @override
  String get themeLight => 'Açık';

  @override
  String get themeDark => 'Koyu';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get languageSystem => 'Sistem varsayılanı';

  @override
  String get settingsPurchases => 'Satın almalar';

  @override
  String get removeAdsTitle => 'Reklamları kaldır';

  @override
  String get removeAdsSubtitle => 'Tek seferlik ödeme, abonelik yok';

  @override
  String get restorePurchasesTitle => 'Satın almaları geri yükle';

  @override
  String get restorePurchasesSubtitle => 'Bu cihazdaki satın almayı geri getir';

  @override
  String get settingsSupport => 'Destek & gizlilik';

  @override
  String get shareAppTitle => 'Uygulamayı paylaş';

  @override
  String get shareAppSubtitle => 'Utility Toolbox\'ı bir arkadaşına öner';

  @override
  String shareAppMessage(String url) {
    return 'Belge taramak, PDF düzenlemek, QR kod okumak ve çevrimdışı çeviri için Utility Toolbox kullanıyorum. Ücretsiz: $url';
  }

  @override
  String get rateAppTitle => 'Uygulamayı puanla';

  @override
  String get rateAppSubtitle => 'Kısa bir yorum çok yardımcı olur';

  @override
  String get privacyPolicyTitle => 'Gizlilik politikası';

  @override
  String get privacyPolicySubtitle => 'Uygulama nelere neden erişir';

  @override
  String get privacyChoicesTitle => 'Reklam gizlilik seçenekleri';

  @override
  String get privacyChoicesSubtitle =>
      'Kişiselleştirilmiş reklam iznini değiştir';

  @override
  String versionLabel(String version) {
    return 'Sürüm $version';
  }

  @override
  String get onboardingSkip => 'Atla';

  @override
  String get onboardingNext => 'İleri';

  @override
  String get onboardingStart => 'Başla';

  @override
  String get onboarding1Title => 'Tüm araçlar,\ntek uygulama';

  @override
  String get onboarding1Body =>
      'Belge tara, PDF düzenle, QR kod oku, çeviri yap ve fotoğrafları boyutlandır — on uygulama yüklemeden.';

  @override
  String get onboarding2Title => 'Her uygulamadan\nçalışır';

  @override
  String get onboarding2Body =>
      'Bir fotoğrafı veya PDF\'yi Utility Toolbox\'a paylaşın, çevirmek için metni seçin ya da kısayollar için uygulama simgesine basılı tutun.';

  @override
  String get onboarding3Title => 'Hızlı, çevrimdışı\nve gizli';

  @override
  String get onboarding3Body =>
      'Neredeyse her şey telefonunuzda çalışır. Bulut seçeneğini kendiniz açmadıkça dosyalarınız asla yüklenmez.';

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonClear => 'Temizle';
}
