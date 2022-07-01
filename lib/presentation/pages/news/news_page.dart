import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:theme/theme.dart';

import '../../../core/bloc/data_state.dart';
import '../../../core/either.dart';
import '../../../domain/entities/news.dart';
import '../../bloc/localization/localization_cubit.dart';
import '../../bloc/news_list/news_list_cubit.dart';
import '../../widgets/loading.dart';
import 'widgets/news_item.dart';

typedef NewsState = DataState<List<News>, Unit>;

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final allNewsState = context.watch<NewsListCubit>().state;
    final appTheme = AppTheme.of(context);

    late final Widget child;

    if (allNewsState.isInProgress) {
      child = const Loading();
    } else if (allNewsState.isSuccess) {
      child = ListView.builder(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Column(
            children: [
              NewsItem(
                news: allNewsState.data![index],
              ),
              const SizedBox(height: 16),
              Divider(
                height: 0,
                color: appTheme.colors.accentColor,
              ),
            ],
          );
        },
        itemCount: allNewsState.data!.length,
      );
    } else {
      child = Center(
        child: Text(
          AppLocalizations.of(context)!.errorOccured,
          style: appTheme.typography.heading,
        ),
      );
    }

    return BlocListener<LocalizationCubit, Locale>(
      listener: (context, state) {
        context.read<NewsListCubit>().fetchAllNews();
      },
      child: Scaffold(
        body: RefreshIndicator(
          backgroundColor: appTheme.colors.primaryColor,
          color: appTheme.colors.secondaryColor,
          onRefresh: () async {
            context.read<NewsListCubit>().fetchAllNews();
          },
          child: child,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
