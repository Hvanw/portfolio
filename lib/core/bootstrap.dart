import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/app.dart';
import 'package:portfolio/core/config/app_config.dart';
import 'package:portfolio/presentation/landscape/view.dart';

// Pre-processing
// Load translations
// Call runApp(WidgetApp())
// No other Widget should be call or/and created in this file

Future<void> bootstrap(AppConfig config) async {
  if(kIsWeb) {
    return runApp(PortfolioLandscapeApp());
  }
  return runApp(PortfolioPortraitApp());
}