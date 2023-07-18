import 'package:args/command_runner.dart';
import 'dart:io';
import '../../../repositories/student_repository.dart';

class FindAllCommand extends Command {
  //criado 'StudentsRepository' para poder receber as variaveis dentro do construtor
  final StudentRepository repository;

  @override
  String get description => 'Find All Students';

  @override
  String get name => 'findAll';

//construtor
  FindAllCommand(this.repository);

  //necessário adicionar @override e void
  @override
  Future<void> run() async {
    print("Aguarde - Buscando alunos...");
    final students = await repository.findAll();
    print("Apresentar também os cursos? - (S ou N)");
    // Resposta da pergunta feita através de interação humana 'stdin.readLineSync()'
    final showCourses = stdin.readLineSync();
    // print(showCourses);
    print('-------------------------------------');
    print("Os alunos são: ");
    for (var student in students) {
      if (showCourses?.toUpperCase() == "S") {
        print('${student.id} - ${student.name} ${student.nameCourses}');
        //OU
        // print('${student.id} - ${student.name} ${student.courses.where((course) => course.isStudent).map((e) => e.name).toList()}');
      } else {
        print('${student.id} - ${student.name}');
      }
    }
  }
}
