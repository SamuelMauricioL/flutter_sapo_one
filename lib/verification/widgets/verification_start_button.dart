import 'package:flutter/material.dart';
import 'package:so_ui/so_ui.dart';

class VerificationStartButton extends StatelessWidget {
  const VerificationStartButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SoButton(
            onPressed: onPressed,
            child: const Text('Comenzar'),
          ),
        ],
      ),
    );
  }
}
