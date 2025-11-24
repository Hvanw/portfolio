import 'package:flutter/material.dart';

class TimelineItem extends StatelessWidget {
  final String title;
  final String time;
  final String description;

  const TimelineItem({super.key, required this.title, required this.time, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.circle, size: 12),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 4),
        Text(time, style: TextStyle(color: Colors.grey.shade600)),
        const SizedBox(height: 8),
        Text(description),
        const SizedBox(height: 20),
      ],
    );
  }
}
