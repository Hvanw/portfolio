import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Flutter', 'Dart', 'Kotlin', 'Compose', 'React Native', 'SwiftUI',
      'CI/CD', 'Fastlane', 'AWS', 'Docker', 'Clean Architecture', 'MVVM'
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Skills', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills.map((s) => Chip(label: Text(s))).toList(),
            )
          ],
        ),
      ),
    );
  }
}
