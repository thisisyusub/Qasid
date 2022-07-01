import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsiveness/responsiveness.dart';
import 'package:theme/theme.dart';

import '../bloc/theme/theme_cubit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    final appTheme = AppTheme.of(context);
    final appColors = appTheme.colors;

    final rightDotColor = themeMode == ThemeMode.dark
        ? appColors.secondaryColor
        : appColors.blueColor;

    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoadingAnimationWidget.inkDrop(
            color: rightDotColor,
            size: 50.w,
          ),
          const SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.pleaseWait,
            style: appTheme.typography.heading,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
