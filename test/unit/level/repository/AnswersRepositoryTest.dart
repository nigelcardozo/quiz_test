import 'package:quiz_test/level/repository/AnswersRepository.dart';
import 'package:test/test.dart';

void main() {
  test('Test getLevelPath returns correct paths', () {
    String response = AnswerRepository().getLevelPath(1);
    expect(response, 'assets/data/levels/Level1.json');

    response = AnswerRepository().getLevelPath(2);
    expect(response, 'assets/data/levels/Level2.json');

    response = AnswerRepository().getLevelPath(3);
    expect(response, 'assets/data/levels/Level3.json');

    response = AnswerRepository().getLevelPath(0);
    expect(response, '');

    response = AnswerRepository().getLevelPath(4);
    expect(response, '');
  });
}
