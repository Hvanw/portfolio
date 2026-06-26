import 'dart:io';

Future<void> createWebApp() async {
  stdout.writeln('Creating web app...');
  // run command "flutter create --platform=web ."
  await Process.run('flutter', ['create', '--platform', 'web', '.']);
}
