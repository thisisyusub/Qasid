import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class NewsBottomNavBar extends StatefulWidget {
  const NewsBottomNavBar({
    Key? key,
    this.onChange,
  }) : super(key: key);

  final ValueChanged<int>? onChange;

  @override
  State<NewsBottomNavBar> createState() => _NewsBottomNavBarState();
}

class _NewsBottomNavBarState extends State<NewsBottomNavBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);

    return BottomNavyBar(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      selectedIndex: _index,
      onItemSelected: (index) {
        setState(() {
          _index = index;
          widget.onChange?.call(_index);
        });
      },
      items: [
        _buildBottomNavyBarItem(
          appTheme: appTheme,
          title: 'News',
          icon: CupertinoIcons.news,
          isCurrent: _index == 0,
        ),
        // _buildBottomNavyBarItem(
        //   appTheme: appTheme,
        //   title: 'Saved',
        //   icon: CupertinoIcons.bookmark,
        //   isCurrent: _index == 1,
        // ),
        _buildBottomNavyBarItem(
          appTheme: appTheme,
          title: 'Settings',
          icon: CupertinoIcons.settings,
          isCurrent: _index == 1,
        ),
      ],
    );
  }

  BottomNavyBarItem _buildBottomNavyBarItem({
    required AppThemeData appTheme,
    required String title,
    required IconData icon,
    bool isCurrent = false,
  }) {
    return BottomNavyBarItem(
      icon: Icon(
        icon,
        color: isCurrent ? Colors.black : appTheme.colors.accentColor,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      textAlign: TextAlign.center,
      activeColor: appTheme.colors.accentColor,
      inactiveColor: appTheme.colors.accentColor,
    );
  }
}
