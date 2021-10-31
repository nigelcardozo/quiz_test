//import 'package:json_annotation/json_annotation.dart';
//part 'album.g.dart';

//@JsonSerializable(explicitToJson: true)
class Level {
  final int id;
  final String name;

  //@JsonKey(name: 'title')
  //String name;

  //Album({this.userId, this.id, this.name});
  Level({required this.id, required this.name});

  // factory Answer.fromJson(Map<String, dynamic> levels) => _$AnswerFromJson(levels);
  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(id: json["id"], name: json["name"]);
  }
}
