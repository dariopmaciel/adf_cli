import 'package:args/command_runner.dart';

import '../../repositories/student_repository.dart';
import 'sub_commands/find_all_command.dart';
import 'sub_commands/find_by_id_command.dart';

class StudantsCommand extends Command {
  @override
  String get description => 'Students Operation';

  @override
  String get name => 'students';

  StudantsCommand() {
    //criado uma instancia de 'StudentsRepository()' para poder repassar para este subComando
    //pq será repassado em TODOS os comandos
    final studantRepository = StudentRepository();
    addSubcommand(FindAllCommand(studantRepository));
    addSubcommand(FindByIdCommand(studantRepository));
  }
}
 