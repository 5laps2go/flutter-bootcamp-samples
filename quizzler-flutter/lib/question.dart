class Question {
  String text;
  bool answer;

  Question(this.text, this.answer);

  bool checkAnswer(bool submitted) {
    return (answer == submitted);
  }
}
