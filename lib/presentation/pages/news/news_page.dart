import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/theme.dart';

import '../../../core/bloc/data_state.dart';
import '../../../core/either.dart';
import '../../../domain/entities/news.dart';
import '../../bloc/news_list/news_list_cubit.dart';
import 'widgets/news_item.dart';

typedef NewsState = DataState<List<News>, Unit>;

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final appColors = appTheme.colors;

    return Scaffold(
      backgroundColor: appColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Qasid',
          style: Theme.of(context).textTheme.headline6,
        ),
        elevation: .0,
      ),
      body: Column(
        children: [
          if (false)
            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16.0),
                itemBuilder: (_, i) {
                  return Container(
                    height: 30,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                      color: i == 0 ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: Text(
                        'Sports',
                        style: TextStyle(
                          color: i == 0 ? Colors.white : Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 15,
              ),
            ),
          //const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<NewsListCubit, NewsState>(
              builder: (_, state) {
                if (state.isInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }

                if (state.isFailure) {
                  return const Center(
                    child: Text('Fuck'),
                  );
                }

                if (state.isSuccess) {
                  final allNews = state.data!;

                  return LayoutBuilder(
                    builder: (_, constraints) {
                      return PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, index) {
                          return NewsItem(
                            news: allNews[index],
                            constraints: constraints,
                          );
                        },
                        itemCount: allNews.length,
                      );
                    },
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
