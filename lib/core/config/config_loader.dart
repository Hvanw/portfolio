import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/core/config/app_config.dart';
import 'package:portfolio/firebase_options.dart';

Future<AppConfig> getConfigs(List<String> args) async {
  FirebaseOptions? firebaseOptions;
  try {
    firebaseOptions = DefaultFirebaseOptions.currentPlatform;
  } catch (e) {
    log(e.toString());
  }
  return AppConfig(
    firebaseOptions: firebaseOptions,
  );
}