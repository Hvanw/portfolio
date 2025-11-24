import 'package:flutter/material.dart';

class Project {
  final String title;
  final String short;
  final String description;
  final IconData icon;

  Project({required this.title, required this.short, required this.description, required this.icon});
}


// -----------------------------------------------------------------------------
// DEMO PROJECT LIST — bạn có thể thay bằng project thật
// -----------------------------------------------------------------------------
final demoProjects = [
  Project(
    title: 'FixME — Flutter + Golang',
    short: 'Booking service app with VNPay/MoMo + Maps',
    description: 'A service-booking app with Google Maps, VNPay, MoMo, CI/CD via Fastlane (iOS/Android).',
    icon: Icons.home_repair_service,
  ),
  Project(
    title: 'Pre:MIND — Flutter + Django',
    short: 'Restaurant booking with custom iBeacon logic',
    description: 'Deep iBeacon customization on iOS/Android with native channel integration.',
    icon: Icons.bluetooth,
  ),
  Project(
    title: 'Simap — Kotlin + Compose',
    short: 'Device management with barcode & NFC',
    description: 'Native app using Jetpack Compose, NFC, barcode scanning, and MVVM architecture.',
    icon: Icons.qr_code_scanner,
  ),
];

