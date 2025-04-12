import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_verification_domain/so_verification_domain.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  VerificationBloc({
    required SendVerificationCodeUseCase sendVerificationCodeUseCase,
    required VerifyEmailUseCase verifyEmailUseCase,
  })  : _sendVerificationCodeUseCase = sendVerificationCodeUseCase,
        _verifyEmailUseCase = verifyEmailUseCase,
        super(VerificationInitial()) {
    on<SendVerificationCodeEvent>(_onSendVerificationCodeEvent);
    on<VerifyEmailEvent>(_onVerifyEmailEvent);
  }

  final SendVerificationCodeUseCase _sendVerificationCodeUseCase;
  final VerifyEmailUseCase _verifyEmailUseCase;

  Future<void> _onSendVerificationCodeEvent(
    SendVerificationCodeEvent event,
    Emitter<VerificationState> emit,
  ) async {
    emit(VerificationCodeSending());
    final result = await _sendVerificationCodeUseCase(email: event.email);
    result.when(
      ok: (_) => emit(const VerificationCodeSent('123456789')),
      err: (failure) => emit(VerificationCodeError(failure.message)),
    );
  }

  Future<void> _onVerifyEmailEvent(
    VerifyEmailEvent event,
    Emitter<VerificationState> emit,
  ) async {
    emit(VerificationInProgress());
    final result = await _verifyEmailUseCase(
      verificationId: event.verificationId,
      smsCode: event.smsCode,
    );
    result.when(
      ok: (entity) => emit(VerificationSuccess(entity)),
      err: (failure) => emit(VerificationFailure(failure.message)),
    );
  }
}
