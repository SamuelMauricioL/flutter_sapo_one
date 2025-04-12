import 'package:oxidized/oxidized.dart';
import 'package:so_utils/so_utils.dart';
import 'package:so_verification_domain/so_verification_domain.dart';

class SendVerificationCodeUseCase {
  SendVerificationCodeUseCase({required this.repository});
  final VerificationRepository repository;

  Future<Result<Unit, SoFailure>> call({
    required String email,
  }) async {
    return repository.sendVerificationCode(email: email);
  }
}
