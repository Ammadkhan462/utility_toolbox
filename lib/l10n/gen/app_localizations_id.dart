// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Utility Toolbox';

  @override
  String get navTools => 'Alat';

  @override
  String get navFiles => 'File Saya';

  @override
  String get settingsTooltip => 'Pengaturan';

  @override
  String get searchHint => 'Cari: kompres pdf, scan, jpg…';

  @override
  String get quickActions => 'Aksi cepat';

  @override
  String get favorites => 'Favorit';

  @override
  String get recent => 'Terbaru';

  @override
  String searchNoResults(String query) {
    return 'Tidak ada alat untuk “$query”';
  }

  @override
  String get toolMenuAddFavorite => 'Tambah ke favorit';

  @override
  String get toolMenuRemoveFavorite => 'Hapus dari favorit';

  @override
  String get toolMenuPinShortcut => 'Tambah ke layar utama';

  @override
  String get pinShortcutRequested =>
      'Konfirmasi untuk menambah pintasan ke layar utama';

  @override
  String get pinShortcutUnsupported =>
      'Aplikasi layar utama Anda tidak mendukung pintasan';

  @override
  String get newBadge => 'BARU';

  @override
  String get catScan => 'Scan & QR';

  @override
  String get catPdf => 'PDF';

  @override
  String get catImage => 'Foto & gambar';

  @override
  String get catText => 'Teks & terjemahan';

  @override
  String get catCalc => 'Hitung & konversi';

  @override
  String get catNetwork => 'Internet';

  @override
  String get catDevice => 'Perangkat & lokasi';

  @override
  String get catSecurity => 'Keamanan';

  @override
  String get catMedia => 'Video & audio';

  @override
  String get toolDocScannerTitle => 'Scan Dokumen';

  @override
  String get toolDocScannerDesc => 'Scan kertas jadi PDF, tepi otomatis';

  @override
  String get toolDocScannerKeywords =>
      'scan paper, camscanner, document, pdf scanner, receipt, scan dokumen, pemindai dokumen, scanner pdf, pindai, scan kertas, struk, nota, kwitansi, foto dokumen';

  @override
  String get toolQrScannerTitle => 'Scan QR & Barcode';

  @override
  String get toolQrScannerDesc => 'Dari kamera atau foto';

  @override
  String get toolQrScannerKeywords =>
      'qr reader, barcode, scan code, scan qr, pemindai qr, pembaca qr, scan barcode, kode qr, scan kode, qris';

  @override
  String get toolQrGeneratorTitle => 'Buat Kode QR';

  @override
  String get toolQrGeneratorDesc => 'Link, teks, kontak, dan lainnya';

  @override
  String get toolQrGeneratorKeywords =>
      'qr maker, generate qr, barcode generator, buat qr, bikin qr, pembuat qr, membuat kode qr, buat barcode';

  @override
  String get toolOcrTitle => 'Gambar ke Teks';

  @override
  String get toolOcrDesc => 'Salin teks dari foto apa pun (OCR)';

  @override
  String get toolOcrKeywords =>
      'ocr, text scanner, extract text, copy text from image, foto ke teks, gambar jadi teks, salin teks dari gambar, ambil teks, scan teks';

  @override
  String get toolWifiQrTitle => 'QR Code WiFi';

  @override
  String get toolWifiQrDesc => 'Bagikan WiFi tanpa ketik sandi';

  @override
  String get toolWifiQrKeywords =>
      'wifi password, share wifi, sandi wifi, password wifi, bagikan wifi, kata sandi wifi';

  @override
  String get toolImageToPdfTitle => 'Gambar ke PDF';

  @override
  String get toolImageToPdfDesc => 'Ubah foto jadi satu PDF';

  @override
  String get toolImageToPdfKeywords =>
      'jpg to pdf, photo to pdf, picture to pdf, jpg ke pdf, foto ke pdf, gambar ke pdf, ubah foto jadi pdf';

  @override
  String get toolMergePdfTitle => 'Gabung PDF';

  @override
  String get toolMergePdfDesc => 'Satukan beberapa PDF jadi satu';

  @override
  String get toolMergePdfKeywords =>
      'join pdf, combine pdf, gabung pdf, menggabungkan pdf, satukan pdf';

  @override
  String get toolCompressPdfTitle => 'Kompres PDF';

  @override
  String get toolCompressPdfDesc => 'Perkecil PDF agar mudah dikirim';

  @override
  String get toolCompressPdfKeywords =>
      'reduce pdf size, shrink pdf, kompres pdf, perkecil pdf, kecilkan ukuran pdf, mengecilkan pdf';

  @override
  String get toolSplitPdfTitle => 'Pisah PDF';

  @override
  String get toolSplitPdfDesc => 'Ambil atau hapus halaman';

  @override
  String get toolSplitPdfKeywords =>
      'extract pages, delete pages, cut pdf, pisah pdf, pisahkan pdf, potong pdf, hapus halaman pdf, split pdf';

  @override
  String get toolPdfToImagesTitle => 'PDF ke JPG';

  @override
  String get toolPdfToImagesDesc => 'Simpan tiap halaman jadi gambar';

  @override
  String get toolPdfToImagesKeywords =>
      'pdf to image, pdf to png, pdf pages, pdf ke jpg, pdf ke gambar, pdf jadi foto, pdf ke png';

  @override
  String get toolProtectPdfTitle => 'Kunci PDF';

  @override
  String get toolProtectPdfDesc => 'Beri kata sandi pada PDF';

  @override
  String get toolProtectPdfKeywords =>
      'password pdf, encrypt pdf, secure pdf, kunci pdf, sandi pdf, proteksi pdf, amankan pdf';

  @override
  String get toolUnlockPdfTitle => 'Buka Kunci PDF';

  @override
  String get toolUnlockPdfDesc => 'Hapus sandi yang Anda ketahui';

  @override
  String get toolUnlockPdfKeywords =>
      'remove pdf password, decrypt pdf, buka kunci pdf, hapus password pdf, buka sandi pdf';

  @override
  String get toolWordToPdfTitle => 'Word ke PDF';

  @override
  String get toolWordToPdfDesc => 'Ubah dokumen .docx';

  @override
  String get toolWordToPdfKeywords =>
      'doc to pdf, docx, word, word ke pdf, docx ke pdf, ubah word jadi pdf';

  @override
  String get toolImageCompressorTitle => 'Kompres Foto';

  @override
  String get toolImageCompressorDesc => 'File lebih kecil, tampilan sama';

  @override
  String get toolImageCompressorKeywords =>
      'reduce image size, compress jpg, kb, kompres foto, kompres gambar, perkecil ukuran foto, kecilkan foto, kompres jpg 200 kb';

  @override
  String get toolImageResizerTitle => 'Ubah Ukuran Foto';

  @override
  String get toolImageResizerDesc => 'Ukuran pas, JPG, PNG, atau WEBP';

  @override
  String get toolImageResizerKeywords =>
      'resize image, jpg to png, png to jpg, webp, passport size, ubah ukuran foto, resize foto, jpg ke png, png ke jpg, pas foto, foto 3x4, foto 4x6';

  @override
  String get toolImageEnhancerTitle => 'Edit Foto';

  @override
  String get toolImageEnhancerDesc => 'Filter, potong, kecerahan, dll.';

  @override
  String get toolImageEnhancerKeywords =>
      'edit photo, filter, crop, rotate, edit foto, potong foto, putar foto, kecerahan';

  @override
  String get toolAiUpscalerTitle => 'Penjernih Foto AI';

  @override
  String get toolAiUpscalerDesc => 'Perbesar foto hingga 4× lebih tajam';

  @override
  String get toolAiUpscalerKeywords =>
      'enhance, hd, increase resolution, blurry, jernihkan foto, foto buram, foto hd, perbesar foto, tingkatkan resolusi';

  @override
  String get toolTranslationTitle => 'Terjemahan';

  @override
  String get toolTranslationDesc => 'Offline, dengan suara';

  @override
  String get toolTranslationKeywords =>
      'translator, language, dictionary, terjemahan, penerjemah, terjemah, bahasa, kamus, translate inggris indonesia';

  @override
  String get toolTextUtilitiesTitle => 'Alat Teks';

  @override
  String get toolTextUtilitiesDesc => 'Hitung kata, ubah huruf, Base64';

  @override
  String get toolTextUtilitiesKeywords =>
      'word counter, uppercase, lowercase, base64, hitung kata, penghitung kata, huruf besar, huruf kecil';

  @override
  String get toolSmartClipboardTitle => 'Kelola Clipboard';

  @override
  String get toolSmartClipboardDesc => 'Simpan, sematkan & cari teks salinan';

  @override
  String get toolSmartClipboardKeywords =>
      'copy paste, notes, clipboard history, salin tempel, papan klip, catatan, riwayat clipboard';

  @override
  String get toolCalculatorTitle => 'Kalkulator';

  @override
  String get toolCalculatorDesc => 'Kalkulator harian dengan riwayat';

  @override
  String get toolCalculatorKeywords =>
      'calc, math, percent, kalkulator, hitung, matematika, persen';

  @override
  String get toolAgeCalculatorTitle => 'Umur & Tanggal';

  @override
  String get toolAgeCalculatorDesc => 'Umur pas dan selisih hari';

  @override
  String get toolAgeCalculatorKeywords =>
      'birthday, date difference, days counter, hitung umur, kalkulator umur, ulang tahun, selisih tanggal, hitung hari';

  @override
  String get toolUnitConverterTitle => 'Konversi Satuan';

  @override
  String get toolUnitConverterDesc => 'Panjang, berat, suhu, dan lainnya';

  @override
  String get toolUnitConverterKeywords =>
      'convert units, cm to inch, kg to lb, celsius, konversi satuan, cm ke inci, kg ke pon, suhu, meter';

  @override
  String get toolLoanCalculatorTitle => 'Pinjaman & Cicilan';

  @override
  String get toolLoanCalculatorDesc => 'Cicilan bulanan dan total bunga';

  @override
  String get toolLoanCalculatorKeywords =>
      'emi, mortgage, interest, installment, cicilan, kredit, pinjaman, bunga, kpr, simulasi kredit, angsuran';

  @override
  String get toolTimezoneTitle => 'Jam Dunia';

  @override
  String get toolTimezoneDesc => 'Jam di kota mana pun, ada widget';

  @override
  String get toolTimezoneKeywords =>
      'time zone, clock, city time, zona waktu, jam dunia, waktu kota, jam';

  @override
  String get toolColorPickerTitle => 'Pemilih Warna';

  @override
  String get toolColorPickerDesc => 'HEX, RGB, HSL, dan CMYK';

  @override
  String get toolColorPickerKeywords =>
      'color code, hex, palette, kode warna, palet warna, warna';

  @override
  String get toolSpeedTestTitle => 'Tes Kecepatan Internet';

  @override
  String get toolSpeedTestDesc => 'Download, upload, dan ping';

  @override
  String get toolSpeedTestKeywords =>
      'wifi speed, internet speed, mbps, speed test, cek kecepatan internet, tes sinyal, kecepatan wifi, cek internet';

  @override
  String get toolIpPingTitle => 'IP & Ping';

  @override
  String get toolIpPingDesc => 'Alamat IP Anda dan cek koneksi host';

  @override
  String get toolIpPingKeywords =>
      'my ip, ping, network, ip saya, alamat ip, jaringan, cek ip';

  @override
  String get toolCompassTitle => 'Kompas';

  @override
  String get toolCompassDesc => 'Arah dan sudut';

  @override
  String get toolCompassKeywords =>
      'direction, north, qibla, kompas, arah, utara, arah kiblat, kiblat';

  @override
  String get toolLocationSaverTitle => 'Simpan Lokasi';

  @override
  String get toolLocationSaverDesc => 'Ingat dan bagikan titik GPS';

  @override
  String get toolLocationSaverKeywords =>
      'parking, gps, map, coordinates, parkir, lokasi, peta, koordinat, share lokasi';

  @override
  String get toolPasswordGeneratorTitle => 'Buat Kata Sandi';

  @override
  String get toolPasswordGeneratorDesc => 'Kata sandi acak yang kuat';

  @override
  String get toolPasswordGeneratorKeywords =>
      'secure password, random, kata sandi, password kuat, buat password, sandi acak';

  @override
  String get toolHashGeneratorTitle => 'Pembuat Hash';

  @override
  String get toolHashGeneratorDesc => 'MD5, SHA-1, SHA-256 teks atau file';

  @override
  String get toolHashGeneratorKeywords =>
      'checksum, md5, sha256, hash, cek file';

  @override
  String get toolVideoConverterTitle => 'Konversi Video';

  @override
  String get toolVideoConverterDesc => 'Video ke MP3, GIF, MP4, dan lainnya';

  @override
  String get toolVideoConverterKeywords =>
      'video to mp3, gif maker, audio extract, video ke mp3, buat gif, ambil audio dari video, konversi video';

  @override
  String get filesEmptyTitle => 'Belum ada file';

  @override
  String get filesEmptyBody =>
      'PDF, gambar, dan file lain yang Anda buat akan muncul di sini agar bisa dibuka atau dibagikan lagi.';

  @override
  String get fileOpen => 'Buka';

  @override
  String get fileShare => 'Bagikan';

  @override
  String get fileRemoveFromList => 'Hapus dari daftar';

  @override
  String get fileOpenFailed =>
      'File tidak bisa dibuka. Mungkin sudah dipindah atau dihapus.';

  @override
  String get filesClearList => 'Kosongkan daftar';

  @override
  String get filesClearConfirm =>
      'Kosongkan daftar? File Anda tetap ada di perangkat.';

  @override
  String get incomingSheetTitle => 'Mau diapakan?';

  @override
  String incomingImages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gambar',
      one: '1 gambar',
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
  String get incomingText => 'Teks yang dibagikan';

  @override
  String get incomingDocument => 'Dokumen Word';

  @override
  String get incomingVideo => 'Video';

  @override
  String get incomingUnsupported => 'Jenis file ini belum didukung';

  @override
  String get incomingFailed => 'File yang dibagikan tidak bisa dibaca';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get settingsAppearance => 'Tampilan';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get themeSystem => 'Otomatis';

  @override
  String get themeLight => 'Terang';

  @override
  String get themeDark => 'Gelap';

  @override
  String get settingsLanguage => 'Bahasa';

  @override
  String get languageSystem => 'Bawaan sistem';

  @override
  String get settingsPurchases => 'Pembelian';

  @override
  String get removeAdsTitle => 'Hapus iklan';

  @override
  String get removeAdsSubtitle => 'Sekali beli, tanpa langganan';

  @override
  String get restorePurchasesTitle => 'Pulihkan pembelian';

  @override
  String get restorePurchasesSubtitle => 'Pulihkan pembelian di perangkat ini';

  @override
  String get settingsSupport => 'Bantuan & privasi';

  @override
  String get shareAppTitle => 'Bagikan aplikasi';

  @override
  String get shareAppSubtitle => 'Ceritakan Utility Toolbox ke teman';

  @override
  String shareAppMessage(String url) {
    return 'Saya pakai Utility Toolbox untuk scan dokumen, edit PDF, baca kode QR, dan terjemahan offline. Gratis: $url';
  }

  @override
  String get rateAppTitle => 'Beri nilai aplikasi';

  @override
  String get rateAppSubtitle => 'Ulasan singkat sangat membantu';

  @override
  String get privacyPolicyTitle => 'Kebijakan privasi';

  @override
  String get privacyPolicySubtitle => 'Apa yang diakses aplikasi dan alasannya';

  @override
  String get privacyChoicesTitle => 'Pilihan privasi iklan';

  @override
  String get privacyChoicesSubtitle =>
      'Ubah izin untuk iklan yang dipersonalisasi';

  @override
  String versionLabel(String version) {
    return 'Versi $version';
  }

  @override
  String get onboardingSkip => 'Lewati';

  @override
  String get onboardingNext => 'Lanjut';

  @override
  String get onboardingStart => 'Mulai';

  @override
  String get onboarding1Title => 'Semua alat,\nsatu aplikasi';

  @override
  String get onboarding1Body =>
      'Scan dokumen, edit PDF, baca kode QR, terjemahkan, dan ubah ukuran foto — tanpa pasang sepuluh aplikasi.';

  @override
  String get onboarding2Title => 'Bisa dari\naplikasi apa pun';

  @override
  String get onboarding2Body =>
      'Bagikan foto atau PDF ke Utility Toolbox, pilih teks untuk diterjemahkan, atau tekan lama ikon aplikasi untuk pintasan.';

  @override
  String get onboarding3Title => 'Cepat, offline,\ndan privat';

  @override
  String get onboarding3Body =>
      'Hampir semuanya berjalan di ponsel Anda. File Anda tidak pernah diunggah kecuali Anda sendiri mengaktifkan opsi cloud.';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonClear => 'Hapus';

  @override
  String get toolBgRemoverTitle => 'Hapus Latar';

  @override
  String get toolBgRemoverDesc => 'Potong orang dan objek dengan sekali ketuk';

  @override
  String get toolBgRemoverKeywords =>
      'hapus latar, hapus background, potong, transparan, stiker, pas foto, latar putih, remove background, remove bg, cutout, png';

  @override
  String get toolBmiTitle => 'Kalkulator BMI';

  @override
  String get toolBmiDesc => 'Cek indeks massa tubuh dan berat ideal';

  @override
  String get toolBmiKeywords =>
      'BMI, indeks massa tubuh, IMT, berat badan, tinggi badan, berat ideal, obesitas, kesehatan, bmi, body mass index, weight, height, ideal weight, obesity';

  @override
  String get toolBubbleLevelTitle => 'Waterpass';

  @override
  String get toolBubbleLevelDesc => 'Periksa apakah rak dan bingkai lurus';

  @override
  String get toolBubbleLevelKeywords =>
      'waterpass, level, lurus, sudut, kemiringan, datar, spirit level, bubble level, angle, tilt';

  @override
  String get toolCurrencyTitle => 'Konversi Mata Uang';

  @override
  String get toolCurrencyDesc => 'Kurs terbaru untuk 150+ mata uang';

  @override
  String get toolCurrencyKeywords =>
      'mata uang, kurs, valas, uang, konversi, tukar, dolar, rupiah, euro, ringgit, riyal, currency, exchange rate, money, convert, forex';

  @override
  String get toolDirectChatTitle => 'Chat Langsung';

  @override
  String get toolDirectChatDesc => 'Kirim WhatsApp tanpa menyimpan nomor';

  @override
  String get toolDirectChatKeywords =>
      'whatsapp, wa, chat langsung, pesan, nomor tidak disimpan, kirim pesan, direct chat, message, unsaved number, click to chat, wa.me, send message, chat';

  @override
  String get toolFlashlightTitle => 'Senter';

  @override
  String get toolFlashlightDesc => 'Senter terang dengan SOS dan strobo';

  @override
  String get toolFlashlightKeywords =>
      'senter, lampu, cahaya, flash, strobo, flashlight, torch, light, led, sos, strobe';

  @override
  String get toolOrganizePdfTitle => 'Atur PDF';

  @override
  String get toolOrganizePdfDesc => 'Urutkan ulang, putar, atau hapus halaman';

  @override
  String get toolOrganizePdfKeywords =>
      'atur, urutkan, putar, hapus halaman, susun, organize, organise, reorder, rotate, delete pages, remove pages, arrange, sort, pdf';

  @override
  String get toolPdfToTextTitle => 'PDF ke Teks';

  @override
  String get toolPdfToTextDesc => 'Salin semua teks dari PDF';

  @override
  String get toolPdfToTextKeywords =>
      'ekstrak teks, salin teks, pdf ke txt, konversi, baca pdf, pdf to text, extract text, copy text, txt, read pdf, convert, pdf to word';

  @override
  String get toolPercentageTitle => 'Persen & Diskon';

  @override
  String get toolPercentageDesc =>
      'Persen, diskon, tip, patungan, dan pajak seketika';

  @override
  String get toolPercentageKeywords =>
      'persen, persentase, diskon, potongan harga, tip, patungan, bagi tagihan, pajak, PPN, percentage, percent, discount, sale price, tip, split bill, tax, vat';

  @override
  String get toolSignPdfTitle => 'Tanda tangani PDF';

  @override
  String get toolSignPdfDesc =>
      'Gambar tanda tangan Anda dan letakkan di halaman mana pun';

  @override
  String get toolSignPdfKeywords =>
      'tanda tangan, ttd, tanda tangan elektronik, isi dan tanda tangani, paraf, sign, signature, e-sign, esign, fill and sign, autograph, pdf';

  @override
  String get toolStopwatchTitle => 'Stopwatch & Timer';

  @override
  String get toolStopwatchDesc =>
      'Stopwatch dengan putaran dan timer hitung mundur';

  @override
  String get toolStopwatchKeywords =>
      'stopwatch, timer, hitung mundur, putaran, alarm, jam, timer dapur, olahraga, countdown, lap';

  @override
  String get toolWatermarkPdfTitle => 'Watermark & Nomor Halaman';

  @override
  String get toolWatermarkPdfDesc =>
      'Bubuhkan teks atau nomor halaman di setiap halaman';

  @override
  String get toolWatermarkPdfKeywords =>
      'tanda air, cap, stempel, nomor halaman, penomoran, rahasia, draf, watermark, stamp, page numbers, number pages, confidential, draft, footer, header, pdf';

  @override
  String get bmiMetric => 'Metrik (cm, kg)';

  @override
  String get bmiImperial => 'Imperial (ft, lb)';

  @override
  String get bmiHeight => 'Tinggi';

  @override
  String get bmiWeight => 'Berat';

  @override
  String get bmiFeet => 'Kaki';

  @override
  String get bmiInches => 'Inci';

  @override
  String get bmiUnitCm => 'cm';

  @override
  String get bmiUnitKg => 'kg';

  @override
  String get bmiUnitLb => 'lb';

  @override
  String get bmiUnitFt => 'ft';

  @override
  String get bmiUnitIn => 'inci';

  @override
  String get bmiAge => 'Usia (opsional)';

  @override
  String get bmiSex => 'Jenis kelamin (opsional)';

  @override
  String get bmiMale => 'Pria';

  @override
  String get bmiFemale => 'Wanita';

  @override
  String get bmiYourBmi => 'BMI Anda';

  @override
  String get bmiUnderweight => 'Kurus';

  @override
  String get bmiNormal => 'Berat sehat';

  @override
  String get bmiOverweight => 'Kelebihan berat';

  @override
  String get bmiObese => 'Obesitas';

  @override
  String bmiHealthyRange(String min, String max) {
    return 'Berat sehat untuk tinggi Anda: $min – $max';
  }

  @override
  String bmiToLose(String amount) {
    return 'Sekitar $amount di atas rentang sehat';
  }

  @override
  String bmiToGain(String amount) {
    return 'Sekitar $amount di bawah rentang sehat';
  }

  @override
  String bmiIdealWeight(String weight) {
    return 'Perkiraan berat ideal: $weight';
  }

  @override
  String get bmiChildNote =>
      'Untuk anak dan remaja di bawah 18 tahun, BMI dibaca dengan grafik pertumbuhan sesuai usia. Hasil ini memakai rentang dewasa.';

  @override
  String get bmiDisclaimer => 'BMI hanya panduan umum, bukan diagnosis medis.';

  @override
  String get bmiEnterValues => 'Masukkan tinggi dan berat badan Anda';

  @override
  String get currencyAmount => 'Jumlah';

  @override
  String get currencyFrom => 'Dari';

  @override
  String get currencyTo => 'Ke';

  @override
  String get currencySwap => 'Tukar mata uang';

  @override
  String get currencyChoose => 'Pilih mata uang';

  @override
  String get currencySearchHint => 'Cari mata uang atau kode';

  @override
  String get currencyAll => 'Semua mata uang';

  @override
  String currencyRatesFrom(String date) {
    return 'Kurs per $date';
  }

  @override
  String get currencyRefresh => 'Perbarui kurs';

  @override
  String get currencyUpdating => 'Memperbarui kurs…';

  @override
  String get currencyOfflineCached =>
      'Gagal memperbarui. Menampilkan kurs tersimpan.';

  @override
  String get currencyNoRatesTitle => 'Kurs belum diunduh';

  @override
  String get currencyNoRatesBody =>
      'Sambungkan ke internet sekali untuk mengunduh kurs. Setelah itu, konverter juga bisa dipakai offline.';

  @override
  String get currencyRetry => 'Coba lagi';

  @override
  String get currencyOtherFavorites => 'Mata uang favorit Anda';

  @override
  String get currencyFavoritesHint =>
      'Ketuk ☆ di samping mata uang dalam daftar untuk menambahkannya di sini.';

  @override
  String get currencyCopy => 'Salin hasil';

  @override
  String get currencyCopied => 'Disalin';

  @override
  String get currencyNoMatch => 'Mata uang tidak ditemukan';

  @override
  String get currencyDisclaimer =>
      'Kurs hanya sebagai acuan dan bisa berbeda dari kurs bank Anda.';

  @override
  String get directChatPhone => 'Nomor telepon';

  @override
  String get directChatCountryCode => 'Kode negara';

  @override
  String get directChatSearchCountry => 'Cari negara atau kode';

  @override
  String get directChatNoCountry => 'Negara tidak ditemukan';

  @override
  String get directChatMessage => 'Pesan (opsional)';

  @override
  String get directChatOpen => 'Buka di WhatsApp';

  @override
  String get directChatPaste => 'Tempel nomor';

  @override
  String get directChatPasteNone => 'Tidak ada nomor telepon di papan klip';

  @override
  String get directChatTooShort => 'Nomor ini terlalu pendek';

  @override
  String get directChatTooLong => 'Nomor ini terlalu panjang';

  @override
  String directChatWillOpen(String number) {
    return 'Chat dengan $number';
  }

  @override
  String get directChatOpenFailed =>
      'Chat tidak bisa dibuka. Apakah WhatsApp sudah terpasang?';

  @override
  String get directChatHint =>
      'Kirim pesan ke nomor mana pun tanpa menyimpannya di kontak.';

  @override
  String get directChatNotAffiliated =>
      'Alat independen. Tidak berafiliasi dengan WhatsApp atau Meta.';

  @override
  String get percentageTabPercent => 'Persen';

  @override
  String get percentageTabDiscount => 'Diskon';

  @override
  String get percentageTabTip => 'Tip & patungan';

  @override
  String get percentageTabTax => 'Pajak / PPN';

  @override
  String get percentageOfTitle => 'Persen dari angka';

  @override
  String get percentageFieldPercent => 'Persentase';

  @override
  String get percentageFieldNumber => 'Angka';

  @override
  String percentageOfResult(String percent, String number) {
    return '$percent dari $number';
  }

  @override
  String get percentageWhatTitle => 'Berapa persennya?';

  @override
  String get percentageFieldPart => 'Nilai';

  @override
  String get percentageFieldTotal => 'Total';

  @override
  String percentageWhatResult(String part, String total) {
    return '$part dari $total';
  }

  @override
  String get percentageChangeTitle => 'Perubahan persen';

  @override
  String get percentageFieldOld => 'Nilai lama';

  @override
  String get percentageFieldNew => 'Nilai baru';

  @override
  String percentageIncrease(String percent) {
    return 'Naik $percent';
  }

  @override
  String percentageDecrease(String percent) {
    return 'Turun $percent';
  }

  @override
  String get percentageNoChange => 'Tidak berubah';

  @override
  String get percentageDifference => 'Selisih';

  @override
  String get percentagePrice => 'Harga awal';

  @override
  String get percentageDiscount => 'Diskon';

  @override
  String get percentageExtraDiscount => 'Diskon tambahan (opsional)';

  @override
  String get percentageYouPay => 'Anda bayar';

  @override
  String get percentageYouSave => 'Anda hemat';

  @override
  String get percentageTotalDiscount => 'Total diskon';

  @override
  String get percentageBill => 'Jumlah tagihan';

  @override
  String get percentageTip => 'Tip';

  @override
  String get percentageCustom => 'Lainnya';

  @override
  String get percentagePeople => 'Orang';

  @override
  String get percentageAddPerson => 'Tambah orang';

  @override
  String get percentageRemovePerson => 'Kurangi orang';

  @override
  String get percentageTipAmount => 'Jumlah tip';

  @override
  String get percentageTotal => 'Total';

  @override
  String get percentagePerPerson => 'Bayar per orang';

  @override
  String get percentageTaxRate => 'Tarif pajak';

  @override
  String get percentageAddTax => 'Tambah pajak';

  @override
  String get percentageRemoveTax => 'Keluarkan pajak';

  @override
  String get percentagePriceExclTax => 'Harga sebelum pajak';

  @override
  String get percentagePriceInclTax => 'Harga termasuk pajak';

  @override
  String get percentageBeforeTax => 'Sebelum pajak';

  @override
  String get percentageTaxAmount => 'Pajak';

  @override
  String get percentageAfterTax => 'Total dengan pajak';

  @override
  String get percentageEnterValues => 'Masukkan angka untuk melihat hasil';

  @override
  String get commonSave => 'Simpan';

  @override
  String get commonShare => 'Bagikan';

  @override
  String get commonCopy => 'Salin';

  @override
  String get commonCopied => 'Disalin';

  @override
  String get commonRetry => 'Coba lagi';

  @override
  String get commonDone => 'Selesai';

  @override
  String get commonDelete => 'Hapus';

  @override
  String get commonUndo => 'Urungkan';

  @override
  String get commonOpen => 'Buka';

  @override
  String get commonReset => 'Atur ulang';

  @override
  String get commonClose => 'Tutup';

  @override
  String get commonOpenSettings => 'Buka setelan';

  @override
  String get commonChoosePhoto => 'Pilih foto';

  @override
  String get commonChooseFile => 'Pilih file';

  @override
  String get commonCamera => 'Kamera';

  @override
  String get commonGallery => 'Galeri';

  @override
  String get commonWorking => 'Memproses…';

  @override
  String get commonSavedToGallery => 'Disimpan ke galeri';

  @override
  String get commonSavedToDownloads => 'Disimpan ke Download';

  @override
  String get commonSaveFailed => 'File tidak dapat disimpan';

  @override
  String get commonErrorGeneric => 'Terjadi kesalahan. Silakan coba lagi.';

  @override
  String get commonErrorOffline => 'Tidak ada koneksi internet';

  @override
  String get commonErrorTimeout => 'Waktu permintaan habis. Silakan coba lagi.';

  @override
  String get commonPermissionNeeded => 'Izin diperlukan. Izinkan di Setelan.';

  @override
  String get commonResult => 'Hasil';

  @override
  String get commonStart => 'Mulai';

  @override
  String get commonStop => 'Berhenti';

  @override
  String get commonClearAll => 'Hapus semua';

  @override
  String get commonPaste => 'Tempel';

  @override
  String get commonSearch => 'Cari';

  @override
  String get organizePdfHint =>
      'Ketuk halaman untuk memilihnya. Tekan lama halaman, lalu seret untuk memindahkannya.';

  @override
  String organizePdfSelected(int count) {
    return '$count dipilih';
  }

  @override
  String get organizePdfRotateLeft => 'Putar ke kiri';

  @override
  String get organizePdfRotateRight => 'Putar ke kanan';

  @override
  String get organizePdfDelete => 'Hapus';

  @override
  String get organizePdfSelectAll => 'Pilih semua';

  @override
  String get organizePdfClearSelection => 'Batalkan pilihan';

  @override
  String organizePdfDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman dihapus',
    );
    return '$_temp0';
  }

  @override
  String get organizePdfUndo => 'Urungkan';

  @override
  String get organizePdfKeepOne =>
      'PDF harus memiliki setidaknya satu halaman.';

  @override
  String get organizePdfNoChanges =>
      'Belum ada perubahan — pindahkan, putar, atau hapus halaman dulu.';

  @override
  String get organizePdfReset => 'Batalkan semua perubahan';

  @override
  String get organizePdfMoveEarlier => 'Pindahkan ke depan';

  @override
  String get organizePdfMoveLater => 'Pindahkan ke belakang';

  @override
  String get organizePdfSave => 'Simpan PDF';

  @override
  String get organizePdfFailed => 'PDF ini tidak dapat disimpan.';

  @override
  String get organizePdfResult => 'PDF yang sudah diatur siap';

  @override
  String pdfToTextReading(int current, int total) {
    return 'Membaca halaman $current dari $total…';
  }

  @override
  String pdfToTextWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kata',
    );
    return '$_temp0';
  }

  @override
  String get pdfToTextCopyAll => 'Salin semua';

  @override
  String get pdfToTextCopied => 'Teks disalin';

  @override
  String get pdfToTextSaveTxt => 'Simpan sebagai .txt';

  @override
  String get pdfToTextEmptyPage => 'Tidak ada teks di halaman ini';

  @override
  String get pdfToTextScannedTitle => 'Teks tidak ditemukan';

  @override
  String get pdfToTextScannedBody =>
      'PDF ini tampaknya hasil pindaian atau foto, jadi tidak ada teks untuk disalin. Sebagai gantinya, kami bisa membaca kata-kata di halaman 1 dari gambarnya.';

  @override
  String pdfToTextOpenOcr(String tool) {
    return 'Baca halaman 1 dengan $tool';
  }

  @override
  String get pdfToTextFailed => 'Teks dalam PDF ini tidak dapat dibaca.';

  @override
  String pdfToTextPartlyScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman tidak berisi teks (mungkin hasil pindaian).',
    );
    return '$_temp0';
  }

  @override
  String get pdfEditChoosePdf => 'Pilih PDF';

  @override
  String get pdfEditChooseHint =>
      'Atau bagikan PDF ke Utility Toolbox dari aplikasi apa pun';

  @override
  String get pdfEditChange => 'Ganti';

  @override
  String get pdfEditReading => 'Membaca…';

  @override
  String pdfEditPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
    );
    return '$_temp0';
  }

  @override
  String pdfEditPageN(int number) {
    return 'Halaman $number';
  }

  @override
  String get pdfEditInvalidPdf => 'File ini sepertinya bukan PDF yang valid.';

  @override
  String get pdfEditLocked =>
      'PDF ini dilindungi kata sandi. Hapus kata sandinya dulu, lalu coba lagi.';

  @override
  String get pdfEditLockedShort => 'Dilindungi kata sandi';

  @override
  String get pdfEditPreviewFailed => 'Halaman ini tidak dapat ditampilkan.';

  @override
  String get pdfEditResultReady => 'PDF Anda sudah siap';

  @override
  String get pdfEditSaveDownloads => 'Simpan ke Unduhan';

  @override
  String get pdfEditShare => 'Bagikan';

  @override
  String get pdfEditStartOver => 'Mulai lagi';

  @override
  String get pdfEditSavedToDownloads =>
      'Tersimpan di Unduhan — temukan di File Saya';

  @override
  String get pdfEditSharedInstead => 'Menu berbagi dibuka sebagai gantinya';

  @override
  String get pdfEditSaveFailed => 'File tidak dapat dibuat. Silakan coba lagi.';

  @override
  String get signPdfStepPdf => 'Pilih PDF Anda';

  @override
  String get signPdfStepSignature => 'Buat tanda tangan Anda';

  @override
  String get signPdfStepPlace => 'Ketuk halaman untuk menaruh tanda tangan';

  @override
  String get signPdfDraw => 'Gambar tanda tangan';

  @override
  String get signPdfDrawAgain => 'Gambar ulang';

  @override
  String get signPdfUseSaved => 'Pakai tanda tangan tersimpan';

  @override
  String get signPdfDeleteSaved => 'Hapus tanda tangan tersimpan';

  @override
  String get signPdfSavedDeleted => 'Tanda tangan tersimpan dihapus';

  @override
  String get signPdfDrawTitle => 'Gambar tanda tangan Anda';

  @override
  String get signPdfDrawHint => 'Tanda tangani di sini dengan jari';

  @override
  String get signPdfUndo => 'Urungkan';

  @override
  String get signPdfInkBlack => 'Hitam';

  @override
  String get signPdfInkBlue => 'Biru';

  @override
  String get signPdfRemember => 'Simpan tanda tangan untuk lain kali';

  @override
  String get signPdfDone => 'Pakai tanda tangan ini';

  @override
  String get signPdfEmpty => 'Gambar tanda tangan Anda dulu.';

  @override
  String get signPdfSignatureLabel => 'Tanda tangan Anda';

  @override
  String get signPdfPlaceHint =>
      'Seret untuk memindahkan, cubit atau pakai penggeser untuk mengubah ukuran. Ketuk halaman untuk memindahkan tanda tangan ke sana.';

  @override
  String get signPdfSize => 'Ukuran';

  @override
  String get signPdfPlaceConfirm => 'Taruh di sini';

  @override
  String get signPdfRemoveFromPage => 'Hapus dari halaman ini';

  @override
  String get signPdfAllPages => 'Tambahkan ke semua halaman';

  @override
  String signPdfAllPagesDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tanda tangan ditambahkan ke semua $count halaman',
    );
    return '$_temp0';
  }

  @override
  String get signPdfClearAll => 'Hapus semua';

  @override
  String signPdfPlacedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ditandatangani di $count halaman',
      zero: 'Belum ada halaman yang ditandatangani',
    );
    return '$_temp0';
  }

  @override
  String get signPdfSave => 'Simpan PDF bertanda tangan';

  @override
  String get signPdfNoPlacement =>
      'Ketuk halaman dulu untuk menaruh tanda tangan.';

  @override
  String get signPdfFailed => 'PDF ini tidak dapat ditandatangani.';

  @override
  String get signPdfResult => 'PDF bertanda tangan Anda sudah siap';

  @override
  String get watermarkPdfModeText => 'Watermark teks';

  @override
  String get watermarkPdfModeNumbers => 'Nomor halaman';

  @override
  String get watermarkPdfText => 'Teks watermark';

  @override
  String get watermarkPdfDefaultText => 'RAHASIA';

  @override
  String get watermarkPdfTextEmpty => 'Ketik teks watermark dulu.';

  @override
  String get watermarkPdfSize => 'Ukuran teks';

  @override
  String get watermarkPdfOpacity => 'Opasitas';

  @override
  String get watermarkPdfLayout => 'Tata letak';

  @override
  String get watermarkPdfDiagonal => 'Diagonal';

  @override
  String get watermarkPdfCenter => 'Tengah';

  @override
  String get watermarkPdfTiled => 'Berulang';

  @override
  String get watermarkPdfColor => 'Warna';

  @override
  String get watermarkPdfColorGrey => 'Abu-abu';

  @override
  String get watermarkPdfColorRed => 'Merah';

  @override
  String get watermarkPdfColorBlue => 'Biru';

  @override
  String get watermarkPdfColorBlack => 'Hitam';

  @override
  String get watermarkPdfColorGreen => 'Hijau';

  @override
  String get watermarkPdfFormat => 'Format';

  @override
  String watermarkPdfPageLabel(String number) {
    return 'Halaman $number';
  }

  @override
  String get watermarkPdfPosition => 'Posisi';

  @override
  String get watermarkPdfBottomCenter => 'Bawah tengah';

  @override
  String get watermarkPdfBottomRight => 'Kanan bawah';

  @override
  String get watermarkPdfTopRight => 'Kanan atas';

  @override
  String get watermarkPdfStartAt => 'Mulai dari';

  @override
  String get watermarkPdfDecrease => 'Kurangi';

  @override
  String get watermarkPdfIncrease => 'Tambah';

  @override
  String get watermarkPdfPreview => 'Pratinjau (halaman 1)';

  @override
  String get watermarkPdfApplyText => 'Tambahkan watermark';

  @override
  String get watermarkPdfApplyNumbers => 'Tambahkan nomor halaman';

  @override
  String get watermarkPdfFailed => 'PDF ini tidak dapat diperbarui.';

  @override
  String get bgRemoverPickTitle => 'Pilih foto';

  @override
  String get bgRemoverPickBody =>
      'Paling bagus untuk orang, hewan peliharaan, dan benda. Foto Anda diproses di ponsel Anda.';

  @override
  String get bgRemoverGallery => 'Pilih dari galeri';

  @override
  String get bgRemoverCamera => 'Ambil foto';

  @override
  String get bgRemoverPreparing => 'Menyiapkan foto…';

  @override
  String get bgRemoverWorking => 'Menghapus latar…';

  @override
  String get bgRemoverDownloading =>
      'Menyiapkan penghapus latar. Ini hanya sekali dan butuh koneksi internet…';

  @override
  String get bgRemoverDownloadFailed =>
      'Penghapus latar belum siap. Layanan Google Play masih mengunduhnya. Periksa koneksi internet Anda dan coba lagi sebentar lagi.';

  @override
  String get bgRemoverNoSubject =>
      'Tidak ada orang atau benda yang ditemukan di foto ini. Coba foto dengan objek yang jelas.';

  @override
  String get bgRemoverOpenFailed =>
      'Foto ini tidak bisa dibuka. Coba foto lain.';

  @override
  String get bgRemoverFailed =>
      'Terjadi kesalahan saat menghapus latar. Silakan coba lagi.';

  @override
  String get bgRemoverRetry => 'Coba lagi';

  @override
  String get bgRemoverAnotherPhoto => 'Pilih foto lain';

  @override
  String get bgRemoverNewPhoto => 'Foto baru';

  @override
  String get bgRemoverBefore => 'Sebelum';

  @override
  String get bgRemoverAfter => 'Sesudah';

  @override
  String get bgRemoverCompare => 'Bandingkan sebelum dan sesudah';

  @override
  String get bgRemoverCompareHint => 'Geser penggeser untuk membandingkan';

  @override
  String get bgRemoverBgTransparent => 'Transparan';

  @override
  String get bgRemoverBgWhite => 'Putih';

  @override
  String get bgRemoverBgBlack => 'Hitam';

  @override
  String get bgRemoverBgBlue => 'Biru';

  @override
  String get bgRemoverBgRed => 'Merah';

  @override
  String get bgRemoverBgYellow => 'Kuning';

  @override
  String get bgRemoverBgBlur => 'Buram';

  @override
  String get bgRemoverSave => 'Simpan ke galeri';

  @override
  String get bgRemoverSaved => 'Tersimpan di galeri Anda';

  @override
  String get bgRemoverSaveFailed =>
      'Gambar tidak bisa disimpan. Silakan coba lagi.';

  @override
  String get bgRemoverPngHint => 'PNG dengan latar transparan';

  @override
  String get bgRemoverJpgHint => 'JPG dengan latar pilihan';

  @override
  String get bubbleLevelSurfaceHint => 'Letakkan ponsel mendatar di permukaan';

  @override
  String get bubbleLevelUprightHint => 'Tempelkan sisi ponsel ke permukaan';

  @override
  String get bubbleLevelLevel => 'Rata';

  @override
  String bubbleLevelAngleLabel(String angle) {
    return 'Kemiringan $angle derajat';
  }

  @override
  String bubbleLevelAxes(String x, String y) {
    return 'Kiri–kanan $x° · Depan–belakang $y°';
  }

  @override
  String get bubbleLevelCalibrate => 'Kalibrasi';

  @override
  String get bubbleLevelReset => 'Atur ulang';

  @override
  String get bubbleLevelCalibrateTitle => 'Kalibrasi waterpass?';

  @override
  String get bubbleLevelCalibrateBody =>
      'Letakkan ponsel di permukaan yang pasti rata (atau tempelkan ke sisi yang lurus), lalu ketuk Kalibrasi. Posisi saat ini akan terbaca 0°.';

  @override
  String get bubbleLevelCalibrated =>
      'Terkalibrasi. Posisi ini sekarang terbaca 0°.';

  @override
  String get bubbleLevelResetDone => 'Kalibrasi dihapus';

  @override
  String get bubbleLevelUnavailable =>
      'Ponsel ini tidak punya sensor gerak, jadi waterpass tidak bisa berfungsi.';

  @override
  String get flashlightOn => 'Lampu menyala';

  @override
  String get flashlightOff => 'Lampu mati';

  @override
  String get flashlightTurnOn => 'Nyalakan lampu';

  @override
  String get flashlightTurnOff => 'Matikan lampu';

  @override
  String get flashlightModeSteady => 'Tetap';

  @override
  String get flashlightModeSos => 'SOS';

  @override
  String get flashlightModeStrobe => 'Strobo';

  @override
  String get flashlightSosHint =>
      'Mengedipkan sinyal darurat ··· ––– ··· berulang kali';

  @override
  String flashlightStrobeSpeed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kedipan per detik',
    );
    return '$_temp0';
  }

  @override
  String get flashlightUseScreen => 'Pakai cahaya layar';

  @override
  String get flashlightUseScreenHint => 'Nyalakan layar, bukan lampu kilat';

  @override
  String get flashlightNoTorch =>
      'Ponsel ini tidak punya lampu kilat, jadi layar yang akan menyala.';

  @override
  String get flashlightTorchBusy =>
      'Lampu kilat sedang dipakai (mungkin aplikasi lain memakai kamera), jadi layar yang akan menyala.';

  @override
  String get flashlightScreenColor => 'Warna cahaya layar';

  @override
  String get flashlightColorWhite => 'Putih';

  @override
  String get flashlightColorWarm => 'Putih hangat';

  @override
  String get flashlightColorRed => 'Merah';

  @override
  String get flashlightColorGreen => 'Hijau';

  @override
  String get flashlightColorBlue => 'Biru';

  @override
  String get flashlightTapToTurnOff => 'Ketuk di mana saja untuk mematikan';

  @override
  String get stopwatchTabStopwatch => 'Stopwatch';

  @override
  String get stopwatchTabTimer => 'Timer';

  @override
  String get stopwatchStart => 'Mulai';

  @override
  String get stopwatchPause => 'Jeda';

  @override
  String get stopwatchResume => 'Lanjutkan';

  @override
  String get stopwatchLap => 'Putaran';

  @override
  String get stopwatchReset => 'Atur ulang';

  @override
  String stopwatchLapNumber(int number) {
    return 'Putaran $number';
  }

  @override
  String stopwatchCurrentLap(int number, String time) {
    return 'Putaran $number: $time';
  }

  @override
  String get stopwatchBest => 'Tercepat';

  @override
  String get stopwatchWorst => 'Terlambat';

  @override
  String get stopwatchNoLaps =>
      'Ketuk Putaran saat stopwatch berjalan untuk mencatat waktu putaran.';

  @override
  String get stopwatchTimerQuickStart => 'Mulai cepat';

  @override
  String stopwatchTimerMinutes(int minutes) {
    return '$minutes mnt';
  }

  @override
  String get stopwatchTimerCustom => 'Atur waktu sendiri';

  @override
  String get stopwatchTimerPickTitle => 'Atur timer';

  @override
  String get stopwatchTimerHours => 'jam';

  @override
  String get stopwatchTimerMinutesUnit => 'menit';

  @override
  String get stopwatchTimerSeconds => 'detik';

  @override
  String get stopwatchTimerAddMinute => '+1 mnt';

  @override
  String get stopwatchTimerPaused => 'Dijeda';

  @override
  String stopwatchTimerRemaining(String time) {
    return 'Sisa $time';
  }

  @override
  String get stopwatchTimerTimesUp => 'Waktu habis!';

  @override
  String stopwatchTimerFinishedBody(String duration) {
    return 'Timer $duration Anda sudah selesai.';
  }

  @override
  String get stopwatchTimerRestart => 'Mulai ulang';

  @override
  String get stopwatchTimerDone => 'Selesai';

  @override
  String get stopwatchTimerKeepOpen =>
      'Biarkan layar ini terbuka: ponsel akan bergetar saat waktu habis.';

  @override
  String get translateHeroTitle => 'Bicara atau ketik untuk menerjemahkan';

  @override
  String get translateBadgeOnDevice => 'AI di perangkat';

  @override
  String get translateBadgeOffline => 'Berfungsi offline';

  @override
  String get translateFrom => 'Dari';

  @override
  String get translateTo => 'Ke';

  @override
  String get translateSwap => 'Tukar bahasa';

  @override
  String get translateHint => 'Masukkan teks atau ketuk mikrofon untuk bicara…';

  @override
  String get translateHintListening =>
      'Mendengarkan… bicaralah seperti biasa, ketuk mikrofon untuk berhenti';

  @override
  String translateListeningIn(String language) {
    return 'Mendengarkan dalam bahasa $language… ketuk mikrofon untuk berhenti dan menerjemahkan.';
  }

  @override
  String get translateSameLanguage => 'Bahasa sumber dan target harus berbeda.';

  @override
  String get translateButton => 'Terjemahkan';

  @override
  String get translateTranslating => 'Menerjemahkan…';

  @override
  String get translateStopAndTranslate => 'Berhenti & terjemahkan';

  @override
  String get translateDownloadingModel => 'Mengunduh model bahasa…';

  @override
  String get translateResultLabel => 'Terjemahan';

  @override
  String get translatePlayAudio => 'Putar audio';

  @override
  String get translateGenerating => 'Membuat…';

  @override
  String get translateShareAudio => 'Bagikan file audio';

  @override
  String get translateGenerateAudio => 'Buat file audio';

  @override
  String get translateAudioReady =>
      'File audio siap — bagikan untuk mengirim atau menyimpannya.';

  @override
  String get translateMicStop => 'Berhenti mendengarkan & terjemahkan';

  @override
  String get translateMicStart => 'Bicara untuk menerjemahkan';

  @override
  String get translateMicBlocked =>
      'Akses mikrofon diblokir. Aktifkan di Setelan untuk memakai input suara.';

  @override
  String get translateMicNeeded =>
      'Izin mikrofon diperlukan untuk input suara.';

  @override
  String get translateSpeechUnavailable =>
      'Pengenalan suara tidak tersedia di perangkat ini.';

  @override
  String get translateNoSpeech => 'Suara tidak tertangkap. Coba bicara lagi.';

  @override
  String get translateVoiceFailed => 'Input suara berhenti. Coba lagi.';

  @override
  String get translateDownloadFailed =>
      'Tidak dapat mengunduh model bahasa. Periksa koneksi internet Anda.';

  @override
  String get translateFailed => 'Terjemahan gagal. Coba lagi.';

  @override
  String get translateAudioFailed =>
      'Tidak dapat membuat file audio di perangkat ini.';

  @override
  String translateLanguageName(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'af': 'Afrikaans',
      'sq': 'Albania',
      'ar': 'Arab',
      'be': 'Belarusia',
      'bn': 'Bengali',
      'bg': 'Bulgaria',
      'ca': 'Katala',
      'zh': 'Tionghoa (Sederhana)',
      'hr': 'Kroasia',
      'cs': 'Ceko',
      'da': 'Denmark',
      'nl': 'Belanda',
      'en': 'Inggris',
      'eo': 'Esperanto',
      'et': 'Estonia',
      'fi': 'Finlandia',
      'fr': 'Prancis',
      'gl': 'Galisia',
      'ka': 'Georgia',
      'de': 'Jerman',
      'el': 'Yunani',
      'gu': 'Gujarati',
      'ht': 'Kreol Haiti',
      'he': 'Ibrani',
      'hi': 'Hindi',
      'hu': 'Hungaria',
      'is': 'Islandia',
      'id': 'Indonesia',
      'ga': 'Irlandia',
      'it': 'Italia',
      'ja': 'Jepang',
      'kn': 'Kannada',
      'ko': 'Korea',
      'lv': 'Latvia',
      'lt': 'Lituania',
      'mk': 'Makedonia',
      'ms': 'Melayu',
      'mt': 'Malta',
      'mr': 'Marathi',
      'no': 'Norwegia',
      'fa': 'Persia (Farsi)',
      'pl': 'Polandia',
      'pt': 'Portugis',
      'ro': 'Rumania',
      'ru': 'Rusia',
      'sk': 'Slovakia',
      'sl': 'Slovenia',
      'es': 'Spanyol',
      'sw': 'Swahili',
      'sv': 'Swedia',
      'tl': 'Tagalog (Filipino)',
      'ta': 'Tamil',
      'te': 'Telugu',
      'th': 'Thai',
      'tr': 'Turki',
      'uk': 'Ukraina',
      'ur': 'Urdu',
      'vi': 'Vietnam',
      'cy': 'Wales',
      'other': '$code',
    });
    return '$_temp0';
  }

  @override
  String get textUtilMode => 'Mode';

  @override
  String get textUtilModeText => 'Teks';

  @override
  String get textUtilHint => 'Masukkan teks di sini…';

  @override
  String get textUtilHintBase64 =>
      'Masukkan teks atau Base64 untuk dikonversi…';

  @override
  String textUtilWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'kata',
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
  String get textUtilNoSpaces => 'tanpa spasi';

  @override
  String get textUtilUpper => 'HURUF BESAR';

  @override
  String get textUtilLower => 'huruf kecil';

  @override
  String get textUtilTitle => 'Huruf Awal Kata Besar';

  @override
  String get textUtilSentence => 'Huruf awal kalimat besar';

  @override
  String get textUtilEncode => 'Enkode';

  @override
  String get textUtilDecode => 'Dekode';

  @override
  String get textUtilOutput => 'Hasil';

  @override
  String get textUtilInvalidBase64 => 'Itu bukan Base64 yang valid.';

  @override
  String get clipEmptyClipboard => 'Papan klip kosong atau tidak berisi teks.';

  @override
  String clipSaved(String text) {
    return 'Tersimpan: $text';
  }

  @override
  String get clipAddManualTitle => 'Tambahkan teks secara manual';

  @override
  String get clipAddHint => 'Ketik atau tempel teks di sini…';

  @override
  String get clipClearUnpinned => 'Hapus yang tidak disematkan';

  @override
  String get clipClearHistoryTitle => 'Hapus riwayat?';

  @override
  String get clipClearHistoryBody =>
      'Hapus semua item yang tidak disematkan? Item yang disematkan tetap disimpan.';

  @override
  String get clipSearchHint => 'Cari klip…';

  @override
  String get clipFilterAll => 'Semua';

  @override
  String get clipFilterPinned => 'Disematkan';

  @override
  String get clipFilterLinks => 'Tautan';

  @override
  String get clipFilterText => 'Teks';

  @override
  String get clipFilterCode => 'Kode';

  @override
  String clipSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString tersimpan',
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
      other: '$countString disematkan',
    );
    return '$_temp0';
  }

  @override
  String get clipAddText => 'Tambah teks';

  @override
  String get clipLabel => 'Label';

  @override
  String get clipAddLabelTitle => 'Tambah label';

  @override
  String get clipLabelHint => 'mis. Email kantor';

  @override
  String get clipEmptyTitle => 'Belum ada klip';

  @override
  String get clipEmptyMessage =>
      'Salin teks apa pun di ponsel Anda, lalu ketuk Tempel untuk menyimpannya di sini secara permanen.';

  @override
  String get clipPasteFromClipboard => 'Tempel dari papan klip';

  @override
  String get clipTypeLink => 'Tautan';

  @override
  String get clipTypeEmail => 'Email';

  @override
  String get clipTypePhone => 'Telepon';

  @override
  String get clipTypeCode => 'Kode';

  @override
  String get clipTypeText => 'Teks';

  @override
  String get clipJustNow => 'baru saja';

  @override
  String clipMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mnt lalu',
    );
    return '$_temp0';
  }

  @override
  String clipHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jam lalu',
    );
    return '$_temp0';
  }

  @override
  String clipDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari lalu',
    );
    return '$_temp0';
  }

  @override
  String get clipPin => 'Sematkan';

  @override
  String get clipUnpin => 'Lepas sematan';

  @override
  String get calcDivideByZero => 'Tidak bisa dibagi dengan nol';

  @override
  String get calcCheckExpression => 'Periksa ekspresinya';

  @override
  String get calcCopyResult => 'Salin hasil';

  @override
  String get calcPlus => 'Tambah';

  @override
  String get calcMinus => 'Kurang';

  @override
  String get calcTimes => 'Kali';

  @override
  String get calcDivide => 'Bagi';

  @override
  String get calcPercent => 'Persen';

  @override
  String get calcParentheses => 'Tanda kurung';

  @override
  String get calcEquals => 'Sama dengan';

  @override
  String get calcDecimalPoint => 'Titik desimal';

  @override
  String get ageTabAge => 'Usia';

  @override
  String get ageTabBetween => 'Antar tanggal';

  @override
  String get ageDateOfBirth => 'Tanggal lahir';

  @override
  String get ageFrom => 'Dari';

  @override
  String get ageTo => 'Sampai';

  @override
  String get ageFutureDate => 'Tanggal itu ada di masa depan.';

  @override
  String ageYearsUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'tahun',
    );
    return '$_temp0';
  }

  @override
  String ageDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hari',
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
      other: '$countString tahun',
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
      other: '$countString bulan',
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
      other: '$countString hari',
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
      other: '$countString minggu',
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
      other: '$countString hari lagi',
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
  String get ageNextBirthday => 'Ulang tahun berikutnya';

  @override
  String get ageBirthdayToday => 'Hari ini 🎉';

  @override
  String get ageTotalMonths => 'Total bulan';

  @override
  String get ageTotalWeeks => 'Total minggu';

  @override
  String get ageTotalDays => 'Total hari';

  @override
  String get ageWeeksLabel => 'Minggu';

  @override
  String get ageWeekdays => 'Hari kerja (Sen–Jum)';

  @override
  String get ageHours => 'Jam';

  @override
  String get ageIncludingEnd => 'Termasuk tanggal akhir';

  @override
  String get unitFrom => 'Dari';

  @override
  String get unitTo => 'Ke';

  @override
  String get unitEnterValue => 'Masukkan nilai';

  @override
  String get unitSwap => 'Tukar satuan';

  @override
  String unitCategoryName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'length': 'Panjang',
      'weight': 'Berat',
      'temperature': 'Suhu',
      'area': 'Luas',
      'volume': 'Volume',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String unitName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'millimeter': 'Milimeter',
      'centimeter': 'Sentimeter',
      'meter': 'Meter',
      'kilometer': 'Kilometer',
      'inch': 'Inci',
      'foot': 'Kaki',
      'mile': 'Mil',
      'gram': 'Gram',
      'kilogram': 'Kilogram',
      'ounce': 'Ons',
      'pound': 'Pon',
      'celsius': 'Celsius',
      'fahrenheit': 'Fahrenheit',
      'kelvin': 'Kelvin',
      'squareMeter': 'Meter persegi',
      'squareFoot': 'Kaki persegi',
      'acre': 'Ekar',
      'hectare': 'Hektare',
      'milliliter': 'Mililiter',
      'liter': 'Liter',
      'gallonUs': 'Galon (AS)',
      'fluidOunce': 'Ons cairan',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String get loanAmount => 'Jumlah pinjaman';

  @override
  String get loanInterestRate => 'Suku bunga tahunan';

  @override
  String get loanTenure => 'Tenor';

  @override
  String get loanTenureMonths => 'Tenor (bulan)';

  @override
  String get loanTenureYears => 'Tenor (tahun)';

  @override
  String get loanToggleMonths => 'Bulan';

  @override
  String get loanToggleYears => 'Tahun';

  @override
  String get loanEmpty =>
      'Masukkan detail pinjaman yang valid di atas untuk menghitung cicilan';

  @override
  String get loanMonthlyEmi => 'Cicilan bulanan';

  @override
  String get loanPrincipal => 'Pokok';

  @override
  String get loanTotalInterest => 'Total bunga';

  @override
  String get loanTotalPayment => 'Total pembayaran';

  @override
  String get loanBreakdown => 'Rincian';

  @override
  String get loanInterest => 'Bunga';

  @override
  String loanInterestShare(String percent) {
    return '$percent bunga';
  }

  @override
  String get loanSchedule => 'Jadwal angsuran';

  @override
  String loanMonths(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bulan',
    );
    return '$_temp0';
  }

  @override
  String get loanColMonth => 'Bln';

  @override
  String get loanColBalance => 'Sisa';

  @override
  String get loanShowAll => 'Tampilkan semua bulan';

  @override
  String get loanShowLess => 'Tampilkan lebih sedikit';

  @override
  String get clockSearchHint => 'Cari kota atau negara…';

  @override
  String get clockPinned => 'Disematkan';

  @override
  String get clockAllCities => 'Semua kota';

  @override
  String clockOnWidget(int shown, int total) {
    final intl.NumberFormat shownNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String shownString = shownNumberFormat.format(shown);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Di widget: $shownString dari $totalString';
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

    return 'Di widget: $shownString dari maks. $maxString (ubah ukuran untuk melihat lebih banyak)';
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

    return 'Widget layar utama menampilkan $defaultRowsString kota pertama secara default — tarik tepi bawahnya untuk menampilkan hingga $maxRowsString.';
  }

  @override
  String get clockPin => 'Sematkan';

  @override
  String get clockUnpin => 'Lepas sematan';

  @override
  String get clockNoResults => 'Tidak ada kota yang cocok';

  @override
  String get speedSelectingServer => 'Memilih server…';

  @override
  String get speedPhasePing => 'Mengukur ping';

  @override
  String get speedPhaseDownload => 'Menguji kecepatan unduh';

  @override
  String get speedPhaseUpload => 'Menguji kecepatan unggah';

  @override
  String get speedDownloadSpeed => 'Kecepatan unduh';

  @override
  String get speedUploadSpeed => 'Kecepatan unggah';

  @override
  String get speedRunAgain => 'Ulangi';

  @override
  String get speedGo => 'MULAI';

  @override
  String speedMeasuredVia(String server) {
    return 'Diukur melalui $server';
  }

  @override
  String get speedPoweredBy => 'Menggunakan server tes kecepatan Cloudflare';

  @override
  String get speedIdleHint =>
      'Ketuk tombol untuk mengukur ping serta kecepatan unduh dan unggah.';

  @override
  String get speedPing => 'Ping';

  @override
  String get speedResultsTitle => 'Hasil tes kecepatan';

  @override
  String get speedDownload => 'Unduh';

  @override
  String get speedUpload => 'Unggah';

  @override
  String speedConnectedIp(String ip) {
    return 'IP Anda: $ip';
  }

  @override
  String get speedErrorOffline =>
      'Tidak ada koneksi internet. Periksa Wi-Fi atau data seluler Anda.';

  @override
  String get speedErrorTimeout =>
      'Waktu tes habis. Koneksi Anda mungkin tidak stabil.';

  @override
  String get speedErrorFailed => 'Tes gagal. Silakan coba lagi.';

  @override
  String get pingErrorHostNotFound =>
      'Host tidak ditemukan. Periksa alamat dan koneksi internet Anda.';

  @override
  String get pingErrorNoData => 'Tidak ada informasi untuk alamat ini.';

  @override
  String get pingTabMyIp => 'IP Saya';

  @override
  String get pingTabLookup => 'Cari';

  @override
  String get pingTabPing => 'Ping';

  @override
  String get pingYourPublicIp => 'IP publik Anda';

  @override
  String get pingFieldCity => 'Kota';

  @override
  String get pingFieldRegion => 'Wilayah';

  @override
  String get pingFieldCountry => 'Negara';

  @override
  String get pingFieldIsp => 'ISP / Organisasi';

  @override
  String get pingFieldTimezone => 'Zona waktu';

  @override
  String get pingFieldLocation => 'Koordinat';

  @override
  String get pingFieldIp => 'Alamat IP';

  @override
  String get pingIpCopied => 'Alamat IP disalin';

  @override
  String get pingCopyIp => 'Salin IP';

  @override
  String get pingLookupHint => 'Alamat IP atau nama host';

  @override
  String get pingLookupButton => 'Cari';

  @override
  String get pingHostHint => 'Nama host (mis. google.com)';

  @override
  String get pingStartButton => 'Ping';

  @override
  String pingHeader(String host, String ip) {
    return 'Ping ke $host ($ip) melalui port TCP 443';
  }

  @override
  String get pingStatAvg => 'Rata-rata';

  @override
  String get pingStatLoss => 'Hilang';

  @override
  String get pingStatSent => 'Terkirim';

  @override
  String get pingTimeout => 'Habis waktu';

  @override
  String get compassN => 'U';

  @override
  String get compassNE => 'TL';

  @override
  String get compassE => 'T';

  @override
  String get compassSE => 'TG';

  @override
  String get compassS => 'S';

  @override
  String get compassSW => 'BD';

  @override
  String get compassW => 'B';

  @override
  String get compassNW => 'BL';

  @override
  String get compassNorth => 'Utara';

  @override
  String get compassNortheast => 'Timur Laut';

  @override
  String get compassEast => 'Timur';

  @override
  String get compassSoutheast => 'Tenggara';

  @override
  String get compassSouth => 'Selatan';

  @override
  String get compassSouthwest => 'Barat Daya';

  @override
  String get compassWest => 'Barat';

  @override
  String get compassNorthwest => 'Barat Laut';

  @override
  String compassSemantics(String degrees, String direction) {
    return 'Arah $degrees°, $direction';
  }

  @override
  String get compassHeadingMagnetic => 'Arah magnetis';

  @override
  String get compassUnavailable =>
      'Perangkat ini tidak punya magnetometer, jadi kompas tidak bisa berfungsi.';

  @override
  String get locationSavedHeader => 'Lokasi tersimpan';

  @override
  String locationSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString tersimpan',
      zero: 'Belum ada',
    );
    return '$_temp0';
  }

  @override
  String locationEmpty(String save) {
    return 'Belum ada lokasi tersimpan.\nKetuk \"$save\" untuk menyimpan posisi Anda saat ini.';
  }

  @override
  String locationDeleted(String name) {
    return '\"$name\" dihapus';
  }

  @override
  String get locationSaveDialogTitle => 'Simpan lokasi';

  @override
  String get locationNameLabel => 'Nama';

  @override
  String get locationNameHint => 'mis. Rumah, Kantor…';

  @override
  String get locationNoteLabel => 'Catatan (opsional)';

  @override
  String get locationCurrent => 'Lokasi saat ini';

  @override
  String get locationRefresh => 'Perbarui lokasi';

  @override
  String get locationLocating => 'Mencari lokasi Anda…';

  @override
  String get locationServicesOff =>
      'Lokasi dimatikan. Aktifkan untuk melihat posisi Anda.';

  @override
  String get locationPermissionDenied =>
      'Izinkan akses lokasi untuk melihat posisi Anda.';

  @override
  String get locationPermissionDeniedForever =>
      'Akses lokasi diblokir. Izinkan di Setelan untuk memakai alat ini.';

  @override
  String get locationErrorTimeout =>
      'Sinyal GPS tidak didapat. Mendekatlah ke jendela atau keluar, lalu coba lagi.';

  @override
  String get locationAllow => 'Izinkan akses';

  @override
  String locationAccuracy(String meters) {
    return 'Akurasi: ±$meters m';
  }

  @override
  String get locationCoordsCopied => 'Koordinat disalin';

  @override
  String get locationCopyCoords => 'Salin koordinat';

  @override
  String get locationOpenInMaps => 'Buka di Maps';

  @override
  String get passwordYours => 'Kata sandi Anda';

  @override
  String get passwordSelectType => 'Pilih minimal satu jenis karakter';

  @override
  String get passwordStrength => 'Kekuatan';

  @override
  String get passwordWeak => 'Lemah';

  @override
  String get passwordFair => 'Cukup';

  @override
  String get passwordGood => 'Baik';

  @override
  String get passwordStrong => 'Kuat';

  @override
  String get passwordLength => 'Panjang';

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
  String get passwordInclude => 'Sertakan';

  @override
  String get passwordUppercase => 'Huruf besar';

  @override
  String get passwordLowercase => 'Huruf kecil';

  @override
  String get passwordNumbers => 'Angka';

  @override
  String get passwordSymbols => 'Simbol';

  @override
  String get passwordCopied => 'Kata sandi disalin';

  @override
  String get passwordGenerate => 'Buat baru';

  @override
  String get hashModeText => 'Teks';

  @override
  String get hashModeFile => 'File';

  @override
  String get hashAlgorithm => 'Algoritma';

  @override
  String get hashInputHint => 'Masukkan teks untuk di-hash…';

  @override
  String get hashPickFile => 'Ketuk untuk memilih file';

  @override
  String get hashChange => 'Ganti';

  @override
  String get hashHashing => 'Menghitung…';

  @override
  String get hashGenerate => 'Buat hash';

  @override
  String get hashFileError => 'File ini tidak dapat dibaca. Coba file lain.';

  @override
  String get hashCopied => 'Hash disalin';

  @override
  String get hashCopy => 'Salin hash';

  @override
  String get colorPickerFormats => 'Format warna';

  @override
  String get colorPickerHexLabel => 'Warna HEX';

  @override
  String get colorPickerHexInvalid => 'Masukkan 6 digit hex (0–9, A–F)';

  @override
  String get colorPickerApply => 'Terapkan warna';

  @override
  String colorPickerCopied(String format) {
    return '$format disalin';
  }

  @override
  String get colorPickerPalette => 'Palet cepat';

  @override
  String colorPickerSwatch(String hex) {
    return 'Warna $hex';
  }

  @override
  String get imgCompressPickHint => 'Ketuk untuk memilih atau mengambil foto';

  @override
  String imgCompressSupported(String formats) {
    return 'Mendukung $formats';
  }

  @override
  String get imgCompressChange => 'Ganti foto';

  @override
  String get imgCompressModeQuality => 'Menurut kualitas';

  @override
  String get imgCompressModeTarget => 'Ukuran target';

  @override
  String get imgCompressQuality => 'Kualitas';

  @override
  String get imgCompressSmallest => 'File terkecil';

  @override
  String get imgCompressBestQuality => 'Kualitas terbaik';

  @override
  String get imgCompressQualityNote =>
      'Foto besar juga diperkecil menjadi sekitar 1920×1080.';

  @override
  String imgCompressTargetUnder(String size) {
    return 'Di bawah $size';
  }

  @override
  String get imgCompressTargetHint =>
      'Mempertahankan kualitas terbaik yang muat dalam batas — praktis untuk unggahan formulir lamaran kerja dan instansi pemerintah.';

  @override
  String get imgCompressButton => 'Kompres foto';

  @override
  String get imgCompressCompressing => 'Mengompres…';

  @override
  String get imgCompressSuccess => 'Berhasil dikompres!';

  @override
  String imgCompressFitsTarget(String size) {
    return 'Selesai — di bawah $size';
  }

  @override
  String imgCompressMissedTarget(String size) {
    return 'Tidak bisa di bawah $size. Ini versi terkecil yang bisa kami buat.';
  }

  @override
  String get imgCompressStatOriginal => 'Asli';

  @override
  String get imgCompressStatCompressed => 'Dikompres';

  @override
  String get imgCompressStatSaved => 'Hemat';

  @override
  String get imgCompressFailed =>
      'Foto ini tidak bisa dikompres. Coba foto lain.';

  @override
  String get imgResizePresetPassport => 'Paspor 35×45 mm';

  @override
  String imgResizePresetSquare(String size) {
    return 'Persegi $size';
  }

  @override
  String imgResizePresetStory(String size) {
    return 'Story $size';
  }

  @override
  String imgResizePresetMax(String name, String px) {
    return '$name (maks $px)';
  }

  @override
  String get imgResizeChoosePhotos => 'Pilih foto';

  @override
  String imgResizeSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto dipilih',
      one: '1 foto dipilih',
    );
    return '$_temp0';
  }

  @override
  String get imgResizePickHint =>
      'Pilih satu atau banyak — atau bagikan ke aplikasi';

  @override
  String get imgResizeChoose => 'Pilih';

  @override
  String get imgResizeChange => 'Ganti';

  @override
  String get imgResizePresets => 'Preset';

  @override
  String get imgResizeModePercent => 'Persen';

  @override
  String get imgResizeModeMaxSide => 'Sisi maks';

  @override
  String get imgResizeModeExact => 'Tepat';

  @override
  String get imgResizeWidth => 'Lebar (px)';

  @override
  String get imgResizeHeight => 'Tinggi (px)';

  @override
  String get imgResizeCrop => 'Pangkas agar pas (tanpa meregang)';

  @override
  String get imgResizeFormat => 'Format';

  @override
  String get imgResizeQuality => 'Kualitas';

  @override
  String get imgResizeButton => 'Ubah ukuran';

  @override
  String imgResizeSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Simpan $count foto ke galeri',
      one: 'Simpan 1 foto ke galeri',
    );
    return '$_temp0';
  }

  @override
  String get imgResizeChangeSettings => 'Ubah pengaturan';

  @override
  String imgResizeInvalidSize(int min, int max) {
    return 'Masukkan lebar dan tinggi antara $min dan $max.';
  }

  @override
  String imgResizeFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto tidak bisa dibaca.',
      one: '1 foto tidak bisa dibaca.',
    );
    return '$_temp0';
  }

  @override
  String imgResizeSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto disimpan ke galeri',
      one: '1 foto disimpan ke galeri',
    );
    return '$_temp0';
  }

  @override
  String get imgEnhanceEmptyTitle => 'Edit foto Anda';

  @override
  String get imgEnhanceEmptyBody =>
      'Atur kecerahan, kontras, saturasi, dan ketajaman, terapkan preset, putar dan balik — semuanya di perangkat Anda.';

  @override
  String get imgEnhanceFineControls => 'Kontrol detail';

  @override
  String get imgEnhanceApplying => 'Menerapkan…';

  @override
  String get imgEnhanceChange => 'Ganti';

  @override
  String get imgEnhancePresets => 'Preset';

  @override
  String get imgEnhanceTransform => 'Transformasi';

  @override
  String get imgEnhanceAdjustments => 'Penyesuaian';

  @override
  String get imgEnhanceRotate => 'Putar';

  @override
  String get imgEnhanceFlipH => 'Balik horizontal';

  @override
  String get imgEnhanceFlipV => 'Balik vertikal';

  @override
  String get imgEnhanceBrightness => 'Kecerahan';

  @override
  String get imgEnhanceContrast => 'Kontras';

  @override
  String get imgEnhanceSaturation => 'Saturasi';

  @override
  String get imgEnhanceSharpen => 'Pertajam';

  @override
  String get imgEnhanceBlur => 'Buram';

  @override
  String get imgEnhanceQuality => 'Kualitas';

  @override
  String get imgEnhanceApply => 'Terapkan';

  @override
  String get imgEnhanceFailed => 'Edit tidak bisa diterapkan. Coba foto lain.';

  @override
  String imgEnhanceResult(String before, String after, String change) {
    return 'Selesai! $before → $after ($change)';
  }

  @override
  String get imgEnhancePresetOriginal => 'Asli';

  @override
  String get imgEnhancePresetVivid => 'Cerah';

  @override
  String get imgEnhancePresetCool => 'Sejuk';

  @override
  String get imgEnhancePresetWarm => 'Hangat';

  @override
  String get imgEnhancePresetDramatic => 'Dramatis';

  @override
  String get imgEnhancePresetFade => 'Pudar';

  @override
  String get imgEnhancePresetVintage => 'Vintage';

  @override
  String get imgEnhancePresetNoir => 'Noir';

  @override
  String get upscalerNewImage => 'Foto baru';

  @override
  String get upscalerIntro =>
      'Perbesar foto hingga 4× dengan AI di perangkat. Berfungsi offline setelah sekali unduh model — mode cloud opsional untuk wajah.';

  @override
  String get upscalerBadgeOnDevice => 'AI di perangkat';

  @override
  String get upscalerBadgeOffline => 'Berfungsi offline';

  @override
  String get upscalerBadgeUpTo4x => 'Hingga 4× lebih besar';

  @override
  String get upscalerBadgeGpu => 'Dipercepat GPU';

  @override
  String get upscalerBestResults =>
      'Hasil terbaik: foto resolusi rendah, hasil pindaian lama, thumbnail, dan JPEG terkompresi.';

  @override
  String get upscalerChangeImage => 'Ganti foto';

  @override
  String get upscalerTabOriginal => 'Asli';

  @override
  String get upscalerTabUpscaled => 'Diperbesar AI';

  @override
  String get upscalerStageStarting => 'Memulai…';

  @override
  String get upscalerStageConnecting => 'Menghubungkan ke server AI…';

  @override
  String get upscalerStageOnDevice => 'Memproses di perangkat ini…';

  @override
  String get upscalerStageCloudUnavailable =>
      'Cloud tidak tersedia — memproses di perangkat ini…';

  @override
  String get upscalerStageUploading => 'Mengunggah foto…';

  @override
  String get upscalerStageRestoringFaces => 'AI memulihkan wajah dan detail…';

  @override
  String get upscalerStagePreparing => 'Menyiapkan foto…';

  @override
  String get upscalerStageLoadingModel => 'Memuat model AI…';

  @override
  String get upscalerStageDownloadingModel =>
      'Mengunduh model AI (sekali saja)…';

  @override
  String get upscalerStageFallback => 'Memakai pembesaran standar…';

  @override
  String get upscalerStageDecoding => 'Membaca foto…';

  @override
  String upscalerStageResizing(String from, String to) {
    return 'Mengubah ukuran input ($from → $to)…';
  }

  @override
  String get upscalerStageDenoising => 'Mengurangi noise…';

  @override
  String upscalerStageUpscaling(String factor) {
    return 'Memperbesar ($factor×)…';
  }

  @override
  String upscalerStageAiTiles(String done, String total) {
    return 'AI memperbesar… ($done/$total)';
  }

  @override
  String get upscalerStageSharpening => 'Mempertajam…';

  @override
  String get upscalerStageColour => 'Menyesuaikan warna…';

  @override
  String get upscalerStageSaving => 'Menyimpan…';

  @override
  String get upscalerStageDone => 'Selesai!';

  @override
  String get upscalerLoadingModelHint => 'Memuat model AI (hanya pertama kali)';

  @override
  String get upscalerTime4x =>
      'Pembesaran 4× bisa memakan 15–60 s tergantung ukuran foto.';

  @override
  String get upscalerTime2x => 'Pembesaran 2× biasanya memakan 5–20 s.';

  @override
  String upscalerDoneIn(String seconds) {
    return 'Diperbesar dalam $seconds s';
  }

  @override
  String get upscalerStatResolution => 'Resolusi';

  @override
  String get upscalerStatFileSize => 'Ukuran file';

  @override
  String get upscalerStatScale => 'Skala';

  @override
  String get upscalerShareSubject => 'Foto diperbesar AI';

  @override
  String get upscalerFallbackModelUnavailable =>
      'Model AI butuh internet sekali — memakai pembesaran standar';

  @override
  String get upscalerFallbackModelFailed =>
      'Model AI tidak bisa berjalan di perangkat ini — memakai pembesaran standar';

  @override
  String get upscalerFallbackCloud =>
      'Server cloud tidak tersedia — diproses di perangkat ini';

  @override
  String get upscalerSettings => 'Pengaturan AI';

  @override
  String get upscalerFactorLabel => 'Faktor pembesaran';

  @override
  String get upscalerFactor2xDesc => 'Cepat — bagus untuk sebagian besar foto';

  @override
  String get upscalerFactor4xDesc => 'Kualitas terbaik — lebih lambat';

  @override
  String get upscalerOptimiseFor => 'Optimalkan untuk';

  @override
  String get upscalerModeAuto => 'Otomatis';

  @override
  String get upscalerModePhoto => 'Foto';

  @override
  String get upscalerModeIllustration => 'Ilustrasi';

  @override
  String get upscalerModeFace => 'Detail wajah';

  @override
  String get upscalerDenoise => 'Kurangi noise awal';

  @override
  String get upscalerDenoiseTip => 'Mengurangi noise JPEG sebelum diperbesar';

  @override
  String get upscalerSharpen => 'Pertajam akhir';

  @override
  String get upscalerSharpenTip => 'Menambah ketajaman setelah diperbesar';

  @override
  String get upscalerCloudTitle => 'Peningkatan wajah di cloud';

  @override
  String get upscalerCloudOn =>
      'Foto Anda diunggah ke server kami untuk diproses.';

  @override
  String get upscalerCloudOff => 'Mati — foto tetap di perangkat ini.';

  @override
  String get upscalerCloudDialogTitle => 'Kirim foto ke cloud?';

  @override
  String get upscalerCloudDialogBody =>
      'Mode cloud mengunggah foto yang Anda pilih ke server pembesaran kami melalui koneksi terenkripsi agar dapat diproses dengan model AI yang lebih besar (GFPGAN + Real-ESRGAN).\n\n• Hanya foto yang Anda pilih untuk diperbesar yang dikirim.\n• Foto diproses di memori dan tidak disimpan setelah hasilnya dikembalikan.\n• Tidak ada data akun atau data pribadi yang ikut dikirim.\n\nAnda bisa mematikannya kapan saja. Mode di perangkat berfungsi sepenuhnya offline.';

  @override
  String get upscalerCloudKeepLocal => 'Tetap di perangkat';

  @override
  String get upscalerCloudEnable => 'Aktifkan cloud';

  @override
  String get upscalerUpscale => 'Perbesar dengan AI';

  @override
  String get upscalerUpscaleAgain => 'Perbesar lagi dengan pengaturan baru';

  @override
  String get upscalerFailed => 'Pembesaran gagal';

  @override
  String get upscalerErrorTooLarge =>
      'Foto terlalu besar. Coba foto yang lebih kecil atau pembesaran 2×.';

  @override
  String get upscalerErrorUnreadable =>
      'Foto ini tidak bisa dibaca. Gunakan file JPG atau PNG.';

  @override
  String get upscalerErrorNetwork =>
      'Waktu jaringan habis. Periksa koneksi Anda atau matikan mode cloud.';

  @override
  String get videoPickHint => 'Ketuk untuk memilih video';

  @override
  String videoProbeInfo(String format, String duration) {
    return 'Format: $format · Durasi: $duration';
  }

  @override
  String get videoOutputFormat => 'Format output';

  @override
  String get videoFmtMostCompatible => 'Paling kompatibel';

  @override
  String get videoFmtApple => 'Apple / QuickTime';

  @override
  String get videoFmtFlexible => 'Kontainer fleksibel';

  @override
  String get videoFmtLegacy => 'Format lama';

  @override
  String get videoFmtGif => 'Animasi (tanpa suara)';

  @override
  String get videoFmtAudioOnly => 'Hanya audio';

  @override
  String get videoFmtAudioAac => 'Hanya audio (AAC)';

  @override
  String get videoFmtAudioRaw => 'Hanya audio (mentah)';

  @override
  String get videoFmtWav => 'Audio tanpa kompresi';

  @override
  String videoConvertingPercent(int percent) {
    return 'Mengonversi… $percent%';
  }

  @override
  String get videoConvertingWait => 'Mengonversi… mungkin perlu waktu';

  @override
  String get videoDone => 'Konversi selesai!';

  @override
  String get videoErrorUnsupported =>
      'Konversi gagal. Format ini mungkin tidak didukung di perangkat Anda.';

  @override
  String get videoConvertAnother => 'Konversi lainnya';

  @override
  String get videoPickButton => 'Pilih file video';

  @override
  String videoConvertTo(String format) {
    return 'Konversi ke $format';
  }

  @override
  String get docScanAndroidOnly =>
      'Pemindai dokumen hanya tersedia di Android.';

  @override
  String docScanNeedsPlayServices(String details) {
    return 'Pemindai tidak dapat dimulai. Pemindai memerlukan layanan Google Play — pastikan sudah diperbarui. ($details)';
  }

  @override
  String get docScanStartFailed =>
      'Pemindai tidak dapat dimulai. Silakan coba lagi.';

  @override
  String get docScanPdfSaved =>
      'PDF disimpan ke Download — temukan di File Saya';

  @override
  String docScanPagesSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman disimpan ke galeri',
      one: '1 halaman disimpan ke galeri',
    );
    return '$_temp0';
  }

  @override
  String get docScanHeadline => 'Pindai kertas menjadi PDF yang rapi';

  @override
  String get docScanIntro =>
      'Tepi terdeteksi otomatis. Tambahkan halaman sebanyak yang Anda mau, lalu pangkas, putar, dan beri filter sebelum menyimpan.';

  @override
  String get docScanScanning => 'Memindai…';

  @override
  String get docScanStart => 'Mulai memindai';

  @override
  String get docScanScannedPages => 'Halaman hasil pindaian';

  @override
  String docScanPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
      one: '1 halaman',
    );
    return '$_temp0';
  }

  @override
  String get docScanSavePdf => 'Simpan PDF';

  @override
  String get docScanSharePdf => 'Bagikan PDF';

  @override
  String get docScanCopyText => 'Salin teks';

  @override
  String get docScanSaveJpg => 'Simpan sebagai JPG';

  @override
  String get docScanAnother => 'Pindai dokumen lain';

  @override
  String get pdfToolsChoosePdf => 'Pilih PDF';

  @override
  String get pdfToolsChooseHint =>
      'Atau bagikan PDF ke Utility Toolbox dari aplikasi apa pun';

  @override
  String get pdfToolsReading => 'Membaca…';

  @override
  String get pdfToolsLockedShort => 'Dilindungi kata sandi';

  @override
  String pdfToolsPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
      one: '1 halaman',
    );
    return '$_temp0';
  }

  @override
  String get pdfToolsChange => 'Ganti';

  @override
  String get pdfToolsResultReady => 'PDF Anda sudah siap';

  @override
  String get pdfToolsSaveDownloads => 'Simpan ke Download';

  @override
  String get pdfToolsStartOver => 'Mulai lagi';

  @override
  String get pdfToolsSavedToDownloads =>
      'Disimpan ke Download — temukan di File Saya';

  @override
  String get pdfToolsSharedInstead => 'Menu berbagi dibuka sebagai gantinya';

  @override
  String get pdfToolsRangeEmpty => 'Masukkan minimal satu halaman.';

  @override
  String pdfToolsRangeInvalid(String part) {
    return '“$part” bukan halaman atau rentang (mis. 1-3, 5).';
  }

  @override
  String pdfToolsRangeOutside(String part, int count) {
    return '“$part” di luar 1–$count.';
  }

  @override
  String get pdfToolsInvalidPdf => 'File ini tampaknya bukan PDF yang valid.';

  @override
  String pdfToolsLockedUnlockFirst(String tool) {
    return 'PDF ini dilindungi kata sandi. Buka dulu dengan $tool.';
  }

  @override
  String pdfToolsPagesLabel(int count) {
    return 'Halaman (1–$count)';
  }

  @override
  String pdfToolsPagesHint(String example) {
    return 'mis. $example';
  }

  @override
  String pdfToolsPageN(int number) {
    return 'Halaman $number';
  }

  @override
  String get pdfToolsDownload => 'Unduh';

  @override
  String get pdfToolsSavedNotification =>
      'Disimpan ke Download — buka lewat notifikasi.';

  @override
  String get pdfToolsShareToSave =>
      'Menu berbagi dibuka — pilih tempat menyimpan file.';

  @override
  String pdfToolsSelectedFile(String name) {
    return 'Dipilih: $name';
  }

  @override
  String pdfToolsSize(String size) {
    return 'Ukuran: $size';
  }

  @override
  String get pdfToolsDragToReorder => 'Seret untuk mengurutkan';

  @override
  String get pdfHomeTitle => 'Perangkat PDF';

  @override
  String get pdfHomeSection => 'Alat PDF';

  @override
  String get pdfHomeSubtitle => 'Buat, gabungkan, dan optimalkan dokumen Anda';

  @override
  String get pdfPasswordEnter => 'Masukkan kata sandi.';

  @override
  String pdfPasswordTooShort(int count) {
    return 'Gunakan minimal $count karakter.';
  }

  @override
  String get pdfPasswordMismatch => 'Kata sandi tidak cocok.';

  @override
  String get pdfPasswordWrong => 'Kata sandi salah.';

  @override
  String get pdfPasswordLockFailed => 'Tidak dapat mengunci PDF ini.';

  @override
  String get pdfPasswordUnlockFailed => 'Tidak dapat membuka kunci PDF ini.';

  @override
  String get pdfPasswordLockedDone => 'PDF Anda sudah dikunci';

  @override
  String get pdfPasswordRemovedDone => 'Kata sandi dihapus';

  @override
  String get pdfPasswordAlreadyLocked =>
      'PDF ini sudah berkata sandi. Buka kuncinya dulu.';

  @override
  String get pdfPasswordNotLocked =>
      'PDF ini tidak berkata sandi — tidak ada yang perlu dibuka.';

  @override
  String get pdfPasswordNew => 'Kata sandi baru';

  @override
  String get pdfPasswordCurrent => 'Kata sandi saat ini';

  @override
  String get pdfPasswordRepeat => 'Ulangi kata sandi';

  @override
  String get pdfPasswordShow => 'Tampilkan kata sandi';

  @override
  String get pdfPasswordHide => 'Sembunyikan kata sandi';

  @override
  String get pdfPasswordWarning =>
      'Simpan kata sandi ini baik-baik — tidak bisa dipulihkan. Dienkripsi dengan AES-256.';

  @override
  String get pdfSplitExtract => 'Ambil halaman';

  @override
  String get pdfSplitRemove => 'Hapus halaman';

  @override
  String get pdfSplitPagesHelp =>
      'Gunakan koma dan rentang. “8-” berarti halaman 8 sampai akhir.';

  @override
  String get pdfSplitRemovesAll => 'Itu akan menghapus semua halaman.';

  @override
  String get pdfSplitFailed => 'Tidak dapat memisahkan PDF ini.';

  @override
  String get pdfToImagesFailed => 'Tidak dapat merender PDF ini.';

  @override
  String pdfToImagesSaved(int saved, int total) {
    return '$saved dari $total gambar disimpan ke galeri';
  }

  @override
  String get pdfToImagesAllPages => 'Semua halaman';

  @override
  String get pdfToImagesConvert => 'Ubah ke JPG';

  @override
  String pdfToImagesRendered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman dirender…',
      one: '1 halaman dirender…',
    );
    return '$_temp0';
  }

  @override
  String pdfToImagesRenderedOf(int count, int total) {
    return '$count dari $total halaman dirender…';
  }

  @override
  String pdfToImagesSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Simpan $count gambar ke galeri',
      one: 'Simpan 1 gambar ke galeri',
    );
    return '$_temp0';
  }

  @override
  String get pdfCompressButton => 'Kompres';

  @override
  String get pdfCompressWorking => 'Mengompres PDF…';

  @override
  String pdfCompressOriginalSize(String size) {
    return 'Ukuran asli: $size';
  }

  @override
  String get pdfCompressIntro =>
      'Pilih file PDF. Kompresi paling efektif untuk dokumen yang banyak gambarnya.';

  @override
  String get pdfCompressLow => 'Rendah';

  @override
  String get pdfCompressMedium => 'Sedang';

  @override
  String get pdfCompressHigh => 'Tinggi';

  @override
  String get pdfCompressFailed => 'Tidak dapat mengompres PDF ini.';

  @override
  String pdfCompressBefore(String size) {
    return 'Sebelum: $size';
  }

  @override
  String pdfCompressAfter(String size) {
    return 'Sesudah: $size';
  }

  @override
  String get pdfMergeButton => 'Gabungkan';

  @override
  String get pdfMergeWorking => 'Menggabungkan PDF…';

  @override
  String get pdfMergePick => 'Pilih file PDF';

  @override
  String get pdfMergeIntro => 'Pilih minimal dua file PDF untuk digabungkan.';

  @override
  String get pdfMergeFailed =>
      'Tidak dapat menggabungkan PDF. Salah satu file mungkin tidak terbaca.';

  @override
  String pdfMergeResult(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF gabungan ($count halaman)',
      one: 'PDF gabungan (1 halaman)',
    );
    return '$_temp0';
  }

  @override
  String get imageToPdfCreate => 'Buat PDF';

  @override
  String get imageToPdfWorking => 'Membuat PDF…';

  @override
  String get imageToPdfPick => 'Pilih gambar';

  @override
  String get imageToPdfIntro => 'Pilih satu atau beberapa gambar untuk diubah.';

  @override
  String get imageToPdfFailed => 'Tidak dapat membuat PDF. Coba gambar lain.';

  @override
  String imageToPdfReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF siap ($count halaman)',
      one: 'PDF siap (1 halaman)',
    );
    return '$_temp0';
  }

  @override
  String get qrScanNoCodeInPhoto =>
      'Tidak ada kode QR atau barcode di foto ini.';

  @override
  String get qrScanPhotoFailed => 'Tidak dapat membaca foto ini.';

  @override
  String qrScanResultTitle(String type) {
    return 'Dipindai ($type)';
  }

  @override
  String get qrScanFromPhoto => 'Pindai dari foto';

  @override
  String get qrScanCameraNeeded =>
      'Akses kamera diperlukan untuk memindai kode QR dan barcode.';

  @override
  String get qrScanCameraError =>
      'Kamera tidak dapat dimulai. Tutup aplikasi kamera lain lalu coba lagi.';

  @override
  String get qrScanTorchOn => 'Nyalakan senter';

  @override
  String get qrScanTorchOff => 'Matikan senter';

  @override
  String get qrScanTypeLink => 'Tautan';

  @override
  String get qrScanTypeWifi => 'Wi‑Fi';

  @override
  String get qrScanTypeContact => 'Kontak';

  @override
  String get qrScanTypeText => 'Teks';

  @override
  String get qrGenInputLabel => 'Teks atau URL';

  @override
  String get qrGenInputHint => 'Masukkan konten yang akan dikodekan';

  @override
  String get qrGenPreviewLabel => 'Pratinjau kode QR';

  @override
  String get qrGenEmpty => 'Masukkan teks di atas untuk melihat kode QR Anda.';

  @override
  String get qrGenSaveGallery => 'Simpan ke Galeri';

  @override
  String get qrHomeTitle => 'QR & Barcode';

  @override
  String get qrHomeTabScan => 'Pindai';

  @override
  String get qrHomeTabCreate => 'Buat';

  @override
  String get qrHomeScanTitle => 'Pindai kode';

  @override
  String get qrHomeScanBody =>
      'Arahkan kamera ke kode QR atau barcode untuk memindainya seketika.';

  @override
  String get qrHomeBadgeInstant => 'Instan';

  @override
  String get qrHomeBadgeHistory => 'Riwayat tersimpan';

  @override
  String get qrHomeStartScan => 'Mulai memindai';

  @override
  String get qrHomeCreateTitle => 'Buat kode';

  @override
  String get qrHomeCreateBody =>
      'Buat kode QR dari teks atau URL, lalu simpan atau bagikan.';

  @override
  String get qrHomeBadgeShare => 'Bagikan di mana saja';

  @override
  String get qrHomeBadgeImage => 'Simpan sebagai gambar';

  @override
  String get qrHomeOpenGenerator => 'Buka pembuat kode';

  @override
  String get qrHistoryTitle => 'Riwayat pindaian';

  @override
  String get qrHistoryMore => 'Opsi lainnya';

  @override
  String get qrHistoryEmpty => 'Kode yang dipindai akan muncul di sini.';

  @override
  String get wifiQrPlaceholder => 'Masukkan detail Wi‑Fi\nuntuk membuat QR';

  @override
  String get wifiQrPreviewLabel => 'Kode QR Wi‑Fi';

  @override
  String get wifiQrNetworkDetails => 'Detail jaringan';

  @override
  String get wifiQrSsidLabel => 'Nama jaringan (SSID)';

  @override
  String get wifiQrSsidHint => 'Wi‑Fi Rumah';

  @override
  String get wifiQrPasswordLabel => 'Kata sandi';

  @override
  String get wifiQrPasswordHint => 'Masukkan kata sandi';

  @override
  String get wifiQrShowPassword => 'Tampilkan kata sandi';

  @override
  String get wifiQrHidePassword => 'Sembunyikan kata sandi';

  @override
  String get wifiQrSecurity => 'Keamanan';

  @override
  String get wifiQrSecurityNone => 'Tidak ada (terbuka)';

  @override
  String get wifiQrHidden => 'Jaringan tersembunyi';

  @override
  String get wifiQrHiddenHint => 'Aktifkan jika nama jaringan tidak disiarkan';

  @override
  String get wifiQrSaveImage => 'Simpan gambar';

  @override
  String get wifiQrInfo =>
      'Siapa pun yang memindai kode QR ini akan otomatis terhubung ke Wi‑Fi Anda.';

  @override
  String get wifiQrShareText =>
      'Pindai kode QR ini untuk terhubung ke Wi‑Fi saya!';

  @override
  String get ocrCameraDenied =>
      'Izin kamera ditolak. Buka Setelan untuk mengizinkan akses.';

  @override
  String get ocrCameraRequired =>
      'Izin kamera diperlukan untuk mengambil foto.';

  @override
  String get ocrTimeout =>
      'Pembacaan terlalu lama — model teks mungkin masih diunduh. Sambungkan ke Wi‑Fi sekali, atau coba lagi.';

  @override
  String get ocrFailed =>
      'Tidak dapat membaca teks dari gambar ini. Coba foto yang lebih jelas.';

  @override
  String get ocrPreparing => 'Menyiapkan gambar…';

  @override
  String get ocrScanning => 'Membaca teks…';

  @override
  String get ocrScriptLabel => 'Aksara teks';

  @override
  String get ocrScriptHint =>
      'Pilih aksara teks Anda. Arab, Urdu, dan Bengali belum bisa dibaca.';

  @override
  String get ocrScriptLatin => 'Latin (Indonesia, Inggris…)';

  @override
  String get ocrScriptDevanagari => 'Dewanagari (Hindi, Marathi…)';

  @override
  String get ocrScriptChinese => 'Mandarin';

  @override
  String get ocrScriptJapanese => 'Jepang';

  @override
  String get ocrScriptKorean => 'Korea';

  @override
  String get ocrIdleTitle => 'Ambil teks dari gambar apa pun';

  @override
  String get ocrIdleBody =>
      'Arahkan kamera atau pilih foto — teks langsung diambil di perangkat.';

  @override
  String get ocrBadgeOnDevice => 'AI di perangkat';

  @override
  String get ocrBadgeLocal => 'Diproses lokal';

  @override
  String get ocrBadgeBlocks => 'Salin per blok';

  @override
  String get ocrUseCamera => 'Gunakan kamera';

  @override
  String get ocrChooseGallery => 'Pilih dari galeri';

  @override
  String get ocrOnDeviceNote => 'Di perangkat · tanpa unggah';

  @override
  String get ocrTabImage => 'Gambar';

  @override
  String get ocrTabText => 'Teks';

  @override
  String get ocrTapBlockHint => 'Ketuk blok yang disorot untuk menyalinnya';

  @override
  String get ocrBlockTitle => 'Teks blok';

  @override
  String ocrBlockLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count baris · ketuk untuk menyalin',
      one: '1 baris · ketuk untuk menyalin',
    );
    return '$_temp0';
  }

  @override
  String get ocrCopyBlock => 'Salin blok';

  @override
  String get ocrBlockCopied => 'Blok disalin';

  @override
  String get ocrCopyEntireBlock => 'Salin seluruh blok';

  @override
  String get ocrCopyLine => 'Salin baris';

  @override
  String get ocrNoText =>
      'Tidak ada teks terdeteksi — coba foto yang lebih jelas.';

  @override
  String get ocrQuickCopy => 'Salin cepat per bagian';

  @override
  String ocrBlockNCopied(int number) {
    return 'Blok $number disalin';
  }

  @override
  String get ocrDoneEditing => 'Selesai mengedit';

  @override
  String get ocrEditText => 'Edit teks';

  @override
  String get ocrAllCopied => 'Semua teks disalin';

  @override
  String get ocrCopyAll => 'Salin semua';

  @override
  String get ocrScanAgain => 'Pindai';

  @override
  String ocrStatLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count baris',
      one: '1 baris',
    );
    return '$_temp0';
  }

  @override
  String ocrStatWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kata',
      one: '1 kata',
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
  String get wordPdfNoText =>
      'Tidak ada teks yang bisa diambil dari dokumen ini.';

  @override
  String get wordPdfInfo =>
      'Mengubah file .docx menjadi PDF. Teks dipertahankan; tata letak rumit (tabel, gambar) bisa berbeda.';

  @override
  String get wordPdfOpeningPicker => 'Membuka pemilih file…';

  @override
  String wordPdfConverting(int percent) {
    return 'Mengonversi… $percent%';
  }

  @override
  String get wordPdfDone => 'Konversi selesai';

  @override
  String get wordPdfTapToPick => 'Ketuk untuk memilih file .docx';

  @override
  String get wordPdfSupports => 'Mendukung format .docx';

  @override
  String get wordPdfFailed =>
      'Konversi gagal. File mungkin rusak atau bukan dokumen .docx.';

  @override
  String get wordPdfFontsOffline =>
      'Sebagian teks (mis. Arab, Urdu, Hindi, Bengali, atau Sirilik) tidak ada di PDF ini. Fontnya hanya diunduh sekali — sambungkan ke internet lalu konversi lagi.';

  @override
  String get wordPdfConvertAnother => 'Konversi file lain';

  @override
  String get wordPdfPick => 'Pilih file .docx';

  @override
  String get wordPdfStep1Title => 'Pilih file Word Anda';

  @override
  String get wordPdfStep1Desc => 'Pilih file .docx dari penyimpanan perangkat.';

  @override
  String get wordPdfStep2Title => 'Konversi otomatis';

  @override
  String get wordPdfStep2Desc =>
      'Teks diambil dan disusun menjadi halaman PDF A4.';

  @override
  String get wordPdfStep3Title => 'Bagikan atau simpan';

  @override
  String get wordPdfStep3Desc =>
      'Bagikan PDF ke aplikasi, email, atau penyimpanan cloud apa pun.';

  @override
  String get wordPdfReady => 'PDF siap';
}
