import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final Widget image;
  final double imageSize;

  const FeatureCard({
    Key? key,
    required this.title,
    required this.image,
    this.imageSize = 65.0, // Kích thước ảnh mặc định là 100.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(
            width: imageSize,
            height: imageSize,
            child: image,
          ),
          const SizedBox(height: 15.0),
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
