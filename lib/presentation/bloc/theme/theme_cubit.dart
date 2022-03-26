import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/use_cases/use_case.dart';
import '../../../domain/use_cases/change_theme_mode.dart';
import '../../../domain/use_cases/get_default_theme_mode.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit({
    required GetDefaultThemeMode getDefaultThemeMode,
    required this.changeThemeMode,
  }) : super(ThemeMode.system) {
    final result = getDefaultThemeMode(NoParams());

    result.when(
      error: (_) {},
      success: (index) {
        if (index != null) {
          emit(_intToThemeMode(index));
        }
      },
    );
  }

  final ChangeThemeMode changeThemeMode;

  void changeTheme(int index, {bool save = true}) async {
    if (save) {
      final result = await changeThemeMode(index);

      if (result.isSuccess()) {
        emit(_intToThemeMode(index));
      }
    } else {
      emit(_intToThemeMode(index));
    }
  }

  ThemeMode _intToThemeMode(int index) {
    switch (index) {
      case 0:
        return ThemeMode.system;
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
