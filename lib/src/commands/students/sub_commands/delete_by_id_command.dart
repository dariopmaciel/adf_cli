// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

class DeleteByIdCommand extends Command {
  StudentRepository studentRepository;

  @override
  String get description => 'Delete by ID';

  @override
  String get name => 'delete';

  DeleteByIdCommand(this.studentRepository){
    argParser.addOption('file', help: 'Delete by Id', abbr: 'd');
  
  }

  void run(){
    print("Deletar FULANO?");
  }
}
