part of 'verification_bloc.dart';

abstract class VerificationEvent extends Equatable {
  const VerificationEvent();

  @override
  List<Object> get props => [];
}

class SendVerificationCodeEvent extends VerificationEvent {
  const SendVerificationCodeEvent(this.email);
  final String email;

  @override
  List<Object> get props => [email];
}

class VerifyEmailEvent extends VerificationEvent {
  const VerifyEmailEvent(this.email, this.verificationCode);
  final String email;
  final String verificationCode;

  @override
  List<Object> get props => [email, verificationCode];
}
