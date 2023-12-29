class DocumentModel {
  String userId;
  String text;
  String imagePath;

  DocumentModel({
    required this.userId,
    required this.text,
    required this.imagePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'text': text,
      'imagePath': imagePath,
    };
  }
}
