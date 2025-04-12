import 'package:flutter/material.dart';
import 'package:so_ui/so_ui.dart';

class VerificationEmailInput extends StatelessWidget {
  const VerificationEmailInput({
    required this.emailController,
    this.onPressed,
    super.key,
  });

  final TextEditingController emailController;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SoTextField(
            controller: emailController,
            labelText: 'Correo Electrónico',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          SoButton(
            onPressed: onPressed,
            child: const Text('Enviar Código de Verificación'),
          ),
        ],
      ),
    );
  }
}
