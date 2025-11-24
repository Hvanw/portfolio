import 'dart:io';

void createWebApp() {
  stdout.writeln('Creating web app...');
  // run command "flutter create --platform=web ."
  Process.run('flutter', ['create', '--platform', 'web', '.']);
}
