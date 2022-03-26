import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/use_cases/use_case.dart';
import '../repositories/preferences_repository.dart';

class GetDefaultThemeMode extends UseCase<Either<Failure, int?>, NoParams> {
  GetDefaultThemeMode(this.repository);

  final PreferencesRepository repository;

  @override
  Either<Failure, int?> call(NoParams params) {
    return repository.themeMode;
  }
}
