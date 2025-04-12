import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:so_verification_data/src/models/verification_model.dart';

abstract class VerificationRemoteDataSource {
  Future<void> sendVerificationCode({required String email});
  Future<VerificationModel> verifyEmail({
    required String email,
    required String verificationCode,
  });
}

class VerificationRemoteDataSourceImpl implements VerificationRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  @override
  Future<void> sendVerificationCode({required String email}) async {
    try {
      final callable = _functions.httpsCallable('sendVerificationCode');
      // ignore: inference_failure_on_function_invocation
      await callable.call(<String, dynamic>{'email': email});
    } catch (e) {
      throw Exception('Error sending verification code');
    }
  }

  @override
  Future<VerificationModel> verifyEmail({
    required String email,
    required String verificationCode,
  }) async {
    try {
      final verificationDoc =
          await _firestore.collection('verificationCodes').doc(email).get();

      if (verificationDoc.exists) {
        final storedCode = verificationDoc.data()!['code'];
        if (storedCode == verificationCode) {
          await _firestore.collection('users').doc().set({
            'email': email,
            'verifiedEmail': true,
          });

          return VerificationModel(email: email, isVerified: true);
        } else {
          throw Exception('Invalid verification code');
        }
      } else {
        throw Exception('Verification code not found');
      }
    } catch (e) {
      rethrow;
    }
  }
}
