import 'package:equatable/equatable.dart';

abstract class SoFailure extends Equatable {
  const SoFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}

// General failures
class ServerFailure extends SoFailure {
  const ServerFailure({
    super.message = 'Ocurrió un error, vuelva a interlo.',
  });
}

class CacheFailure extends SoFailure {
  const CacheFailure({
    super.message = 'Ocurrió un error, vuelva a interlo.',
  });
}
