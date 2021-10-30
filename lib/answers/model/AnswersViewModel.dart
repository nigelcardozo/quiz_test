import 'package:quiz_test/answers/repository/AnswersRepository.dart';
import 'package:quiz_test/model/Answer.dart';

class AnswersViewModel {
  List<Answer> generateAnswers(int level) {
    return AnswersRepository().generateAnswerList(level);
  }
}
