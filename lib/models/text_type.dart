enum TextType {
  simple,
  tex,
  markdown,
  html,
}

extension TextTypeString on String {
  TextType get toTextType {
    switch (this) {
      case "simple":
        return TextType.simple;
      case "tex":
        return TextType.tex;
      case "markdown":
        return TextType.markdown;
      case "html":
        return TextType.html;
      default:
        return TextType.simple;
    }
  }
}
