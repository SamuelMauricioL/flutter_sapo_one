import 'package:flutter/material.dart';

class VerificationSuccessInfo extends StatelessWidget {
  const VerificationSuccessInfo({
    required this.email,
    this.onBackPressed,
    super.key,
  });

  final String email;
  final void Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 100,
            color: Colors.lightGreen,
          ),
          const SizedBox(height: 20),
          const Text(
            '¡Tu correo ha sido verificado!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            email,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: onBackPressed,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Volver'),
          ),
        ],
      ),
    );
  }
}
