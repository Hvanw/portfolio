import 'package:flutter/material.dart';
import 'package:portfolio/presentation/portrait/timeline_item.dart';

class ExperienceTimeline extends StatelessWidget {
  const ExperienceTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Experience', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            TimelineItem(
              title: 'Mobile Development Team Lead — AEGONA',
              time: '2022 - 2025',
              description:
                  'Led a team of 8 mobile devs, built production apps, maintained CI/CD with Fastlane, improved architecture and code quality.',
            ),
          ],
        ),
      ),
    );
  }
}
