import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:theme/theme.dart';

import '../../../injection_container.dart';
import '../../bloc/auth/auth_cubit.dart';
import '../../bloc/news_list/news_list_cubit.dart';
import '../../bloc/news_source/news_source_cubit.dart';
import '../main/main_page.dart';
import '../source_selection/source_selection_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: theme.colors.primaryColor,
        statusBarIconBrightness: theme.colors.statusBarIconBrightness,
      ),
      child: BlocConsumer<AuthCubit, SourceState>(
        listener: (_, state) {
          if (state == SourceState.notSubmitted ||
              state == SourceState.submitted) {
            FlutterNativeSplash.remove();
          }
        },
        builder: (_, state) {
          if (state == SourceState.submitted) {
            return BlocProvider<NewsListCubit>(
              create: (_) => di()..fetchAllNews(),
              child: const MainPage(),
            );
          } else if (state == SourceState.notSubmitted) {
            return BlocProvider<NewsSourceCubit>(
              create: (context) => di()..fetchNewsSources(),
              child: const SourceSelectionPage(),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
