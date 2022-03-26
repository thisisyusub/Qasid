import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/use_cases/use_case.dart';
import '../repositories/preferences_repository.dart';

class GetDefaultLocale extends UseCase<Either<Failure, String?>, NoParams> {
  GetDefaultLocale(this.repository);

  final PreferencesRepository repository;

  @override
  Either<Failure, String?> call(NoParams params) {
    return repository.locale;
  }
}
