import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../news/news_page.dart';
import '../settings/settings_page.dart';
import 'widgets/news_bottom_nav_bar.dart';

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
        //statusBarColor: AppTheme.of(context).colors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        // backgroundColor: appTheme.colors.primaryColor,
        body: PageView(
          controller: _pageController,
          allowImplicitScrolling: false,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            NewsPage(),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: NewsBottomNavBar(
          onChange: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 700),
              curve: Curves.fastOutSlowIn,
            );
          },
        ),
      ),
    );
  }
}
