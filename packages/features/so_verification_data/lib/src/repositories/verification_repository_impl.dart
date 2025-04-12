import 'package:oxidized/oxidized.dart';
import 'package:so_utils/so_utils.dart';
import 'package:so_verification_data/src/datasources/verification_remote_data_source.dart';
import 'package:so_verification_data/src/failures/verification_failures.dart';
import 'package:so_verification_data/src/mappers/verification_mapper.dart';
import 'package:so_verification_domain/so_verification_domain.dart';

class VerificationRepositoryImpl implements VerificationRepository {
  VerificationRepositoryImpl({required this.remoteDataSource});
  final VerificationRemoteDataSource remoteDataSource;

  @override
  Future<Result<Unit, SoFailure>> sendVerificationCode({
    required String email,
  }) async {
    try {
      await remoteDataSource.sendVerificationCode(email: email);
      return const Result.ok(unit);
    } catch (e) {
      return const Result.err(SendCodeFailure());
    }
  }

  @override
  Future<Result<VerificationEntity, SoFailure>> verifyEmail({
    required String email,
    required String verificationCode,
  }) async {
    try {
      final verificationModel = await remoteDataSource.verifyEmail(
        email: email,
        verificationCode: verificationCode,
      );
      return Result.ok(verificationModel.toEntity());
    } catch (e) {
      return const Result.err(VerifyEmailFailure());
    }
  }
}
