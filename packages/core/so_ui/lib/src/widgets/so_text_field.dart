import 'package:flutter/material.dart';

class SoTextField extends StatelessWidget {
  const SoTextField({
    required this.controller,
    required this.labelText,
    super.key,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
    );
  }
}
