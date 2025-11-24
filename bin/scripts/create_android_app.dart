import 'dart:io';

import '../creds/base_configs.dart';

void createAndroidApp() {
  stdout.writeln('Creating Android app...');
  final String androidId = baseConfigs['android']?['id'] as String? ?? 'com.example';
  // run command "flutter create --platform=android --org=$androidId ."
  Process.run('flutter', ['create', '--platform', 'android', '--org=$androidId', '.']);
}
