import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

class FindByIdCommand extends Command {
  final StudentRepository studentRepository;

  @override
  String get description => 'Find Student By Id';

  @override
  String get name => 'byId';

  FindByIdCommand(this.studentRepository) {
    argParser.addOption('id', help: 'Student Id', abbr: 'i');
  }

  @override
  Future<void> run() async {
    // print(argResults?['id']);
    if (argResults?['id'] == null) {
      print("Por favor envie o ID do aluno com o comando --id=X ou -i 0");
      return;
    }

    final id = int.parse(argResults?['id']);

    print("Aguarde - Buscando dados...");
    final student = await studentRepository.findById(id);
    print('-------------------------------------');
    print("Aluno: ${student.name}");
    print('-------------------------------------');
    print("Nome: ${student.name}");
    print("Idade: ${student.age ?? 'Não informado'}");
    print("Cursos: ");
    student.nameCourses.forEach(print);
    print("Endereço: ${student.address.street}");
    print("ZipCode:  ${student.address.zipCode}");

    print('-------------------------------------');
  }
}
