import 'package:oxidized/oxidized.dart';
import 'package:so_utils/so_utils.dart';
import 'package:so_verification_domain/so_verification_domain.dart';

class VerifyEmailUseCase {
  VerifyEmailUseCase(this._verificationRepository);
  final VerificationRepository _verificationRepository;

  Future<Result<VerificationEntity, SoFailure>> call({
    required String verificationId,
    required String smsCode,
  }) async {
    return _verificationRepository.verifyEmail(
      verificationId: verificationId,
      smsCode: smsCode,
    );
  }
}
