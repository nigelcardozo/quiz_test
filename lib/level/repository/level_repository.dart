import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quiz_test/models/level.dart';

class LevelRepository {
  Future<List<Level>> fetchLevels() async {
    final jsondata =
        await rootBundle.loadString('assets/data/levels/Levels.json');

    final body = jsonDecode(jsondata);
    final Iterable json = body["Items"];
    return json.map((level) => Level.fromJson(level)).toList();
  }
}
