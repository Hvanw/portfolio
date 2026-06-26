import 'package:flutter/material.dart';
import 'package:portfolio/data/technical_stack.dart';
import 'package:portfolio/presentation/portrait/technical_stack_widget.dart';

const skills = [
  TechnicalStack.flutter,
  TechnicalStack.dart,
  TechnicalStack.kotlin,
  TechnicalStack.compose,
  TechnicalStack.reactNative,
  TechnicalStack.swiftUI,
  TechnicalStack.ciCd,
  TechnicalStack.fastlane,
  TechnicalStack.aws,
  TechnicalStack.docker,
  TechnicalStack.cleanArchitecture,
  TechnicalStack.mvvm,
];

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Skills',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListTechnicalStacksWidget(skills),
          ],
        ),
      ),
    );
  }
}
