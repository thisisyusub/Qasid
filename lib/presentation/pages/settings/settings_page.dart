import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:theme/theme.dart';

import '../../fragments/change_language/change_language_fragment.dart';
import '../../fragments/change_theme/change_theme_fragment.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final appTheme = AppTheme.of(context);
    final unweightedTitle = appTheme.typography.title.copyWith(
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
          ListTile(
            onTap: () {
              ChangeThemeModeFragment.build(context: context);
            },
            title: Text(
              localization.changeTheme,
              style: unweightedTitle,
            ),
          ),
          // Theme(
          //   data: ThemeData(
          //     dialogTheme: DialogTheme(
          //       backgroundColor: appTheme.colors.primaryColor,
          //     ),
          //   ),
          //   child: ListTile(
          //     onTap: () {
          //       showAboutDialog(
          //         context: context,
          //       );
          //     },
          //     title: Text(
          //       localization.aboutApp,
          //       style: unweightedTitle,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
