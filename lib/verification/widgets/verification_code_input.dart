import 'package:flutter/material.dart';
import 'package:so_ui/so_ui.dart';

class VerificationCodeInput extends StatelessWidget {
  const VerificationCodeInput({
    required this.codeController,
    this.onPressed,
    super.key,
  });

  final TextEditingController codeController;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SoTextField(
            controller: codeController,
            labelText: 'Introduce el código',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          SoButton(
            onPressed: onPressed,
            child: const Text('Verificar'),
          ),
        ],
      ),
    );
  }
}
