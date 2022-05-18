import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsiveness/responsiveness.dart';
import 'package:theme/theme.dart';

import '../core/utils/app_scroll_behaviour.dart';
import '../injection_container.dart';
import 'bloc/auth/auth_cubit.dart';
import 'bloc/localization/localization_cubit.dart';
import 'bloc/theme/theme_cubit.dart';
import 'pages/auth/auth_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => di()..checkAuth(),
        ),
        BlocProvider<LocalizationCubit>(
          create: (context) => di(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => di(),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig.init(constraints, orientation);
              final themeMode = context.watch<ThemeCubit>().state;

              late final AppColorsData appColors;

              if (themeMode == ThemeMode.light) {
                appColors = AppColorsData.light();
              } else {
                appColors = AppColorsData.dark();
              }

              return AppTheme(
                data: AppThemeData(
                  colors: appColors,
                  typography: AppTypographyData.regular(),
                ),
                child: Builder(
                  builder: (context) {
                    final appTheme = AppTheme.of(context);
                    final locale = context.watch<LocalizationCubit>().state;
                    final themeMode = context.watch<ThemeCubit>().state;

                    return MaterialApp(
                      title: 'Qasid',
                      locale: locale,
                      themeMode: themeMode,
                      debugShowCheckedModeBanner: false,
                      localizationsDelegates:
                          AppLocalizations.localizationsDelegates,
                      supportedLocales: AppLocalizations.supportedLocales,
                      theme: ThemeData(
                        useMaterial3: true,
                        colorSchemeSeed: Color(0xFF272932),
                        brightness: Brightness.light,
                      ),
                      darkTheme: ThemeData(
                        useMaterial3: true,
                        colorSchemeSeed: Color(0xFF272932),
                        brightness: Brightness.dark,
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
