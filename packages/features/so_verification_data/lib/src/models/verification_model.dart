class VerificationModel {
  const VerificationModel({
    required this.email,
    required this.isVerified,
  });

  factory VerificationModel.fromJson(Map<String, dynamic> json) {
    return VerificationModel(
      email: (json['email'] as String?) ?? '',
      isVerified: (json['verifiedEmail'] as bool?) ?? false,
    );
  }
  final String email;
  final bool isVerified;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'verifiedEmail': isVerified,
    };
  }
}
