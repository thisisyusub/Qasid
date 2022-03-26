import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/use_cases/use_case.dart';
import '../../../domain/use_cases/change_locale.dart';
import '../../../domain/use_cases/get_default_locale.dart';

class LocalizationCubit extends Cubit<Locale> {
  LocalizationCubit({
    required GetDefaultLocale getDefaultLocale,
    required this.changeLocale,
  }) : super(const Locale('az', 'AZ')) {
    final result = getDefaultLocale(NoParams());

    result.when(
      error: (_) {},
      success: (languageCode) {
        if (languageCode != null) {
          emit(Locale(languageCode));
        }
      },
    );
  }

  final ChangeLocale changeLocale;

  void changeLanguage(String languageCode) async {
    final result = await changeLocale(languageCode);

    if (result.isSuccess()) {
      emit(Locale(languageCode));
    }
  }
}
