// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../models/address.dart';
import '../../../models/city.dart';
import '../../../models/phone.dart';
import '../../../models/student.dart';
import '../../../repositories/product_repository.dart';
import '../../../repositories/student_repository.dart';

class UpdateCommand extends Command {
  StudentRepository studentRepository;

  final productRepository = ProductRepository();

  @override
  String get description => 'Update Student';

  @override
  String get name => 'update';

  UpdateCommand(this.studentRepository) {
    argParser.addOption('file', help: 'Path of the CSV File', abbr: 'f');
    argParser.addOption('id', help: 'Student + ID', abbr: 'i');
  }

  Future<void> run() async {
    print("AGUARDE");
    final filePath = argResults?['file'];
    final id = argResults?['id'];
    if (id == null) {
      print("Por favor informe o ID do aluno com o comando --id=0 ou -i 0");
      return;
    }

    final students = File(filePath).readAsLinesSync();
    print("Aguarde, atualizando dados do aluno...");
    print("-----------------------------");

    if (students.length > 1) {
      print("Por favor informa somente 1 aluno do arquivo $filePath");
      return;
    } else if (students.isEmpty) {
      print("Por favor informa somente 1 aluno do arquivo $filePath");
      return;
    }

    var student = students.first;

    // for (var student in students) {
    final studentData = student.split(';');
    final courseCsv = studentData[2]
        .split(',')
        .map((e) => e.trim())
        .toList(); //o comando trim tira os espaços do começo e final
    // print(courseCsv);
    final courseFutures = courseCsv.map((c) async {
      final course = await productRepository.findByName(c);
      course.isStudent = true;
      return course;
    }).toList();

    final courses = await Future.wait(courseFutures);

    final studentModel = Student(
      id: int.parse(id),
      name: studentData[0],
      age: int.tryParse(studentData[1]),
      nameCourses: courseCsv,
      courses: courses,
      address: Address(
        street: studentData[3],
        number: int.parse(studentData[4]),
        zipCode: studentData[5],
        city: City(id: 1, name: studentData[6]),
        phone: Phone(ddd: int.parse(studentData[7]), phone: studentData[8]),
      ),
    );
    await studentRepository.upDate(studentModel);
    // }
    print("-----------------------------");
    print("Aluno atualizado com Sucesso!!!");
  }
}
