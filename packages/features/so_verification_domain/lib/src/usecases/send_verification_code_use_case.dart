import 'package:oxidized/oxidized.dart';
import 'package:so_utils/so_utils.dart';
import 'package:so_verification_domain/so_verification_domain.dart';

class SendVerificationCodeUseCase {
  SendVerificationCodeUseCase(this._verificationRepository);
  final VerificationRepository _verificationRepository;

  Future<Result<Unit, SoFailure>> call({
    required String email,
  }) async {
    return _verificationRepository.sendVerificationCode(email: email);
  }
}
