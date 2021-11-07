import 'dart:convert';

String encodeSingleJsonLevelData() {
  return _encodeJsonLevelData(1, "Level One");
}

String _encodeJsonLevelData(int id, String name) {
  var body = {};
  body["id"] = id;
  body["name"] = name;
  var item = {};
  item["item"] = body;

  return json.encode(item);
}
