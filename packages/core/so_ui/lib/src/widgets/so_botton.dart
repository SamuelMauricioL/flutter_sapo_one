import 'package:flutter/material.dart';

class SoButton extends StatelessWidget {
  const SoButton({
    required this.child,
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
