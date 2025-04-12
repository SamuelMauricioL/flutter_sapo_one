import 'package:flutter_sapo_one/verification/di/verification_di.dart';
import 'package:get_it/get_it.dart';
import 'package:so_utils/so_utils.dart';

class Get {
  static final it = GetIt.instance;

  static Future<void> init() async {
    final modules = <ModuleDi>[
      VerificationModule(it),
    ];

    for (final element in modules) {
      element.registerModule();
    }
  }
}
