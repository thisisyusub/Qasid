import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../either.dart';
import '../failures.dart';

abstract class UseCase<Type, Params> {
  FutureOr<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
