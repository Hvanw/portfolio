import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Contact', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _contactRow(Icons.email, 'vanhuy2710@gmail.com', () => _openEmail('vanhuy2710@gmail.com')),
            const SizedBox(height: 8),
            _contactRow(Icons.link, 'GitHub: Hvanw', () => _openUrl('https://github.com/Hvanw')),
          ],
        ),
      ),
    );
  }

  Widget _contactRow(IconData icon, String label, VoidCallback onTap) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Expanded(child: Text(label)),
        TextButton(onPressed: onTap, child: const Text('Open')),
      ],
    );
  }
}


// -----------------------------------------------------------------------------
// UTILITIES
// -----------------------------------------------------------------------------
Future<void> _openUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    debugPrint('Cannot open URL');
  }
}

Future<void> _openEmail(String to) async {
  final uri = Uri(scheme: 'mailto', path: to);
  launchUrl(uri);
}
