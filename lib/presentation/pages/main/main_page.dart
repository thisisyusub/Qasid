import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme/theme.dart';

import '../news/news_page.dart';
import 'widgets/custom_app_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppTheme.of(context).colors.primaryColor,
        statusBarIconBrightness:
            AppTheme.of(context).colors.statusBarIconBrightness,
      ),
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(),
            Expanded(
              child: PageView(
                controller: _pageController,
                allowImplicitScrolling: false,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  NewsPage(),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
