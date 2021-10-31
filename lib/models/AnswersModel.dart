import 'package:quiz_test/models/Answer.dart';

class AnswersModel {
  final Answer answer;

  AnswersModel({required this.answer});

  String get solution {
    return this.answer.solution;
  }

  String get imagePath {
    return this.answer.imagePath;
  }
}
