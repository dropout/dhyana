/// Extension on String to provide additional functionality.
extension StringExtension on String {

  /// Splits the string into a list of its individual characters.
  /// Including white space characters.
  List<String> get splittedLetters {
    List<String> splittedLetters = [];
    for (var i = 0; i < length; ++i) {
      splittedLetters.add(this[i]);
    }
    return splittedLetters;
  }

}
