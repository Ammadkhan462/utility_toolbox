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

  @override
  String get toolBgRemoverTitle => 'Remover fundo';

  @override
  String get toolBgRemoverDesc => 'Recorte pessoas e objetos com um toque';

  @override
  String get toolBgRemoverKeywords =>
      'remover fundo, apagar fundo, tirar fundo, recortar, transparente, figurinha, foto 3x4, fundo branco, remove background, remove bg, cutout, png';

  @override
  String get toolBmiTitle => 'Calculadora de IMC';

  @override
  String get toolBmiDesc => 'Seu índice de massa corporal e peso saudável';

  @override
  String get toolBmiKeywords =>
      'IMC, índice de massa corporal, peso, altura, peso ideal, obesidade, saúde, bmi, body mass index, weight, height, ideal weight, obesity';

  @override
  String get toolBubbleLevelTitle => 'Nível de bolha';

  @override
  String get toolBubbleLevelDesc =>
      'Confira se prateleiras e quadros estão retos';

  @override
  String get toolBubbleLevelKeywords =>
      'nível, nível de bolha, reto, ângulo, inclinação, prumo, level, spirit level, bubble level, tilt';

  @override
  String get toolCurrencyTitle => 'Conversor de moedas';

  @override
  String get toolCurrencyDesc => 'Câmbio atualizado de mais de 150 moedas';

  @override
  String get toolCurrencyKeywords =>
      'moeda, câmbio, cotação, dinheiro, converter, dólar, euro, real, peso, currency, exchange rate, money, convert, forex';

  @override
  String get toolDirectChatTitle => 'Conversa direta';

  @override
  String get toolDirectChatDesc =>
      'Mande mensagem no WhatsApp sem salvar o número';

  @override
  String get toolDirectChatKeywords =>
      'whatsapp, zap, conversa direta, mensagem, número não salvo, enviar mensagem, direct chat, message, unsaved number, click to chat, wa.me, send message, chat';

  @override
  String get toolFlashlightTitle => 'Lanterna';

  @override
  String get toolFlashlightDesc => 'Lanterna forte com SOS e estroboscópio';

  @override
  String get toolFlashlightKeywords =>
      'lanterna, luz, lâmpada, flash, estroboscópio, flashlight, torch, light, led, sos, strobe';

  @override
  String get toolOrganizePdfTitle => 'Organizar PDF';

  @override
  String get toolOrganizePdfDesc => 'Reordene, gire ou exclua páginas';

  @override
  String get toolOrganizePdfKeywords =>
      'organizar, reordenar, girar, rotacionar, excluir páginas, remover páginas, organize, organise, reorder, rotate, delete pages, remove pages, arrange, sort, pdf';

  @override
  String get toolPdfToTextTitle => 'PDF para texto';

  @override
  String get toolPdfToTextDesc => 'Copie todo o texto de um PDF';

  @override
  String get toolPdfToTextKeywords =>
      'extrair texto, copiar texto, pdf para txt, converter, ler pdf, pdf to text, extract text, copy text, txt, read pdf, convert, pdf to word';

  @override
  String get toolPercentageTitle => 'Porcentagem e desconto';

  @override
  String get toolPercentageDesc =>
      'Porcentagem, desconto, gorjeta e imposto na hora';

  @override
  String get toolPercentageKeywords =>
      'porcentagem, percentual, desconto, promoção, gorjeta, dividir conta, imposto, IVA, percentage, percent, discount, sale price, tip, split bill, tax, vat';

  @override
  String get toolSignPdfTitle => 'Assinar PDF';

  @override
  String get toolSignPdfDesc =>
      'Desenhe sua assinatura e coloque-a em qualquer página';

  @override
  String get toolSignPdfKeywords =>
      'assinar, assinatura, assinatura eletrônica, preencher e assinar, rubrica, sign, signature, e-sign, esign, fill and sign, autograph, pdf';

  @override
  String get toolStopwatchTitle => 'Cronômetro e timer';

  @override
  String get toolStopwatchDesc => 'Cronômetro com voltas e timer regressivo';

  @override
  String get toolStopwatchKeywords =>
      'cronômetro, timer, temporizador, contagem regressiva, volta, alarme, relógio, timer de cozinha, treino, stopwatch, countdown, lap';

  @override
  String get toolWatermarkPdfTitle => 'Marca d’água e números de página';

  @override
  String get toolWatermarkPdfDesc =>
      'Carimbe texto ou números em todas as páginas';

  @override
  String get toolWatermarkPdfKeywords =>
      'marca d’água, carimbo, números de página, numerar páginas, confidencial, rascunho, rodapé, watermark, stamp, page numbers, number pages, confidential, draft, footer, header, pdf';

  @override
  String get bmiMetric => 'Métrico (cm, kg)';

  @override
  String get bmiImperial => 'Imperial (pés, lb)';

  @override
  String get bmiHeight => 'Altura';

  @override
  String get bmiWeight => 'Peso';

  @override
  String get bmiFeet => 'Pés';

  @override
  String get bmiInches => 'Polegadas';

  @override
  String get bmiUnitCm => 'cm';

  @override
  String get bmiUnitKg => 'kg';

  @override
  String get bmiUnitLb => 'lb';

  @override
  String get bmiUnitFt => 'pés';

  @override
  String get bmiUnitIn => 'pol';

  @override
  String get bmiAge => 'Idade (opcional)';

  @override
  String get bmiSex => 'Sexo (opcional)';

  @override
  String get bmiMale => 'Masculino';

  @override
  String get bmiFemale => 'Feminino';

  @override
  String get bmiYourBmi => 'Seu IMC';

  @override
  String get bmiUnderweight => 'Abaixo do peso';

  @override
  String get bmiNormal => 'Peso saudável';

  @override
  String get bmiOverweight => 'Sobrepeso';

  @override
  String get bmiObese => 'Obesidade';

  @override
  String bmiHealthyRange(String min, String max) {
    return 'Peso saudável para sua altura: $min – $max';
  }

  @override
  String bmiToLose(String amount) {
    return 'Cerca de $amount acima da faixa saudável';
  }

  @override
  String bmiToGain(String amount) {
    return 'Cerca de $amount abaixo da faixa saudável';
  }

  @override
  String bmiIdealWeight(String weight) {
    return 'Peso ideal estimado: $weight';
  }

  @override
  String get bmiChildNote =>
      'Para menores de 18 anos, o IMC é avaliado com curvas de crescimento por idade. Estes resultados usam as faixas de adultos.';

  @override
  String get bmiDisclaimer =>
      'O IMC é uma referência geral, não um diagnóstico médico.';

  @override
  String get bmiEnterValues => 'Informe sua altura e seu peso';

  @override
  String get currencyAmount => 'Valor';

  @override
  String get currencyFrom => 'De';

  @override
  String get currencyTo => 'Para';

  @override
  String get currencySwap => 'Inverter moedas';

  @override
  String get currencyChoose => 'Escolher moeda';

  @override
  String get currencySearchHint => 'Buscar moeda ou código';

  @override
  String get currencyAll => 'Todas as moedas';

  @override
  String currencyRatesFrom(String date) {
    return 'Cotações de $date';
  }

  @override
  String get currencyRefresh => 'Atualizar cotações';

  @override
  String get currencyUpdating => 'Atualizando cotações…';

  @override
  String get currencyOfflineCached =>
      'Não foi possível atualizar. Mostrando cotações salvas.';

  @override
  String get currencyNoRatesTitle => 'Cotações ainda não baixadas';

  @override
  String get currencyNoRatesBody =>
      'Conecte-se à internet uma vez para baixar as cotações. Depois, o conversor funciona também offline.';

  @override
  String get currencyRetry => 'Tentar novamente';

  @override
  String get currencyOtherFavorites => 'Suas moedas favoritas';

  @override
  String get currencyFavoritesHint =>
      'Toque em ☆ ao lado de uma moeda na lista para adicioná-la aqui.';

  @override
  String get currencyCopy => 'Copiar resultado';

  @override
  String get currencyCopied => 'Copiado';

  @override
  String get currencyNoMatch => 'Nenhuma moeda encontrada';

  @override
  String get currencyDisclaimer =>
      'As cotações são só uma referência e podem ser diferentes das do seu banco.';

  @override
  String get directChatPhone => 'Número de telefone';

  @override
  String get directChatCountryCode => 'Código do país';

  @override
  String get directChatSearchCountry => 'Buscar país ou código';

  @override
  String get directChatNoCountry => 'Nenhum país encontrado';

  @override
  String get directChatMessage => 'Mensagem (opcional)';

  @override
  String get directChatOpen => 'Abrir no WhatsApp';

  @override
  String get directChatPaste => 'Colar número';

  @override
  String get directChatPasteNone =>
      'Nenhum número de telefone na área de transferência';

  @override
  String get directChatTooShort => 'Este número parece curto demais';

  @override
  String get directChatTooLong => 'Este número parece longo demais';

  @override
  String directChatWillOpen(String number) {
    return 'Conversa com $number';
  }

  @override
  String get directChatOpenFailed =>
      'Não foi possível abrir a conversa. O WhatsApp está instalado?';

  @override
  String get directChatHint =>
      'Mande mensagem para qualquer número sem salvá-lo nos contatos.';

  @override
  String get directChatNotAffiliated =>
      'Ferramenta independente. Sem vínculo com o WhatsApp ou a Meta.';

  @override
  String get percentageTabPercent => 'Porcentagem';

  @override
  String get percentageTabDiscount => 'Desconto';

  @override
  String get percentageTabTip => 'Gorjeta';

  @override
  String get percentageTabTax => 'Imposto';

  @override
  String get percentageOfTitle => 'Porcentagem de um número';

  @override
  String get percentageFieldPercent => 'Porcentagem';

  @override
  String get percentageFieldNumber => 'Número';

  @override
  String percentageOfResult(String percent, String number) {
    return '$percent de $number';
  }

  @override
  String get percentageWhatTitle => 'Qual é a porcentagem?';

  @override
  String get percentageFieldPart => 'Valor';

  @override
  String get percentageFieldTotal => 'Total';

  @override
  String percentageWhatResult(String part, String total) {
    return '$part de $total';
  }

  @override
  String get percentageChangeTitle => 'Variação percentual';

  @override
  String get percentageFieldOld => 'Valor antigo';

  @override
  String get percentageFieldNew => 'Valor novo';

  @override
  String percentageIncrease(String percent) {
    return 'Aumento de $percent';
  }

  @override
  String percentageDecrease(String percent) {
    return 'Queda de $percent';
  }

  @override
  String get percentageNoChange => 'Sem alteração';

  @override
  String get percentageDifference => 'Diferença';

  @override
  String get percentagePrice => 'Preço original';

  @override
  String get percentageDiscount => 'Desconto';

  @override
  String get percentageExtraDiscount => 'Desconto extra (opcional)';

  @override
  String get percentageYouPay => 'Você paga';

  @override
  String get percentageYouSave => 'Você economiza';

  @override
  String get percentageTotalDiscount => 'Desconto total';

  @override
  String get percentageBill => 'Valor da conta';

  @override
  String get percentageTip => 'Gorjeta';

  @override
  String get percentageCustom => 'Outro';

  @override
  String get percentagePeople => 'Pessoas';

  @override
  String get percentageAddPerson => 'Adicionar pessoa';

  @override
  String get percentageRemovePerson => 'Remover pessoa';

  @override
  String get percentageTipAmount => 'Valor da gorjeta';

  @override
  String get percentageTotal => 'Total';

  @override
  String get percentagePerPerson => 'Cada pessoa paga';

  @override
  String get percentageTaxRate => 'Alíquota';

  @override
  String get percentageAddTax => 'Somar imposto';

  @override
  String get percentageRemoveTax => 'Tirar imposto';

  @override
  String get percentagePriceExclTax => 'Preço sem imposto';

  @override
  String get percentagePriceInclTax => 'Preço com imposto';

  @override
  String get percentageBeforeTax => 'Sem imposto';

  @override
  String get percentageTaxAmount => 'Imposto';

  @override
  String get percentageAfterTax => 'Total com imposto';

  @override
  String get percentageEnterValues => 'Digite números para ver o resultado';

  @override
  String get commonSave => 'Salvar';

  @override
  String get commonShare => 'Compartilhar';

  @override
  String get commonCopy => 'Copiar';

  @override
  String get commonCopied => 'Copiado';

  @override
  String get commonRetry => 'Tentar novamente';

  @override
  String get commonDone => 'Concluído';

  @override
  String get commonDelete => 'Excluir';

  @override
  String get commonUndo => 'Desfazer';

  @override
  String get commonOpen => 'Abrir';

  @override
  String get commonReset => 'Redefinir';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonOpenSettings => 'Abrir configurações';

  @override
  String get commonChoosePhoto => 'Escolher foto';

  @override
  String get commonChooseFile => 'Escolher arquivo';

  @override
  String get commonCamera => 'Câmera';

  @override
  String get commonGallery => 'Galeria';

  @override
  String get commonWorking => 'Processando…';

  @override
  String get commonSavedToGallery => 'Salvo na galeria';

  @override
  String get commonSavedToDownloads => 'Salvo em Downloads';

  @override
  String get commonSaveFailed => 'Não foi possível salvar o arquivo';

  @override
  String get commonErrorGeneric => 'Algo deu errado. Tente novamente.';

  @override
  String get commonErrorOffline => 'Sem conexão com a internet';

  @override
  String get commonErrorTimeout => 'O tempo esgotou. Tente novamente.';

  @override
  String get commonPermissionNeeded =>
      'Permissão necessária. Permita nas configurações.';

  @override
  String get commonResult => 'Resultado';

  @override
  String get commonStart => 'Iniciar';

  @override
  String get commonStop => 'Parar';

  @override
  String get commonClearAll => 'Limpar tudo';

  @override
  String get commonPaste => 'Colar';

  @override
  String get commonSearch => 'Pesquisar';

  @override
  String get organizePdfHint =>
      'Toque nas páginas para selecioná-las. Toque e segure uma página e arraste para movê-la.';

  @override
  String organizePdfSelected(int count) {
    return '$count selecionada(s)';
  }

  @override
  String get organizePdfRotateLeft => 'Girar para a esquerda';

  @override
  String get organizePdfRotateRight => 'Girar para a direita';

  @override
  String get organizePdfDelete => 'Excluir';

  @override
  String get organizePdfSelectAll => 'Selecionar tudo';

  @override
  String get organizePdfClearSelection => 'Limpar seleção';

  @override
  String organizePdfDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas excluídas',
      one: '1 página excluída',
    );
    return '$_temp0';
  }

  @override
  String get organizePdfUndo => 'Desfazer';

  @override
  String get organizePdfKeepOne => 'Um PDF precisa ter pelo menos uma página.';

  @override
  String get organizePdfNoChanges =>
      'Nenhuma alteração ainda — mova, gire ou exclua páginas primeiro.';

  @override
  String get organizePdfReset => 'Desfazer todas as alterações';

  @override
  String get organizePdfMoveEarlier => 'Mover para antes';

  @override
  String get organizePdfMoveLater => 'Mover para depois';

  @override
  String get organizePdfSave => 'Salvar PDF';

  @override
  String get organizePdfFailed => 'Não foi possível salvar este PDF.';

  @override
  String get organizePdfResult => 'Seu PDF organizado está pronto';

  @override
  String pdfToTextReading(int current, int total) {
    return 'Lendo a página $current de $total…';
  }

  @override
  String pdfToTextWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras',
      one: '1 palavra',
    );
    return '$_temp0';
  }

  @override
  String get pdfToTextCopyAll => 'Copiar tudo';

  @override
  String get pdfToTextCopied => 'Texto copiado';

  @override
  String get pdfToTextSaveTxt => 'Salvar como .txt';

  @override
  String get pdfToTextEmptyPage => 'Não há texto nesta página';

  @override
  String get pdfToTextScannedTitle => 'Nenhum texto encontrado';

  @override
  String get pdfToTextScannedBody =>
      'Este PDF parece ser uma digitalização ou fotos, então não há texto para copiar. Em vez disso, podemos ler as palavras da página 1 a partir da imagem.';

  @override
  String pdfToTextOpenOcr(String tool) {
    return 'Ler a página 1 com $tool';
  }

  @override
  String get pdfToTextFailed => 'Não foi possível ler o texto deste PDF.';

  @override
  String pdfToTextPartlyScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas não têm texto (podem estar digitalizadas).',
      one: '1 página não tem texto (pode estar digitalizada).',
    );
    return '$_temp0';
  }

  @override
  String get pdfEditChoosePdf => 'Escolha um PDF';

  @override
  String get pdfEditChooseHint =>
      'Ou compartilhe um PDF com o Utility Toolbox a partir de qualquer app';

  @override
  String get pdfEditChange => 'Trocar';

  @override
  String get pdfEditReading => 'Lendo…';

  @override
  String pdfEditPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '1 página',
    );
    return '$_temp0';
  }

  @override
  String pdfEditPageN(int number) {
    return 'Página $number';
  }

  @override
  String get pdfEditInvalidPdf => 'Este arquivo não parece ser um PDF válido.';

  @override
  String get pdfEditLocked =>
      'Este PDF está protegido por senha. Remova a senha primeiro e tente novamente.';

  @override
  String get pdfEditLockedShort => 'Protegido por senha';

  @override
  String get pdfEditPreviewFailed => 'Não foi possível mostrar esta página.';

  @override
  String get pdfEditResultReady => 'Seu PDF está pronto';

  @override
  String get pdfEditSaveDownloads => 'Salvar em Downloads';

  @override
  String get pdfEditShare => 'Compartilhar';

  @override
  String get pdfEditStartOver => 'Começar de novo';

  @override
  String get pdfEditSavedToDownloads =>
      'Salvo em Downloads — encontre em Meus arquivos';

  @override
  String get pdfEditSharedInstead =>
      'O menu de compartilhamento foi aberto no lugar';

  @override
  String get pdfEditSaveFailed =>
      'Não foi possível criar o arquivo. Tente novamente.';

  @override
  String get signPdfStepPdf => 'Escolha seu PDF';

  @override
  String get signPdfStepSignature => 'Crie sua assinatura';

  @override
  String get signPdfStepPlace =>
      'Toque em uma página para colocar sua assinatura';

  @override
  String get signPdfDraw => 'Desenhar assinatura';

  @override
  String get signPdfDrawAgain => 'Desenhar de novo';

  @override
  String get signPdfUseSaved => 'Usar assinatura salva';

  @override
  String get signPdfDeleteSaved => 'Excluir assinatura salva';

  @override
  String get signPdfSavedDeleted => 'Assinatura salva excluída';

  @override
  String get signPdfDrawTitle => 'Desenhe sua assinatura';

  @override
  String get signPdfDrawHint => 'Assine aqui com o dedo';

  @override
  String get signPdfUndo => 'Desfazer';

  @override
  String get signPdfInkBlack => 'Preto';

  @override
  String get signPdfInkBlue => 'Azul';

  @override
  String get signPdfRemember => 'Salvar assinatura para a próxima vez';

  @override
  String get signPdfDone => 'Usar esta assinatura';

  @override
  String get signPdfEmpty => 'Desenhe sua assinatura primeiro.';

  @override
  String get signPdfSignatureLabel => 'Sua assinatura';

  @override
  String get signPdfPlaceHint =>
      'Arraste para mover; use dois dedos ou o controle para redimensionar. Toque na página para levar a assinatura até lá.';

  @override
  String get signPdfSize => 'Tamanho';

  @override
  String get signPdfPlaceConfirm => 'Colocar aqui';

  @override
  String get signPdfRemoveFromPage => 'Remover desta página';

  @override
  String get signPdfAllPages => 'Adicionar a todas as páginas';

  @override
  String signPdfAllPagesDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Assinatura adicionada às $count páginas',
      one: 'Assinatura adicionada a 1 página',
    );
    return '$_temp0';
  }

  @override
  String get signPdfClearAll => 'Remover todas';

  @override
  String signPdfPlacedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Assinado em $count páginas',
      one: 'Assinado em 1 página',
      zero: 'Nenhuma página assinada ainda',
    );
    return '$_temp0';
  }

  @override
  String get signPdfSave => 'Salvar PDF assinado';

  @override
  String get signPdfNoPlacement =>
      'Primeiro toque em uma página para colocar sua assinatura.';

  @override
  String get signPdfFailed => 'Não foi possível assinar este PDF.';

  @override
  String get signPdfResult => 'Seu PDF assinado está pronto';

  @override
  String get watermarkPdfModeText => 'Marca d’água de texto';

  @override
  String get watermarkPdfModeNumbers => 'Números de página';

  @override
  String get watermarkPdfText => 'Texto da marca d’água';

  @override
  String get watermarkPdfDefaultText => 'CONFIDENCIAL';

  @override
  String get watermarkPdfTextEmpty =>
      'Digite primeiro o texto da marca d’água.';

  @override
  String get watermarkPdfSize => 'Tamanho do texto';

  @override
  String get watermarkPdfOpacity => 'Opacidade';

  @override
  String get watermarkPdfLayout => 'Layout';

  @override
  String get watermarkPdfDiagonal => 'Diagonal';

  @override
  String get watermarkPdfCenter => 'Centro';

  @override
  String get watermarkPdfTiled => 'Lado a lado';

  @override
  String get watermarkPdfColor => 'Cor';

  @override
  String get watermarkPdfColorGrey => 'Cinza';

  @override
  String get watermarkPdfColorRed => 'Vermelho';

  @override
  String get watermarkPdfColorBlue => 'Azul';

  @override
  String get watermarkPdfColorBlack => 'Preto';

  @override
  String get watermarkPdfColorGreen => 'Verde';

  @override
  String get watermarkPdfFormat => 'Formato';

  @override
  String watermarkPdfPageLabel(String number) {
    return 'Página $number';
  }

  @override
  String get watermarkPdfPosition => 'Posição';

  @override
  String get watermarkPdfBottomCenter => 'Embaixo no centro';

  @override
  String get watermarkPdfBottomRight => 'Embaixo à direita';

  @override
  String get watermarkPdfTopRight => 'Em cima à direita';

  @override
  String get watermarkPdfStartAt => 'Começar em';

  @override
  String get watermarkPdfDecrease => 'Diminuir';

  @override
  String get watermarkPdfIncrease => 'Aumentar';

  @override
  String get watermarkPdfPreview => 'Prévia (página 1)';

  @override
  String get watermarkPdfApplyText => 'Adicionar marca d’água';

  @override
  String get watermarkPdfApplyNumbers => 'Adicionar números de página';

  @override
  String get watermarkPdfFailed => 'Não foi possível alterar este PDF.';

  @override
  String get bgRemoverPickTitle => 'Escolha uma foto';

  @override
  String get bgRemoverPickBody =>
      'Funciona melhor com pessoas, animais e objetos. Sua foto é processada no seu celular.';

  @override
  String get bgRemoverGallery => 'Escolher da galeria';

  @override
  String get bgRemoverCamera => 'Tirar uma foto';

  @override
  String get bgRemoverPreparing => 'Preparando a foto…';

  @override
  String get bgRemoverWorking => 'Removendo o fundo…';

  @override
  String get bgRemoverDownloading =>
      'Preparando a ferramenta de remover fundo. Isso só acontece uma vez e precisa de internet…';

  @override
  String get bgRemoverDownloadFailed =>
      'A ferramenta ainda não está pronta: o Google Play Services ainda está baixando. Verifique sua internet e tente de novo em um minuto.';

  @override
  String get bgRemoverNoSubject =>
      'Nenhuma pessoa ou objeto foi encontrado nesta foto. Tente uma foto com um tema bem visível.';

  @override
  String get bgRemoverOpenFailed =>
      'Não foi possível abrir esta foto. Tente outra.';

  @override
  String get bgRemoverFailed =>
      'Algo deu errado ao remover o fundo. Tente novamente.';

  @override
  String get bgRemoverRetry => 'Tentar de novo';

  @override
  String get bgRemoverAnotherPhoto => 'Escolher outra foto';

  @override
  String get bgRemoverNewPhoto => 'Nova foto';

  @override
  String get bgRemoverBefore => 'Antes';

  @override
  String get bgRemoverAfter => 'Depois';

  @override
  String get bgRemoverCompare => 'Comparar antes e depois';

  @override
  String get bgRemoverCompareHint => 'Arraste o controle para comparar';

  @override
  String get bgRemoverBgTransparent => 'Transparente';

  @override
  String get bgRemoverBgWhite => 'Branco';

  @override
  String get bgRemoverBgBlack => 'Preto';

  @override
  String get bgRemoverBgBlue => 'Azul';

  @override
  String get bgRemoverBgRed => 'Vermelho';

  @override
  String get bgRemoverBgYellow => 'Amarelo';

  @override
  String get bgRemoverBgBlur => 'Desfoque';

  @override
  String get bgRemoverSave => 'Salvar na galeria';

  @override
  String get bgRemoverSaved => 'Salva na sua galeria';

  @override
  String get bgRemoverSaveFailed =>
      'Não foi possível salvar a imagem. Tente novamente.';

  @override
  String get bgRemoverPngHint => 'PNG com fundo transparente';

  @override
  String get bgRemoverJpgHint => 'JPG com o fundo escolhido';

  @override
  String get bubbleLevelSurfaceHint => 'Deite o celular sobre a superfície';

  @override
  String get bubbleLevelUprightHint =>
      'Encoste a borda do celular na superfície';

  @override
  String get bubbleLevelLevel => 'Nivelado';

  @override
  String bubbleLevelAngleLabel(String angle) {
    return 'Inclinação de $angle graus';
  }

  @override
  String bubbleLevelAxes(String x, String y) {
    return 'Esquerda–direita $x° · Frente–trás $y°';
  }

  @override
  String get bubbleLevelCalibrate => 'Calibrar';

  @override
  String get bubbleLevelReset => 'Redefinir';

  @override
  String get bubbleLevelCalibrateTitle => 'Calibrar o nível?';

  @override
  String get bubbleLevelCalibrateBody =>
      'Coloque o celular numa superfície que você sabe que está nivelada (ou encoste numa borda reta) e toque em Calibrar. A posição atual passará a marcar 0°.';

  @override
  String get bubbleLevelCalibrated => 'Calibrado. Esta posição agora marca 0°.';

  @override
  String get bubbleLevelResetDone => 'Calibração apagada';

  @override
  String get bubbleLevelUnavailable =>
      'Este celular não tem sensor de movimento, então o nível não funciona aqui.';

  @override
  String get flashlightOn => 'Luz ligada';

  @override
  String get flashlightOff => 'Luz desligada';

  @override
  String get flashlightTurnOn => 'Ligar a luz';

  @override
  String get flashlightTurnOff => 'Desligar a luz';

  @override
  String get flashlightModeSteady => 'Contínua';

  @override
  String get flashlightModeSos => 'SOS';

  @override
  String get flashlightModeStrobe => 'Estrobo';

  @override
  String get flashlightSosHint =>
      'Pisca o sinal de socorro ··· ––– ··· sem parar';

  @override
  String flashlightStrobeSpeed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count piscadas por segundo',
      one: '1 piscada por segundo',
    );
    return '$_temp0';
  }

  @override
  String get flashlightUseScreen => 'Usar a tela como luz';

  @override
  String get flashlightUseScreenHint => 'Acende a tela em vez do flash';

  @override
  String get flashlightNoTorch =>
      'Este celular não tem flash, então a tela acende no lugar.';

  @override
  String get flashlightTorchBusy =>
      'O flash está ocupado (talvez outro app esteja usando a câmera), então a tela acende no lugar.';

  @override
  String get flashlightScreenColor => 'Cor da luz da tela';

  @override
  String get flashlightColorWhite => 'Branco';

  @override
  String get flashlightColorWarm => 'Branco quente';

  @override
  String get flashlightColorRed => 'Vermelho';

  @override
  String get flashlightColorGreen => 'Verde';

  @override
  String get flashlightColorBlue => 'Azul';

  @override
  String get flashlightTapToTurnOff => 'Toque em qualquer lugar para desligar';

  @override
  String get stopwatchTabStopwatch => 'Cronômetro';

  @override
  String get stopwatchTabTimer => 'Timer';

  @override
  String get stopwatchStart => 'Iniciar';

  @override
  String get stopwatchPause => 'Pausar';

  @override
  String get stopwatchResume => 'Continuar';

  @override
  String get stopwatchLap => 'Volta';

  @override
  String get stopwatchReset => 'Zerar';

  @override
  String stopwatchLapNumber(int number) {
    return 'Volta $number';
  }

  @override
  String stopwatchCurrentLap(int number, String time) {
    return 'Volta $number: $time';
  }

  @override
  String get stopwatchBest => 'Mais rápida';

  @override
  String get stopwatchWorst => 'Mais lenta';

  @override
  String get stopwatchNoLaps =>
      'Toque em Volta com o cronômetro rodando para registrar os tempos.';

  @override
  String get stopwatchTimerQuickStart => 'Início rápido';

  @override
  String stopwatchTimerMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get stopwatchTimerCustom => 'Escolher outro tempo';

  @override
  String get stopwatchTimerPickTitle => 'Definir timer';

  @override
  String get stopwatchTimerHours => 'horas';

  @override
  String get stopwatchTimerMinutesUnit => 'min';

  @override
  String get stopwatchTimerSeconds => 's';

  @override
  String get stopwatchTimerAddMinute => '+1 min';

  @override
  String get stopwatchTimerPaused => 'Pausado';

  @override
  String stopwatchTimerRemaining(String time) {
    return 'Faltam $time';
  }

  @override
  String get stopwatchTimerTimesUp => 'O tempo acabou!';

  @override
  String stopwatchTimerFinishedBody(String duration) {
    return 'Seu timer de $duration terminou.';
  }

  @override
  String get stopwatchTimerRestart => 'Reiniciar';

  @override
  String get stopwatchTimerDone => 'Pronto';

  @override
  String get stopwatchTimerKeepOpen =>
      'Mantenha esta tela aberta: o celular vibra quando o tempo acabar.';

  @override
  String get translateHeroTitle => 'Fale ou digite para traduzir';

  @override
  String get translateBadgeOnDevice => 'IA no dispositivo';

  @override
  String get translateBadgeOffline => 'Funciona offline';

  @override
  String get translateFrom => 'De';

  @override
  String get translateTo => 'Para';

  @override
  String get translateSwap => 'Trocar idiomas';

  @override
  String get translateHint =>
      'Digite um texto ou toque no microfone para falar…';

  @override
  String get translateHintListening =>
      'Ouvindo… fale normalmente e toque no microfone para parar';

  @override
  String translateListeningIn(String language) {
    return 'Ouvindo em $language… toque no microfone para parar e traduzir.';
  }

  @override
  String get translateSameLanguage =>
      'Os idiomas de origem e de destino devem ser diferentes.';

  @override
  String get translateButton => 'Traduzir';

  @override
  String get translateTranslating => 'Traduzindo…';

  @override
  String get translateStopAndTranslate => 'Parar e traduzir';

  @override
  String get translateDownloadingModel => 'Baixando o modelo de idioma…';

  @override
  String get translateResultLabel => 'Tradução';

  @override
  String get translatePlayAudio => 'Reproduzir áudio';

  @override
  String get translateGenerating => 'Gerando…';

  @override
  String get translateShareAudio => 'Compartilhar arquivo de áudio';

  @override
  String get translateGenerateAudio => 'Gerar arquivo de áudio';

  @override
  String get translateAudioReady =>
      'Arquivo de áudio pronto: compartilhe para enviar ou salvar.';

  @override
  String get translateMicStop => 'Parar de ouvir e traduzir';

  @override
  String get translateMicStart => 'Fale para traduzir';

  @override
  String get translateMicBlocked =>
      'O acesso ao microfone está bloqueado. Ative-o nas configurações para usar a entrada de voz.';

  @override
  String get translateMicNeeded =>
      'É necessária a permissão do microfone para a entrada de voz.';

  @override
  String get translateSpeechUnavailable =>
      'O reconhecimento de voz não está disponível neste dispositivo.';

  @override
  String get translateNoSpeech => 'Não entendi. Tente falar novamente.';

  @override
  String get translateVoiceFailed => 'A entrada de voz parou. Tente novamente.';

  @override
  String get translateDownloadFailed =>
      'Não foi possível baixar os modelos de idioma. Verifique sua conexão com a internet.';

  @override
  String get translateFailed => 'A tradução falhou. Tente novamente.';

  @override
  String get translateAudioFailed =>
      'Não foi possível criar um arquivo de áudio neste dispositivo.';

  @override
  String translateLanguageName(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'af': 'Africâner',
      'sq': 'Albanês',
      'ar': 'Árabe',
      'be': 'Bielorrusso',
      'bn': 'Bengali',
      'bg': 'Búlgaro',
      'ca': 'Catalão',
      'zh': 'Chinês (simplificado)',
      'hr': 'Croata',
      'cs': 'Tcheco',
      'da': 'Dinamarquês',
      'nl': 'Holandês',
      'en': 'Inglês',
      'eo': 'Esperanto',
      'et': 'Estoniano',
      'fi': 'Finlandês',
      'fr': 'Francês',
      'gl': 'Galego',
      'ka': 'Georgiano',
      'de': 'Alemão',
      'el': 'Grego',
      'gu': 'Guzerate',
      'ht': 'Crioulo haitiano',
      'he': 'Hebraico',
      'hi': 'Híndi',
      'hu': 'Húngaro',
      'is': 'Islandês',
      'id': 'Indonésio',
      'ga': 'Irlandês',
      'it': 'Italiano',
      'ja': 'Japonês',
      'kn': 'Canarim',
      'ko': 'Coreano',
      'lv': 'Letão',
      'lt': 'Lituano',
      'mk': 'Macedônio',
      'ms': 'Malaio',
      'mt': 'Maltês',
      'mr': 'Marati',
      'no': 'Norueguês',
      'fa': 'Persa (farsi)',
      'pl': 'Polonês',
      'pt': 'Português',
      'ro': 'Romeno',
      'ru': 'Russo',
      'sk': 'Eslovaco',
      'sl': 'Esloveno',
      'es': 'Espanhol',
      'sw': 'Suaíli',
      'sv': 'Sueco',
      'tl': 'Tagalo (filipino)',
      'ta': 'Tâmil',
      'te': 'Telugu',
      'th': 'Tailandês',
      'tr': 'Turco',
      'uk': 'Ucraniano',
      'ur': 'Urdu',
      'vi': 'Vietnamita',
      'cy': 'Galês',
      'other': '$code',
    });
    return '$_temp0';
  }

  @override
  String get textUtilMode => 'Modo';

  @override
  String get textUtilModeText => 'Texto';

  @override
  String get textUtilHint => 'Digite o texto aqui…';

  @override
  String get textUtilHintBase64 => 'Digite texto ou Base64 para converter…';

  @override
  String textUtilWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'palavras',
      one: 'palavra',
    );
    return '$_temp0';
  }

  @override
  String textUtilCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'caracteres',
      one: 'caractere',
    );
    return '$_temp0';
  }

  @override
  String get textUtilNoSpaces => 'sem espaços';

  @override
  String get textUtilUpper => 'MAIÚSCULAS';

  @override
  String get textUtilLower => 'minúsculas';

  @override
  String get textUtilTitle => 'Iniciais Maiúsculas';

  @override
  String get textUtilSentence => 'Primeira letra maiúscula';

  @override
  String get textUtilEncode => 'Codificar';

  @override
  String get textUtilDecode => 'Decodificar';

  @override
  String get textUtilOutput => 'Saída';

  @override
  String get textUtilInvalidBase64 => 'Isso não é um Base64 válido.';

  @override
  String get clipEmptyClipboard =>
      'A área de transferência está vazia ou não tem texto.';

  @override
  String clipSaved(String text) {
    return 'Salvo: $text';
  }

  @override
  String get clipAddManualTitle => 'Adicionar texto manualmente';

  @override
  String get clipAddHint => 'Digite ou cole o texto aqui…';

  @override
  String get clipClearUnpinned => 'Limpar não fixados';

  @override
  String get clipClearHistoryTitle => 'Limpar histórico?';

  @override
  String get clipClearHistoryBody =>
      'Remover todos os itens não fixados? Os itens fixados são mantidos.';

  @override
  String get clipSearchHint => 'Pesquisar recortes…';

  @override
  String get clipFilterAll => 'Todos';

  @override
  String get clipFilterPinned => 'Fixados';

  @override
  String get clipFilterLinks => 'Links';

  @override
  String get clipFilterText => 'Texto';

  @override
  String get clipFilterCode => 'Código';

  @override
  String clipSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString salvos',
      one: '1 salvo',
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
      other: '$countString fixados',
      one: '1 fixado',
    );
    return '$_temp0';
  }

  @override
  String get clipAddText => 'Adicionar texto';

  @override
  String get clipLabel => 'Rótulo';

  @override
  String get clipAddLabelTitle => 'Adicionar rótulo';

  @override
  String get clipLabelHint => 'ex.: e-mail do trabalho';

  @override
  String get clipEmptyTitle => 'Nenhum recorte ainda';

  @override
  String get clipEmptyMessage =>
      'Copie qualquer texto no celular e toque em Colar para salvá-lo aqui permanentemente.';

  @override
  String get clipPasteFromClipboard => 'Colar da área de transferência';

  @override
  String get clipTypeLink => 'Link';

  @override
  String get clipTypeEmail => 'E-mail';

  @override
  String get clipTypePhone => 'Telefone';

  @override
  String get clipTypeCode => 'Código';

  @override
  String get clipTypeText => 'Texto';

  @override
  String get clipJustNow => 'agora mesmo';

  @override
  String clipMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count min',
    );
    return '$_temp0';
  }

  @override
  String clipHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count h',
    );
    return '$_temp0';
  }

  @override
  String clipDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'há $count dias',
      one: 'há 1 dia',
    );
    return '$_temp0';
  }

  @override
  String get clipPin => 'Fixar';

  @override
  String get clipUnpin => 'Desafixar';

  @override
  String get calcDivideByZero => 'Não é possível dividir por zero';

  @override
  String get calcCheckExpression => 'Verifique a expressão';

  @override
  String get calcCopyResult => 'Copiar resultado';

  @override
  String get calcPlus => 'Mais';

  @override
  String get calcMinus => 'Menos';

  @override
  String get calcTimes => 'Vezes';

  @override
  String get calcDivide => 'Dividido por';

  @override
  String get calcPercent => 'Por cento';

  @override
  String get calcParentheses => 'Parênteses';

  @override
  String get calcEquals => 'Igual';

  @override
  String get calcDecimalPoint => 'Ponto decimal';

  @override
  String get ageTabAge => 'Idade';

  @override
  String get ageTabBetween => 'Entre datas';

  @override
  String get ageDateOfBirth => 'Data de nascimento';

  @override
  String get ageFrom => 'De';

  @override
  String get ageTo => 'Até';

  @override
  String get ageFutureDate => 'Essa data está no futuro.';

  @override
  String ageYearsUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'anos',
      one: 'ano',
    );
    return '$_temp0';
  }

  @override
  String ageDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dias',
      one: 'dia',
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
      other: '$countString anos',
      one: '1 ano',
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
      other: '$countString meses',
      one: '1 mês',
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
      other: '$countString dias',
      one: '1 dia',
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
      other: '$countString semanas',
      one: '1 semana',
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
      other: 'em $countString dias',
      one: 'em 1 dia',
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
  String get ageNextBirthday => 'Próximo aniversário';

  @override
  String get ageBirthdayToday => 'Hoje 🎉';

  @override
  String get ageTotalMonths => 'Total de meses';

  @override
  String get ageTotalWeeks => 'Total de semanas';

  @override
  String get ageTotalDays => 'Total de dias';

  @override
  String get ageWeeksLabel => 'Semanas';

  @override
  String get ageWeekdays => 'Dias úteis (seg–sex)';

  @override
  String get ageHours => 'Horas';

  @override
  String get ageIncludingEnd => 'Incluindo a data final';

  @override
  String get unitFrom => 'De';

  @override
  String get unitTo => 'Para';

  @override
  String get unitEnterValue => 'Digite um valor';

  @override
  String get unitSwap => 'Trocar unidades';

  @override
  String unitCategoryName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'length': 'Comprimento',
      'weight': 'Peso',
      'temperature': 'Temperatura',
      'area': 'Área',
      'volume': 'Volume',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String unitName(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'millimeter': 'Milímetro',
      'centimeter': 'Centímetro',
      'meter': 'Metro',
      'kilometer': 'Quilômetro',
      'inch': 'Polegada',
      'foot': 'Pé',
      'mile': 'Milha',
      'gram': 'Grama',
      'kilogram': 'Quilograma',
      'ounce': 'Onça',
      'pound': 'Libra',
      'celsius': 'Celsius',
      'fahrenheit': 'Fahrenheit',
      'kelvin': 'Kelvin',
      'squareMeter': 'Metro quadrado',
      'squareFoot': 'Pé quadrado',
      'acre': 'Acre',
      'hectare': 'Hectare',
      'milliliter': 'Mililitro',
      'liter': 'Litro',
      'gallonUs': 'Galão (EUA)',
      'fluidOunce': 'Onça líquida',
      'other': '$id',
    });
    return '$_temp0';
  }

  @override
  String get loanAmount => 'Valor do empréstimo';

  @override
  String get loanInterestRate => 'Taxa de juros anual';

  @override
  String get loanTenure => 'Prazo';

  @override
  String get loanTenureMonths => 'Prazo (meses)';

  @override
  String get loanTenureYears => 'Prazo (anos)';

  @override
  String get loanToggleMonths => 'Meses';

  @override
  String get loanToggleYears => 'Anos';

  @override
  String get loanEmpty =>
      'Insira dados válidos do empréstimo acima para calcular a parcela';

  @override
  String get loanMonthlyEmi => 'Parcela mensal';

  @override
  String get loanPrincipal => 'Principal';

  @override
  String get loanTotalInterest => 'Juros totais';

  @override
  String get loanTotalPayment => 'Pagamento total';

  @override
  String get loanBreakdown => 'Detalhamento';

  @override
  String get loanInterest => 'Juros';

  @override
  String loanInterestShare(String percent) {
    return '$percent de juros';
  }

  @override
  String get loanSchedule => 'Tabela de amortização';

  @override
  String loanMonths(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString meses',
      one: '1 mês',
    );
    return '$_temp0';
  }

  @override
  String get loanColMonth => 'Mês';

  @override
  String get loanColBalance => 'Saldo';

  @override
  String get loanShowAll => 'Mostrar todos os meses';

  @override
  String get loanShowLess => 'Mostrar menos';

  @override
  String get clockSearchHint => 'Pesquisar cidade ou país…';

  @override
  String get clockPinned => 'Fixadas';

  @override
  String get clockAllCities => 'Todas as cidades';

  @override
  String clockOnWidget(int shown, int total) {
    final intl.NumberFormat shownNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String shownString = shownNumberFormat.format(shown);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'No widget: $shownString de $totalString';
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

    return 'No widget: $shownString de até $maxString (redimensione para ver mais)';
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

    return 'O widget da tela inicial mostra as primeiras $defaultRowsString por padrão; arraste a borda inferior para ver até $maxRowsString.';
  }

  @override
  String get clockPin => 'Fixar';

  @override
  String get clockUnpin => 'Desafixar';

  @override
  String get clockNoResults => 'Nenhuma cidade encontrada';

  @override
  String get speedSelectingServer => 'Selecionando servidor…';

  @override
  String get speedPhasePing => 'Medindo o ping';

  @override
  String get speedPhaseDownload => 'Testando a velocidade de download';

  @override
  String get speedPhaseUpload => 'Testando a velocidade de upload';

  @override
  String get speedDownloadSpeed => 'Velocidade de download';

  @override
  String get speedUploadSpeed => 'Velocidade de upload';

  @override
  String get speedRunAgain => 'Repetir';

  @override
  String get speedGo => 'IR';

  @override
  String speedMeasuredVia(String server) {
    return 'Medido via $server';
  }

  @override
  String get speedPoweredBy =>
      'Usa os servidores de teste de velocidade da Cloudflare';

  @override
  String get speedIdleHint =>
      'Toque no botão para medir o ping e as velocidades de download e upload.';

  @override
  String get speedPing => 'Ping';

  @override
  String get speedResultsTitle => 'Resultados do teste';

  @override
  String get speedDownload => 'Download';

  @override
  String get speedUpload => 'Upload';

  @override
  String speedConnectedIp(String ip) {
    return 'Seu IP: $ip';
  }

  @override
  String get speedErrorOffline =>
      'Sem conexão com a internet. Verifique o Wi-Fi ou os dados móveis.';

  @override
  String get speedErrorTimeout =>
      'O teste expirou. Sua conexão pode estar instável.';

  @override
  String get speedErrorFailed => 'O teste falhou. Tente novamente.';

  @override
  String get pingErrorHostNotFound =>
      'Host não encontrado. Verifique o endereço e sua conexão com a internet.';

  @override
  String get pingErrorNoData =>
      'Não há informações disponíveis para este endereço.';

  @override
  String get pingTabMyIp => 'Meu IP';

  @override
  String get pingTabLookup => 'Consultar';

  @override
  String get pingTabPing => 'Ping';

  @override
  String get pingYourPublicIp => 'Seu IP público';

  @override
  String get pingFieldCity => 'Cidade';

  @override
  String get pingFieldRegion => 'Região';

  @override
  String get pingFieldCountry => 'País';

  @override
  String get pingFieldIsp => 'Provedor';

  @override
  String get pingFieldTimezone => 'Fuso horário';

  @override
  String get pingFieldLocation => 'Coordenadas';

  @override
  String get pingFieldIp => 'Endereço IP';

  @override
  String get pingIpCopied => 'Endereço IP copiado';

  @override
  String get pingCopyIp => 'Copiar IP';

  @override
  String get pingLookupHint => 'Endereço IP ou nome do host';

  @override
  String get pingLookupButton => 'Consultar';

  @override
  String get pingHostHint => 'Nome do host (ex.: google.com)';

  @override
  String get pingStartButton => 'Testar';

  @override
  String pingHeader(String host, String ip) {
    return 'Ping para $host ($ip) pela porta TCP 443';
  }

  @override
  String get pingStatAvg => 'Média';

  @override
  String get pingStatLoss => 'Perda';

  @override
  String get pingStatSent => 'Enviados';

  @override
  String get pingTimeout => 'Tempo esgotado';

  @override
  String get compassN => 'N';

  @override
  String get compassNE => 'NE';

  @override
  String get compassE => 'L';

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
  String get compassNorth => 'Norte';

  @override
  String get compassNortheast => 'Nordeste';

  @override
  String get compassEast => 'Leste';

  @override
  String get compassSoutheast => 'Sudeste';

  @override
  String get compassSouth => 'Sul';

  @override
  String get compassSouthwest => 'Sudoeste';

  @override
  String get compassWest => 'Oeste';

  @override
  String get compassNorthwest => 'Noroeste';

  @override
  String compassSemantics(String degrees, String direction) {
    return 'Rumo $degrees°, $direction';
  }

  @override
  String get compassHeadingMagnetic => 'Rumo magnético';

  @override
  String get compassUnavailable =>
      'Este aparelho não tem magnetômetro, então a bússola não funciona.';

  @override
  String get locationSavedHeader => 'Locais salvos';

  @override
  String locationSavedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString salvos',
      one: '1 salvo',
      zero: 'Nenhum',
    );
    return '$_temp0';
  }

  @override
  String locationEmpty(String save) {
    return 'Nenhum local salvo ainda.\nToque em \"$save\" para guardar onde você está.';
  }

  @override
  String locationDeleted(String name) {
    return 'Local \"$name\" excluído';
  }

  @override
  String get locationSaveDialogTitle => 'Salvar local';

  @override
  String get locationNameLabel => 'Nome';

  @override
  String get locationNameHint => 'ex.: Casa, Trabalho…';

  @override
  String get locationNoteLabel => 'Observação (opcional)';

  @override
  String get locationCurrent => 'Local atual';

  @override
  String get locationRefresh => 'Atualizar local';

  @override
  String get locationLocating => 'Buscando sua localização…';

  @override
  String get locationServicesOff =>
      'A localização está desativada. Ative-a para ver onde você está.';

  @override
  String get locationPermissionDenied =>
      'Permita o acesso à localização para ver onde você está.';

  @override
  String get locationPermissionDeniedForever =>
      'O acesso à localização está bloqueado. Permita nas configurações para usar esta ferramenta.';

  @override
  String get locationErrorTimeout =>
      'Não foi possível obter sinal de GPS. Fique perto de uma janela ou ao ar livre e tente de novo.';

  @override
  String get locationAllow => 'Permitir acesso';

  @override
  String locationAccuracy(String meters) {
    return 'Precisão: ±$meters m';
  }

  @override
  String get locationCoordsCopied => 'Coordenadas copiadas';

  @override
  String get locationCopyCoords => 'Copiar coordenadas';

  @override
  String get locationOpenInMaps => 'Abrir no Maps';

  @override
  String get passwordYours => 'Sua senha';

  @override
  String get passwordSelectType => 'Escolha pelo menos um tipo de caractere';

  @override
  String get passwordStrength => 'Força';

  @override
  String get passwordWeak => 'Fraca';

  @override
  String get passwordFair => 'Razoável';

  @override
  String get passwordGood => 'Boa';

  @override
  String get passwordStrong => 'Forte';

  @override
  String get passwordLength => 'Tamanho';

  @override
  String passwordChars(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString caracteres',
      one: '1 caractere',
    );
    return '$_temp0';
  }

  @override
  String get passwordInclude => 'Incluir';

  @override
  String get passwordUppercase => 'Maiúsculas';

  @override
  String get passwordLowercase => 'Minúsculas';

  @override
  String get passwordNumbers => 'Números';

  @override
  String get passwordSymbols => 'Símbolos';

  @override
  String get passwordCopied => 'Senha copiada';

  @override
  String get passwordGenerate => 'Gerar nova';

  @override
  String get hashModeText => 'Texto';

  @override
  String get hashModeFile => 'Arquivo';

  @override
  String get hashAlgorithm => 'Algoritmo';

  @override
  String get hashInputHint => 'Digite o texto para gerar o hash…';

  @override
  String get hashPickFile => 'Toque para escolher um arquivo';

  @override
  String get hashChange => 'Trocar';

  @override
  String get hashHashing => 'Calculando…';

  @override
  String get hashGenerate => 'Gerar hash';

  @override
  String get hashFileError => 'Não foi possível ler este arquivo. Tente outro.';

  @override
  String get hashCopied => 'Hash copiado';

  @override
  String get hashCopy => 'Copiar hash';

  @override
  String get colorPickerFormats => 'Formatos de cor';

  @override
  String get colorPickerHexLabel => 'Cor HEX';

  @override
  String get colorPickerHexInvalid =>
      'Digite 6 dígitos hexadecimais (0–9, A–F)';

  @override
  String get colorPickerApply => 'Aplicar cor';

  @override
  String colorPickerCopied(String format) {
    return '$format copiado';
  }

  @override
  String get colorPickerPalette => 'Paleta rápida';

  @override
  String colorPickerSwatch(String hex) {
    return 'Cor $hex';
  }

  @override
  String get imgCompressPickHint => 'Toque para escolher ou tirar uma foto';

  @override
  String imgCompressSupported(String formats) {
    return 'Compatível com $formats';
  }

  @override
  String get imgCompressChange => 'Trocar foto';

  @override
  String get imgCompressModeQuality => 'Por qualidade';

  @override
  String get imgCompressModeTarget => 'Tamanho alvo';

  @override
  String get imgCompressQuality => 'Qualidade';

  @override
  String get imgCompressSmallest => 'Menor arquivo';

  @override
  String get imgCompressBestQuality => 'Melhor qualidade';

  @override
  String get imgCompressQualityNote =>
      'Fotos grandes também são reduzidas para cerca de 1920×1080.';

  @override
  String imgCompressTargetUnder(String size) {
    return 'Menos de $size';
  }

  @override
  String get imgCompressTargetHint =>
      'Mantém a melhor qualidade dentro do limite — ideal para formulários de emprego e órgãos públicos.';

  @override
  String get imgCompressButton => 'Comprimir foto';

  @override
  String get imgCompressCompressing => 'Comprimindo…';

  @override
  String get imgCompressSuccess => 'Comprimida com sucesso!';

  @override
  String imgCompressFitsTarget(String size) {
    return 'Pronto — menos de $size';
  }

  @override
  String imgCompressMissedTarget(String size) {
    return 'Não foi possível ficar abaixo de $size. Esta é a menor versão que conseguimos gerar.';
  }

  @override
  String get imgCompressStatOriginal => 'Original';

  @override
  String get imgCompressStatCompressed => 'Comprimida';

  @override
  String get imgCompressStatSaved => 'Economia';

  @override
  String get imgCompressFailed =>
      'Não foi possível comprimir esta foto. Tente outra.';

  @override
  String get imgResizePresetPassport => 'Passaporte 35×45 mm';

  @override
  String imgResizePresetSquare(String size) {
    return 'Quadrado $size';
  }

  @override
  String imgResizePresetStory(String size) {
    return 'Story $size';
  }

  @override
  String imgResizePresetMax(String name, String px) {
    return '$name (máx. $px)';
  }

  @override
  String get imgResizeChoosePhotos => 'Escolher fotos';

  @override
  String imgResizeSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos selecionadas',
      one: '1 foto selecionada',
    );
    return '$_temp0';
  }

  @override
  String get imgResizePickHint =>
      'Escolha uma ou várias — ou compartilhe com o app';

  @override
  String get imgResizeChoose => 'Escolher';

  @override
  String get imgResizeChange => 'Trocar';

  @override
  String get imgResizePresets => 'Predefinições';

  @override
  String get imgResizeModePercent => 'Porcentagem';

  @override
  String get imgResizeModeMaxSide => 'Lado máx.';

  @override
  String get imgResizeModeExact => 'Exato';

  @override
  String get imgResizeWidth => 'Largura (px)';

  @override
  String get imgResizeHeight => 'Altura (px)';

  @override
  String get imgResizeCrop => 'Cortar para caber (sem esticar)';

  @override
  String get imgResizeFormat => 'Formato';

  @override
  String get imgResizeQuality => 'Qualidade';

  @override
  String get imgResizeButton => 'Redimensionar';

  @override
  String imgResizeSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Salvar $count fotos na galeria',
      one: 'Salvar 1 foto na galeria',
    );
    return '$_temp0';
  }

  @override
  String get imgResizeChangeSettings => 'Alterar configurações';

  @override
  String imgResizeInvalidSize(int min, int max) {
    return 'Digite uma largura e uma altura entre $min e $max.';
  }

  @override
  String imgResizeFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Não foi possível ler $count fotos.',
      one: 'Não foi possível ler 1 foto.',
    );
    return '$_temp0';
  }

  @override
  String imgResizeSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos salvas na galeria',
      one: '1 foto salva na galeria',
    );
    return '$_temp0';
  }

  @override
  String get imgEnhanceEmptyTitle => 'Edite suas fotos';

  @override
  String get imgEnhanceEmptyBody =>
      'Ajuste brilho, contraste, saturação e nitidez, aplique filtros, gire e espelhe — tudo no seu aparelho.';

  @override
  String get imgEnhanceFineControls => 'Ajustes finos';

  @override
  String get imgEnhanceApplying => 'Aplicando…';

  @override
  String get imgEnhanceChange => 'Trocar';

  @override
  String get imgEnhancePresets => 'Filtros';

  @override
  String get imgEnhanceTransform => 'Transformar';

  @override
  String get imgEnhanceAdjustments => 'Ajustes';

  @override
  String get imgEnhanceRotate => 'Girar';

  @override
  String get imgEnhanceFlipH => 'Espelhar horizontal';

  @override
  String get imgEnhanceFlipV => 'Espelhar vertical';

  @override
  String get imgEnhanceBrightness => 'Brilho';

  @override
  String get imgEnhanceContrast => 'Contraste';

  @override
  String get imgEnhanceSaturation => 'Saturação';

  @override
  String get imgEnhanceSharpen => 'Nitidez';

  @override
  String get imgEnhanceBlur => 'Desfoque';

  @override
  String get imgEnhanceQuality => 'Qualidade';

  @override
  String get imgEnhanceApply => 'Aplicar';

  @override
  String get imgEnhanceFailed =>
      'Não foi possível aplicar as edições. Tente outra foto.';

  @override
  String imgEnhanceResult(String before, String after, String change) {
    return 'Pronto! $before → $after ($change)';
  }

  @override
  String get imgEnhancePresetOriginal => 'Original';

  @override
  String get imgEnhancePresetVivid => 'Vívido';

  @override
  String get imgEnhancePresetCool => 'Frio';

  @override
  String get imgEnhancePresetWarm => 'Quente';

  @override
  String get imgEnhancePresetDramatic => 'Dramático';

  @override
  String get imgEnhancePresetFade => 'Desbotado';

  @override
  String get imgEnhancePresetVintage => 'Vintage';

  @override
  String get imgEnhancePresetNoir => 'Noir';

  @override
  String get upscalerNewImage => 'Nova foto';

  @override
  String get upscalerIntro =>
      'Amplie fotos em até 4× com IA no aparelho. Funciona offline após baixar o modelo uma única vez — modo nuvem opcional para rostos.';

  @override
  String get upscalerBadgeOnDevice => 'IA no aparelho';

  @override
  String get upscalerBadgeOffline => 'Funciona offline';

  @override
  String get upscalerBadgeUpTo4x => 'Até 4× maior';

  @override
  String get upscalerBadgeGpu => 'Acelerado por GPU';

  @override
  String get upscalerBestResults =>
      'Melhores resultados: fotos de baixa resolução, digitalizações antigas, miniaturas e JPEGs comprimidos.';

  @override
  String get upscalerChangeImage => 'Trocar foto';

  @override
  String get upscalerTabOriginal => 'Original';

  @override
  String get upscalerTabUpscaled => 'Ampliada por IA';

  @override
  String get upscalerStageStarting => 'Iniciando…';

  @override
  String get upscalerStageConnecting => 'Conectando ao servidor de IA…';

  @override
  String get upscalerStageOnDevice => 'Processando neste aparelho…';

  @override
  String get upscalerStageCloudUnavailable =>
      'Nuvem indisponível — processando neste aparelho…';

  @override
  String get upscalerStageUploading => 'Enviando foto…';

  @override
  String get upscalerStageRestoringFaces =>
      'A IA está restaurando rostos e detalhes…';

  @override
  String get upscalerStagePreparing => 'Preparando foto…';

  @override
  String get upscalerStageLoadingModel => 'Carregando modelo de IA…';

  @override
  String get upscalerStageDownloadingModel =>
      'Baixando modelo de IA (uma única vez)…';

  @override
  String get upscalerStageFallback => 'Usando ampliação padrão…';

  @override
  String get upscalerStageDecoding => 'Lendo foto…';

  @override
  String upscalerStageResizing(String from, String to) {
    return 'Redimensionando entrada ($from → $to)…';
  }

  @override
  String get upscalerStageDenoising => 'Reduzindo ruído…';

  @override
  String upscalerStageUpscaling(String factor) {
    return 'Ampliando ($factor×)…';
  }

  @override
  String upscalerStageAiTiles(String done, String total) {
    return 'Ampliando com IA… ($done/$total)';
  }

  @override
  String get upscalerStageSharpening => 'Aumentando nitidez…';

  @override
  String get upscalerStageColour => 'Ajustando cores…';

  @override
  String get upscalerStageSaving => 'Salvando…';

  @override
  String get upscalerStageDone => 'Pronto!';

  @override
  String get upscalerLoadingModelHint =>
      'Carregando o modelo de IA (só na primeira vez)';

  @override
  String get upscalerTime4x =>
      'A ampliação 4× pode levar de 15 a 60 s, dependendo do tamanho da foto.';

  @override
  String get upscalerTime2x => 'A ampliação 2× costuma levar de 5 a 20 s.';

  @override
  String upscalerDoneIn(String seconds) {
    return 'Ampliada em $seconds s';
  }

  @override
  String get upscalerStatResolution => 'Resolução';

  @override
  String get upscalerStatFileSize => 'Tamanho';

  @override
  String get upscalerStatScale => 'Escala';

  @override
  String get upscalerShareSubject => 'Foto ampliada por IA';

  @override
  String get upscalerFallbackModelUnavailable =>
      'O modelo de IA precisa de internet uma vez — usamos a ampliação padrão';

  @override
  String get upscalerFallbackModelFailed =>
      'O modelo de IA não pôde rodar neste aparelho — usamos a ampliação padrão';

  @override
  String get upscalerFallbackCloud =>
      'Servidor na nuvem indisponível — processado neste aparelho';

  @override
  String get upscalerSettings => 'Configurações de IA';

  @override
  String get upscalerFactorLabel => 'Fator de ampliação';

  @override
  String get upscalerFactor2xDesc => 'Rápido — ótimo para a maioria das fotos';

  @override
  String get upscalerFactor4xDesc => 'Melhor qualidade — mais lento';

  @override
  String get upscalerOptimiseFor => 'Otimizar para';

  @override
  String get upscalerModeAuto => 'Auto';

  @override
  String get upscalerModePhoto => 'Foto';

  @override
  String get upscalerModeIllustration => 'Ilustração';

  @override
  String get upscalerModeFace => 'Detalhes do rosto';

  @override
  String get upscalerDenoise => 'Reduzir ruído antes';

  @override
  String get upscalerDenoiseTip => 'Reduz o ruído de JPEG antes de ampliar';

  @override
  String get upscalerSharpen => 'Nitidez depois';

  @override
  String get upscalerSharpenTip => 'Deixa a imagem mais nítida após ampliar';

  @override
  String get upscalerCloudTitle => 'Melhoria de rostos na nuvem';

  @override
  String get upscalerCloudOn =>
      'Sua foto é enviada ao nosso servidor para processamento.';

  @override
  String get upscalerCloudOff => 'Desativado — as fotos ficam neste aparelho.';

  @override
  String get upscalerCloudDialogTitle => 'Enviar fotos para a nuvem?';

  @override
  String get upscalerCloudDialogBody =>
      'O modo nuvem envia a foto selecionada ao nosso servidor de ampliação por uma conexão criptografada, para processá-la com um modelo de IA maior (GFPGAN + Real-ESRGAN).\n\n• Somente a foto que você escolher ampliar é enviada.\n• A foto é processada na memória e não é guardada depois que o resultado é devolvido.\n• Nenhuma conta ou dado pessoal é enviado junto.\n\nVocê pode desativar isso a qualquer momento. O modo no aparelho funciona totalmente offline.';

  @override
  String get upscalerCloudKeepLocal => 'Manter no aparelho';

  @override
  String get upscalerCloudEnable => 'Ativar nuvem';

  @override
  String get upscalerUpscale => 'Ampliar com IA';

  @override
  String get upscalerUpscaleAgain =>
      'Ampliar de novo com as novas configurações';

  @override
  String get upscalerFailed => 'Falha ao ampliar';

  @override
  String get upscalerErrorTooLarge =>
      'A foto é grande demais. Tente uma foto menor ou a ampliação 2×.';

  @override
  String get upscalerErrorUnreadable =>
      'Não foi possível ler esta foto. Use um arquivo JPG ou PNG.';

  @override
  String get upscalerErrorNetwork =>
      'Tempo de rede esgotado. Verifique sua conexão ou desative o modo nuvem.';

  @override
  String get videoPickHint => 'Toque para escolher um vídeo';

  @override
  String videoProbeInfo(String format, String duration) {
    return 'Formato: $format · Duração: $duration';
  }

  @override
  String get videoOutputFormat => 'Formato de saída';

  @override
  String get videoFmtMostCompatible => 'Mais compatível';

  @override
  String get videoFmtApple => 'Apple / QuickTime';

  @override
  String get videoFmtFlexible => 'Contêiner flexível';

  @override
  String get videoFmtLegacy => 'Formato antigo';

  @override
  String get videoFmtGif => 'Animado (sem áudio)';

  @override
  String get videoFmtAudioOnly => 'Só áudio';

  @override
  String get videoFmtAudioAac => 'Só áudio (AAC)';

  @override
  String get videoFmtAudioRaw => 'Só áudio (bruto)';

  @override
  String get videoFmtWav => 'Áudio sem compressão';

  @override
  String videoConvertingPercent(int percent) {
    return 'Convertendo… $percent%';
  }

  @override
  String get videoConvertingWait => 'Convertendo… isso pode demorar um pouco';

  @override
  String get videoDone => 'Conversão concluída!';

  @override
  String get videoErrorUnsupported =>
      'Falha na conversão. Talvez este formato não seja compatível com seu aparelho.';

  @override
  String get videoConvertAnother => 'Converter outro';

  @override
  String get videoPickButton => 'Escolher arquivo de vídeo';

  @override
  String videoConvertTo(String format) {
    return 'Converter para $format';
  }

  @override
  String get docScanAndroidOnly =>
      'O scanner de documentos só está disponível no Android.';

  @override
  String docScanNeedsPlayServices(String details) {
    return 'Não foi possível iniciar o scanner. Ele precisa dos serviços do Google Play — verifique se estão atualizados. ($details)';
  }

  @override
  String get docScanStartFailed =>
      'Não foi possível iniciar o scanner. Tente novamente.';

  @override
  String get docScanPdfSaved =>
      'PDF salvo em Downloads — encontre-o em Meus arquivos';

  @override
  String docScanPagesSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas salvas na galeria',
      one: '1 página salva na galeria',
    );
    return '$_temp0';
  }

  @override
  String get docScanHeadline => 'Digitalize papel em um PDF nítido';

  @override
  String get docScanIntro =>
      'As bordas são detectadas automaticamente. Adicione quantas páginas quiser, recorte, gire e aplique filtros antes de salvar.';

  @override
  String get docScanScanning => 'Digitalizando…';

  @override
  String get docScanStart => 'Começar a digitalizar';

  @override
  String get docScanScannedPages => 'Páginas digitalizadas';

  @override
  String docScanPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '1 página',
    );
    return '$_temp0';
  }

  @override
  String get docScanSavePdf => 'Salvar PDF';

  @override
  String get docScanSharePdf => 'Compartilhar PDF';

  @override
  String get docScanCopyText => 'Copiar texto';

  @override
  String get docScanSaveJpg => 'Salvar como JPG';

  @override
  String get docScanAnother => 'Digitalizar outro documento';

  @override
  String get pdfToolsChoosePdf => 'Escolher um PDF';

  @override
  String get pdfToolsChooseHint =>
      'Ou compartilhe um PDF com o Utility Toolbox de qualquer app';

  @override
  String get pdfToolsReading => 'Lendo…';

  @override
  String get pdfToolsLockedShort => 'Protegido por senha';

  @override
  String pdfToolsPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '1 página',
    );
    return '$_temp0';
  }

  @override
  String get pdfToolsChange => 'Trocar';

  @override
  String get pdfToolsResultReady => 'Seu PDF está pronto';

  @override
  String get pdfToolsSaveDownloads => 'Salvar em Downloads';

  @override
  String get pdfToolsStartOver => 'Recomeçar';

  @override
  String get pdfToolsSavedToDownloads =>
      'Salvo em Downloads — encontre em Meus arquivos';

  @override
  String get pdfToolsSharedInstead =>
      'O menu de compartilhamento foi aberto no lugar';

  @override
  String get pdfToolsRangeEmpty => 'Digite pelo menos uma página.';

  @override
  String pdfToolsRangeInvalid(String part) {
    return '“$part” não é uma página nem um intervalo (ex.: 1-3, 5).';
  }

  @override
  String pdfToolsRangeOutside(String part, int count) {
    return '“$part” está fora de 1–$count.';
  }

  @override
  String get pdfToolsInvalidPdf => 'Este arquivo não parece ser um PDF válido.';

  @override
  String pdfToolsLockedUnlockFirst(String tool) {
    return 'Este PDF é protegido por senha. Desbloqueie-o primeiro com $tool.';
  }

  @override
  String pdfToolsPagesLabel(int count) {
    return 'Páginas (1–$count)';
  }

  @override
  String pdfToolsPagesHint(String example) {
    return 'ex.: $example';
  }

  @override
  String pdfToolsPageN(int number) {
    return 'Página $number';
  }

  @override
  String get pdfToolsDownload => 'Baixar';

  @override
  String get pdfToolsSavedNotification =>
      'Salvo em Downloads — abra pela notificação.';

  @override
  String get pdfToolsShareToSave =>
      'Menu de compartilhamento aberto — escolha onde salvar o arquivo.';

  @override
  String pdfToolsSelectedFile(String name) {
    return 'Selecionado: $name';
  }

  @override
  String pdfToolsSize(String size) {
    return 'Tamanho: $size';
  }

  @override
  String get pdfToolsDragToReorder => 'Arraste para reordenar';

  @override
  String get pdfHomeTitle => 'Ferramentas de PDF';

  @override
  String get pdfHomeSection => 'Ferramentas de PDF';

  @override
  String get pdfHomeSubtitle => 'Crie, combine e otimize seus documentos';

  @override
  String get pdfPasswordEnter => 'Digite uma senha.';

  @override
  String pdfPasswordTooShort(int count) {
    return 'Use pelo menos $count caracteres.';
  }

  @override
  String get pdfPasswordMismatch => 'As senhas não coincidem.';

  @override
  String get pdfPasswordWrong => 'Essa senha não está correta.';

  @override
  String get pdfPasswordLockFailed => 'Não foi possível bloquear este PDF.';

  @override
  String get pdfPasswordUnlockFailed =>
      'Não foi possível desbloquear este PDF.';

  @override
  String get pdfPasswordLockedDone => 'Seu PDF está bloqueado';

  @override
  String get pdfPasswordRemovedDone => 'Senha removida';

  @override
  String get pdfPasswordAlreadyLocked =>
      'Este PDF já tem senha. Desbloqueie-o primeiro.';

  @override
  String get pdfPasswordNotLocked =>
      'Este PDF não tem senha — não há nada para desbloquear.';

  @override
  String get pdfPasswordNew => 'Nova senha';

  @override
  String get pdfPasswordCurrent => 'Senha atual';

  @override
  String get pdfPasswordRepeat => 'Repita a senha';

  @override
  String get pdfPasswordShow => 'Mostrar senha';

  @override
  String get pdfPasswordHide => 'Ocultar senha';

  @override
  String get pdfPasswordWarning =>
      'Guarde bem esta senha — ela não pode ser recuperada. Criptografado com AES-256.';

  @override
  String get pdfSplitExtract => 'Extrair páginas';

  @override
  String get pdfSplitRemove => 'Remover páginas';

  @override
  String get pdfSplitPagesHelp =>
      'Use vírgulas e intervalos. “8-” significa da página 8 até o fim.';

  @override
  String get pdfSplitRemovesAll => 'Isso removeria todas as páginas.';

  @override
  String get pdfSplitFailed => 'Não foi possível dividir este PDF.';

  @override
  String get pdfToImagesFailed => 'Não foi possível converter este PDF.';

  @override
  String pdfToImagesSaved(int saved, int total) {
    return '$saved de $total imagens salvas na galeria';
  }

  @override
  String get pdfToImagesAllPages => 'Todas as páginas';

  @override
  String get pdfToImagesConvert => 'Converter para JPG';

  @override
  String pdfToImagesRendered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas convertidas…',
      one: '1 página convertida…',
    );
    return '$_temp0';
  }

  @override
  String pdfToImagesRenderedOf(int count, int total) {
    return '$count de $total páginas convertidas…';
  }

  @override
  String pdfToImagesSaveAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Salvar $count imagens na galeria',
      one: 'Salvar 1 imagem na galeria',
    );
    return '$_temp0';
  }

  @override
  String get pdfCompressButton => 'Comprimir';

  @override
  String get pdfCompressWorking => 'Comprimindo PDF…';

  @override
  String pdfCompressOriginalSize(String size) {
    return 'Tamanho original: $size';
  }

  @override
  String get pdfCompressIntro =>
      'Escolha um arquivo PDF. A compressão funciona melhor em documentos com muitas imagens.';

  @override
  String get pdfCompressLow => 'Baixa';

  @override
  String get pdfCompressMedium => 'Média';

  @override
  String get pdfCompressHigh => 'Alta';

  @override
  String get pdfCompressFailed => 'Não foi possível comprimir este PDF.';

  @override
  String pdfCompressBefore(String size) {
    return 'Antes: $size';
  }

  @override
  String pdfCompressAfter(String size) {
    return 'Depois: $size';
  }

  @override
  String get pdfMergeButton => 'Juntar';

  @override
  String get pdfMergeWorking => 'Juntando PDFs…';

  @override
  String get pdfMergePick => 'Escolher arquivos PDF';

  @override
  String get pdfMergeIntro =>
      'Selecione pelo menos dois arquivos PDF para juntar.';

  @override
  String get pdfMergeFailed =>
      'Não foi possível juntar os PDFs. Um dos arquivos pode estar ilegível.';

  @override
  String pdfMergeResult(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF combinado ($count páginas)',
      one: 'PDF combinado (1 página)',
    );
    return '$_temp0';
  }

  @override
  String get imageToPdfCreate => 'Criar PDF';

  @override
  String get imageToPdfWorking => 'Criando PDF…';

  @override
  String get imageToPdfPick => 'Escolher imagens';

  @override
  String get imageToPdfIntro => 'Selecione uma ou mais imagens para converter.';

  @override
  String get imageToPdfFailed =>
      'Não foi possível criar o PDF. Tente outras imagens.';

  @override
  String imageToPdfReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PDF pronto ($count páginas)',
      one: 'PDF pronto (1 página)',
    );
    return '$_temp0';
  }

  @override
  String get qrScanNoCodeInPhoto =>
      'Nenhum QR code ou código de barras encontrado nesta foto.';

  @override
  String get qrScanPhotoFailed => 'Não foi possível ler esta foto.';

  @override
  String qrScanResultTitle(String type) {
    return 'Lido ($type)';
  }

  @override
  String get qrScanFromPhoto => 'Ler de uma foto';

  @override
  String get qrScanCameraNeeded =>
      'É preciso acesso à câmera para ler QR codes e códigos de barras.';

  @override
  String get qrScanCameraError =>
      'Não foi possível iniciar a câmera. Feche outros apps de câmera e tente novamente.';

  @override
  String get qrScanTorchOn => 'Ligar a lanterna';

  @override
  String get qrScanTorchOff => 'Desligar a lanterna';

  @override
  String get qrScanTypeLink => 'Link';

  @override
  String get qrScanTypeWifi => 'Wi‑Fi';

  @override
  String get qrScanTypeContact => 'Contato';

  @override
  String get qrScanTypeText => 'Texto';

  @override
  String get qrGenInputLabel => 'Texto ou URL';

  @override
  String get qrGenInputHint => 'Digite o conteúdo a codificar';

  @override
  String get qrGenPreviewLabel => 'Prévia do QR code';

  @override
  String get qrGenEmpty => 'Digite um texto acima para ver seu QR code.';

  @override
  String get qrGenSaveGallery => 'Salvar na galeria';

  @override
  String get qrHomeTitle => 'QR e código de barras';

  @override
  String get qrHomeTabScan => 'Ler';

  @override
  String get qrHomeTabCreate => 'Criar';

  @override
  String get qrHomeScanTitle => 'Ler um código';

  @override
  String get qrHomeScanBody =>
      'Aponte a câmera para um QR code ou código de barras para ler na hora.';

  @override
  String get qrHomeBadgeInstant => 'Na hora';

  @override
  String get qrHomeBadgeHistory => 'Histórico salvo';

  @override
  String get qrHomeStartScan => 'Começar a ler';

  @override
  String get qrHomeCreateTitle => 'Criar um código';

  @override
  String get qrHomeCreateBody =>
      'Crie um QR code a partir de texto ou URL e depois salve ou compartilhe.';

  @override
  String get qrHomeBadgeShare => 'Compartilhe onde quiser';

  @override
  String get qrHomeBadgeImage => 'Salvar como imagem';

  @override
  String get qrHomeOpenGenerator => 'Abrir gerador';

  @override
  String get qrHistoryTitle => 'Histórico de leituras';

  @override
  String get qrHistoryMore => 'Mais opções';

  @override
  String get qrHistoryEmpty => 'Os códigos lidos aparecerão aqui.';

  @override
  String get wifiQrPlaceholder => 'Digite os dados do Wi‑Fi\npara gerar o QR';

  @override
  String get wifiQrPreviewLabel => 'QR code do Wi‑Fi';

  @override
  String get wifiQrNetworkDetails => 'Dados da rede';

  @override
  String get wifiQrSsidLabel => 'Nome da rede (SSID)';

  @override
  String get wifiQrSsidHint => 'Wi‑Fi de casa';

  @override
  String get wifiQrPasswordLabel => 'Senha';

  @override
  String get wifiQrPasswordHint => 'Digite a senha';

  @override
  String get wifiQrShowPassword => 'Mostrar senha';

  @override
  String get wifiQrHidePassword => 'Ocultar senha';

  @override
  String get wifiQrSecurity => 'Segurança';

  @override
  String get wifiQrSecurityNone => 'Nenhuma (aberta)';

  @override
  String get wifiQrHidden => 'Rede oculta';

  @override
  String get wifiQrHiddenHint => 'Ative se o nome da rede não for transmitido';

  @override
  String get wifiQrSaveImage => 'Salvar imagem';

  @override
  String get wifiQrInfo =>
      'Quem ler este QR code vai se conectar automaticamente ao seu Wi‑Fi.';

  @override
  String get wifiQrShareText =>
      'Leia este QR code para se conectar ao meu Wi‑Fi!';

  @override
  String get ocrCameraDenied =>
      'Permissão da câmera negada. Abra as Configurações para permitir.';

  @override
  String get ocrCameraRequired =>
      'É preciso permissão da câmera para tirar uma foto.';

  @override
  String get ocrTimeout =>
      'A leitura demorou demais — o modelo de texto ainda pode estar sendo baixado. Conecte-se ao Wi‑Fi uma vez ou tente novamente.';

  @override
  String get ocrFailed =>
      'Não foi possível ler o texto desta imagem. Tente uma foto mais nítida.';

  @override
  String get ocrPreparing => 'Preparando imagem…';

  @override
  String get ocrScanning => 'Lendo texto…';

  @override
  String get ocrScriptLabel => 'Sistema de escrita';

  @override
  String get ocrScriptHint =>
      'Escolha o alfabeto do seu texto. Árabe, urdu e bengali ainda não podem ser lidos.';

  @override
  String get ocrScriptLatin => 'Latino (português, inglês…)';

  @override
  String get ocrScriptDevanagari => 'Devanágari (hindi, marati…)';

  @override
  String get ocrScriptChinese => 'Chinês';

  @override
  String get ocrScriptJapanese => 'Japonês';

  @override
  String get ocrScriptKorean => 'Coreano';

  @override
  String get ocrIdleTitle => 'Extraia texto de qualquer imagem';

  @override
  String get ocrIdleBody =>
      'Aponte a câmera ou escolha uma foto — o texto é extraído na hora, no próprio aparelho.';

  @override
  String get ocrBadgeOnDevice => 'IA no aparelho';

  @override
  String get ocrBadgeLocal => 'Processado localmente';

  @override
  String get ocrBadgeBlocks => 'Cópia por bloco';

  @override
  String get ocrUseCamera => 'Usar câmera';

  @override
  String get ocrChooseGallery => 'Escolher da galeria';

  @override
  String get ocrOnDeviceNote => 'No aparelho · sem upload';

  @override
  String get ocrTabImage => 'Imagem';

  @override
  String get ocrTabText => 'Texto';

  @override
  String get ocrTapBlockHint => 'Toque em um bloco destacado para copiá-lo';

  @override
  String get ocrBlockTitle => 'Texto do bloco';

  @override
  String ocrBlockLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count linhas · toque para copiar',
      one: '1 linha · toque para copiar',
    );
    return '$_temp0';
  }

  @override
  String get ocrCopyBlock => 'Copiar bloco';

  @override
  String get ocrBlockCopied => 'Bloco copiado';

  @override
  String get ocrCopyEntireBlock => 'Copiar o bloco inteiro';

  @override
  String get ocrCopyLine => 'Copiar linha';

  @override
  String get ocrNoText =>
      'Nenhum texto detectado — tente uma foto mais nítida.';

  @override
  String get ocrQuickCopy => 'Cópia rápida por seção';

  @override
  String ocrBlockNCopied(int number) {
    return 'Bloco $number copiado';
  }

  @override
  String get ocrDoneEditing => 'Concluir edição';

  @override
  String get ocrEditText => 'Editar texto';

  @override
  String get ocrAllCopied => 'Todo o texto copiado';

  @override
  String get ocrCopyAll => 'Copiar tudo';

  @override
  String get ocrScanAgain => 'Ler';

  @override
  String ocrStatLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count linhas',
      one: '1 linha',
    );
    return '$_temp0';
  }

  @override
  String ocrStatWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras',
      one: '1 palavra',
    );
    return '$_temp0';
  }

  @override
  String ocrStatChars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count caracteres',
      one: '1 caractere',
    );
    return '$_temp0';
  }

  @override
  String get wordPdfNoText =>
      'Nenhum texto extraível encontrado neste documento.';

  @override
  String get wordPdfInfo =>
      'Converte arquivos .docx em PDF. O texto é mantido; layouts complexos (tabelas, imagens) podem variar.';

  @override
  String get wordPdfOpeningPicker => 'Abrindo o seletor de arquivos…';

  @override
  String wordPdfConverting(int percent) {
    return 'Convertendo… $percent%';
  }

  @override
  String get wordPdfDone => 'Conversão concluída';

  @override
  String get wordPdfTapToPick => 'Toque para escolher um arquivo .docx';

  @override
  String get wordPdfSupports => 'Compatível com o formato .docx';

  @override
  String get wordPdfFailed =>
      'A conversão falhou. O arquivo pode estar danificado ou não ser um .docx.';

  @override
  String get wordPdfFontsOffline =>
      'Parte do texto (ex.: árabe, urdu, hindi, bengali ou cirílico) está faltando neste PDF. A fonte é baixada só uma vez — conecte-se à internet e converta de novo.';

  @override
  String get wordPdfConvertAnother => 'Converter outro';

  @override
  String get wordPdfPick => 'Escolher arquivo .docx';

  @override
  String get wordPdfStep1Title => 'Escolha seu arquivo do Word';

  @override
  String get wordPdfStep1Desc =>
      'Selecione um arquivo .docx do armazenamento do aparelho.';

  @override
  String get wordPdfStep2Title => 'Conversão automática';

  @override
  String get wordPdfStep2Desc =>
      'O texto é extraído e diagramado em páginas PDF A4.';

  @override
  String get wordPdfStep3Title => 'Compartilhe ou salve';

  @override
  String get wordPdfStep3Desc =>
      'Compartilhe o PDF com qualquer app, e-mail ou armazenamento em nuvem.';

  @override
  String get wordPdfReady => 'PDF pronto';
}
