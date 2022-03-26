import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/theme.dart';

import '../../../core/bloc/data_state.dart';
import '../../../core/either.dart';
import '../../../domain/entities/news.dart';
import '../../bloc/news_list/news_list_cubit.dart';
import '../../widgets/loading.dart';
import 'widgets/news_item.dart';

typedef NewsState = DataState<List<News>, Unit>;

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allNewsState = context.watch<NewsListCubit>().state;
    final appTheme = AppTheme.of(context);

    return Scaffold(
      body: RefreshIndicator(
        backgroundColor: appTheme.colors.primaryColor,
        color: appTheme.colors.secondaryColor,
        onRefresh: () async {
          context.read<NewsListCubit>().fetchAllNews();
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              centerTitle: true,
              backgroundColor: appTheme.colors.primaryColor,
              title: Text(
                'Qasid',
                style: appTheme.typography.heading.copyWith(
                  color: appTheme.colors.secondaryColor,
                ),
              ),
              floating: true,
            ),
            if (allNewsState.isInProgress)
              const SliverFillRemaining(
                child: Loading(),
              ),
            if (allNewsState.isSuccess)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Column(
                      children: [
                        NewsItem(
                          news: allNewsState.data![index],
                        ),
                        Divider(
                          height: 0,
                          color: appTheme.colors.accentColor,
                        ),
                      ],
                    );
                  },
                  childCount: allNewsState.data!.length,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
