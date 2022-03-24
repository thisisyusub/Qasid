import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:theme/theme.dart';

import '../../../core/utils/selection.dart';
import '../../../domain/entities/news_source.dart';
import '../../bloc/news_source/news_source_cubit.dart';
import '../main/main_page.dart';

class SourceSelectionPage extends StatelessWidget {
  const SourceSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final appTheme = AppTheme.of(context);

    final sourceCubit = context.watch<NewsSourceCubit>();
    final newsSources = sourceCubit.state;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: constraints.maxHeight * 0.1),
                Text(
                  localization.selectSoureTitle,
                  style: appTheme.typography.heading.copyWith(
                    color: appTheme.colors.secondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                _NewsSources(
                  newsSources: newsSources,
                  appTheme: appTheme,
                  sourceCubit: sourceCubit,
                ),
                _SubmitButton(
                  sourceCubit: sourceCubit,
                  appTheme: appTheme,
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
    required this.appTheme,
  }) : super(key: key);

  final NewsSourceCubit sourceCubit;
  final AppThemeData appTheme;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          sourceCubit.submit();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) {
                return const MainPage();
              },
            ),
          );
        },
        child: Text(localization.goForward),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            appTheme.colors.secondaryColor,
          ),
          textStyle: MaterialStateProperty.all(
            appTheme.typography.title.copyWith(
              color: appTheme.colors.secondaryColor,
            ),
          ),
          fixedSize: MaterialStateProperty.all(
            const Size(200.0, 50.0),
          ),
        ),
      ),
    );
  }
}

class _NewsSources extends StatelessWidget {
  const _NewsSources({
    Key? key,
    required this.newsSources,
    required this.appTheme,
    required this.sourceCubit,
  }) : super(key: key);

  final List<Selection<NewsSource>> newsSources;
  final AppThemeData appTheme;
  final NewsSourceCubit sourceCubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    newsSources[i].value.title,
                    style: appTheme.typography.title.copyWith(
                      color: appTheme.colors.secondaryColor,
                    ),
                  ),
                ),
                CupertinoSwitch(
                  value: newsSources[i].selected,
                  activeColor: appTheme.colors.secondaryColor,
                  onChanged: (_) {
                    sourceCubit.changeSelection(i);
                  },
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
