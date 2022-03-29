import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:theme/theme.dart';

import '../../../core/utils/selection.dart';
import '../../../domain/entities/news_source.dart';
import '../../../injection_container.dart';
import '../../bloc/news_list/news_list_cubit.dart';
import '../../bloc/news_source/news_source_cubit.dart';
import '../main/main_page.dart';

class SourceSelectionPage extends StatelessWidget {
  const SourceSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final theme = AppTheme.of(context);

    final sourceCubit = context.watch<NewsSourceCubit>();
    final newsSources = sourceCubit.state;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: constraints.maxHeight * 0.08),
                Text(
                  localization.selectSoureTitle,
                  style: theme.typography.heading.copyWith(
                    color: theme.colors.secondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                _NewsSources(
                  newsSources: newsSources,
                  sourceCubit: sourceCubit,
                ),
                _SubmitButton(
                  sourceCubit: sourceCubit,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    Key? key,
    required this.sourceCubit,
  }) : super(key: key);

  final NewsSourceCubit sourceCubit;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final theme = AppTheme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          sourceCubit.submit();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) {
                return BlocProvider<NewsListCubit>(
                  create: (_) => di()..fetchAllNews(),
                  child: const MainPage(),
                );
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(localization.goForward),
        ),
        style: ElevatedButton.styleFrom(
          primary: theme.colors.buttonColor,
          textStyle: theme.typography.title.copyWith(
            color: Colors.white,
          ),
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}

class _NewsSources extends StatelessWidget {
  const _NewsSources({
    Key? key,
    required this.newsSources,
    required this.sourceCubit,
  }) : super(key: key);

  final List<Selection<NewsSource>> newsSources;
  final NewsSourceCubit sourceCubit;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (_, i) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    newsSources[i].value.title,
                    style: theme.typography.title.copyWith(
                      color: theme.colors.secondaryColor,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 1.2,
                  child: CupertinoSwitch(
                    value: newsSources[i].selected,
                    onChanged: (_) {
                      sourceCubit.changeSelection(i);
                    },
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: newsSources.length,
      ),
    );
  }
}
