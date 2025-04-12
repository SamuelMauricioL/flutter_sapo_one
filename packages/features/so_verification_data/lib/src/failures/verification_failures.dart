import 'package:so_utils/so_utils.dart';

class SendCodeFailure extends SoFailure {
  const SendCodeFailure({super.message = 'Error enviando el código'});
}

class VerifyEmailFailure extends SoFailure {
  const VerifyEmailFailure({super.message = 'Error verificando el email'});
}
