import 'package:flutter/material.dart';
import 'package:portfolio/presentation/portrait/project.dart';
import 'package:portfolio/presentation/portrait/project_detail_page.dart';

class ProjectTile extends StatelessWidget {
  final Project project;
  const ProjectTile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ProjectDetailPage(project: project)),
      ),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Hero(
                tag: project.title,
                child: Icon(project.icon, size: 40, color: Colors.indigo),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(project.short, style: TextStyle(color: Colors.grey.shade700)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
