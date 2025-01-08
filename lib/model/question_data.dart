class QuestionData {
  final String question;
  final List<String> answerList;

  QuestionData(this.question, this.answerList);

  List<String> getSuffle() {
    final suffleList = List.of(answerList);
    suffleList.shuffle();
    return suffleList;
  }
}
