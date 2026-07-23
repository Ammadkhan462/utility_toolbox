import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class OcrService {
  Future<String> recognizeText(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final recognizer =
        TextRecognizer(script: TextRecognitionScript.latin);

    try {
      final result = await recognizer.processImage(inputImage);
      final buffer = StringBuffer();
      for (final block in result.blocks) {
        buffer.writeln(block.text);
      }
      return buffer.toString().trim();
    } finally {
      await recognizer.close();
    }
  }
}
