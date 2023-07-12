import 'package:args/command_runner.dart';

class FindAllCommand extends Command {
  @override
  String get description => 'Find All Students';

  @override
  String get name => 'findAll';

  @override
  void run(){
    print("Rodando o findAll");
  }
}
