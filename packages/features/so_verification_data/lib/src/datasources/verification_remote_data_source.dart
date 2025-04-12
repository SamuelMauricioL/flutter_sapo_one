import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:so_verification_data/src/models/verification_model.dart';

abstract class VerificationRemoteDataSource {
  Future<void> sendVerificationCode({required String email});
  Future<VerificationModel> verifyEmail({
    required String verificationId,
    required String smsCode,
  });
}

class VerificationRemoteDataSourceImpl implements VerificationRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> sendVerificationCode({required String email}) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: email, // Using email as phoneNumber
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String verificationId, int? forceResendingToken) {},
      verificationFailed: (FirebaseAuthException e) {
        throw e;
      },
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
    );
  }

  @override
  Future<VerificationModel> verifyEmail({
    required String verificationId,
    required String smsCode,
  }) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    try {
      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'email': user.email,
          'verifiedEmail': true,
        });
        return VerificationModel(email: user.email!, isVerified: true);
      } else {
        throw Exception('Error verifying user');
      }
    } catch (e) {
      rethrow;
    }
  }
}
