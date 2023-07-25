// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

class DeleteCommand extends Command {
  StudentRepository repository;

  @override
  String get description => 'Delete student by ID';

  @override
  String get name => 'delete';

  DeleteCommand(this.repository) {
    argParser.addOption('id', help: 'Student id', abbr: 'i');
  }

  Future<void> run() async {
    final id = int.tryParse(argResults?['id']);
    if (id == null) {
      print("Por favor informe o ID do aluno com o comando --id=1 ou -i 1");
      return;
    }
    print("AGUARDE...");
    final student = await repository.findById(id);
    print("Confirme a EXCLUSÃO do aluno ${student.name}? (S ou N)");
    final confirmDelete = stdin.readLineSync();
    if (confirmDelete?.toLowerCase() == "s") {
      await repository.deletebyId(id);
      print("-----------------");
      print("Aluno DELETADO com Sucesso");
      print("-----------------");
    } else {
      print("-----------------");
      print("Operação CANCELADA!!!");
      print("-----------------");
    }
  }
}
