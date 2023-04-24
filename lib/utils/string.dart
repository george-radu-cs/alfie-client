extension StringTitleCaseExtension on String {
  String get toTitleCase {
    if (isEmpty) {
      return this;
    }

    return split(' ')
        .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');
  }
}
