import 'dart:io';
import 'package:flutter_launcher_icons/main.dart' as flutter_launcher_icons;

void installAppIcon() {
  stdout.writeln('Installing app icon ...');

  flutter_launcher_icons.createIconsFromArguments([]);
}