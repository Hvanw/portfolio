import 'dart:io';

import '../creds/base_configs.dart';

Future<void> createAndroidApp() async {
  stdout.writeln('Creating Android app...');
  final String androidId = baseConfigs['android']?['id'] as String? ?? 'com.example';
  // run command "flutter create --platform=android --org=$androidId ."
  await Process.run('flutter', ['create', '--platform', 'android', '--org=$androidId', '.']);
}
