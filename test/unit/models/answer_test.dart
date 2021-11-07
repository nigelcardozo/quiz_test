import 'package:quiz_test/models/Answer.dart';
import 'package:test/test.dart';

void main() {
  test('Test that correct solultion and image path are returned', () {
    Answer answer =
        Answer(solution: "pluto", imagePath: "assets/images/levels/1/104.png");

    expect(answer.solution, "pluto");
    expect(answer.imagePath, "assets/images/levels/1/104.png");
  });
}
