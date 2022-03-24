import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/use_cases/use_case.dart';
import '../../../domain/use_cases/is_sources_selected.dart';

class AuthCubit extends Cubit<bool> {
  AuthCubit(this.isSourcesSelected) : super(false);

  final IsSourcesSelected isSourcesSelected;

  void checkAuth() async {
    final result = await isSourcesSelected(NoParams());

    result.when(
      error: (_) => emit(false),
      success: (authenticated) => emit(authenticated),
    );
  }
}
