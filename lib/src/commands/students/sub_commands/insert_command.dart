import 'dart:io';
import 'package:adf_cli/src/models/address.dart';
import 'package:adf_cli/src/models/city.dart';
import 'package:adf_cli/src/models/phone.dart';
import 'package:adf_cli/src/models/student.dart';
import 'package:args/command_runner.dart';
// import '../../../models/address.dart';
// import '../../../models/city.dart';
// import '../../../models/phone.dart';
// import '../../../models/student.dart';
import '../../../repositories/product_repository.dart';
import '../../../repositories/student_repository.dart';

class InsertCommand extends Command {
  final StudentRepository studentRepository;
  //instanciado o 'productRepository = ProductRepository()' pois será inserido
  final productRepository = ProductRepository();

  @override
  String get description => 'Insert Student';

  @override
  String get name => 'insert';

  //adicionado argumentos para -h
  InsertCommand(this.studentRepository) {
    argParser.addOption('file', help: 'Path of the CSV File', abbr: 'f');
  }

  Future<void> run() async {
    print("AGUARDE");
    final filePath = argResults?['file'];
    //File (dart:io) + reitura de linhas Syncronas retornando uma lista de Strings
    final students = File(filePath).readAsLinesSync();
    print("-----------------------------");

    for (var student in students) {
      // print(student);
      // print("----------");
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
      studentRepository.insert(studentModel);
    }
    print("-----------------------------");
    print("Alunos adicionados com Sucesso!!!");
  }
}
