enum AttachmentType {
  image,
  video,
  audio,
  none,
}

extension AttachmentTypeString on String {
  AttachmentType get toAttachmentType {
    switch (this) {
      case "image":
        return AttachmentType.image;
      case "video":
        return AttachmentType.video;
      case "audio":
        return AttachmentType.audio;
      default:
        return AttachmentType.none;
    }
  }
}
