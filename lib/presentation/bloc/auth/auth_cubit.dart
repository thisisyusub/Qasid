import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/use_cases/use_case.dart';
import '../../../domain/use_cases/is_sources_selected.dart';

enum SourceState { checking, submitted, notSubmitted }

class AuthCubit extends Cubit<SourceState> {
  AuthCubit(this.isSourcesSelected) : super(SourceState.checking);

  final IsSourcesSelected isSourcesSelected;

  void checkAuth() async {
    final result = await isSourcesSelected(NoParams());
    await Future.delayed(const Duration(milliseconds: 700));

    result.when(
      error: (_) => emit(SourceState.notSubmitted),
      success: (authenticated) {
        if (authenticated) {
          emit(SourceState.submitted);
        } else {
          emit(SourceState.notSubmitted);
        }
      },
    );
  }
}
