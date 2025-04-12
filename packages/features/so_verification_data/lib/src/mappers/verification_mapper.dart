import 'package:so_verification_data/src/models/verification_model.dart';
import 'package:so_verification_domain/so_verification_domain.dart';

extension VerificationMapper on VerificationModel {
  VerificationEntity toEntity() {
    return VerificationEntity(
      email: email,
      isVerified: isVerified,
    );
  }
}
