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
}
