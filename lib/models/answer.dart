class Answer {
  final String solution;
  final String imagePath;

  Answer({required this.solution, required this.imagePath});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(solution: json["solution"], imagePath: json["imagePath"]);
  }
}
