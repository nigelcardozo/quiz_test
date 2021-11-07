import 'package:quiz_test/models/Answer.dart';
import 'package:quiz_test/models/Answers.dart';
import 'package:test/test.dart';

void main() {
  test('Test that correct solution and imagepath are returned', () {
    Answer answer =
        Answer(solution: "pluto", imagePath: "assets/images/levels/1/104.png");

    Answers answers = Answers(answer: answer);

    expect(answers.solution, "pluto");
    expect(answers.imagePath, "assets/images/levels/1/104.png");
  });
}
