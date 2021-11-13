import 'package:flutter/foundation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_test/level/repository/AnswersRepository.dart';
import 'package:quiz_test/level/view_model/LevelViewModel.dart';
import 'package:quiz_test/models/Answer.dart';
import 'package:test/test.dart';
import 'LevelViewModelTest.mocks.dart';

late LevelViewModel levelViewModel;

@GenerateMocks([AnswerRepository])
void main() {
  setUp(() {
    levelViewModel = new LevelViewModel();
  });

  List<Answer> _getAnswerTestData() {
    List<Answer> answersList = <Answer>[];

    Answer answer = Answer(
        solution: 'cruella', imagePath: 'assets/images/levels/2/201.png');
    answersList.add(answer);

    answer =
        Answer(solution: 'darth', imagePath: 'assets/images/levels/2/202.png');
    answersList.add(answer);

    answer =
        Answer(solution: 'stitch', imagePath: 'assets/images/levels/2/203.png');
    answersList.add(answer);

    answer =
        Answer(solution: 'olaf', imagePath: 'assets/images/levels/2/204.png');
    answersList.add(answer);

    answer =
        Answer(solution: 'anna', imagePath: 'assets/images/levels/2/205.png');
    answersList.add(answer);

    return answersList;
  }

  test('Test that LevelSelectionViewModel level is correctly set', () async {
    expect(levelViewModel.level, 1);

    levelViewModel.setLevel(2);

    expect(levelViewModel.level, 2);
  });

  test('Test that LevelSelectionViewModel level is correctly set', () async {
    var mockAnswerRepository = MockAnswerRepository();
    List<Answer> answersList = _getAnswerTestData();

    when(mockAnswerRepository.fetchAnswers(2))
        .thenAnswer((_) async => SynchronousFuture((answersList)));

    levelViewModel.setRepository(mockAnswerRepository);
    levelViewModel.setLevel(2);

    var result = await levelViewModel.fetchAnswers();

    expect(result.length, 5);

    expect(result[0].solution, 'cruella');
    expect(result[0].imagePath, 'assets/images/levels/2/201.png');

    expect(result[1].solution, 'darth');
    expect(result[1].imagePath, 'assets/images/levels/2/202.png');

    expect(result[2].solution, 'stitch');
    expect(result[2].imagePath, 'assets/images/levels/2/203.png');

    expect(result[3].solution, 'olaf');
    expect(result[3].imagePath, 'assets/images/levels/2/204.png');

    expect(result[4].solution, 'anna');
    expect(result[4].imagePath, 'assets/images/levels/2/205.png');
  });
}
