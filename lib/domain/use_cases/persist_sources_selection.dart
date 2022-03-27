import 'dart:async';

import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/use_cases/use_case.dart';
import '../../core/utils/selection.dart';
import '../../data/models/news_source_model.dart';
import '../entities/news_source.dart';
import '../repositories/preferences_repository.dart';

class PersistSourcesSelection extends UseCase<Future<Either<Failure, Unit>>,
    List<Selection<NewsSource>>> {
  PersistSourcesSelection(this.repository);

  final PreferencesRepository repository;

  @override
  Future<Either<Failure, Unit>> call(List<Selection<NewsSource>> params) {
    final convertedParams = <Selection<NewsSourceModel>>[];

    for (var param in params) {
      convertedParams.add(
        Selection(
          selected: param.selected,
          value: NewsSourceModel(
            title: param.value.title,
            feedUrls: param.value.feedUrls,
            dateParser: param.value.dateParser,
          ),
        ),
      );
    }

    return repository.persistSourcesPreferences(convertedParams);
  }
}
