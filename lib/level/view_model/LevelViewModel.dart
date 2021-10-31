import 'package:flutter/material.dart';
import 'package:quiz_test/level/repository/AnswersRepository.dart';
import 'package:quiz_test/models/AnswersModel.dart';

class LevelViewModel extends ChangeNotifier {
  List<AnswersModel> answers = <AnswersModel>[];

  Future<void> fetchAnswers(int level) async {
    final results = await AnswerRepository().fetchAnswers(level);
    this.answers = results.map((item) => AnswersModel(answer: item)).toList();
    notifyListeners();
  }
}
