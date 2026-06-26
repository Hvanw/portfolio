import 'package:flutter/material.dart';
import 'package:portfolio/generated/assets.gen.dart';
import 'package:portfolio/data/project.dart';
import 'package:portfolio/presentation/portrait/technical_stack_widget.dart';
import 'package:portfolio/presentation/portrait/project_detail_page.dart';

class ProjectTile extends StatelessWidget {
  final Project project;
  const ProjectTile({super.key, required this.project});

  Widget _buildImage(BuildContext context) {
    final imageUrl = project.imageUrl ?? '';
    final isImageValid = imageUrl.isNotEmpty;
    return SizedBox(
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(4),
        child: Image(
          image: isImageValid
              ? NetworkImage(imageUrl)
              : Assets.images.placeholder.provider(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(project.short, style: TextStyle(color: Colors.grey.shade700)),
            Spacer(),
            ListTechnicalStacksWidget(project.technicalStacks),
          ],
        ),
      ),
    );
  }

  Widget card(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_buildImage(context), _buildDetails(context)],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ProjectDetailPage(project: project)),
      ),
      child: card(context),
    );
  }
}
