import 'dart:convert';

import 'address.dart';
import 'courses.dart';



class Student {
  final int id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Courses> courses;
  final Address adress;

  Student({
    required this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.adress,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      // 'age': age,
      'nameCourses': nameCourses,
      'courses': courses.map((x) => x.toMap()).toList(),
      'adress': adress.toMap(),
    };
    if (age != null) {
      map['age'] = age;
    }
    return map;
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      nameCourses: List<String>.from(map['nameCourses']),
      adress: Address.fromMap(map['nameCourses']),
      courses: map['courses']
              ?.map<Courses>((coursesMap) => Courses.fromMap(coursesMap))
              .toList() ??
          <Courses>[],
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(jsonDecode(source));
}
