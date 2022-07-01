import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:theme/theme.dart';

import '../../bloc/theme/theme_cubit.dart';
import '../../fragments/change_language/change_language_fragment.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final appTheme = AppTheme.of(context);

    final unweightedTitle = appTheme.typography.heading.copyWith(
      color: appTheme.colors.secondaryColor,
      fontWeight: FontWeight.normal,
    );

    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              ChangeLanguageFragment.build(context: context);
            },
            title: Text(
              localization.changeLanguage,
              style: unweightedTitle,
            ),
          ),
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (_, themeMode) {
              return SwitchListTile.adaptive(
                value: themeMode == ThemeMode.light ? false : true,
                onChanged: (value) {
                  context.read<ThemeCubit>().changeTheme(value ? 2 : 1);
                },
                title: Text(
                  localization.changeTheme,
                  style: unweightedTitle,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
