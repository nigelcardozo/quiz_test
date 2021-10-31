//import 'package:json_annotation/json_annotation.dart';
//part 'album.g.dart';

//@JsonSerializable(explicitToJson: true)
class Level {
  int id;
  String name;

  //@JsonKey(name: 'title')
  //String name;

  //Album({this.userId, this.id, this.name});
  Level({required this.id, required this.name});

  // factory Answer.fromJson(Map<String, dynamic> levels) => _$AnswerFromJson(levels);
  // Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
