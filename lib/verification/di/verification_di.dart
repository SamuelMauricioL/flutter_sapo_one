import 'package:get_it/get_it.dart';
import 'package:so_utils/so_utils.dart';
import 'package:so_verification_data/so_verification_data.dart';
import 'package:so_verification_domain/so_verification_domain.dart';

class VerificationModule extends ModuleDi {
  VerificationModule(this.getIt);

  final GetIt getIt;

  @override
  void registerModule() {
    _registerDataSource();
    _registerRepository();
    _registerUseCases();
  }

  void _registerDataSource() {
    getIt.registerLazySingleton<VerificationRemoteDataSource>(
      VerificationRemoteDataSourceImpl.new,
    );
  }

  void _registerRepository() {
    getIt.registerLazySingleton<VerificationRepository>(
      () => VerificationRepositoryImpl(
        remoteDataSource: getIt<VerificationRemoteDataSource>(),
      ),
    );
  }

  void _registerUseCases() {
    getIt
      ..registerLazySingleton<SendVerificationCodeUseCase>(
        () => SendVerificationCodeUseCase(
          repository: getIt<VerificationRepository>(),
        ),
      )
      ..registerLazySingleton<VerifyEmailUseCase>(
        () => VerifyEmailUseCase(
          repository: getIt<VerificationRepository>(),
        ),
      );
  }
}
