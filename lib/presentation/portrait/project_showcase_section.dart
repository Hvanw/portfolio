import 'package:flutter/material.dart';
import 'package:portfolio/presentation/portrait/project_tile.dart';

import 'project.dart';

class ProjectShowcaseSection extends StatelessWidget {
  const ProjectShowcaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Projects', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...demoProjects.map((p) => ProjectTile(project: p)),
          ],
        ),
      ),
    );
  }
}
