import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final IconData icon;

  const FeatureCard({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Icon(icon, size: 70.0),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
