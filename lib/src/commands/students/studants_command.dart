import 'package:args/command_runner.dart';

import 'sub_commands/find_all_command.dart';

class StudantsCommand extends Command {
  @override
  String get description => 'Students Operation';

  @override
  String get name => 'students';

  StudantsCommand() {
    addSubcommand(FindAllCommand());
  }
}
