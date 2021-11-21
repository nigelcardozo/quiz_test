import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quiz_test/models/answer.dart';

class AnswerRepository {
  Future<List<Answer>> fetchAnswers(int level) async {
    String levelPath = getLevelPath(level);
    final jsondata = await rootBundle.loadString(levelPath);

    final body = jsonDecode(jsondata);
    final Iterable json = body["Items"];
    return json.map((answer) => Answer.fromJson(answer)).toList();
  }

  String getLevelPath(int level) {
    if (level == 1) {
      return 'assets/data/levels/Level1.json';
    }

    if (level == 2) {
      return 'assets/data/levels/Level2.json';
    }

    if (level == 3) {
      return 'assets/data/levels/Level3.json';
    }

    return '';
  }
}
