import 'dart:io';

import '../creds/base_configs.dart';

void createIOSApp() {
  stdout.writeln('Creating iOS app...');
  final String iosId = baseConfigs['ios']?['id'] as String? ?? 'com.example';
  // run command "flutter create --platform=ios --org=$iosId ."
  Process.run('flutter', ['create', '--platform', 'ios', '--org=$iosId', '.']);
}
