import 'package:oxidized/oxidized.dart';
import 'package:so_utils/so_utils.dart';
import 'package:so_verification_domain/src/entities/verification.dart';

abstract class VerificationRepository {
  Future<Result<Unit, SoFailure>> sendVerificationCode({
    required String email,
  });
  Future<Result<VerificationEntity, SoFailure>> verifyEmail({
    required String email,
    required String verificationCode,
  });
}
