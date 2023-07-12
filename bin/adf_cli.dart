// import 'package:args/args.dart';

import 'package:adf_cli/src/commands/students/studants_command.dart';
import 'package:args/command_runner.dart';

void main(List<String> arguments) {
  // final argParser = ArgParser();

  // argParser.addFlag("data", abbr: "d");
  // argParser.addOption("name", abbr: "n");
  // argParser.addOption("template", abbr: "t");

  // final argResult = argParser.parse(arguments);

  // print('${argResult['data']}');
  // print('${argResult['name']}');
  // print('${argResult['template']}');

  CommandRunner("ADF CLI", "Descrição do ADF CLI")
    ..addCommand(StudantsCommand())
    // ..addCommand(ExemploCommand())
    ..run(arguments);
}


// Teste PARA chamado por // ..addCommand(ExemploCommand())
// class ExemploCommand extends Command {
//   @override
//   String get description => "-> Exemplo de Comando";

//   @override
//   String get name => "exemplo";

//   ExemploCommand() {
//     argParser.addOption("template",
//         abbr: "t", help: "Envie template de criação do projeto.");
//   }

//   @override
//   void run() {
//     print(argResults?["template"]);
//     print("Executar qualquer coisa!!!");
//   }
// }
