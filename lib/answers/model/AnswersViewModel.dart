import 'package:quiz_test/answers/repository/AnswersRepository.dart';
import 'package:quiz_test/models/Answer.dart';

class AnswersViewModel {
  List<Answer> generateAnswers(int level) {
    return AnswersRepository().generateAnswerList(level);
  }
}
