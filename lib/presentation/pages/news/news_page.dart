import 'package:flutter/material.dart';
import 'package:qasid/main.dart';

import '../../../core/app_theme/app_theme.dart';
import 'widgets/news_item.dart';

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
        title: Text(
          'Hi, Kanan',
          style: Theme.of(context).textTheme.headline6,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
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
          const SizedBox(height: 10),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    return NewsItem(
                      news: newsList[index],
                      constraints: constraints,
                    );
                  },
                  itemCount: newsList.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
