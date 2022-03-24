import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/utils/selection.dart';
import '../../domain/entities/news_source.dart';
import '../../domain/repositories/preferences_repository.dart';
import '../data_sources/local/preferences_data_source.dart';
import '../models/news_source_model.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  PreferencesRepositoryImpl(this.dataSource);

  final PreferencesDataSource dataSource;

  @override
  Either<Failure, bool> get isSourcesSelected {
    try {
      return Success(dataSource.isSourcesSelected);
    } catch (_) {
      return const Error(Failure.cache());
    }
  }

  @override
  Either<Failure, List<Selection<NewsSource>>> getSourcesPreferences() {
    try {
      return Success(dataSource.getSourcesPreferences());
    } catch (_) {
      return const Error(Failure.cache());
    }
  }

  @override
  Future<Either<Failure, Unit>> persistSourcesPreferences(
      List<Selection<NewsSourceModel>> selections) async {
    try {
      await dataSource.persistSourcesSelection(selections);

      return const Success(unit);
    } catch (_) {
      return const Error(Failure.cache());
    }
  }
}
