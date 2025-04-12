import 'package:firebase_auth/firebase_auth.dart';
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
    } on FirebaseAuthException catch (_) {
      return const Result.err(SendCodeFailure());
    } catch (e) {
      return const Result.err(ServerFailure());
    }
  }

  @override
  Future<Result<VerificationEntity, SoFailure>> verifyEmail({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final verificationModel = await remoteDataSource.verifyEmail(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      return Result.ok(verificationModel.toEntity());
    } on FirebaseAuthException catch (_) {
      return const Result.err(VerifyEmailFailure());
    } catch (e) {
      return const Result.err(ServerFailure());
    }
  }
}
