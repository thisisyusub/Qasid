import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/use_cases/use_case.dart';
import '../repositories/preferences_repository.dart';

class ChangeThemeMode extends UseCase<Future<Either<Failure, Unit?>>, int> {
  ChangeThemeMode(this.repository);

  final PreferencesRepository repository;

  @override
  Future<Either<Failure, Unit?>> call(int params) {
    return repository.persistThemeMode(params);
  }
}
