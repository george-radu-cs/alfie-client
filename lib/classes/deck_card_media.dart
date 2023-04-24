class DeckCardMedia {
  final int id;
  String? questionAttachmentLocalURI;
  String? questionAttachmentCloudURI;
  String? answerAttachmentLocalURI;
  String? answerAttachmentCloudURI;

  DeckCardMedia({
    required this.id,
    this.questionAttachmentLocalURI,
    this.questionAttachmentCloudURI,
    this.answerAttachmentLocalURI,
    this.answerAttachmentCloudURI,
  });

  factory DeckCardMedia.fromMap(Map<String, dynamic> json) => DeckCardMedia(
        id: json['id'],
        questionAttachmentLocalURI: json['questionAttachmentLocalURI'],
        questionAttachmentCloudURI: json['questionAttachmentCloudURI'],
        answerAttachmentLocalURI: json['answerAttachmentLocalURI'],
        answerAttachmentCloudURI: json['answerAttachmentCloudURI'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'questionAttachmentLocalURI': questionAttachmentLocalURI,
        'questionAttachmentCloudURI': questionAttachmentCloudURI,
        'answerAttachmentLocalURI': answerAttachmentLocalURI,
        'answerAttachmentCloudURI': answerAttachmentCloudURI,
      };

  @override
  String toString() {
    return 'DeckCardMedia(id: $id, questionAttachmentLocalURI: $questionAttachmentLocalURI, questionAttachmentCloudURI: $questionAttachmentCloudURI, answerAttachmentLocalURI: $answerAttachmentLocalURI, answerAttachmentCloudURI: $answerAttachmentCloudURI)';
  }
}
