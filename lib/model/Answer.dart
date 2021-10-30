//import 'package:json_annotation/json_annotation.dart';
//part 'album.g.dart';

//@JsonSerializable(explicitToJson: true)
class Answer {
  String answer;
  String imagePath;

  //@JsonKey(name: 'title')
  //String name;

  //Album({this.userId, this.id, this.name});
  Answer({required this.answer, required this.imagePath});

  // factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  // Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
