import 'package:flutter/material.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/presentation/portrait/technical_stack_widget.dart';
import 'package:portfolio/presentation/widgets/bold_text.dart';
import 'package:portfolio/presentation/widgets/gallery_placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailPage extends StatelessWidget {
  final Project project;
  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final link = project.link;
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.nda)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Icon(Icons.lock_outline, size: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Text('Confidential / NDA', style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 13)),
                  ],
                ),
              ),
            Text(project.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TechChipList(project.techChips),
            const SizedBox(height: 16),
            BoldText(project.description, style: const TextStyle(height: 1.5)),
            if (link != null) ...[
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication),
                icon: const Icon(Icons.open_in_new),
                label: const Text('View project'),
              ),
            ],
            if (project.hasCaseStudy) ...[
              const SizedBox(height: 28),
              const GalleryPlaceholder(),
              const SizedBox(height: 24),
              if (project.role != null) _CaseStudySection(heading: 'Role', body: project.role!),
              if (project.problem != null) _CaseStudySection(heading: 'Problem', body: project.problem!),
              if (project.approach != null) _CaseStudySection(heading: 'Approach', body: project.approach!),
              if (project.result != null) _CaseStudySection(heading: 'Result', body: project.result!),
            ],
          ],
        ),
      ),
    );
  }
}

class _CaseStudySection extends StatelessWidget {
  const _CaseStudySection({required this.heading, required this.body});

  final String heading;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 6),
          BoldText(body, style: const TextStyle(height: 1.5)),
        ],
      ),
    );
  }
}
