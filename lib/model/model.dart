class QuizModel {
  int? id;
  String question;
  List<String> answers;
  int correctAnswerIndex;

  QuizModel({
    this.id,
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': question,
      'answers': answers.join('|'),
      'correctAnswerIndex': correctAnswerIndex,
    };
  }

  static QuizModel fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'],
      question: map['title'],
      answers: (map['answers'] as String).split('|'),
      correctAnswerIndex: map['correctAnswerIndex'],
      // dateTime: DateTime.now(),
    );
  }
}
