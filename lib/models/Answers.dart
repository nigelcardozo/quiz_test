import 'package:quiz_test/models/Answer.dart';

class Answers {
  final Answer answer;

  Answers({required this.answer});

  String get solution {
    return this.answer.solution;
  }

  String get imagePath {
    return this.answer.imagePath;
  }
}
