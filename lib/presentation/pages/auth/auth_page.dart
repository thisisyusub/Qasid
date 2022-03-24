import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../../bloc/auth/auth_cubit.dart';
import '../../bloc/news_source/news_source_cubit.dart';
import '../main/main_page.dart';
import '../source_selection/source_selection_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenticated = context.watch<AuthCubit>().state;

    if (authenticated) {
      return const MainPage();
    } else {
      return BlocProvider<NewsSourceCubit>(
        create: (context) => di()..fetchNewsSources(),
        child: const SourceSelectionPage(),
      );
    }
  }
}
