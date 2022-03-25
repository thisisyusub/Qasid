import 'dart:async';

import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/use_cases/use_case.dart';
import '../../core/utils/selection.dart';
import '../entities/news_source.dart';
import '../repositories/preferences_repository.dart';

class GetPreferencesOfSources
    extends UseCase<dynamic, List<Selection<NewsSource>>, NoParams> {
  GetPreferencesOfSources(this.repository);

  final PreferencesRepository repository;

  @override
  FutureOr<Either<Failure, List<Selection<NewsSource>>>> call(NoParams params) {
    return repository.getSourcesPreferences();
  }
}