import 'package:equatable/equatable.dart';

class VerificationEntity extends Equatable {
  const VerificationEntity({
    required this.email,
    required this.isVerified,
  });
  final String email;
  final bool isVerified;

  @override
  List<Object?> get props => [email, isVerified];
}
