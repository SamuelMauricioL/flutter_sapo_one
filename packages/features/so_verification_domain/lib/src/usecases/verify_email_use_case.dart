import 'package:oxidized/oxidized.dart';
import 'package:so_utils/so_utils.dart';
import 'package:so_verification_domain/so_verification_domain.dart';

class VerifyEmailUseCase {
  VerifyEmailUseCase({required this.repository});
  final VerificationRepository repository;

  Future<Result<VerificationEntity, SoFailure>> call({
    required String email,
    required String verificationCode,
  }) async {
    return repository.verifyEmail(
      email: email,
      verificationCode: verificationCode,
    );
  }
}
