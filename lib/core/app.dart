import 'package:flutter/material.dart';
import 'package:portfolio/presentation/portrait/home_page.dart';

class PortfolioPortraitApp extends StatelessWidget {
  const PortfolioPortraitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const HomePage(),
    );
  }
}