import 'package:portfolio/data/technical_stack.dart';

class Project {
  final String name; // project name
  final List<TechnicalStack> technicalStacks;
  final String short;
  final String description;
  final String? imageUrl;

  Project({
    required this.name,
    this.technicalStacks = const [],
    required this.short,
    required this.description,
    this.imageUrl,
  });
}

final demoProjects = [
  Project(
    name: 'FixME',
    technicalStacks: [TechnicalStack.flutter, TechnicalStack.golang],
    short: 'Booking service app with VNPay/MoMo + Maps',
    description:
        'A service-booking app with Google Maps, VNPay, MoMo, CI/CD via Fastlane (iOS/Android).',
  ),
  Project(
    name: 'Pre:MIND',
    technicalStacks: [TechnicalStack.flutter, TechnicalStack.django],
    short: 'Restaurant booking with custom iBeacon logic',
    description:
        'Deep iBeacon customization on iOS/Android with native channel integration.',
  ),
  Project(
    name: 'Simap',
    technicalStacks: [TechnicalStack.kotlin, TechnicalStack.compose],
    short: 'Device management with barcode & NFC',
    description:
        'Native app using Jetpack Compose, NFC, barcode scanning, and MVVM architecture.',
  ),
];
