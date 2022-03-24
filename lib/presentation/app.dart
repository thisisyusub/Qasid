import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsiveness/responsiveness.dart';
import 'package:theme/theme.dart';

import '../core/utils/app_scroll_behaviour.dart';
import '../injection_container.dart';
import 'bloc/auth/auth_cubit.dart';
import 'pages/auth/auth_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => di()..checkAuth(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig.init(constraints, orientation);

              return AppTheme(
                data: AppThemeData(
                  colors: AppColorsData.light(),
                  typography: AppTypographyData.regular(),
                ),
                child: Builder(
                  builder: (context) {
                    final appTheme = AppTheme.of(context);

                    return MaterialApp(
                      title: 'Qasid',
                      locale: const Locale('az'),
                      localizationsDelegates:
                          AppLocalizations.localizationsDelegates,
                      supportedLocales: AppLocalizations.supportedLocales,
                      theme: ThemeData(
                        primaryColor: appTheme.colors.primaryColor,
                        primaryColorDark: appTheme.colors.secondaryColor,
                      ),
                      builder: (context, child) {
                        return ScrollConfiguration(
                          behavior: AppScrollBehaviour(),
                          child: child!,
                        );
                      },
                      home: const AuthPage(),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
