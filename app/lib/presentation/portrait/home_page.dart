import 'package:connectivity_banner/connectivity_banner.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/portrait/contact_section.dart';
import 'package:portfolio/presentation/portrait/experience_timeline.dart';
import 'package:portfolio/presentation/portrait/hero_section.dart';
import 'package:portfolio/presentation/portrait/project_showcase_section.dart';
import 'package:portfolio/presentation/portrait/skills_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Van — Mobile Developer Showcase'),
        centerTitle: true,
      ),
      body: ConnectivityBanner(
        onConnected: () {},
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
            HeroSection(),
            SizedBox(height: 20),
            SkillsSection(),
            SizedBox(height: 20),
            ExperienceTimeline(),
            SizedBox(height: 20),
            ProjectShowcaseSection(),
            SizedBox(height: 20),
            ContactSection(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
