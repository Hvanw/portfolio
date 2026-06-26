import 'dart:io';

import 'create_android_app.dart';
import 'create_ios_app.dart';
import 'create_web_app.dart';

void scripts(List<String> arguments) {
  final header = 'Flutter command-line assistant.';
  final menu = '''
  1. Create Android App
  2. Create iOS App
  3. Create Web App
  0. Exit
''';

  stdout.writeln(header);
  stdout.write(menu);
  stdout.write('Select one option: ');
  final option = stdin.readLineSync();
  switch (option) {
    case '1':
      createAndroidApp();
      break;
    case '2':
      createIOSApp();
      break;
    case '3':
      createWebApp();
      break;
    case '0':
      stdout.write('Bye!');
      exit(0);
    default:
      stdout.write('Invalid option');
  }
}
