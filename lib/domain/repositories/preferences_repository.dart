import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/utils/selection.dart';
import '../../data/models/news_source_model.dart';
import '../entities/news_source.dart';

abstract class PreferencesRepository {
  Future<Either<Failure, Unit>> persistLocale(String languageCode);

  Future<Either<Failure, Unit>> persistThemeMode(int index);

  Either<Failure, String?> get locale;

  Either<Failure, int?> get themeMode;

  Either<Failure, bool> get isSourcesSelected;

  Future<Either<Failure, Unit>> persistSourcesPreferences(
    List<Selection<NewsSourceModel>> selections,
  );

  Either<Failure, List<Selection<NewsSource>>> getSourcesPreferences();
}
