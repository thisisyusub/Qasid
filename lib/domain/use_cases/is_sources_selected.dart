import 'dart:async';

import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/use_cases/use_case.dart';
import '../repositories/preferences_repository.dart';

class IsSourcesSelected extends UseCase<dynamic, bool, NoParams> {
  IsSourcesSelected(this.repository);

  final PreferencesRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(NoParams params) {
    return repository.isSourcesSelected;
  }
}
