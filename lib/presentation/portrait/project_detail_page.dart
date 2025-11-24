import 'package:flutter/material.dart';
import 'package:portfolio/presentation/portrait/project.dart';

class ProjectDetailPage extends StatelessWidget {
  final Project project;
  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: project.title,
              child: Icon(project.icon, size: 80, color: Colors.indigo),
            ),
            const SizedBox(height: 20),
            Text(project.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text(project.description),
          ],
        ),
      ),
    );
  }
}
