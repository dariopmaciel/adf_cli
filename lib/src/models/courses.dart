import 'dart:convert';

class Courses {

  final int id;
  final String name;
  final bool isStrudents;
  
  Courses({
    required this.id,
    required this.name,
    required this.isStrudents,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isStrudents': isStrudents,
    };
  }

  factory Courses.fromMap(Map<String, dynamic> map) {
    return Courses(
      id: map['id'] ?? 0,
      name: map['name'] ??'',
      isStrudents: map['isStrudents'] ?? false,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Courses.fromJson(String json) => Courses.fromMap(jsonDecode(json));
  }
