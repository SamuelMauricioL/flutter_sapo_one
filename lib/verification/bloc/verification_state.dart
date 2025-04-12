part of 'verification_bloc.dart';

abstract class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object> get props => [];
}

class VerificationToStart extends VerificationState {}

class VerificationInitial extends VerificationState {}

class VerificationCodeSending extends VerificationState {}

class VerificationCodeSent extends VerificationState {
  const VerificationCodeSent(this.email);
  final String email;

  @override
  List<Object> get props => [email];
}

class VerificationInProgress extends VerificationState {}

class VerificationCodeError extends VerificationState {
  const VerificationCodeError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}

class VerificationSuccess extends VerificationState {
  const VerificationSuccess(this.verification);
  final VerificationEntity verification;

  @override
  List<Object> get props => [verification];
}

class VerificationFailure extends VerificationState {
  const VerificationFailure(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
