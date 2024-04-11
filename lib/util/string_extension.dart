extension StringX on String {
  String get getFileName {
    final splitted = split('/');
    if (splitted.isNotEmpty) {
      return splitted.last;
    }
    return this;
  }

  String get getExtension {
    final splitted = split('.');
    if (splitted.isNotEmpty) {
      return splitted.last;
    }
    return this;
  }
}
