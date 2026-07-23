import 'package:flutter/material.dart';

/// Shown in place of a project's image gallery until real screenshots are
/// uploaded (gallery is empty for every case-study project as of writing).
class GalleryPlaceholder extends StatelessWidget {
  const GalleryPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.image_outlined, color: colorScheme.onSurfaceVariant, size: 28),
          const SizedBox(height: 8),
          Text('Images coming soon', style: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 12.5)),
        ],
      ),
    );
  }
}
