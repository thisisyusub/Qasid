import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:theme/theme.dart';

import '../../bloc/localization/localization_cubit.dart';

class ChangeLanguageFragment {
  const ChangeLanguageFragment._();

  static void build({
    required BuildContext context,
  }) {
    final appTheme = AppTheme.of(context);
    final localization = AppLocalizations.of(context)!;
    final localizationCubit = context.read<LocalizationCubit>();
    final languagecode = localizationCubit.state.languageCode;

    showModalBottomSheet(
      context: context,
      backgroundColor: appTheme.colors.primaryColor,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewPadding.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _LanguageTile(
                value: 'az',
                gruopValue: languagecode,
                title: localization.azerbaijani,
                appTheme: appTheme,
                localizationCubit: localizationCubit,
              ),
              _LanguageTile(
                value: 'en',
                gruopValue: languagecode,
                title: localization.english,
                appTheme: appTheme,
                localizationCubit: localizationCubit,
              ),
              _LanguageTile(
                value: 'ru',
                gruopValue: languagecode,
                title: localization.russian,
                appTheme: appTheme,
                localizationCubit: localizationCubit,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    Key? key,
    required this.value,
    required this.gruopValue,
    required this.title,
    required this.appTheme,
    required this.localizationCubit,
  }) : super(key: key);

  final String value;
  final String gruopValue;
  final String title;
  final AppThemeData appTheme;
  final LocalizationCubit localizationCubit;

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
          style: appTheme.typography.heading.copyWith(
            color: appTheme.colors.secondaryColor,
          ),
        ),
        onChanged: (_) {
          localizationCubit.changeLanguage(value);
          Navigator.pop(context);
        },
      ),
    );
  }
}
