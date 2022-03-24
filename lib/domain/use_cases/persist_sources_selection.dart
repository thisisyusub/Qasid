import 'dart:async';

import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/use_cases/use_case.dart';
import '../../core/utils/selection.dart';
import '../../data/models/news_source_model.dart';
import '../entities/news_source.dart';
import '../repositories/preferences_repository.dart';

class PersistSourcesSelection
    extends UseCase<dynamic, Unit, List<Selection<NewsSource>>> {
  PersistSourcesSelection(this.repository);

  final PreferencesRepository repository;

  @override
  FutureOr<Either<Failure, Unit>> call(List<Selection<NewsSource>> params) {
    final convertedParams = <Selection<NewsSourceModel>>[];

    for (var param in params) {
      convertedParams.add(
        Selection(
          selected: param.selected,
          value: NewsSourceModel(
            title: param.value.title,
            feedUrl: param.value.feedUrl,
            hasEnglishVersion: param.value.hasEnglishVersion,
            hasRussianVersion: param.value.hasRussianVersion,
          ),
        ),
      );
    }

    return repository.persistSourcesPreferences(convertedParams);
  }
}
