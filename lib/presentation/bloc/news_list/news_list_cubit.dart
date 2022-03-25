import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/data_state.dart';
import '../../../core/either.dart';
import '../../../core/use_cases/use_case.dart';
import '../../../domain/entities/news.dart';
import '../../../domain/use_cases/get_news_list.dart';

class NewsListCubit extends Cubit<DataState<List<News>, Unit>> {
  NewsListCubit({
    required this.getNewsList,
  }) : super(const DataState());

  GetNewsList getNewsList;

  void fetchAllNews() async {
    emit(state.copyWith(isInProgress: true));
    final result = await getNewsList(NoParams());

    result.when(
      error: (_) => emit(
        state.copyWith(
          isFailure: true,
          error: unit,
        ),
      ),
      success: (allNews) {
        emit(
          state.copyWith(
            isSuccess: true,
            data: allNews,
          ),
        );
      },
    );
  }
}
