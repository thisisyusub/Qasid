import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:theme/theme.dart';

import '../../bloc/theme/theme_cubit.dart';

class ChangeThemeModeFragment {
  const ChangeThemeModeFragment._();

  static void build({
    required BuildContext context,
  }) {
    final appTheme = AppTheme.of(context);
    final localization = AppLocalizations.of(context)!;
    final themeCubit = context.read<ThemeCubit>();
    final themeMode = themeCubit.state;

    showModalBottomSheet(
      context: context,
      backgroundColor: appTheme.colors.primaryColor,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ThemeModeTile(
              value: 0,
              gruopValue: themeMode.index,
              title: 'System',
              appTheme: appTheme,
              themeCubit: themeCubit,
            ),
            _ThemeModeTile(
              value: 1,
              gruopValue: themeMode.index,
              title: 'Light',
              appTheme: appTheme,
              themeCubit: themeCubit,
            ),
            _ThemeModeTile(
              value: 2,
              gruopValue: themeMode.index,
              title: 'Dark',
              appTheme: appTheme,
              themeCubit: themeCubit,
            ),
          ],
        );
      },
    );
  }
}

class _ThemeModeTile extends StatelessWidget {
  const _ThemeModeTile({
    Key? key,
    required this.value,
    required this.gruopValue,
    required this.title,
    required this.appTheme,
    required this.themeCubit,
  }) : super(key: key);

  final int value;
  final int gruopValue;
  final String title;
  final AppThemeData appTheme;
  final ThemeCubit themeCubit;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(
            appTheme.colors.secondaryColor,
          ),
        ),
      ),
      child: RadioListTile(
        value: value,
        groupValue: gruopValue,
        title: Text(
          title,
          style: appTheme.typography.title.copyWith(
            color: appTheme.colors.secondaryColor,
          ),
        ),
        onChanged: (_) {
          themeCubit.changeTheme(value);
          Navigator.pop(context);
        },
      ),
    );
  }
}
