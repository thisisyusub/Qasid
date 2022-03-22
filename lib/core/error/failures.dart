import 'package:equatable/equatable.dart';

enum ErrorType { noInternet, network, cache, other }

class Failure<E> extends Equatable {
  final E? error;
  final ErrorType errorType;

  const Failure({
    this.errorType = ErrorType.other,
    this.error,
  });

  const Failure.cache() : this(errorType: ErrorType.cache);

  const Failure.network([E? error])
      : this(
          errorType: ErrorType.network,
          error: error,
        );

  const Failure.noInternet() : this(errorType: ErrorType.noInternet);

  const Failure.other() : this(errorType: ErrorType.other);

  @override
  List<Object?> get props => [errorType, error];
}
