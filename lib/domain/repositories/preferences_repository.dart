import '../../core/either.dart';
import '../../core/error/failures.dart';

abstract class PreferencesRepository {
  Future<Either<Failure, Unit>> persistLocale(String languageCode);

  Future<Either<Failure, Unit>> persistThemeMode(int index);

  Either<Failure, String?> get locale;

  Either<Failure, int?> get themeMode;
}
