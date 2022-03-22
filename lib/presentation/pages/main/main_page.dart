import 'package:flutter/material.dart';

import '../news/news_page.dart';
import '../news_detail/news_detail_page.dart';
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
    return Scaffold(
      body: PageView(
        controller: _pageController,
        allowImplicitScrolling: false,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const NewsPage(),
          const NewsDetailPage(),
        ],
      ),
      bottomNavigationBar: NewsBottomNavBar(
        onChange: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
          );
        },
      ),
    );
  }
}
