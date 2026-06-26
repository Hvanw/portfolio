import 'package:flutter/material.dart';
import 'package:portfolio/presentation/portrait/project_tile.dart';

import '../../data/project.dart';

class ProjectShowcaseSection extends StatelessWidget {
  const ProjectShowcaseSection({super.key});

  Widget listProjectsWidget(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: demoProjects.length,
        itemBuilder: (_, index) {
          final itemWidget = ProjectTile(project: demoProjects[index]);
          if (index == demoProjects.length - 1) {
            return Row(
              children: [
                itemWidget,
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Not implemented yet'),
                      ),
                    );
                  },
                  child: const Text('See all projects'),
                ),
              ],
            );
          }
          return itemWidget;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Projects',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            listProjectsWidget(context),
          ],
        ),
      ),
    );
  }
}
