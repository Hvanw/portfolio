import 'package:portfolio/core/bootstrap.dart';
import 'package:portfolio/core/config/config_loader.dart';

// Entry point
void main(List<String> args) async {
  // Load configs and environment varialbles
  final configs = await getConfigs(args);
  // Run bootstrap
  await bootstrap(configs);
}


