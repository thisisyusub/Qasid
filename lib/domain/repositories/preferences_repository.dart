import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/utils/selection.dart';
import '../../data/models/news_source_model.dart';
import '../entities/news_source.dart';

abstract class PreferencesRepository {
  Either<Failure, bool> get isSourcesSelected;

  Future<Either<Failure, Unit>> persistSourcesPreferences(
    List<Selection<NewsSourceModel>> selections,
  );

  Either<Failure, List<Selection<NewsSource>>> getSourcesPreferences();
}
