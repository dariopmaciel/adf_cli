import 'dart:io';

import 'package:args/command_runner.dart';

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

  void run() {
    final filePath = argResults?['file'];
    //File (dart:io) + reitura de linhas Syncronas retornando uma lista de Strings
    print("AGRADE");
    final students = File(filePath).readAsLinesSync();
    print("-----------------------------");
    for (var student in students) {
      print(student);
    }
  }
}
