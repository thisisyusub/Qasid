import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/use_cases/use_case.dart';
import '../repositories/preferences_repository.dart';

class ChangeLocale extends UseCase<Future<Either<Failure, Unit?>>, String> {
  ChangeLocale(this.repository);

  final PreferencesRepository repository;

  @override
  Future<Either<Failure, Unit?>> call(String params) {
    return repository.persistLocale(params);
  }
}
