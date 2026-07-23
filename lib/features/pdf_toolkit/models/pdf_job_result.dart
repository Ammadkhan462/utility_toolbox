class PdfJobResult {
  PdfJobResult({
    required this.filePath,
    required this.fileSizeBytes,
    required this.pageCount,
    required this.createdAt,
  });

  final String filePath;
  final int fileSizeBytes;
  final int pageCount;
  final DateTime createdAt;
}
