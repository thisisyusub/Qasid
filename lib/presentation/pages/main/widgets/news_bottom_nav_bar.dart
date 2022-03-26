import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return BottomNavyBar(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      backgroundColor: theme.primaryColor,
      showElevation: true,
      selectedIndex: _index,
      onItemSelected: (index) {
        setState(() {
          _index = index;
          widget.onChange?.call(_index);
        });
      },
      items: [
        _buildBottomNavyBarItem(
          title: localization.news,
          icon: CupertinoIcons.news,
          isCurrent: _index == 0,
        ),
        _buildBottomNavyBarItem(
          title: localization.settings,
          icon: CupertinoIcons.settings,
          isCurrent: _index == 1,
        ),
      ],
    );
  }

  BottomNavyBarItem _buildBottomNavyBarItem({
    required String title,
    required IconData icon,
    bool isCurrent = false,
  }) {
    return BottomNavyBarItem(
      icon: Icon(
        icon,
      ),
      title: Text(
        title,
        // style: appTheme.typography.subtitle.copyWith(
        //   color: appTheme.colors.secondaryColor,
        // ),
      ),
      textAlign: TextAlign.center,
      // activeColor: appTheme.colors.secondaryColor,
      // inactiveColor: appTheme.colors.accentColor,
    );
  }
}
