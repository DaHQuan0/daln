import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Icon(icon, size: 48.0),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: const TextStyle(fontSize: 17.0),
          ),
        ],
      ),
    );
  }
}
