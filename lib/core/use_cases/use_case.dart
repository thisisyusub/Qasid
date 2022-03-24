import 'dart:async';

import 'package:equatable/equatable.dart';

import '../either.dart';
import '../error/failures.dart';

abstract class UseCase<Error, Type, Params> {
  FutureOr<Either<Failure<Error>, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
