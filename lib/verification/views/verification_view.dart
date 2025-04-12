import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapo_one/di/injection_container.dart';
import 'package:flutter_sapo_one/verification/bloc/verification_bloc.dart';
import 'package:flutter_sapo_one/verification/widgets/verification_code_input.dart';
import 'package:flutter_sapo_one/verification/widgets/verification_email_input.dart';
import 'package:so_ui/so_ui.dart';
import 'package:so_verification_domain/so_verification_domain.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationBloc(
        sendVerificationCodeUseCase: Get.it<SendVerificationCodeUseCase>(),
        verifyEmailUseCase: Get.it<VerifyEmailUseCase>(),
      ),
      child: VerificationBody(),
    );
  }
}

class VerificationBody extends StatelessWidget {
  VerificationBody({super.key});

  final _emailController = TextEditingController();
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificación de Email'),
      ),
      body: BlocConsumer<VerificationBloc, VerificationState>(
        listener: (context, state) {
          if (state is VerificationCodeError || state is VerificationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text((state as VerificationFailure).error)),
            );
          }

          if (state is VerificationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Email verificado con éxito: ${state.user.email}'),
              ),
            );
          }
        },
        builder: (context, state) {
          return switch (state) {
            VerificationInitial() => Center(
                child: VerificationEmailInput(
                  emailController: _emailController,
                  onPressed: () {
                    context
                        .read<VerificationBloc>()
                        .add(SendVerificationCodeEvent(_emailController.text));
                  },
                ),
              ),
            VerificationCodeSending() => const Center(
                child: SoLoadingIndicator(text: 'Enviando Código...'),
              ),
            VerificationInProgress() => const Center(
                child: SoLoadingIndicator(text: 'Verificando...'),
              ),
            VerificationCodeSent(:final String verificationId) =>
              VerificationCodeInput(
                codeController: _codeController,
                onPressed: () {
                  context.read<VerificationBloc>().add(
                        VerifyEmailEvent(
                          verificationId,
                          _codeController.text,
                        ),
                      );
                },
              ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}
