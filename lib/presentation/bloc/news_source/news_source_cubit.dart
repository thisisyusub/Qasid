import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/use_cases/use_case.dart';
import '../../../core/utils/selection.dart';
import '../../../domain/entities/news_source.dart';
import '../../../domain/use_cases/get_news_sources.dart';
import '../../../domain/use_cases/persist_sources_selection.dart';

class NewsSourceCubit extends Cubit<List<Selection<NewsSource>>> {
  NewsSourceCubit({
    required this.getNewsSources,
    required this.persistSourcesSelection,
  }) : super(<Selection<NewsSource>>[]);

  final GetNewsSources getNewsSources;
  final PersistSourcesSelection persistSourcesSelection;

  void fetchNewsSources() async {
    final result = getNewsSources(NoParams());

    result.when(
      error: (_) => emit([]),
      success: (newsSources) {
        emit(
          newsSources.map((newsSource) {
            return Selection(value: newsSource);
          }).toList(),
        );
      },
    );
  }

  void changeSelection(int index) {
    var source = state[index];

    state[index] = source.toggle();

    emit([...state]);
  }

  void submit() {
    if (state.every((element) => !element.selected)) {
      return;
    }

    persistSourcesSelection(state);
  }
}
