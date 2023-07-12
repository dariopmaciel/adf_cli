
import 'dart:convert';

class City {
  int id;
  String name;
  City({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String json) => City.fromMap(jsonDecode(json));
}
