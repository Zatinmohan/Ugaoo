/// [FileExtensionType] is an enum that represents the file extension type.
enum FileExtensionType {
  /// This is the jpg extension type
  jpg,

  /// This is the jpeg extension type
  jpeg,

  /// This is the png extension type
  png,

  /// This is the pdf extension type
  pdf,

  /// This is the doc extension type
  doc,

  /// This is the docx extension type
  docx,

  /// This is the xls extension type
  xls,

  /// This is the xlsx extension type
  xlsx,

  /// This is the ppt extension type
  ppt,

  /// This is the pptx extension type
  pptx,

  /// This is the txt extension type
  txt,

  /// This is the csv extension type
  csv,

  /// This is the mp4 extension type
  mp4,

  /// This is the generic extension type
  generic;

  /// This is the function to get the file extension type from the string
  static FileExtensionType fromString(String value) {
    switch (value.startsWith('.') ? value.substring(1) : value) {
      case 'jpg':
        return FileExtensionType.jpg;
      case 'jpeg':
        return FileExtensionType.jpeg;
      case 'png':
        return FileExtensionType.png;
      case 'pdf':
        return FileExtensionType.pdf;
      case 'doc':
        return FileExtensionType.doc;
      case 'docx':
        return FileExtensionType.docx;
      case 'xls':
        return FileExtensionType.xls;
      case 'xlsx':
        return FileExtensionType.xlsx;
      case 'ppt':
        return FileExtensionType.ppt;
      case 'pptx':
        return FileExtensionType.pptx;
      case 'txt':
        return FileExtensionType.txt;
      case 'csv':
        return FileExtensionType.csv;
      case 'mp4':
        return FileExtensionType.mp4;
      default:
        return FileExtensionType.generic;
    }
  }
}
