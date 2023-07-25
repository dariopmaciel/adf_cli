import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/student.dart';

class StudentRepository {
  Future<List<Student>> findAll() async {
    final studantsResult =
        await http.get(Uri.parse('http://10.0.0.106:8080/students'));
    //validador de conectado
    if (studantsResult.statusCode != 200) {
      throw Exception();
    }
//ao adicionar 'as List' o auto-complete funciona melhor
    final studantsData = jsonDecode(studantsResult.body) as List; //<=

    return studantsData.map<Student>((student) {
      return Student.fromMap(student);
    }).toList();
  }

  Future<Student> findById(int id) async {
    final studentsResult =
        await http.get(Uri.parse('http://localhost:8080/students/$id'));

    if (studentsResult.statusCode != 200) {
      throw Exception();
    }
    if (studentsResult.body == '[]') {
      throw Exception();
    }

    // return studantsData.map<Studant>((studant) {
    //     return Studant.fromMap(studant);
    // }).toList();]

    return Student.fromJson(studentsResult.body);
  }

  Future<void> insert(Student student) async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/students'),
      body: student.toJson(),
      headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
    );
    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> upDate(Student student) async {
    final response = await http.put(
      Uri.parse('http://localhost:8080/students/${student.id}'),
      body: student.toJson(),
      headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
    );
    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> deletebyId(int id) async {
    final response = await http.delete(
      Uri.parse('http://localhost:8080/students/$id'),
    );
    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
