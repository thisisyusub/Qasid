import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../domain/repositories/preferences_repository.dart';
import '../data_sources/local/preferences_data_source.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  PreferencesRepositoryImpl(this.dataSource);

  final PreferencesDataSource dataSource;

  @override
  Future<Either<Failure, Unit>> persistLocale(String languageCode) async {
    try {
      await dataSource.persistAppLocale(languageCode);
      return const Success(unit);
    } catch (_) {
      return const Error(Failure.cache());
    }
  }

  @override
  Either<Failure, String?> get locale {
    try {
      return Success(dataSource.locale);
    } catch (_) {
      return const Error(Failure.cache());
    }
  }

  @override
  Future<Either<Failure, Unit>> persistThemeMode(int themeMode) async {
    try {
      await dataSource.persistAppThemeMode(themeMode);
      return const Success(unit);
    } catch (_) {
      return const Error(Failure.cache());
    }
  }

  @override
  Either<Failure, int?> get themeMode {
    try {
      return Success(dataSource.themeMode);
    } catch (_) {
      return const Error(Failure.cache());
    }
  }
}
