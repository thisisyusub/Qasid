import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final localization = AppLocalizations.of(context)!;
    final appTheme = AppTheme.of(context);

    return BottomNavyBar(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      backgroundColor: appTheme.colors.primaryColor,
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
          appTheme: appTheme,
          title: localization.news,
          icon: CupertinoIcons.news,
          isCurrent: _index == 0,
        ),
        _buildBottomNavyBarItem(
          appTheme: appTheme,
          title: localization.settings,
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
      ),
      title: Text(
        title,
        style: appTheme.typography.subtitle.copyWith(
          color: appTheme.colors.secondaryColor,
        ),
      ),
      textAlign: TextAlign.center,
      activeColor: appTheme.colors.secondaryColor,
      inactiveColor: appTheme.colors.accentColor,
    );
  }
}
