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

  @override
  String get toolBgRemoverTitle => 'Arka Planı Kaldır';

  @override
  String get toolBgRemoverDesc => 'Kişileri ve nesneleri tek dokunuşla kesin';

  @override
  String get toolBgRemoverKeywords =>
      'arka plan kaldır, arka plan sil, dekupe, kesme, şeffaf, çıkartma, vesikalık, beyaz arka plan, remove background, remove bg, cutout, png';

  @override
  String get toolBmiTitle => 'VKİ Hesaplama';

  @override
  String get toolBmiDesc =>
      'Vücut kitle indeksinizi ve sağlıklı kilonuzu öğrenin';

  @override
  String get toolBmiKeywords =>
      'VKİ, vücut kitle indeksi, kilo, boy, ideal kilo, obezite, sağlık, bmi, body mass index, weight, height, ideal weight, obesity';

  @override
  String get toolBubbleLevelTitle => 'Su terazisi';

  @override
  String get toolBubbleLevelDesc =>
      'Rafların ve çerçevelerin düz olup olmadığını kontrol edin';

  @override
  String get toolBubbleLevelKeywords =>
      'su terazisi, düzeç, terazi, açı, eğim, düz, level, spirit level, bubble level, tilt';

  @override
  String get toolCurrencyTitle => 'Döviz Çevirici';

  @override
  String get toolCurrencyDesc => '150+ para birimi için güncel kurlar';

  @override
  String get toolCurrencyKeywords =>
      'döviz, kur, döviz kuru, para birimi, para, çevir, dolar, euro, lira, sterlin, currency, exchange rate, money, convert, forex';

  @override
  String get toolDirectChatTitle => 'Direkt Sohbet';

  @override
  String get toolDirectChatDesc => 'Numarayı kaydetmeden WhatsApp’tan yazın';

  @override
  String get toolDirectChatKeywords =>
      'whatsapp, direkt sohbet, mesaj, kayıtsız numara, numara kaydetmeden, mesaj gönder, direct chat, message, unsaved number, click to chat, wa.me, send message, chat';

  @override
  String get toolFlashlightTitle => 'El feneri';

  @override
  String get toolFlashlightDesc => 'SOS ve flaşör modlu parlak fener';

  @override
  String get toolFlashlightKeywords =>
      'el feneri, fener, ışık, flaş, lamba, flaşör, flashlight, torch, light, led, sos, strobe, flash';

  @override
  String get toolOrganizePdfTitle => 'PDF Düzenle';

  @override
  String get toolOrganizePdfDesc =>
      'Sayfaları yeniden sıralayın, döndürün veya silin';

  @override
  String get toolOrganizePdfKeywords =>
      'düzenle, sırala, döndür, sayfa sil, sayfa kaldır, organize, organise, reorder, rotate, delete pages, remove pages, arrange, sort, pdf';

  @override
  String get toolPdfToTextTitle => 'PDF’den Metne';

  @override
  String get toolPdfToTextDesc => 'PDF’deki tüm metni kopyalayın';

  @override
  String get toolPdfToTextKeywords =>
      'metin çıkar, metni kopyala, pdf\'den txt, dönüştür, pdf oku, pdf to text, extract text, copy text, txt, read pdf, convert, pdf to word';

  @override
  String get toolPercentageTitle => 'Yüzde ve İndirim';

  @override
  String get toolPercentageDesc =>
      'Yüzde, indirim, bahşiş ve KDV saniyeler içinde';

  @override
  String get toolPercentageKeywords =>
      'yüzde, yüzde hesaplama, indirim, iskonto, bahşiş, hesap bölüşme, KDV, vergi, percentage, percent, discount, tip, split bill, tax, vat';

  @override
  String get toolSignPdfTitle => 'PDF İmzala';

  @override
  String get toolSignPdfDesc =>
      'İmzanızı çizin ve istediğiniz sayfaya yerleştirin';

  @override
  String get toolSignPdfKeywords =>
      'imzala, imza, e-imza, doldur ve imzala, paraf, sign, signature, e-sign, esign, fill and sign, autograph, pdf';

  @override
  String get toolStopwatchTitle => 'Kronometre ve Zamanlayıcı';

  @override
  String get toolStopwatchDesc =>
      'Turlu kronometre ve geri sayım zamanlayıcısı';

  @override
  String get toolStopwatchKeywords =>
      'kronometre, zamanlayıcı, geri sayım, tur, alarm, saat, mutfak zamanlayıcısı, antrenman, stopwatch, timer, countdown, lap';

  @override
  String get toolWatermarkPdfTitle => 'Filigran ve Sayfa Numaraları';

  @override
  String get toolWatermarkPdfDesc =>
      'Her sayfaya metin veya sayfa numarası ekleyin';

  @override
  String get toolWatermarkPdfKeywords =>
      'filigran, damga, sayfa numarası, numaralandır, gizli, taslak, altbilgi, watermark, stamp, page numbers, number pages, confidential, draft, footer, header, pdf';

  @override
  String get bmiMetric => 'Metrik (cm, kg)';

  @override
  String get bmiImperial => 'İngiliz (ft, lb)';

  @override
  String get bmiHeight => 'Boy';

  @override
  String get bmiWeight => 'Kilo';

  @override
  String get bmiFeet => 'Fit';

  @override
  String get bmiInches => 'İnç';

  @override
  String get bmiUnitCm => 'cm';

  @override
  String get bmiUnitKg => 'kg';

  @override
  String get bmiUnitLb => 'lb';

  @override
  String get bmiUnitFt => 'ft';

  @override
  String get bmiUnitIn => 'inç';

  @override
  String get bmiAge => 'Yaş (isteğe bağlı)';

  @override
  String get bmiSex => 'Cinsiyet (isteğe bağlı)';

  @override
  String get bmiMale => 'Erkek';

  @override
  String get bmiFemale => 'Kadın';

  @override
  String get bmiYourBmi => 'VKİ değeriniz';

  @override
  String get bmiUnderweight => 'Zayıf';

  @override
  String get bmiNormal => 'Sağlıklı kilo';

  @override
  String get bmiOverweight => 'Fazla kilolu';

  @override
  String get bmiObese => 'Obez';

  @override
  String bmiHealthyRange(String min, String max) {
    return 'Boyunuz için sağlıklı kilo: $min – $max';
  }

  @override
  String bmiToLose(String amount) {
    return 'Sağlıklı aralığın yaklaşık $amount üzerinde';
  }

  @override
  String bmiToGain(String amount) {
    return 'Sağlıklı aralığın yaklaşık $amount altında';
  }

  @override
  String bmiIdealWeight(String weight) {
    return 'Tahmini ideal kilo: $weight';
  }

  @override
  String get bmiChildNote =>
      '18 yaş altındaki çocuk ve gençlerde VKİ, yaşa göre büyüme eğrileriyle değerlendirilir. Bu sonuçlar yetişkin aralıklarını kullanır.';

  @override
  String get bmiDisclaimer =>
      'VKİ genel bir göstergedir, tıbbi teşhis değildir.';

  @override
  String get bmiEnterValues => 'Boyunuzu ve kilonuzu girin';

  @override
  String get currencyAmount => 'Tutar';

  @override
  String get currencyFrom => 'Çevrilen';

  @override
  String get currencyTo => 'Hedef';

  @override
  String get currencySwap => 'Para birimlerini değiştir';

  @override
  String get currencyChoose => 'Para birimi seç';

  @override
  String get currencySearchHint => 'Para birimi veya kod ara';

  @override
  String get currencyAll => 'Tüm para birimleri';

  @override
  String currencyRatesFrom(String date) {
    return '$date tarihli kurlar';
  }

  @override
  String get currencyRefresh => 'Kurları yenile';

  @override
  String get currencyUpdating => 'Kurlar güncelleniyor…';

  @override
  String get currencyOfflineCached =>
      'Güncellenemedi. Kayıtlı kurlar gösteriliyor.';

  @override
  String get currencyNoRatesTitle => 'Kurlar henüz indirilmedi';

  @override
  String get currencyNoRatesBody =>
      'Kurları indirmek için bir kez internete bağlanın. Sonrasında çevirici çevrimdışı da çalışır.';

  @override
  String get currencyRetry => 'Tekrar dene';

  @override
  String get currencyOtherFavorites => 'Favori para birimleriniz';

  @override
  String get currencyFavoritesHint =>
      'Buraya eklemek için listedeki bir para biriminin yanındaki ☆ simgesine dokunun.';

  @override
  String get currencyCopy => 'Sonucu kopyala';

  @override
  String get currencyCopied => 'Kopyalandı';

  @override
  String get currencyNoMatch => 'Para birimi bulunamadı';

  @override
  String get currencyDisclaimer =>
      'Kurlar yalnızca bilgi amaçlıdır ve bankanızın kurundan farklı olabilir.';

  @override
  String get directChatPhone => 'Telefon numarası';

  @override
  String get directChatCountryCode => 'Ülke kodu';

  @override
  String get directChatSearchCountry => 'Ülke veya kod ara';

  @override
  String get directChatNoCountry => 'Ülke bulunamadı';

  @override
  String get directChatMessage => 'Mesaj (isteğe bağlı)';

  @override
  String get directChatOpen => 'WhatsApp’ta aç';

  @override
  String get directChatPaste => 'Numarayı yapıştır';

  @override
  String get directChatPasteNone => 'Panoda telefon numarası yok';

  @override
  String get directChatTooShort => 'Numara çok kısa görünüyor';

  @override
  String get directChatTooLong => 'Numara çok uzun görünüyor';

  @override
  String directChatWillOpen(String number) {
    return '$number ile sohbet';
  }

  @override
  String get directChatOpenFailed => 'Sohbet açılamadı. WhatsApp yüklü mü?';

  @override
  String get directChatHint =>
      'Rehbere kaydetmeden herhangi bir numaraya mesaj gönderin.';

  @override
  String get directChatNotAffiliated =>
      'Bağımsız bir araçtır. WhatsApp veya Meta ile bağlantılı değildir.';

  @override
  String get percentageTabPercent => 'Yüzde';

  @override
  String get percentageTabDiscount => 'İndirim';

  @override
  String get percentageTabTip => 'Bahşiş';

  @override
  String get percentageTabTax => 'Vergi / KDV';

  @override
  String get percentageOfTitle => 'Bir sayının yüzdesi';

  @override
  String get percentageFieldPercent => 'Yüzde';

  @override
  String get percentageFieldNumber => 'Sayı';

  @override
  String percentageOfResult(String percent, String number) {
    return '$number × $percent';
  }

  @override
  String get percentageWhatTitle => 'Yüzde kaç?';

  @override
  String get percentageFieldPart => 'Değer';

  @override
  String get percentageFieldTotal => 'Toplam';

  @override
  String percentageWhatResult(String part, String total) {
    return '$total içinde $part';
  }

  @override
  String get percentageChangeTitle => 'Yüzde değişim';

  @override
  String get percentageFieldOld => 'Eski değer';

  @override
  String get percentageFieldNew => 'Yeni değer';

  @override
  String percentageIncrease(String percent) {
    return 'Artış: $percent';
  }

  @override
  String percentageDecrease(String percent) {
    return 'Azalış: $percent';
  }

  @override
  String get percentageNoChange => 'Değişim yok';

  @override
  String get percentageDifference => 'Fark';

  @override
  String get percentagePrice => 'Etiket fiyatı';

  @override
  String get percentageDiscount => 'İndirim';

  @override
  String get percentageExtraDiscount => 'Ek indirim (isteğe bağlı)';

  @override
  String get percentageYouPay => 'Ödeyeceğiniz';

  @override
  String get percentageYouSave => 'Tasarrufunuz';

  @override
  String get percentageTotalDiscount => 'Toplam indirim';

  @override
  String get percentageBill => 'Hesap tutarı';

  @override
  String get percentageTip => 'Bahşiş';

  @override
  String get percentageCustom => 'Özel';

  @override
  String get percentagePeople => 'Kişi sayısı';

  @override
  String get percentageAddPerson => 'Kişi ekle';

  @override
  String get percentageRemovePerson => 'Kişi çıkar';

  @override
  String get percentageTipAmount => 'Bahşiş tutarı';

  @override
  String get percentageTotal => 'Toplam';

  @override
  String get percentagePerPerson => 'Kişi başı';

  @override
  String get percentageTaxRate => 'Vergi oranı';

  @override
  String get percentageAddTax => 'Vergi ekle';

  @override
  String get percentageRemoveTax => 'Vergiyi çıkar';

  @override
  String get percentagePriceExclTax => 'Vergisiz fiyat';

  @override
  String get percentagePriceInclTax => 'Vergi dahil fiyat';

  @override
  String get percentageBeforeTax => 'Vergi öncesi';

  @override
  String get percentageTaxAmount => 'Vergi';

  @override
  String get percentageAfterTax => 'Vergi dahil toplam';

  @override
  String get percentageEnterValues => 'Sonucu görmek için sayıları girin';

  @override
  String get commonSave => 'Kaydet';

  @override
  String get commonShare => 'Paylaş';

  @override
  String get commonCopy => 'Kopyala';

  @override
  String get commonCopied => 'Kopyalandı';

  @override
  String get commonRetry => 'Tekrar dene';

  @override
  String get commonDone => 'Bitti';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonUndo => 'Geri al';

  @override
  String get commonOpen => 'Aç';

  @override
  String get commonReset => 'Sıfırla';

  @override
  String get commonClose => 'Kapat';

  @override
  String get commonOpenSettings => 'Ayarları aç';

  @override
  String get commonChoosePhoto => 'Fotoğraf seç';

  @override
  String get commonChooseFile => 'Dosya seç';

  @override
  String get commonCamera => 'Kamera';

  @override
  String get commonGallery => 'Galeri';

  @override
  String get commonWorking => 'İşleniyor…';

  @override
  String get commonSavedToGallery => 'Galeriye kaydedildi';

  @override
  String get commonSavedToDownloads => 'İndirilenler\'e kaydedildi';

  @override
  String get commonSaveFailed => 'Dosya kaydedilemedi';

  @override
  String get commonErrorGeneric =>
      'Bir şeyler ters gitti. Lütfen tekrar deneyin.';

  @override
  String get commonErrorOffline => 'İnternet bağlantısı yok';

  @override
  String get commonErrorTimeout =>
      'İstek zaman aşımına uğradı. Lütfen tekrar deneyin.';

  @override
  String get commonPermissionNeeded => 'İzin gerekli. Ayarlar\'dan izin verin.';

  @override
  String get commonResult => 'Sonuç';

  @override
  String get commonStart => 'Başlat';

  @override
  String get commonStop => 'Durdur';

  @override
  String get commonClearAll => 'Tümünü temizle';

  @override
  String get commonPaste => 'Yapıştır';

  @override
  String get commonSearch => 'Ara';

  @override
  String get organizePdfHint =>
      'Seçmek için sayfalara dokunun. Taşımak için bir sayfaya basılı tutup sürükleyin.';

  @override
  String organizePdfSelected(int count) {
    return '$count seçili';
  }

  @override
  String get organizePdfRotateLeft => 'Sola döndür';

  @override
  String get organizePdfRotateRight => 'Sağa döndür';

  @override
  String get organizePdfDelete => 'Sil';

  @override
  String get organizePdfSelectAll => 'Tümünü seç';

  @override
  String get organizePdfClearSelection => 'Seçimi temizle';

  @override
  String organizePdfDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa silindi',
    );
    return '$_temp0';
  }

  @override
  String get organizePdfUndo => 'Geri al';

  @override
  String get organizePdfKeepOne => 'Bir PDF’de en az bir sayfa olmalı.';

  @override
  String get organizePdfNoChanges =>
      'Henüz değişiklik yok — önce sayfaları taşıyın, döndürün veya silin.';

  @override
  String get organizePdfReset => 'Tüm değişiklikleri geri al';

  @override
  String get organizePdfMoveEarlier => 'Öne taşı';

  @override
  String get organizePdfMoveLater => 'Arkaya taşı';

  @override
  String get organizePdfSave => 'PDF’yi kaydet';

  @override
  String get organizePdfFailed => 'Bu PDF kaydedilemedi.';

  @override
  String get organizePdfResult => 'Düzenlenmiş PDF’niz hazır';

  @override
  String pdfToTextReading(int current, int total) {
    return '$total sayfadan $current. sayfa okunuyor…';
  }

  @override
  String pdfToTextWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kelime',
    );
    return '$_temp0';
  }

  @override
  String get pdfToTextCopyAll => 'Tümünü kopyala';

  @override
  String get pdfToTextCopied => 'Metin kopyalandı';

  @override
  String get pdfToTextSaveTxt => '.txt olarak kaydet';

  @override
  String get pdfToTextEmptyPage => 'Bu sayfada metin yok';

  @override
  String get pdfToTextScannedTitle => 'Metin bulunamadı';

  @override
  String get pdfToTextScannedBody =>
      'Bu PDF taranmış belge veya fotoğraf gibi görünüyor, bu yüzden kopyalanacak metin yok. Bunun yerine 1. sayfadaki kelimeleri görüntüden okuyabiliriz.';

  @override
  String pdfToTextOpenOcr(String tool) {
    return '1. sayfayı $tool ile oku';
  }

  @override
  String get pdfToTextFailed => 'Bu PDF’deki metin okunamadı.';

  @override
  String pdfToTextPartlyScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfada metin yok (taranmış olabilir).',
    );
    return '$_temp0';
  }

  @override
  String get pdfEditChoosePdf => 'Bir PDF seçin';

  @override
  String get pdfEditChooseHint =>
      'Ya da herhangi bir uygulamadan Utility Toolbox’a PDF paylaşın';

  @override
  String get pdfEditChange => 'Değiştir';

  @override
  String get pdfEditReading => 'Okunuyor…';

  @override
  String pdfEditPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa',
    );
    return '$_temp0';
  }

  @override
  String pdfEditPageN(int number) {
    return 'Sayfa $number';
  }

  @override
  String get pdfEditInvalidPdf => 'Bu dosya geçerli bir PDF gibi görünmüyor.';

  @override
  String get pdfEditLocked =>
      'Bu PDF parola korumalı. Önce parolayı kaldırın, sonra tekrar deneyin.';

  @override
  String get pdfEditLockedShort => 'Parola korumalı';

  @override
  String get pdfEditPreviewFailed => 'Bu sayfa gösterilemedi.';

  @override
  String get pdfEditResultReady => 'PDF’niz hazır';

  @override
  String get pdfEditSaveDownloads => 'İndirilenlere kaydet';

  @override
  String get pdfEditShare => 'Paylaş';

  @override
  String get pdfEditStartOver => 'Baştan başla';

  @override
  String get pdfEditSavedToDownloads =>
      'İndirilenlere kaydedildi — Dosyalarım’da bulabilirsiniz';

  @override
  String get pdfEditSharedInstead => 'Bunun yerine paylaşım menüsü açıldı';

  @override
  String get pdfEditSaveFailed =>
      'Dosya oluşturulamadı. Lütfen tekrar deneyin.';

  @override
  String get signPdfStepPdf => 'PDF’nizi seçin';

  @override
  String get signPdfStepSignature => 'İmzanızı oluşturun';

  @override
  String get signPdfStepPlace =>
      'İmzanızı yerleştirmek için bir sayfaya dokunun';

  @override
  String get signPdfDraw => 'İmza çiz';

  @override
  String get signPdfDrawAgain => 'Yeniden çiz';

  @override
  String get signPdfUseSaved => 'Kayıtlı imzayı kullan';

  @override
  String get signPdfDeleteSaved => 'Kayıtlı imzayı sil';

  @override
  String get signPdfSavedDeleted => 'Kayıtlı imza silindi';

  @override
  String get signPdfDrawTitle => 'İmzanızı çizin';

  @override
  String get signPdfDrawHint => 'Parmağınızla buraya imza atın';

  @override
  String get signPdfUndo => 'Geri al';

  @override
  String get signPdfInkBlack => 'Siyah';

  @override
  String get signPdfInkBlue => 'Mavi';

  @override
  String get signPdfRemember => 'İmzayı sonraki sefer için kaydet';

  @override
  String get signPdfDone => 'Bu imzayı kullan';

  @override
  String get signPdfEmpty => 'Önce imzanızı çizin.';

  @override
  String get signPdfSignatureLabel => 'İmzanız';

  @override
  String get signPdfPlaceHint =>
      'Taşımak için sürükleyin, boyutu iki parmakla veya kaydırıcıyla değiştirin. İmzayı oraya taşımak için sayfaya dokunun.';

  @override
  String get signPdfSize => 'Boyut';

  @override
  String get signPdfPlaceConfirm => 'Buraya yerleştir';

  @override
  String get signPdfRemoveFromPage => 'Bu sayfadan kaldır';

  @override
  String get signPdfAllPages => 'Tüm sayfalara ekle';

  @override
  String signPdfAllPagesDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'İmza $count sayfanın tümüne eklendi',
    );
    return '$_temp0';
  }

  @override
  String get signPdfClearAll => 'Tümünü kaldır';

  @override
  String signPdfPlacedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa imzalandı',
      zero: 'Henüz hiçbir sayfa imzalanmadı',
    );
    return '$_temp0';
  }

  @override
  String get signPdfSave => 'İmzalı PDF’yi kaydet';

  @override
  String get signPdfNoPlacement =>
      'Önce imzanızı yerleştirmek için bir sayfaya dokunun.';

  @override
  String get signPdfFailed => 'Bu PDF imzalanamadı.';

  @override
  String get signPdfResult => 'İmzalı PDF’niz hazır';

  @override
  String get watermarkPdfModeText => 'Metin filigranı';

  @override
  String get watermarkPdfModeNumbers => 'Sayfa numaraları';

  @override
  String get watermarkPdfText => 'Filigran metni';

  @override
  String get watermarkPdfDefaultText => 'GİZLİ';

  @override
  String get watermarkPdfTextEmpty => 'Önce filigran metnini yazın.';

  @override
  String get watermarkPdfSize => 'Metin boyutu';

  @override
  String get watermarkPdfOpacity => 'Opaklık';

  @override
  String get watermarkPdfLayout => 'Yerleşim';

  @override
  String get watermarkPdfDiagonal => 'Çapraz';

  @override
  String get watermarkPdfCenter => 'Orta';

  @override
  String get watermarkPdfTiled => 'Döşeli';

  @override
  String get watermarkPdfColor => 'Renk';

  @override
  String get watermarkPdfColorGrey => 'Gri';

  @override
  String get watermarkPdfColorRed => 'Kırmızı';

  @override
  String get watermarkPdfColorBlue => 'Mavi';

  @override
  String get watermarkPdfColorBlack => 'Siyah';

  @override
  String get watermarkPdfColorGreen => 'Yeşil';

  @override
  String get watermarkPdfFormat => 'Biçim';

  @override
  String watermarkPdfPageLabel(String number) {
    return 'Sayfa $number';
  }

  @override
  String get watermarkPdfPosition => 'Konum';

  @override
  String get watermarkPdfBottomCenter => 'Alt orta';

  @override
  String get watermarkPdfBottomRight => 'Sağ alt';

  @override
  String get watermarkPdfTopRight => 'Sağ üst';

  @override
  String get watermarkPdfStartAt => 'Başlangıç';

  @override
  String get watermarkPdfDecrease => 'Azalt';

  @override
  String get watermarkPdfIncrease => 'Artır';

  @override
  String get watermarkPdfPreview => 'Önizleme (sayfa 1)';

  @override
  String get watermarkPdfApplyText => 'Filigran ekle';

  @override
  String get watermarkPdfApplyNumbers => 'Sayfa numarası ekle';

  @override
  String get watermarkPdfFailed => 'Bu PDF güncellenemedi.';

  @override
  String get bgRemoverPickTitle => 'Bir fotoğraf seçin';

  @override
  String get bgRemoverPickBody =>
      'En iyi insanlar, evcil hayvanlar ve nesnelerle çalışır. Fotoğrafınız telefonunuzda işlenir.';

  @override
  String get bgRemoverGallery => 'Galeriden seç';

  @override
  String get bgRemoverCamera => 'Fotoğraf çek';

  @override
  String get bgRemoverPreparing => 'Fotoğraf hazırlanıyor…';

  @override
  String get bgRemoverWorking => 'Arka plan kaldırılıyor…';

  @override
  String get bgRemoverDownloading =>
      'Arka plan kaldırıcı hazırlanıyor. Bu yalnızca bir kez olur ve internet bağlantısı gerekir…';

  @override
  String get bgRemoverDownloadFailed =>
      'Arka plan kaldırıcı henüz hazır değil; Google Play Hizmetleri onu hâlâ indiriyor. İnternet bağlantınızı kontrol edip bir dakika sonra tekrar deneyin.';

  @override
  String get bgRemoverNoSubject =>
      'Bu fotoğrafta kişi veya nesne bulunamadı. Konusu net olan bir fotoğraf deneyin.';

  @override
  String get bgRemoverOpenFailed =>
      'Bu fotoğraf açılamadı. Başka bir tane deneyin.';

  @override
  String get bgRemoverFailed =>
      'Arka plan kaldırılırken bir sorun oluştu. Lütfen tekrar deneyin.';

  @override
  String get bgRemoverRetry => 'Tekrar dene';

  @override
  String get bgRemoverAnotherPhoto => 'Başka fotoğraf seç';

  @override
  String get bgRemoverNewPhoto => 'Yeni fotoğraf';

  @override
  String get bgRemoverBefore => 'Önce';

  @override
  String get bgRemoverAfter => 'Sonra';

  @override
  String get bgRemoverCompare => 'Önce ve sonrayı karşılaştır';

  @override
  String get bgRemoverCompareHint =>
      'Karşılaştırmak için kaydırıcıyı sürükleyin';

  @override
  String get bgRemoverBgTransparent => 'Şeffaf';

  @override
  String get bgRemoverBgWhite => 'Beyaz';

  @override
  String get bgRemoverBgBlack => 'Siyah';

  @override
  String get bgRemoverBgBlue => 'Mavi';

  @override
  String get bgRemoverBgRed => 'Kırmızı';

  @override
  String get bgRemoverBgYellow => 'Sarı';

  @override
  String get bgRemoverBgBlur => 'Bulanık';

  @override
  String get bgRemoverSave => 'Galeriye kaydet';

  @override
  String get bgRemoverSaved => 'Galerinize kaydedildi';

  @override
  String get bgRemoverSaveFailed =>
      'Görsel kaydedilemedi. Lütfen tekrar deneyin.';

  @override
  String get bgRemoverPngHint => 'Şeffaf arka planlı PNG';

  @override
  String get bgRemoverJpgHint => 'Seçilen arka planlı JPG';

  @override
  String get bubbleLevelSurfaceHint => 'Telefonu yüzeye düz yatırın';

  @override
  String get bubbleLevelUprightHint => 'Telefonun kenarını yüzeye dayayın';

  @override
  String get bubbleLevelLevel => 'Düz';

  @override
  String bubbleLevelAngleLabel(String angle) {
    return 'Eğim $angle derece';
  }

  @override
  String bubbleLevelAxes(String x, String y) {
    return 'Sol–sağ $x° · Ön–arka $y°';
  }

  @override
  String get bubbleLevelCalibrate => 'Kalibre et';

  @override
  String get bubbleLevelReset => 'Sıfırla';

  @override
  String get bubbleLevelCalibrateTitle => 'Su terazisi kalibre edilsin mi?';

  @override
  String get bubbleLevelCalibrateBody =>
      'Telefonu düz olduğundan emin olduğunuz bir yüzeye koyun (veya düz bir kenara dayayın), ardından Kalibre et\'e dokunun. Mevcut konum 0° olarak okunur.';

  @override
  String get bubbleLevelCalibrated =>
      'Kalibre edildi. Bu konum artık 0° gösteriyor.';

  @override
  String get bubbleLevelResetDone => 'Kalibrasyon temizlendi';

  @override
  String get bubbleLevelUnavailable =>
      'Bu telefonda hareket sensörü yok, bu yüzden su terazisi çalışamaz.';

  @override
  String get flashlightOn => 'Işık açık';

  @override
  String get flashlightOff => 'Işık kapalı';

  @override
  String get flashlightTurnOn => 'Işığı aç';

  @override
  String get flashlightTurnOff => 'Işığı kapat';

  @override
  String get flashlightModeSteady => 'Sabit';

  @override
  String get flashlightModeSos => 'SOS';

  @override
  String get flashlightModeStrobe => 'Flaşör';

  @override
  String get flashlightSosHint =>
      'İmdat sinyalini ··· ––– ··· tekrar tekrar yakıp söndürür';

  @override
  String flashlightStrobeSpeed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Saniyede $count flaş',
    );
    return '$_temp0';
  }

  @override
  String get flashlightUseScreen => 'Ekran ışığını kullan';

  @override
  String get flashlightUseScreenHint => 'Flaş yerine ekranı yak';

  @override
  String get flashlightNoTorch =>
      'Bu telefonda flaş yok, bu yüzden onun yerine ekran yanar.';

  @override
  String get flashlightTorchBusy =>
      'Flaş meşgul (kamerayı başka bir uygulama kullanıyor olabilir), bu yüzden ekran yanar.';

  @override
  String get flashlightScreenColor => 'Ekran ışığı rengi';

  @override
  String get flashlightColorWhite => 'Beyaz';

  @override
  String get flashlightColorWarm => 'Sıcak beyaz';

  @override
  String get flashlightColorRed => 'Kırmızı';

  @override
  String get flashlightColorGreen => 'Yeşil';

  @override
  String get flashlightColorBlue => 'Mavi';

  @override
  String get flashlightTapToTurnOff =>
      'Kapatmak için herhangi bir yere dokunun';

  @override
  String get stopwatchTabStopwatch => 'Kronometre';

  @override
  String get stopwatchTabTimer => 'Zamanlayıcı';

  @override
  String get stopwatchStart => 'Başlat';

  @override
  String get stopwatchPause => 'Duraklat';

  @override
  String get stopwatchResume => 'Devam et';

  @override
  String get stopwatchLap => 'Tur';

  @override
  String get stopwatchReset => 'Sıfırla';

  @override
  String stopwatchLapNumber(int number) {
    return 'Tur $number';
  }

  @override
  String stopwatchCurrentLap(int number, String time) {
    return 'Tur $number: $time';
  }

  @override
  String get stopwatchBest => 'En hızlı';

  @override
  String get stopwatchWorst => 'En yavaş';

  @override
  String get stopwatchNoLaps =>
      'Tur sürelerini kaydetmek için kronometre çalışırken Tur\'a dokunun.';

  @override
  String get stopwatchTimerQuickStart => 'Hızlı başlat';

  @override
  String stopwatchTimerMinutes(int minutes) {
    return '$minutes dk';
  }

  @override
  String get stopwatchTimerCustom => 'Kendi süreni ayarla';

  @override
  String get stopwatchTimerPickTitle => 'Zamanlayıcıyı ayarla';

  @override
  String get stopwatchTimerHours => 'saat';

  @override
  String get stopwatchTimerMinutesUnit => 'dk';

  @override
  String get stopwatchTimerSeconds => 'sn';

  @override
  String get stopwatchTimerAddMinute => '+1 dk';

  @override
  String get stopwatchTimerPaused => 'Duraklatıldı';

  @override
  String stopwatchTimerRemaining(String time) {
    return '$time kaldı';
  }

  @override
  String get stopwatchTimerTimesUp => 'Süre doldu!';

  @override
  String stopwatchTimerFinishedBody(String duration) {
    return '$duration süreli zamanlayıcınız bitti.';
  }

  @override
  String get stopwatchTimerRestart => 'Yeniden başlat';

  @override
  String get stopwatchTimerDone => 'Tamam';

  @override
  String get stopwatchTimerKeepOpen =>
      'Bu ekranı açık tutun: süre dolunca telefon titrer.';

  @override
  String get translateHeroTitle => 'Çevirmek için konuşun veya yazın';

  @override
  String get translateBadgeOnDevice => 'Cihaz üzerinde yapay zekâ';

  @override
  String get translateBadgeOffline => 'Çevrimdışı çalışır';

  @override
  String get translateFrom => 'Kaynak dil';

  @override
  String get translateTo => 'Hedef dil';

  @override
  String get translateSwap => 'Dilleri değiştir';

  @override
  String get translateHint =>
      'Metin girin veya konuşmak için mikrofona dokunun…';

  @override
  String get translateHintListening =>
      'Dinleniyor… doğal konuşun, durdurmak için mikrofona dokunun';

  @override
  String translateListeningIn(String language) {
    return 'Dinleniyor ($language)… durdurup çevirmek için mikrofona dokunun.';
  }

  @override
  String get translateSameLanguage => 'Kaynak ve hedef dil farklı olmalıdır.';

  @override
  String get translateButton => 'Çevir';

  @override
  String get translateTranslating => 'Çevriliyor…';

  @override
  String get translateStopAndTranslate => 'Durdur ve çevir';

  @override
  String get translateDownloadingModel => 'Dil modeli indiriliyor…';

  @override
  String get translateResultLabel => 'Çeviri';

  @override
  String get translatePlayAudio => 'Sesi oynat';

  @override
  String get translateGenerating => 'Oluşturuluyor…';

  @override
  String get translateShareAudio => 'Ses dosyasını paylaş';

  @override
  String get translateGenerateAudio => 'Ses dosyası oluştur';

  @override
  String get translateAudioReady =>
      'Ses dosyası hazır — göndermek veya kaydetmek için paylaşın.';

  @override
  String get translateMicStop => 'Dinlemeyi durdur ve çevir';

  @override
  String get translateMicStart => 'Çevirmek için konuşun';

  @override
  String get translateMicBlocked =>
      'Mikrofon erişimi engellendi. Sesli giriş için Ayarlar’dan açın.';

  @override
  String get translateMicNeeded => 'Sesli giriş için mikrofon izni gerekiyor.';

  @override
  String get translateSpeechUnavailable =>
      'Bu cihazda konuşma tanıma kullanılamıyor.';

  @override
  String get translateNoSpeech => 'Anlaşılamadı. Lütfen tekrar konuşun.';

  @override
  String get translateVoiceFailed =>
      'Sesli giriş durdu. Lütfen tekrar deneyin.';

  @override
  String get translateDownloadFailed =>
      'Dil modelleri indirilemedi. İnternet bağlantınızı kontrol edin.';

  @override
  String get translateFailed => 'Çeviri başarısız oldu. Lütfen tekrar deneyin.';

  @override
  String get translateAudioFailed => 'Bu cihazda ses dosyası oluşturulamadı.';

  @override
  String translateLanguageName(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'af': 'Afrikaanca',
      'sq': 'Arnavutça',
      'ar': 'Arapça',
      'be': 'Belarusça',
      'bn': 'Bengalce',
      'bg': 'Bulgarca',
      'ca': 'Katalanca',
      'zh': 'Çince (Basitleştirilmiş)',
      'hr': 'Hırvatça',
      'cs': 'Çekçe',
      'da': 'Danca',
      'nl': 'Felemenkçe',
      'en': 'İngilizce',
      'eo': 'Esperanto',
      'et': 'Estonca',
      'fi': 'Fince',
      'fr': 'Fransızca',
      'gl': 'Galiçyaca',
      'ka': 'Gürcüce',
      'de': 'Almanca',
      'el': 'Yunanca',
      'gu': 'Güceratça',
      'ht': 'Haiti Kreolü',
      'he': 'İbranice',
      'hi': 'Hintçe',
      'hu': 'Macarca',
      'is': 'İzlandaca',
      'id': 'Endonezce',
      'ga': 'İrlandaca',
      'it': 'İtalyanca',
      'ja': 'Japonca',
      'kn': 'Kannada dili',
      'ko': 'Korece',
      'lv': 'Letonca',
      'lt': 'Litvanca',
      'mk': 'Makedonca',
      'ms': 'Malayca',
      'mt': 'Maltaca',
      'mr': 'Marathi dili',
      'no': 'Norveççe',
      'fa': 'Farsça',
      'pl': 'Lehçe',
      'pt': 'Portekizce',
      'ro': 'Rumence',
      'ru': 'Rusça',
      'sk': 'Slovakça',
      'sl': 'Slovence',
      'es': 'İspanyolca',
      'sw': 'Svahili dili',
      'sv': 'İsveççe',
      'tl': 'Tagalogca (Filipince)',
      'ta': 'Tamilce',
      'te': 'Telugu dili',
      'th': 'Tayca',
      'tr': 'Türkçe',
      'uk': 'Ukraynaca',
      'ur': 'Urduca',
      'vi': 'Vietnamca',
      'cy': 'Galce',
      'other': '$code',
    });
    return '$_temp0';
  }

  @override
  String get textUtilMode => 'Mod';

  @override
  String get textUtilModeText => 'Metin';

  @override
  String get textUtilHint => 'Metni buraya girin…';

  @override
  String get textUtilHintBase64 => 'Dönüştürmek için metin veya Base64 girin…';

  @override
  String textUtilWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'kelime',
    );
    return '$_temp0';
  }

  @override
  String textUtilCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'karakter',
    );
    return '$_temp0';
  }

  @override
  String get textUtilNoSpaces => 'boşluksuz';

  @override
  String get textUtilUpper => 'BÜYÜK HARF';

  @override
  String get textUtilLower => 'küçük harf';

  @override
  String get textUtilTitle => 'Her Kelime Büyük';

  @override
  String get textUtilSentence => 'Cümle düzeni';

  @override
  String get textUtilEncode => 'Kodla';

  @override
  String get textUtilDecode => 'Kodu çöz';

  @override
  String get textUtilOutput => 'Çıktı';

  @override
  String get textUtilInvalidBase64 => 'Bu geçerli bir Base64 değil.';

  @override
  String get clipEmptyClipboard => 'Pano boş veya metin içermiyor.';

  @override
  String clipSaved(String text) {
    return 'Kaydedildi: $text';
  }

  @override
  String get clipAddManualTitle => 'Metni elle ekle';

  @override
  String get clipAddHint => 'Metni buraya yazın veya yapıştırın…';

  @override
  String get clipClearUnpinned => 'Sabitlenmemişleri temizle';

  @override
  String get clipClearHistoryTitle => 'Geçmiş temizlensin mi?';

  @override
  String get clipClearHistoryBody =>
      'Sabitlenmemiş tüm öğeler kaldırılsın mı? Sabitlenenler korunur.';

  @override
  String get clipSearchHint => 'Kliplerde ara…';

  @override
  String get clipFilterAll => 'Tümü';

  @override
  String get clipFilterPinned => 'Sabitlenenler';

  @override
  String get clipFilterLinks => 'Bağlantılar';

  @override
  String get clipFilterText => 'Metin';

  @override
  String get clipFilterCode => 'Kod';

  @override
  String clipSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString kayıtlı',
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
      other: '$countString sabitlendi',
    );
    return '$_temp0';
  }

  @override
  String get clipAddText => 'Metin ekle';

  @override
  String get clipLabel => 'Etiket';

  @override
  String get clipAddLabelTitle => 'Etiket ekle';

  @override
  String get clipLabelHint => 'ör. İş e-postası';

  @override
  String get clipEmptyTitle => 'Henüz klip yok';

  @override
  String get clipEmptyMessage =>
      'Telefonunuzda herhangi bir metni kopyalayın, ardından kalıcı olarak buraya kaydetmek için Yapıştır’a dokunun.';

  @override
  String get clipPasteFromClipboard => 'Panodan yapıştır';

  @override
  String get clipTypeLink => 'Bağlantı';

  @override
  String get clipTypeEmail => 'E-posta';

  @override
  String get clipTypePhone => 'Telefon';

  @override
  String get clipTypeCode => 'Kod';

  @override
  String get clipTypeText => 'Metin';

  @override
  String get clipJustNow => 'az önce';

  @override
  String clipMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dk önce',
    );
    return '$_temp0';
  }

  @override
  String clipHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sa önce',
    );
    return '$_temp0';
  }

  @override
  String clipDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün önce',
    );
    return '$_temp0';
  }

  @override
  String get clipPin => 'Sabitle';

  @override
  String get clipUnpin => 'Sabitlemeyi kaldır';

  @override
  String get calcDivideByZero => 'Sıfıra bölünemez';

  @override
  String get calcCheckExpression => 'İfadeyi kontrol edin';

  @override
  String get calcCopyResult => 'Sonucu kopyala';

  @override
  String get calcPlus => 'Artı';

  @override
  String get calcMinus => 'Eksi';

  @override
  String get calcTimes => 'Çarpı';

  @override
  String get calcDivide => 'Bölü';

  @override
  String get calcPercent => 'Yüzde';

  @override
  String get calcParentheses => 'Parantez';

  @override
  String get calcEquals => 'Eşittir';

  @override
  String get calcDecimalPoint => 'Ondalık nokta';

  @override
  String get ageTabAge => 'Yaş';

  @override
  String get ageTabBetween => 'Tarihler arası';

  @override
  String get ageDateOfBirth => 'Doğum tarihi';

  @override
  String get ageFrom => 'Başlangıç';

  @override
  String get ageTo => 'Bitiş';

  @override
  String get ageFutureDate => 'Bu tarih gelecekte.';

  @override
  String ageYearsUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'yıl',
    );
    return '$_temp0';
  }

  @override
  String ageDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'gün',
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
      other: '$countString yıl',
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
      other: '$countString ay',
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
      other: '$countString gün',
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
      other: '$countString hafta',
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
      other: '$countString gün sonra',
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
  String get ageNextBirthday => 'Sonraki doğum günü';

  @override
  String get ageBirthdayToday => 'Bugün 🎉';

  @override
  String get ageTotalMonths => 'Toplam ay';

  @override
  String get ageTotalWeeks => 'Toplam hafta';

  @override
  String get ageTotalDays => 'Toplam gün';

  @override
  String get ageWeeksLabel => 'Hafta';

  @override
  String get ageWeekdays => 'Hafta içi (Pzt–Cum)';

  @override
  String get ageHours => 'Saat';

  @override
  String get ageIncludingEnd => 'Bitiş günü dahil';

  @override
  String get unitFrom => 'Şundan';

  @override
  String get unitTo => 'Şuna';

  @override
  String get unitEnterValue => 'Değer girin';

  @override
  String get unitSwap => 'Birimleri değiştir';

  @override
  String unitCategoryName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'length': 'Uzunluk',
      'weight': 'Ağırlık',
      'temperature': 'Sıcaklık',
      'area': 'Alan',
      'volume': 'Hacim',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String unitName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'millimeter': 'Milimetre',
      'centimeter': 'Santimetre',
      'meter': 'Metre',
      'kilometer': 'Kilometre',
      'inch': 'İnç',
      'foot': 'Fit',
      'mile': 'Mil',
      'gram': 'Gram',
      'kilogram': 'Kilogram',
      'ounce': 'Ons',
      'pound': 'Libre',
      'celsius': 'Celsius',
      'fahrenheit': 'Fahrenheit',
      'kelvin': 'Kelvin',
      'squareMeter': 'Metrekare',
      'squareFoot': 'Fitkare',
      'acre': 'Akre',
      'hectare': 'Hektar',
      'milliliter': 'Mililitre',
      'liter': 'Litre',
      'gallonUs': 'Galon (ABD)',
      'fluidOunce': 'Sıvı ons',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String get loanAmount => 'Kredi tutarı';

  @override
  String get loanInterestRate => 'Yıllık faiz oranı';

  @override
  String get loanTenure => 'Vade';

  @override
  String get loanTenureMonths => 'Vade (ay)';

  @override
  String get loanTenureYears => 'Vade (yıl)';

  @override
  String get loanToggleMonths => 'Ay';

  @override
  String get loanToggleYears => 'Yıl';

  @override
  String get loanEmpty =>
      'Taksiti hesaplamak için yukarıya geçerli kredi bilgileri girin';

  @override
  String get loanMonthlyEmi => 'Aylık taksit';

  @override
  String get loanPrincipal => 'Anapara';

  @override
  String get loanTotalInterest => 'Toplam faiz';

  @override
  String get loanTotalPayment => 'Toplam ödeme';

  @override
  String get loanBreakdown => 'Dağılım';

  @override
  String get loanInterest => 'Faiz';

  @override
  String loanInterestShare(String percent) {
    return '$percent faiz';
  }

  @override
  String get loanSchedule => 'Ödeme planı';

  @override
  String loanMonths(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ay',
    );
    return '$_temp0';
  }

  @override
  String get loanColMonth => 'Ay';

  @override
  String get loanColBalance => 'Kalan';

  @override
  String get loanShowAll => 'Tüm ayları göster';

  @override
  String get loanShowLess => 'Daha az göster';

  @override
  String get clockSearchHint => 'Şehir veya ülke ara…';

  @override
  String get clockPinned => 'Sabitlenenler';

  @override
  String get clockAllCities => 'Tüm şehirler';

  @override
  String clockOnWidget(int shown, int total) {
    final intl.NumberFormat shownNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String shownString = shownNumberFormat.format(shown);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Widget’ta: $totalString içinden $shownString';
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

    return 'Widget’ta: en fazla $maxString içinden $shownString (daha fazlası için boyutlandırın)';
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

    return 'Ana ekran widget’ı varsayılan olarak ilk $defaultRowsString şehri gösterir — $maxRowsString taneye kadar görmek için alt kenarını aşağı sürükleyin.';
  }

  @override
  String get clockPin => 'Sabitle';

  @override
  String get clockUnpin => 'Sabitlemeyi kaldır';

  @override
  String get clockNoResults => 'Eşleşen şehir yok';

  @override
  String get speedSelectingServer => 'Sunucu seçiliyor…';

  @override
  String get speedPhasePing => 'Ping ölçülüyor';

  @override
  String get speedPhaseDownload => 'İndirme hızı test ediliyor';

  @override
  String get speedPhaseUpload => 'Yükleme hızı test ediliyor';

  @override
  String get speedDownloadSpeed => 'İndirme hızı';

  @override
  String get speedUploadSpeed => 'Yükleme hızı';

  @override
  String get speedRunAgain => 'Tekrar';

  @override
  String get speedGo => 'BAŞLA';

  @override
  String speedMeasuredVia(String server) {
    return '$server üzerinden ölçüldü';
  }

  @override
  String get speedPoweredBy => 'Cloudflare hız testi sunucularını kullanır';

  @override
  String get speedIdleHint =>
      'Ping, indirme ve yükleme hızını ölçmek için düğmeye dokunun.';

  @override
  String get speedPing => 'Ping';

  @override
  String get speedResultsTitle => 'Hız testi sonuçları';

  @override
  String get speedDownload => 'İndirme';

  @override
  String get speedUpload => 'Yükleme';

  @override
  String speedConnectedIp(String ip) {
    return 'IP adresiniz: $ip';
  }

  @override
  String get speedErrorOffline =>
      'İnternet bağlantısı yok. Wi-Fi\'nizi veya mobil verinizi kontrol edin.';

  @override
  String get speedErrorTimeout =>
      'Test zaman aşımına uğradı. Bağlantınız kararsız olabilir.';

  @override
  String get speedErrorFailed => 'Test başarısız oldu. Lütfen tekrar deneyin.';

  @override
  String get pingErrorHostNotFound =>
      'Ana bilgisayar bulunamadı. Adresi ve internet bağlantınızı kontrol edin.';

  @override
  String get pingErrorNoData => 'Bu adres için bilgi yok.';

  @override
  String get pingTabMyIp => 'IP\'m';

  @override
  String get pingTabLookup => 'Sorgula';

  @override
  String get pingTabPing => 'Ping';

  @override
  String get pingYourPublicIp => 'Genel IP adresiniz';

  @override
  String get pingFieldCity => 'Şehir';

  @override
  String get pingFieldRegion => 'Bölge';

  @override
  String get pingFieldCountry => 'Ülke';

  @override
  String get pingFieldIsp => 'Sağlayıcı';

  @override
  String get pingFieldTimezone => 'Saat dilimi';

  @override
  String get pingFieldLocation => 'Koordinatlar';

  @override
  String get pingFieldIp => 'IP adresi';

  @override
  String get pingIpCopied => 'IP adresi kopyalandı';

  @override
  String get pingCopyIp => 'IP\'yi kopyala';

  @override
  String get pingLookupHint => 'IP adresi veya ana bilgisayar adı';

  @override
  String get pingLookupButton => 'Sorgula';

  @override
  String get pingHostHint => 'Ana bilgisayar adı (ör. google.com)';

  @override
  String get pingStartButton => 'Ping at';

  @override
  String pingHeader(String host, String ip) {
    return '$host ($ip) adresine TCP 443 portu üzerinden ping';
  }

  @override
  String get pingStatAvg => 'Ortalama';

  @override
  String get pingStatLoss => 'Kayıp';

  @override
  String get pingStatSent => 'Gönderilen';

  @override
  String get pingTimeout => 'Zaman aşımı';

  @override
  String get compassN => 'K';

  @override
  String get compassNE => 'KD';

  @override
  String get compassE => 'D';

  @override
  String get compassSE => 'GD';

  @override
  String get compassS => 'G';

  @override
  String get compassSW => 'GB';

  @override
  String get compassW => 'B';

  @override
  String get compassNW => 'KB';

  @override
  String get compassNorth => 'Kuzey';

  @override
  String get compassNortheast => 'Kuzeydoğu';

  @override
  String get compassEast => 'Doğu';

  @override
  String get compassSoutheast => 'Güneydoğu';

  @override
  String get compassSouth => 'Güney';

  @override
  String get compassSouthwest => 'Güneybatı';

  @override
  String get compassWest => 'Batı';

  @override
  String get compassNorthwest => 'Kuzeybatı';

  @override
  String compassSemantics(String degrees, String direction) {
    return 'Yön $degrees°, $direction';
  }

  @override
  String get compassHeadingMagnetic => 'Manyetik yön';

  @override
  String get compassUnavailable =>
      'Bu cihazda manyetometre yok, bu yüzden pusula çalışamaz.';

  @override
  String get locationSavedHeader => 'Kayıtlı konumlar';

  @override
  String locationSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString kayıtlı',
      zero: 'Henüz yok',
    );
    return '$_temp0';
  }

  @override
  String locationEmpty(String save) {
    return 'Henüz kayıtlı konum yok.\nBulunduğunuz yeri kaydetmek için \"$save\" düğmesine dokunun.';
  }

  @override
  String locationDeleted(String name) {
    return '\"$name\" silindi';
  }

  @override
  String get locationSaveDialogTitle => 'Konumu kaydet';

  @override
  String get locationNameLabel => 'Ad';

  @override
  String get locationNameHint => 'ör. Ev, İş…';

  @override
  String get locationNoteLabel => 'Not (isteğe bağlı)';

  @override
  String get locationCurrent => 'Mevcut konum';

  @override
  String get locationRefresh => 'Konumu yenile';

  @override
  String get locationLocating => 'Konumunuz bulunuyor…';

  @override
  String get locationServicesOff =>
      'Konum kapalı. Nerede olduğunuzu görmek için açın.';

  @override
  String get locationPermissionDenied =>
      'Nerede olduğunuzu görmek için konum erişimine izin verin.';

  @override
  String get locationPermissionDeniedForever =>
      'Konum erişimi engellendi. Bu aracı kullanmak için Ayarlar\'dan izin verin.';

  @override
  String get locationErrorTimeout =>
      'GPS sinyali alınamadı. Bir pencereye yaklaşın veya dışarı çıkıp tekrar deneyin.';

  @override
  String get locationAllow => 'İzin ver';

  @override
  String locationAccuracy(String meters) {
    return 'Doğruluk: ±$meters m';
  }

  @override
  String get locationCoordsCopied => 'Koordinatlar kopyalandı';

  @override
  String get locationCopyCoords => 'Koordinatları kopyala';

  @override
  String get locationOpenInMaps => 'Haritalar\'da aç';

  @override
  String get passwordYours => 'Şifreniz';

  @override
  String get passwordSelectType => 'En az bir karakter türü seçin';

  @override
  String get passwordStrength => 'Güç';

  @override
  String get passwordWeak => 'Zayıf';

  @override
  String get passwordFair => 'Orta';

  @override
  String get passwordGood => 'İyi';

  @override
  String get passwordStrong => 'Güçlü';

  @override
  String get passwordLength => 'Uzunluk';

  @override
  String passwordChars(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString karakter',
    );
    return '$_temp0';
  }

  @override
  String get passwordInclude => 'Dahil et';

  @override
  String get passwordUppercase => 'Büyük harf';

  @override
  String get passwordLowercase => 'Küçük harf';

  @override
  String get passwordNumbers => 'Rakamlar';

  @override
  String get passwordSymbols => 'Semboller';

  @override
  String get passwordCopied => 'Şifre kopyalandı';

  @override
  String get passwordGenerate => 'Yeni oluştur';

  @override
  String get hashModeText => 'Metin';

  @override
  String get hashModeFile => 'Dosya';

  @override
  String get hashAlgorithm => 'Algoritma';

  @override
  String get hashInputHint => 'Hash\'lenecek metni girin…';

  @override
  String get hashPickFile => 'Dosya seçmek için dokunun';

  @override
  String get hashChange => 'Değiştir';

  @override
  String get hashHashing => 'Hesaplanıyor…';

  @override
  String get hashGenerate => 'Hash oluştur';

  @override
  String get hashFileError => 'Bu dosya okunamadı. Başka bir dosya deneyin.';

  @override
  String get hashCopied => 'Hash kopyalandı';

  @override
  String get hashCopy => 'Hash\'i kopyala';

  @override
  String get colorPickerFormats => 'Renk biçimleri';

  @override
  String get colorPickerHexLabel => 'HEX renk';

  @override
  String get colorPickerHexInvalid => '6 hex rakamı girin (0–9, A–F)';

  @override
  String get colorPickerApply => 'Rengi uygula';

  @override
  String colorPickerCopied(String format) {
    return '$format kopyalandı';
  }

  @override
  String get colorPickerPalette => 'Hızlı palet';

  @override
  String colorPickerSwatch(String hex) {
    return 'Renk $hex';
  }

  @override
  String get imgCompressPickHint => 'Fotoğraf seçmek veya çekmek için dokunun';

  @override
  String imgCompressSupported(String formats) {
    return 'Desteklenenler: $formats';
  }

  @override
  String get imgCompressChange => 'Fotoğrafı değiştir';

  @override
  String get imgCompressModeQuality => 'Kaliteye göre';

  @override
  String get imgCompressModeTarget => 'Hedef boyut';

  @override
  String get imgCompressQuality => 'Kalite';

  @override
  String get imgCompressSmallest => 'En küçük dosya';

  @override
  String get imgCompressBestQuality => 'En iyi kalite';

  @override
  String get imgCompressQualityNote =>
      'Büyük fotoğraflar ayrıca yaklaşık 1920×1080\'e küçültülür.';

  @override
  String imgCompressTargetUnder(String size) {
    return '$size altı';
  }

  @override
  String get imgCompressTargetHint =>
      'Sınıra uyan en iyi kaliteyi korur — iş ve resmi başvuru formları için kullanışlı.';

  @override
  String get imgCompressButton => 'Fotoğrafı sıkıştır';

  @override
  String get imgCompressCompressing => 'Sıkıştırılıyor…';

  @override
  String get imgCompressSuccess => 'Başarıyla sıkıştırıldı!';

  @override
  String imgCompressFitsTarget(String size) {
    return 'Tamam — $size altında';
  }

  @override
  String imgCompressMissedTarget(String size) {
    return '$size altına inilemedi. Yapabildiğimiz en küçük sürüm bu.';
  }

  @override
  String get imgCompressStatOriginal => 'Orijinal';

  @override
  String get imgCompressStatCompressed => 'Sıkıştırılmış';

  @override
  String get imgCompressStatSaved => 'Kazanç';

  @override
  String get imgCompressFailed =>
      'Bu fotoğraf sıkıştırılamadı. Başka birini deneyin.';

  @override
  String get imgResizePresetPassport => 'Pasaport 35×45 mm';

  @override
  String imgResizePresetSquare(String size) {
    return 'Kare $size';
  }

  @override
  String imgResizePresetStory(String size) {
    return 'Hikaye $size';
  }

  @override
  String imgResizePresetMax(String name, String px) {
    return '$name (en fazla $px)';
  }

  @override
  String get imgResizeChoosePhotos => 'Fotoğraf seç';

  @override
  String imgResizeSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf seçildi',
      one: '1 fotoğraf seçildi',
    );
    return '$_temp0';
  }

  @override
  String get imgResizePickHint =>
      'Bir veya birden fazla seçin — ya da uygulamayla paylaşın';

  @override
  String get imgResizeChoose => 'Seç';

  @override
  String get imgResizeChange => 'Değiştir';

  @override
  String get imgResizePresets => 'Hazır ayarlar';

  @override
  String get imgResizeModePercent => 'Yüzde';

  @override
  String get imgResizeModeMaxSide => 'En uzun kenar';

  @override
  String get imgResizeModeExact => 'Tam';

  @override
  String get imgResizeWidth => 'Genişlik (px)';

  @override
  String get imgResizeHeight => 'Yükseklik (px)';

  @override
  String get imgResizeCrop => 'Sığdırmak için kırp (germe yok)';

  @override
  String get imgResizeFormat => 'Biçim';

  @override
  String get imgResizeQuality => 'Kalite';

  @override
  String get imgResizeButton => 'Boyutlandır';

  @override
  String imgResizeSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğrafı galeriye kaydet',
      one: '1 fotoğrafı galeriye kaydet',
    );
    return '$_temp0';
  }

  @override
  String get imgResizeChangeSettings => 'Ayarları değiştir';

  @override
  String imgResizeInvalidSize(int min, int max) {
    return '$min ile $max arasında bir genişlik ve yükseklik girin.';
  }

  @override
  String imgResizeFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf okunamadı.',
      one: '1 fotoğraf okunamadı.',
    );
    return '$_temp0';
  }

  @override
  String imgResizeSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf galeriye kaydedildi',
      one: '1 fotoğraf galeriye kaydedildi',
    );
    return '$_temp0';
  }

  @override
  String get imgEnhanceEmptyTitle => 'Fotoğraflarınızı düzenleyin';

  @override
  String get imgEnhanceEmptyBody =>
      'Parlaklık, kontrast, doygunluk ve keskinliği ayarlayın, hazır ayarlar uygulayın, döndürün ve çevirin — hepsi cihazınızda.';

  @override
  String get imgEnhanceFineControls => 'İnce ayarlar';

  @override
  String get imgEnhanceApplying => 'Uygulanıyor…';

  @override
  String get imgEnhanceChange => 'Değiştir';

  @override
  String get imgEnhancePresets => 'Hazır ayarlar';

  @override
  String get imgEnhanceTransform => 'Dönüştür';

  @override
  String get imgEnhanceAdjustments => 'Ayarlamalar';

  @override
  String get imgEnhanceRotate => 'Döndür';

  @override
  String get imgEnhanceFlipH => 'Yatay çevir';

  @override
  String get imgEnhanceFlipV => 'Dikey çevir';

  @override
  String get imgEnhanceBrightness => 'Parlaklık';

  @override
  String get imgEnhanceContrast => 'Kontrast';

  @override
  String get imgEnhanceSaturation => 'Doygunluk';

  @override
  String get imgEnhanceSharpen => 'Keskinleştir';

  @override
  String get imgEnhanceBlur => 'Bulanıklık';

  @override
  String get imgEnhanceQuality => 'Kalite';

  @override
  String get imgEnhanceApply => 'Uygula';

  @override
  String get imgEnhanceFailed =>
      'Düzenlemeler uygulanamadı. Başka bir fotoğraf deneyin.';

  @override
  String imgEnhanceResult(String before, String after, String change) {
    return 'Tamam! $before → $after ($change)';
  }

  @override
  String get imgEnhancePresetOriginal => 'Orijinal';

  @override
  String get imgEnhancePresetVivid => 'Canlı';

  @override
  String get imgEnhancePresetCool => 'Soğuk';

  @override
  String get imgEnhancePresetWarm => 'Sıcak';

  @override
  String get imgEnhancePresetDramatic => 'Dramatik';

  @override
  String get imgEnhancePresetFade => 'Soluk';

  @override
  String get imgEnhancePresetVintage => 'Eski tarz';

  @override
  String get imgEnhancePresetNoir => 'Noir';

  @override
  String get upscalerNewImage => 'Yeni fotoğraf';

  @override
  String get upscalerIntro =>
      'Fotoğrafları cihaz içi yapay zekâ ile 4 kata kadar büyütün. Tek seferlik model indirmesinden sonra çevrimdışı çalışır — yüzler için isteğe bağlı bulut modu.';

  @override
  String get upscalerBadgeOnDevice => 'Cihaz içi yapay zekâ';

  @override
  String get upscalerBadgeOffline => 'Çevrimdışı çalışır';

  @override
  String get upscalerBadgeUpTo4x => '4× büyüğe kadar';

  @override
  String get upscalerBadgeGpu => 'GPU hızlandırmalı';

  @override
  String get upscalerBestResults =>
      'En iyi sonuçlar: düşük çözünürlüklü fotoğraflar, eski taramalar, küçük resimler ve sıkıştırılmış JPEG\'ler.';

  @override
  String get upscalerChangeImage => 'Fotoğrafı değiştir';

  @override
  String get upscalerTabOriginal => 'Orijinal';

  @override
  String get upscalerTabUpscaled => 'YZ ile büyütülmüş';

  @override
  String get upscalerStageStarting => 'Başlatılıyor…';

  @override
  String get upscalerStageConnecting => 'YZ sunucusuna bağlanılıyor…';

  @override
  String get upscalerStageOnDevice => 'Bu cihazda işleniyor…';

  @override
  String get upscalerStageCloudUnavailable =>
      'Bulut kullanılamıyor — bu cihazda işleniyor…';

  @override
  String get upscalerStageUploading => 'Fotoğraf yükleniyor…';

  @override
  String get upscalerStageRestoringFaces =>
      'YZ yüzleri ve ayrıntıları onarıyor…';

  @override
  String get upscalerStagePreparing => 'Fotoğraf hazırlanıyor…';

  @override
  String get upscalerStageLoadingModel => 'YZ modeli yükleniyor…';

  @override
  String get upscalerStageDownloadingModel =>
      'YZ modeli indiriliyor (tek seferlik)…';

  @override
  String get upscalerStageFallback => 'Standart büyütme kullanılıyor…';

  @override
  String get upscalerStageDecoding => 'Fotoğraf okunuyor…';

  @override
  String upscalerStageResizing(String from, String to) {
    return 'Giriş boyutlandırılıyor ($from → $to)…';
  }

  @override
  String get upscalerStageDenoising => 'Gürültü azaltılıyor…';

  @override
  String upscalerStageUpscaling(String factor) {
    return 'Büyütülüyor ($factor×)…';
  }

  @override
  String upscalerStageAiTiles(String done, String total) {
    return 'YZ ile büyütülüyor… ($done/$total)';
  }

  @override
  String get upscalerStageSharpening => 'Keskinleştiriliyor…';

  @override
  String get upscalerStageColour => 'Renkler ayarlanıyor…';

  @override
  String get upscalerStageSaving => 'Kaydediliyor…';

  @override
  String get upscalerStageDone => 'Tamam!';

  @override
  String get upscalerLoadingModelHint =>
      'YZ modeli yükleniyor (yalnızca ilk sefer)';

  @override
  String get upscalerTime4x =>
      '4× büyütme, fotoğraf boyutuna göre 15–60 s sürebilir.';

  @override
  String get upscalerTime2x => '2× büyütme genellikle 5–20 s sürer.';

  @override
  String upscalerDoneIn(String seconds) {
    return '$seconds s içinde büyütüldü';
  }

  @override
  String get upscalerStatResolution => 'Çözünürlük';

  @override
  String get upscalerStatFileSize => 'Dosya boyutu';

  @override
  String get upscalerStatScale => 'Ölçek';

  @override
  String get upscalerShareSubject => 'YZ ile büyütülmüş fotoğraf';

  @override
  String get upscalerFallbackModelUnavailable =>
      'YZ modeli bir kez internet gerektirir — standart büyütme kullanıldı';

  @override
  String get upscalerFallbackModelFailed =>
      'YZ modeli bu cihazda çalıştırılamadı — standart büyütme kullanıldı';

  @override
  String get upscalerFallbackCloud =>
      'Bulut sunucusu kullanılamıyor — bu cihazda işlendi';

  @override
  String get upscalerSettings => 'YZ ayarları';

  @override
  String get upscalerFactorLabel => 'Büyütme oranı';

  @override
  String get upscalerFactor2xDesc => 'Hızlı — çoğu fotoğraf için ideal';

  @override
  String get upscalerFactor4xDesc => 'En iyi kalite — daha yavaş';

  @override
  String get upscalerOptimiseFor => 'Şunun için optimize et';

  @override
  String get upscalerModeAuto => 'Otomatik';

  @override
  String get upscalerModePhoto => 'Fotoğraf';

  @override
  String get upscalerModeIllustration => 'İllüstrasyon';

  @override
  String get upscalerModeFace => 'Yüz ayrıntısı';

  @override
  String get upscalerDenoise => 'Ön gürültü azaltma';

  @override
  String get upscalerDenoiseTip => 'Büyütmeden önce JPEG gürültüsünü azaltır';

  @override
  String get upscalerSharpen => 'Son keskinleştirme';

  @override
  String get upscalerSharpenTip => 'Büyütmeden sonra netlik katar';

  @override
  String get upscalerCloudTitle => 'Bulutta yüz iyileştirme';

  @override
  String get upscalerCloudOn =>
      'Fotoğrafınız işlenmek üzere sunucumuza yüklenir.';

  @override
  String get upscalerCloudOff => 'Kapalı — fotoğraflar bu cihazda kalır.';

  @override
  String get upscalerCloudDialogTitle => 'Fotoğraflar buluta gönderilsin mi?';

  @override
  String get upscalerCloudDialogBody =>
      'Bulut modu, seçtiğiniz fotoğrafı daha büyük bir YZ modeliyle (GFPGAN + Real-ESRGAN) işlenebilmesi için şifreli bir bağlantı üzerinden büyütme sunucumuza yükler.\n\n• Yalnızca büyütmek için seçtiğiniz fotoğraf gönderilir.\n• Fotoğraf bellekte işlenir ve sonuç döndükten sonra saklanmaz.\n• Hiçbir hesap veya kişisel bilgi gönderilmez.\n\nBunu istediğiniz zaman kapatabilirsiniz. Cihaz içi mod tamamen çevrimdışı çalışır.';

  @override
  String get upscalerCloudKeepLocal => 'Cihazda kalsın';

  @override
  String get upscalerCloudEnable => 'Bulutu etkinleştir';

  @override
  String get upscalerUpscale => 'YZ ile büyüt';

  @override
  String get upscalerUpscaleAgain => 'Yeni ayarlarla tekrar büyüt';

  @override
  String get upscalerFailed => 'Büyütme başarısız';

  @override
  String get upscalerErrorTooLarge =>
      'Fotoğraf çok büyük. Daha küçük bir fotoğraf veya 2× büyütme deneyin.';

  @override
  String get upscalerErrorUnreadable =>
      'Bu fotoğraf okunamadı. JPG veya PNG dosyası kullanın.';

  @override
  String get upscalerErrorNetwork =>
      'Ağ zaman aşımı. Bağlantınızı kontrol edin veya bulut modunu kapatın.';

  @override
  String get videoPickHint => 'Video seçmek için dokunun';

  @override
  String videoProbeInfo(String format, String duration) {
    return 'Biçim: $format · Süre: $duration';
  }

  @override
  String get videoOutputFormat => 'Çıktı biçimi';

  @override
  String get videoFmtMostCompatible => 'En uyumlu';

  @override
  String get videoFmtApple => 'Apple / QuickTime';

  @override
  String get videoFmtFlexible => 'Esnek kapsayıcı';

  @override
  String get videoFmtLegacy => 'Eski biçim';

  @override
  String get videoFmtGif => 'Animasyon (sessiz)';

  @override
  String get videoFmtAudioOnly => 'Yalnızca ses';

  @override
  String get videoFmtAudioAac => 'Yalnızca ses (AAC)';

  @override
  String get videoFmtAudioRaw => 'Yalnızca ses (ham)';

  @override
  String get videoFmtWav => 'Sıkıştırılmamış ses';

  @override
  String videoConvertingPercent(int percent) {
    return 'Dönüştürülüyor… %$percent';
  }

  @override
  String get videoConvertingWait => 'Dönüştürülüyor… bu biraz sürebilir';

  @override
  String get videoDone => 'Dönüştürme tamamlandı!';

  @override
  String get videoErrorUnsupported =>
      'Dönüştürme başarısız. Bu biçim cihazınızda desteklenmiyor olabilir.';

  @override
  String get videoConvertAnother => 'Başka birini dönüştür';

  @override
  String get videoPickButton => 'Video dosyası seç';

  @override
  String videoConvertTo(String format) {
    return '$format biçimine dönüştür';
  }

  @override
  String get docScanAndroidOnly =>
      'Belge tarayıcı yalnızca Android\'de kullanılabilir.';

  @override
  String docScanNeedsPlayServices(String details) {
    return 'Tarayıcı başlatılamadı. Google Play hizmetleri gerekiyor; güncel olduklarından emin olun. ($details)';
  }

  @override
  String get docScanStartFailed =>
      'Tarayıcı başlatılamadı. Lütfen tekrar deneyin.';

  @override
  String get docScanPdfSaved =>
      'PDF İndirilenler\'e kaydedildi — Dosyalarım\'da bulabilirsiniz';

  @override
  String docScanPagesSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa galeriye kaydedildi',
      one: '1 sayfa galeriye kaydedildi',
    );
    return '$_temp0';
  }

  @override
  String get docScanHeadline => 'Kağıdı temiz bir PDF\'e tarayın';

  @override
  String get docScanIntro =>
      'Kenarlar otomatik bulunur. İstediğiniz kadar sayfa ekleyin; kaydetmeden önce kırpın, döndürün ve filtre uygulayın.';

  @override
  String get docScanScanning => 'Taranıyor…';

  @override
  String get docScanStart => 'Taramayı başlat';

  @override
  String get docScanScannedPages => 'Taranan sayfalar';

  @override
  String docScanPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa',
      one: '1 sayfa',
    );
    return '$_temp0';
  }

  @override
  String get docScanSavePdf => 'PDF\'i kaydet';

  @override
  String get docScanSharePdf => 'PDF\'i paylaş';

  @override
  String get docScanCopyText => 'Metni kopyala';

  @override
  String get docScanSaveJpg => 'JPG olarak kaydet';

  @override
  String get docScanAnother => 'Başka bir belge tara';

  @override
  String get pdfToolsChoosePdf => 'PDF seç';

  @override
  String get pdfToolsChooseHint =>
      'Ya da herhangi bir uygulamadan Utility Toolbox\'a PDF paylaşın';

  @override
  String get pdfToolsReading => 'Okunuyor…';

  @override
  String get pdfToolsLockedShort => 'Parola korumalı';

  @override
  String pdfToolsPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa',
      one: '1 sayfa',
    );
    return '$_temp0';
  }

  @override
  String get pdfToolsChange => 'Değiştir';

  @override
  String get pdfToolsResultReady => 'PDF\'iniz hazır';

  @override
  String get pdfToolsSaveDownloads => 'İndirilenler\'e kaydet';

  @override
  String get pdfToolsStartOver => 'Baştan başla';

  @override
  String get pdfToolsSavedToDownloads =>
      'İndirilenler\'e kaydedildi — Dosyalarım\'da bulabilirsiniz';

  @override
  String get pdfToolsSharedInstead => 'Bunun yerine paylaşım menüsü açıldı';

  @override
  String get pdfToolsRangeEmpty => 'En az bir sayfa girin.';

  @override
  String pdfToolsRangeInvalid(String part) {
    return '“$part” bir sayfa ya da aralık değil (ör. 1-3, 5).';
  }

  @override
  String pdfToolsRangeOutside(String part, int count) {
    return '“$part” 1–$count aralığının dışında.';
  }

  @override
  String get pdfToolsInvalidPdf => 'Bu dosya geçerli bir PDF gibi görünmüyor.';

  @override
  String pdfToolsLockedUnlockFirst(String tool) {
    return 'Bu PDF parola korumalı. Önce $tool ile kilidini açın.';
  }

  @override
  String pdfToolsPagesLabel(int count) {
    return 'Sayfalar (1–$count)';
  }

  @override
  String pdfToolsPagesHint(String example) {
    return 'ör. $example';
  }

  @override
  String pdfToolsPageN(int number) {
    return 'Sayfa $number';
  }

  @override
  String get pdfToolsDownload => 'İndir';

  @override
  String get pdfToolsSavedNotification =>
      'İndirilenler\'e kaydedildi — açmak için bildirime dokunun.';

  @override
  String get pdfToolsShareToSave =>
      'Paylaşım menüsü açıldı — dosyanın kaydedileceği yeri seçin.';

  @override
  String pdfToolsSelectedFile(String name) {
    return 'Seçilen: $name';
  }

  @override
  String pdfToolsSize(String size) {
    return 'Boyut: $size';
  }

  @override
  String get pdfToolsDragToReorder => 'Sıralamak için sürükleyin';

  @override
  String get pdfHomeTitle => 'PDF Araçları';

  @override
  String get pdfHomeSection => 'PDF araçları';

  @override
  String get pdfHomeSubtitle =>
      'Belgelerinizi oluşturun, birleştirin ve iyileştirin';

  @override
  String get pdfPasswordEnter => 'Bir parola girin.';

  @override
  String pdfPasswordTooShort(int count) {
    return 'En az $count karakter kullanın.';
  }

  @override
  String get pdfPasswordMismatch => 'Parolalar eşleşmiyor.';

  @override
  String get pdfPasswordWrong => 'Parola yanlış.';

  @override
  String get pdfPasswordLockFailed => 'Bu PDF kilitlenemedi.';

  @override
  String get pdfPasswordUnlockFailed => 'Bu PDF\'in kilidi açılamadı.';

  @override
  String get pdfPasswordLockedDone => 'PDF\'iniz kilitlendi';

  @override
  String get pdfPasswordRemovedDone => 'Parola kaldırıldı';

  @override
  String get pdfPasswordAlreadyLocked =>
      'Bu PDF\'in zaten bir parolası var. Önce kilidini açın.';

  @override
  String get pdfPasswordNotLocked =>
      'Bu PDF\'in parolası yok — açılacak bir şey yok.';

  @override
  String get pdfPasswordNew => 'Yeni parola';

  @override
  String get pdfPasswordCurrent => 'Mevcut parola';

  @override
  String get pdfPasswordRepeat => 'Parolayı tekrarla';

  @override
  String get pdfPasswordShow => 'Parolayı göster';

  @override
  String get pdfPasswordHide => 'Parolayı gizle';

  @override
  String get pdfPasswordWarning =>
      'Bu parolayı güvende tutun — kurtarılamaz. AES-256 ile şifrelenir.';

  @override
  String get pdfSplitExtract => 'Sayfaları çıkar';

  @override
  String get pdfSplitRemove => 'Sayfaları kaldır';

  @override
  String get pdfSplitPagesHelp =>
      'Virgül ve aralık kullanın. “8-” 8. sayfadan sona kadar demektir.';

  @override
  String get pdfSplitRemovesAll => 'Bu, tüm sayfaları kaldırır.';

  @override
  String get pdfSplitFailed => 'Bu PDF bölünemedi.';

  @override
  String get pdfToImagesFailed => 'Bu PDF işlenemedi.';

  @override
  String pdfToImagesSaved(int saved, int total) {
    return '$total görselden $saved tanesi galeriye kaydedildi';
  }

  @override
  String get pdfToImagesAllPages => 'Tüm sayfalar';

  @override
  String get pdfToImagesConvert => 'JPG\'ye dönüştür';

  @override
  String pdfToImagesRendered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa işlendi…',
      one: '1 sayfa işlendi…',
    );
    return '$_temp0';
  }

  @override
  String pdfToImagesRenderedOf(int count, int total) {
    return '$total sayfadan $count tanesi işlendi…';
  }

  @override
  String pdfToImagesSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count görseli galeriye kaydet',
      one: '1 görseli galeriye kaydet',
    );
    return '$_temp0';
  }

  @override
  String get pdfCompressButton => 'Sıkıştır';

  @override
  String get pdfCompressWorking => 'PDF sıkıştırılıyor…';

  @override
  String pdfCompressOriginalSize(String size) {
    return 'Orijinal boyut: $size';
  }

  @override
  String get pdfCompressIntro =>
      'Bir PDF dosyası seçin. Sıkıştırma en iyi görsel ağırlıklı belgelerde işe yarar.';

  @override
  String get pdfCompressLow => 'Düşük';

  @override
  String get pdfCompressMedium => 'Orta';

  @override
  String get pdfCompressHigh => 'Yüksek';

  @override
  String get pdfCompressFailed => 'Bu PDF sıkıştırılamadı.';

  @override
  String pdfCompressBefore(String size) {
    return 'Önce: $size';
  }

  @override
  String pdfCompressAfter(String size) {
    return 'Sonra: $size';
  }

  @override
  String get pdfMergeButton => 'Birleştir';

  @override
  String get pdfMergeWorking => 'PDF\'ler birleştiriliyor…';

  @override
  String get pdfMergePick => 'PDF dosyaları seç';

  @override
  String get pdfMergeIntro => 'Birleştirmek için en az iki PDF dosyası seçin.';

  @override
  String get pdfMergeFailed =>
      'PDF\'ler birleştirilemedi. Dosyalardan biri okunamıyor olabilir.';

  @override
  String pdfMergeResult(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Birleştirilmiş PDF ($count sayfa)',
      one: 'Birleştirilmiş PDF (1 sayfa)',
    );
    return '$_temp0';
  }

  @override
  String get imageToPdfCreate => 'PDF oluştur';

  @override
  String get imageToPdfWorking => 'PDF oluşturuluyor…';

  @override
  String get imageToPdfPick => 'Görsel seç';

  @override
  String get imageToPdfIntro =>
      'Dönüştürmek için bir veya daha fazla görsel seçin.';

  @override
  String get imageToPdfFailed =>
      'PDF oluşturulamadı. Lütfen başka görseller deneyin.';

  @override
  String imageToPdfReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF hazır ($count sayfa)',
      one: 'PDF hazır (1 sayfa)',
    );
    return '$_temp0';
  }

  @override
  String get qrScanNoCodeInPhoto =>
      'Bu fotoğrafta QR kod veya barkod bulunamadı.';

  @override
  String get qrScanPhotoFailed => 'Bu fotoğraf okunamadı.';

  @override
  String qrScanResultTitle(String type) {
    return 'Tarandı ($type)';
  }

  @override
  String get qrScanFromPhoto => 'Fotoğraftan tara';

  @override
  String get qrScanCameraNeeded =>
      'QR kod ve barkod taramak için kamera erişimi gerekiyor.';

  @override
  String get qrScanCameraError =>
      'Kamera başlatılamadı. Diğer kamera uygulamalarını kapatıp tekrar deneyin.';

  @override
  String get qrScanTorchOn => 'Feneri aç';

  @override
  String get qrScanTorchOff => 'Feneri kapat';

  @override
  String get qrScanTypeLink => 'Bağlantı';

  @override
  String get qrScanTypeWifi => 'Wi‑Fi';

  @override
  String get qrScanTypeContact => 'Kişi';

  @override
  String get qrScanTypeText => 'Metin';

  @override
  String get qrGenInputLabel => 'Metin veya URL';

  @override
  String get qrGenInputHint => 'Kodlanacak içeriği girin';

  @override
  String get qrGenPreviewLabel => 'QR kod önizlemesi';

  @override
  String get qrGenEmpty => 'QR kodunuzu önizlemek için yukarıya metin girin.';

  @override
  String get qrGenSaveGallery => 'Galeriye kaydet';

  @override
  String get qrHomeTitle => 'QR ve Barkod';

  @override
  String get qrHomeTabScan => 'Tara';

  @override
  String get qrHomeTabCreate => 'Oluştur';

  @override
  String get qrHomeScanTitle => 'Kod tara';

  @override
  String get qrHomeScanBody =>
      'Anında taramak için kamerayı bir QR koda veya barkoda doğrultun.';

  @override
  String get qrHomeBadgeInstant => 'Anında';

  @override
  String get qrHomeBadgeHistory => 'Kayıtlı geçmiş';

  @override
  String get qrHomeStartScan => 'Taramayı başlat';

  @override
  String get qrHomeCreateTitle => 'Kod oluştur';

  @override
  String get qrHomeCreateBody =>
      'Metinden veya URL\'den QR kod oluşturun, sonra kaydedin ya da paylaşın.';

  @override
  String get qrHomeBadgeShare => 'Her yerde paylaş';

  @override
  String get qrHomeBadgeImage => 'Görsel olarak kaydet';

  @override
  String get qrHomeOpenGenerator => 'Oluşturucuyu aç';

  @override
  String get qrHistoryTitle => 'Tarama geçmişi';

  @override
  String get qrHistoryMore => 'Diğer seçenekler';

  @override
  String get qrHistoryEmpty => 'Taranan kodlar burada görünür.';

  @override
  String get wifiQrPlaceholder => 'QR oluşturmak için\nWi‑Fi bilgilerini girin';

  @override
  String get wifiQrPreviewLabel => 'Wi‑Fi QR kodu';

  @override
  String get wifiQrNetworkDetails => 'Ağ bilgileri';

  @override
  String get wifiQrSsidLabel => 'Ağ adı (SSID)';

  @override
  String get wifiQrSsidHint => 'Ev Wi‑Fi\'m';

  @override
  String get wifiQrPasswordLabel => 'Parola';

  @override
  String get wifiQrPasswordHint => 'Parolayı girin';

  @override
  String get wifiQrShowPassword => 'Parolayı göster';

  @override
  String get wifiQrHidePassword => 'Parolayı gizle';

  @override
  String get wifiQrSecurity => 'Güvenlik';

  @override
  String get wifiQrSecurityNone => 'Yok (açık)';

  @override
  String get wifiQrHidden => 'Gizli ağ';

  @override
  String get wifiQrHiddenHint => 'Ağ adı yayınlanmıyorsa açın';

  @override
  String get wifiQrSaveImage => 'Görseli kaydet';

  @override
  String get wifiQrInfo =>
      'Bu QR kodu tarayan herkes Wi‑Fi ağınıza otomatik bağlanır.';

  @override
  String get wifiQrShareText => 'Wi‑Fi\'ıma bağlanmak için bu QR kodu tarayın!';

  @override
  String get ocrCameraDenied =>
      'Kamera izni reddedildi. Erişime izin vermek için Ayarlar\'ı açın.';

  @override
  String get ocrCameraRequired => 'Fotoğraf çekmek için kamera izni gerekiyor.';

  @override
  String get ocrTimeout =>
      'Okuma çok uzun sürdü — metin modeli hâlâ indiriliyor olabilir. Bir kez Wi‑Fi\'ye bağlanın ya da tekrar deneyin.';

  @override
  String get ocrFailed =>
      'Bu görseldeki metin okunamadı. Daha net bir fotoğraf deneyin.';

  @override
  String get ocrPreparing => 'Görsel hazırlanıyor…';

  @override
  String get ocrScanning => 'Metin okunuyor…';

  @override
  String get ocrScriptLabel => 'Yazı sistemi';

  @override
  String get ocrScriptHint =>
      'Metninizin yazıldığı alfabeyi seçin. Arapça, Urduca ve Bengalce henüz okunamıyor.';

  @override
  String get ocrScriptLatin => 'Latin (Türkçe, İngilizce…)';

  @override
  String get ocrScriptDevanagari => 'Devanagari (Hintçe, Marathi…)';

  @override
  String get ocrScriptChinese => 'Çince';

  @override
  String get ocrScriptJapanese => 'Japonca';

  @override
  String get ocrScriptKorean => 'Korece';

  @override
  String get ocrIdleTitle => 'Her görselden metin çıkarın';

  @override
  String get ocrIdleBody =>
      'Kamerayı doğrultun veya bir fotoğraf seçin — metin anında, cihazda çıkarılır.';

  @override
  String get ocrBadgeOnDevice => 'Cihazda yapay zekâ';

  @override
  String get ocrBadgeLocal => 'Yerelde işlenir';

  @override
  String get ocrBadgeBlocks => 'Blok blok kopyala';

  @override
  String get ocrUseCamera => 'Kamerayı kullan';

  @override
  String get ocrChooseGallery => 'Galeriden seç';

  @override
  String get ocrOnDeviceNote => 'Cihazda · yükleme gerekmez';

  @override
  String get ocrTabImage => 'Görsel';

  @override
  String get ocrTabText => 'Metin';

  @override
  String get ocrTapBlockHint => 'Kopyalamak için vurgulanan bloğa dokunun';

  @override
  String get ocrBlockTitle => 'Blok metni';

  @override
  String ocrBlockLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count satır · kopyalamak için dokunun',
      one: '1 satır · kopyalamak için dokunun',
    );
    return '$_temp0';
  }

  @override
  String get ocrCopyBlock => 'Bloğu kopyala';

  @override
  String get ocrBlockCopied => 'Blok kopyalandı';

  @override
  String get ocrCopyEntireBlock => 'Tüm bloğu kopyala';

  @override
  String get ocrCopyLine => 'Satırı kopyala';

  @override
  String get ocrNoText => 'Metin algılanmadı — daha net bir fotoğraf deneyin.';

  @override
  String get ocrQuickCopy => 'Bölüme göre hızlı kopyala';

  @override
  String ocrBlockNCopied(int number) {
    return '$number. blok kopyalandı';
  }

  @override
  String get ocrDoneEditing => 'Düzenlemeyi bitir';

  @override
  String get ocrEditText => 'Metni düzenle';

  @override
  String get ocrAllCopied => 'Tüm metin kopyalandı';

  @override
  String get ocrCopyAll => 'Tümünü kopyala';

  @override
  String get ocrScanAgain => 'Tara';

  @override
  String ocrStatLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count satır',
      one: '1 satır',
    );
    return '$_temp0';
  }

  @override
  String ocrStatWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kelime',
      one: '1 kelime',
    );
    return '$_temp0';
  }

  @override
  String ocrStatChars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count karakter',
      one: '1 karakter',
    );
    return '$_temp0';
  }

  @override
  String get wordPdfNoText => 'Bu belgede çıkarılabilir metin bulunamadı.';

  @override
  String get wordPdfInfo =>
      '.docx dosyalarını PDF\'e dönüştürür. Metin korunur; karmaşık düzenler (tablolar, görseller) farklı görünebilir.';

  @override
  String get wordPdfOpeningPicker => 'Dosya seçici açılıyor…';

  @override
  String wordPdfConverting(int percent) {
    return 'Dönüştürülüyor… %$percent';
  }

  @override
  String get wordPdfDone => 'Dönüştürme tamamlandı';

  @override
  String get wordPdfTapToPick => '.docx dosyası seçmek için dokunun';

  @override
  String get wordPdfSupports => '.docx biçimini destekler';

  @override
  String get wordPdfFailed =>
      'Dönüştürme başarısız. Dosya bozuk olabilir ya da bir .docx belgesi değil.';

  @override
  String get wordPdfFontsOffline =>
      'Bu PDF\'te bazı metinler (ör. Arapça, Urduca, Hintçe, Bengalce veya Kiril) eksik. Yazı tipi yalnızca bir kez indirilir — internete bağlanıp yeniden dönüştürün.';

  @override
  String get wordPdfConvertAnother => 'Başka bir dosya dönüştür';

  @override
  String get wordPdfPick => '.docx dosyası seç';

  @override
  String get wordPdfStep1Title => 'Word dosyanızı seçin';

  @override
  String get wordPdfStep1Desc =>
      'Cihaz depolamasından bir .docx dosyası seçin.';

  @override
  String get wordPdfStep2Title => 'Otomatik dönüştürme';

  @override
  String get wordPdfStep2Desc =>
      'Metin çıkarılır ve A4 PDF sayfalarına yerleştirilir.';

  @override
  String get wordPdfStep3Title => 'Paylaşın veya kaydedin';

  @override
  String get wordPdfStep3Desc =>
      'PDF\'i herhangi bir uygulamaya, e-postaya veya bulut depolamaya paylaşın.';

  @override
  String get wordPdfReady => 'PDF hazır';
}
