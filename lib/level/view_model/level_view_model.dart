import 'package:quiz_test/level/repository/answers_repository.dart';
import 'package:quiz_test/models/answers.dart';

class LevelViewModel {
  late AnswerRepository answerRepository;
  int level = 1;
  List<Answers> answers = <Answers>[];

  void setRepository(AnswerRepository answerRepository) {
    this.answerRepository = answerRepository;
  }

  void setLevel(int level) {
    this.level = level;
  }

  Future<List<Answers>> fetchAnswers() async {
    final results = await answerRepository.fetchAnswers(level);
    return results.map((item) => Answers(answer: item)).toList();
  }
}
