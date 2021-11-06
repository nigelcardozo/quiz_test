import 'package:flutter/material.dart';
import 'package:quiz_test/level/repository/AnswersRepository.dart';
import 'package:quiz_test/models/Answers.dart';

class LevelViewModel extends ChangeNotifier {
  List<Answers> answers = <Answers>[];

  Future<void> fetchAnswers(int level) async {
    final results = await AnswerRepository().fetchAnswers(level);
    this.answers = results.map((item) => Answers(answer: item)).toList();
    notifyListeners();
  }
}
