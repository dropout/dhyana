extension StringExtension on String {


  List<String> get splittedLetters {
    List<String> splittedLetters = [];
    for (var i = 0; i < length; ++i) {
      splittedLetters.add(this[i]);
    }
    return splittedLetters;
  }

}
