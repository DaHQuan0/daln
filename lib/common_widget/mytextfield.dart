import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hinText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hinText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.pink, width: 1.0),
          ),
          filled: true,
          hintText: hinText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}
