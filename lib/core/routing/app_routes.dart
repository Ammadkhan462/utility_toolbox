class AppRoutes {
  AppRoutes._();

  static const home = '/';
  static const settings = '/settings';
  static const onboarding = '/onboarding';

  // Scan & QR
  static const docScanner = '/doc-scanner';
  static const qrBarcode = '/qr-barcode';
  static const qrScanner = '/qr-barcode/scanner';
  static const qrGenerator = '/qr-barcode/generator';
  static const qrHistory = '/qr-barcode/history';
  static const ocr = '/ocr';
  static const wifiQr = '/wifi-qr';

  // PDF
  static const pdfToolkit = '/pdf-toolkit';
  static const pdfImageToPdf = '/pdf-toolkit/image-to-pdf';
  static const pdfMerge = '/pdf-toolkit/merge';
  static const pdfCompress = '/pdf-toolkit/compress';
  static const pdfSplit = '/pdf-toolkit/split';
  static const pdfToImages = '/pdf-toolkit/to-images';
  static const pdfProtect = '/pdf-toolkit/protect';
  static const pdfUnlock = '/pdf-toolkit/unlock';
  static const wordToPdf = '/word-to-pdf';
  static const pdfSign = '/pdf-toolkit/sign';
  static const pdfOrganize = '/pdf-toolkit/organize';
  static const pdfWatermark = '/pdf-toolkit/watermark';
  static const pdfToText = '/pdf-toolkit/to-text';

  // Image
  static const imageCompressor = '/image-compressor';
  static const imageResizer = '/image-resizer';
  static const imageEnhancer = '/image-enhancer';
  static const aiUpscaler = '/ai-upscaler';
  static const bgRemover = '/background-remover';

  // Text
  static const translation = '/translation';
  static const textUtilities = '/text-utilities';
  static const smartClipboard = '/smart-clipboard';
  static const directChat = '/direct-chat';

  // Calculate & convert
  static const calculator = '/calculator';
  static const ageCalculator = '/age-calculator';
  static const unitConverter = '/unit-converter';
  static const loanCalculator = '/loan-calculator';
  static const timezone = '/timezone';
  static const colorPicker = '/color-picker';
  static const currencyConverter = '/currency-converter';
  static const percentageCalculator = '/percentage-calculator';
  static const bmiCalculator = '/bmi-calculator';

  // Network
  static const wifiSpeedTest = '/wifi-speed-test';
  static const ipPing = '/ip-ping';

  // Device
  static const compass = '/compass';
  static const locationSaver = '/location-saver';
  static const flashlight = '/flashlight';
  static const bubbleLevel = '/bubble-level';
  static const stopwatchTimer = '/stopwatch-timer';

  // Security
  static const passwordGenerator = '/password-generator';
  static const hashGenerator = '/hash-generator';

  // Media
  static const videoConverter = '/video-converter';
}
