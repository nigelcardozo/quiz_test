import 'package:flutter/material.dart';
import 'package:quiz_test/level/repository/AnswersRepository.dart';
import 'package:quiz_test/models/Answers.dart';
import 'package:quiz_test/utils/dependency_locator.dart';

import 'LevelHelper.dart';

class LevelViewModel {
  List<Answers> answers = <Answers>[];
  LevelHelper levelHelper = dependencyLocator<LevelHelper>();

  Future<void> fetchAnswers(int level) async {
    final results = await AnswerRepository().fetchAnswers(level);
    this.answers = results.map((item) => Answers(answer: item)).toList();
  }

  Future<List<Answers>> tempFetchAnswers() async {
    final results = await AnswerRepository().fetchAnswers(levelHelper.level);
    return results.map((item) => Answers(answer: item)).toList();
  }
}
