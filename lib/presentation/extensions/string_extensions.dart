extension StringExt on String? {
  /// Add a separator between each widget
  String? toFirstLetterCapitalized() {
    if (this == null) {
      return null;
    }

    return this!.substring(0, 1).toUpperCase() + this!.substring(1);
  }
}
