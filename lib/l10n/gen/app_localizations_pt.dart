// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Utility Toolbox';

  @override
  String get navTools => 'Ferramentas';

  @override
  String get navFiles => 'Meus arquivos';

  @override
  String get settingsTooltip => 'Configurações';

  @override
  String get searchHint => 'Buscar: comprimir pdf, escanear, jpg…';

  @override
  String get quickActions => 'Atalhos rápidos';

  @override
  String get favorites => 'Favoritos';

  @override
  String get recent => 'Recentes';

  @override
  String searchNoResults(String query) {
    return 'Nenhuma ferramenta encontrada para “$query”';
  }

  @override
  String get toolMenuAddFavorite => 'Adicionar aos favoritos';

  @override
  String get toolMenuRemoveFavorite => 'Remover dos favoritos';

  @override
  String get toolMenuPinShortcut => 'Adicionar à tela inicial';

  @override
  String get pinShortcutRequested =>
      'Confirme para adicionar o atalho à tela inicial';

  @override
  String get pinShortcutUnsupported => 'Sua tela inicial não aceita atalhos';

  @override
  String get newBadge => 'NOVO';

  @override
  String get catScan => 'Scanner e QR';

  @override
  String get catPdf => 'PDF';

  @override
  String get catImage => 'Fotos e imagens';

  @override
  String get catText => 'Texto e tradução';

  @override
  String get catCalc => 'Calcular e converter';

  @override
  String get catNetwork => 'Internet';

  @override
  String get catDevice => 'Aparelho e localização';

  @override
  String get catSecurity => 'Segurança';

  @override
  String get catMedia => 'Vídeo e áudio';

  @override
  String get toolDocScannerTitle => 'Scanner de documentos';

  @override
  String get toolDocScannerDesc => 'Escaneie papel em PDF com bordas auto';

  @override
  String get toolDocScannerKeywords =>
      'scan paper, camscanner, document, pdf scanner, receipt, scanner, escanear, digitalizar, escanear documento, scanner pdf, documento, papel, recibo, nota fiscal, câmera';

  @override
  String get toolQrScannerTitle => 'Ler QR e código';

  @override
  String get toolQrScannerDesc => 'Pela câmera ou de uma foto';

  @override
  String get toolQrScannerKeywords =>
      'qr reader, barcode, scan code, leitor qr, ler qr code, código de barras, leitor de código, escanear qr, boleto';

  @override
  String get toolQrGeneratorTitle => 'Criar QR Code';

  @override
  String get toolQrGeneratorDesc => 'Links, texto, contatos e mais';

  @override
  String get toolQrGeneratorKeywords =>
      'qr maker, generate qr, barcode generator, gerador de qr code, criar qr code, gerar qr, código de barras';

  @override
  String get toolOcrTitle => 'Imagem para texto';

  @override
  String get toolOcrDesc => 'Copie o texto de qualquer foto (OCR)';

  @override
  String get toolOcrKeywords =>
      'ocr, text scanner, extract text, copy text from image, scanner de texto, extrair texto, copiar texto da imagem, foto para texto, imagem em texto';

  @override
  String get toolWifiQrTitle => 'QR do WiFi';

  @override
  String get toolWifiQrDesc => 'Compartilhe o WiFi sem digitar a senha';

  @override
  String get toolWifiQrKeywords =>
      'wifi password, share wifi, senha do wifi, compartilhar wifi, wifi qr';

  @override
  String get toolImageToPdfTitle => 'Imagem para PDF';

  @override
  String get toolImageToPdfDesc => 'Junte suas fotos em um só PDF';

  @override
  String get toolImageToPdfKeywords =>
      'jpg to pdf, photo to pdf, picture to pdf, jpg para pdf, foto para pdf, imagem para pdf, converter foto em pdf';

  @override
  String get toolMergePdfTitle => 'Juntar PDF';

  @override
  String get toolMergePdfDesc => 'Una vários PDFs em um só';

  @override
  String get toolMergePdfKeywords =>
      'join pdf, combine pdf, juntar pdf, unir pdf, mesclar pdf, combinar pdf';

  @override
  String get toolCompressPdfTitle => 'Comprimir PDF';

  @override
  String get toolCompressPdfDesc => 'Deixe o PDF menor para enviar';

  @override
  String get toolCompressPdfKeywords =>
      'reduce pdf size, shrink pdf, comprimir pdf, diminuir tamanho pdf, reduzir pdf, compactar pdf';

  @override
  String get toolSplitPdfTitle => 'Dividir PDF';

  @override
  String get toolSplitPdfDesc => 'Extraia ou remova páginas';

  @override
  String get toolSplitPdfKeywords =>
      'extract pages, delete pages, cut pdf, dividir pdf, separar pdf, extrair páginas, excluir páginas, cortar pdf';

  @override
  String get toolPdfToImagesTitle => 'PDF para JPG';

  @override
  String get toolPdfToImagesDesc => 'Salve cada página como imagem';

  @override
  String get toolPdfToImagesKeywords =>
      'pdf to image, pdf to png, pdf pages, pdf para imagem, pdf para jpg, pdf para png, páginas do pdf';

  @override
  String get toolProtectPdfTitle => 'Bloquear PDF';

  @override
  String get toolProtectPdfDesc => 'Coloque senha em um PDF';

  @override
  String get toolProtectPdfKeywords =>
      'password pdf, encrypt pdf, secure pdf, proteger pdf, senha no pdf, criptografar pdf';

  @override
  String get toolUnlockPdfTitle => 'Desbloquear PDF';

  @override
  String get toolUnlockPdfDesc => 'Remova uma senha que você sabe';

  @override
  String get toolUnlockPdfKeywords =>
      'remove pdf password, decrypt pdf, tirar senha do pdf, desbloquear pdf, remover senha pdf';

  @override
  String get toolWordToPdfTitle => 'Word para PDF';

  @override
  String get toolWordToPdfDesc => 'Converta documentos .docx';

  @override
  String get toolWordToPdfKeywords =>
      'doc to pdf, docx, word, word para pdf, doc para pdf, converter word em pdf, documento';

  @override
  String get toolImageCompressorTitle => 'Comprimir foto';

  @override
  String get toolImageCompressorDesc => 'Arquivo menor, mesma aparência';

  @override
  String get toolImageCompressorKeywords =>
      'reduce image size, compress jpg, kb, comprimir imagem, diminuir tamanho da foto, comprimir jpg, reduzir foto';

  @override
  String get toolImageResizerTitle => 'Redimensionar foto';

  @override
  String get toolImageResizerDesc => 'Tamanho exato, JPG, PNG ou WEBP';

  @override
  String get toolImageResizerKeywords =>
      'resize image, jpg to png, png to jpg, webp, passport size, redimensionar imagem, mudar tamanho da foto, jpg para png, png para jpg, foto 3x4';

  @override
  String get toolImageEnhancerTitle => 'Editor de fotos';

  @override
  String get toolImageEnhancerDesc => 'Filtros, corte, brilho e mais';

  @override
  String get toolImageEnhancerKeywords =>
      'edit photo, filter, crop, rotate, editar foto, filtros, cortar, girar, brilho';

  @override
  String get toolAiUpscalerTitle => 'Melhorar com IA';

  @override
  String get toolAiUpscalerDesc => 'Amplie fotos até 4× mais nítidas';

  @override
  String get toolAiUpscalerKeywords =>
      'enhance, hd, increase resolution, blurry, ai upscaler, melhorar qualidade, aumentar resolução, foto borrada, ampliar foto, ia';

  @override
  String get toolTranslationTitle => 'Tradutor';

  @override
  String get toolTranslationDesc => 'Offline, com voz e fala';

  @override
  String get toolTranslationKeywords =>
      'translator, language, dictionary, tradutor, traduzir, idioma, dicionário, tradutor offline, inglês português';

  @override
  String get toolTextUtilitiesTitle => 'Ferramentas de texto';

  @override
  String get toolTextUtilitiesDesc => 'Conte palavras, maiúsculas, Base64';

  @override
  String get toolTextUtilitiesKeywords =>
      'word counter, uppercase, lowercase, base64, contador de palavras, maiúsculas, minúsculas, contar caracteres';

  @override
  String get toolSmartClipboardTitle => 'Área de transferência';

  @override
  String get toolSmartClipboardDesc => 'Salve, fixe e busque textos copiados';

  @override
  String get toolSmartClipboardKeywords =>
      'copy paste, notes, clipboard history, copiar colar, notas, histórico da área de transferência, clipboard';

  @override
  String get toolCalculatorTitle => 'Calculadora';

  @override
  String get toolCalculatorDesc => 'Calculadora do dia a dia com histórico';

  @override
  String get toolCalculatorKeywords =>
      'calc, math, percent, calculadora, matemática, porcentagem, calcular porcentagem';

  @override
  String get toolAgeCalculatorTitle => 'Idade e datas';

  @override
  String get toolAgeCalculatorDesc => 'Idade exata e dias entre datas';

  @override
  String get toolAgeCalculatorKeywords =>
      'birthday, date difference, days counter, calcular idade, aniversário, diferença entre datas, contador de dias, quantos dias';

  @override
  String get toolUnitConverterTitle => 'Conversor de unidades';

  @override
  String get toolUnitConverterDesc => 'Comprimento, peso, temperatura e mais';

  @override
  String get toolUnitConverterKeywords =>
      'convert units, cm to inch, kg to lb, celsius, converter unidades, cm para polegada, kg para libra, conversor, fahrenheit';

  @override
  String get toolLoanCalculatorTitle => 'Empréstimo e parcelas';

  @override
  String get toolLoanCalculatorDesc => 'Parcela mensal e juros totais';

  @override
  String get toolLoanCalculatorKeywords =>
      'emi, mortgage, interest, installment, empréstimo, financiamento, juros, parcelas, simulador de financiamento';

  @override
  String get toolTimezoneTitle => 'Relógio mundial';

  @override
  String get toolTimezoneDesc => 'Hora em qualquer cidade, com widget';

  @override
  String get toolTimezoneKeywords =>
      'time zone, clock, city time, fuso horário, relógio, hora mundial, horário de outros países';

  @override
  String get toolColorPickerTitle => 'Seletor de cores';

  @override
  String get toolColorPickerDesc => 'HEX, RGB, HSL e CMYK';

  @override
  String get toolColorPickerKeywords =>
      'color code, hex, palette, código de cor, paleta, cores';

  @override
  String get toolSpeedTestTitle => 'Teste de velocidade';

  @override
  String get toolSpeedTestDesc => 'Download, upload e ping';

  @override
  String get toolSpeedTestKeywords =>
      'wifi speed, internet speed, mbps, velocidade da internet, teste de velocidade, velocidade do wifi, medir internet';

  @override
  String get toolIpPingTitle => 'IP e ping';

  @override
  String get toolIpPingDesc => 'Seu endereço IP e se um host responde';

  @override
  String get toolIpPingKeywords =>
      'my ip, ping, network, meu ip, endereço ip, rede';

  @override
  String get toolCompassTitle => 'Bússola';

  @override
  String get toolCompassDesc => 'Rumo e direção';

  @override
  String get toolCompassKeywords =>
      'direction, north, qibla, bússola, direção, norte';

  @override
  String get toolLocationSaverTitle => 'Salvar local';

  @override
  String get toolLocationSaverDesc => 'Guarde e compartilhe pontos de GPS';

  @override
  String get toolLocationSaverKeywords =>
      'parking, gps, map, coordinates, estacionamento, onde parei o carro, mapa, coordenadas, localização';

  @override
  String get toolPasswordGeneratorTitle => 'Gerador de senhas';

  @override
  String get toolPasswordGeneratorDesc => 'Senhas fortes e aleatórias';

  @override
  String get toolPasswordGeneratorKeywords =>
      'secure password, random, senha forte, gerador de senha, aleatória, senha segura';

  @override
  String get toolHashGeneratorTitle => 'Gerador de hash';

  @override
  String get toolHashGeneratorDesc =>
      'MD5, SHA-1, SHA-256 de texto ou arquivos';

  @override
  String get toolHashGeneratorKeywords =>
      'checksum, md5, sha256, hash, soma de verificação';

  @override
  String get toolVideoConverterTitle => 'Conversor de vídeo';

  @override
  String get toolVideoConverterDesc => 'Vídeo para MP3, GIF, MP4 e mais';

  @override
  String get toolVideoConverterKeywords =>
      'video to mp3, gif maker, audio extract, vídeo para mp3, video para mp3, criar gif, extrair áudio, conversor de vídeo';

  @override
  String get filesEmptyTitle => 'Nenhum arquivo ainda';

  @override
  String get filesEmptyBody =>
      'PDFs, imagens e outros arquivos que você criar vão aparecer aqui para abrir ou compartilhar de novo.';

  @override
  String get fileOpen => 'Abrir';

  @override
  String get fileShare => 'Compartilhar';

  @override
  String get fileRemoveFromList => 'Remover da lista';

  @override
  String get fileOpenFailed =>
      'Não foi possível abrir o arquivo. Ele pode ter sido movido ou excluído.';

  @override
  String get filesClearList => 'Limpar lista';

  @override
  String get filesClearConfirm =>
      'Limpar a lista? Seus arquivos continuam no aparelho.';

  @override
  String get incomingSheetTitle => 'O que você quer fazer?';

  @override
  String incomingImages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count imagens',
      one: '1 imagem',
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
  String get incomingText => 'Texto compartilhado';

  @override
  String get incomingDocument => 'Documento do Word';

  @override
  String get incomingVideo => 'Vídeo';

  @override
  String get incomingUnsupported =>
      'Esse tipo de arquivo ainda não é compatível';

  @override
  String get incomingFailed => 'Não foi possível ler o arquivo compartilhado';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsAppearance => 'Aparência';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get themeSystem => 'Automático';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get languageSystem => 'Padrão do sistema';

  @override
  String get settingsPurchases => 'Compras';

  @override
  String get removeAdsTitle => 'Remover anúncios';

  @override
  String get removeAdsSubtitle => 'Compra única, sem assinatura';

  @override
  String get restorePurchasesTitle => 'Restaurar compras';

  @override
  String get restorePurchasesSubtitle => 'Recupere uma compra neste aparelho';

  @override
  String get settingsSupport => 'Suporte e privacidade';

  @override
  String get shareAppTitle => 'Compartilhar app';

  @override
  String get shareAppSubtitle => 'Indique o Utility Toolbox para um amigo';

  @override
  String shareAppMessage(String url) {
    return 'Uso o Utility Toolbox para escanear documentos, editar PDFs, ler QR codes e traduzir offline. Grátis: $url';
  }

  @override
  String get rateAppTitle => 'Avaliar o app';

  @override
  String get rateAppSubtitle => 'Uma avaliação rápida ajuda muito';

  @override
  String get privacyPolicyTitle => 'Política de privacidade';

  @override
  String get privacyPolicySubtitle => 'O que o app acessa e por quê';

  @override
  String get privacyChoicesTitle => 'Privacidade dos anúncios';

  @override
  String get privacyChoicesSubtitle =>
      'Altere seu consentimento para anúncios personalizados';

  @override
  String versionLabel(String version) {
    return 'Versão $version';
  }

  @override
  String get onboardingSkip => 'Pular';

  @override
  String get onboardingNext => 'Próximo';

  @override
  String get onboardingStart => 'Começar';

  @override
  String get onboarding1Title => 'Todas as ferramentas,\num só app';

  @override
  String get onboarding1Body =>
      'Escaneie documentos, edite PDFs, leia QR codes, traduza e redimensione fotos — sem instalar dez apps.';

  @override
  String get onboarding2Title => 'Funciona em\nqualquer app';

  @override
  String get onboarding2Body =>
      'Compartilhe uma foto ou PDF com o Utility Toolbox, selecione um texto para traduzir ou toque e segure o ícone do app para ver atalhos.';

  @override
  String get onboarding3Title => 'Rápido, offline\ne privado';

  @override
  String get onboarding3Body =>
      'Quase tudo funciona no seu celular. Seus arquivos nunca são enviados, a menos que você ative uma opção na nuvem.';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonClear => 'Limpar';
}
