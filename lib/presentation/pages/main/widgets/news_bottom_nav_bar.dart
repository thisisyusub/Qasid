import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsiveness/responsiveness.dart';

import '../../../../core/constants/assets.dart';

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

    return NavigationBar(
      selectedIndex: _index,
      height: 64.h,
      onDestinationSelected: (newIndex) {
        setState(() {
          _index = newIndex;
          widget.onChange?.call(_index);
        });
      },
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset(AppIcons.news),
          label: localization.news,
        ),
        NavigationDestination(
          icon: SvgPicture.asset(AppIcons.channels),
          label: localization.channels,
        ),
      ],
    );
  }
}
