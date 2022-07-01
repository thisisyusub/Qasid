import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsiveness/responsiveness.dart';
import 'package:theme/theme.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/utils/date_formats.dart';
import '../../../bloc/localization/localization_cubit.dart';
import '../../settings/settings_page.dart';

double size(
  DeviceScreenType deviceScreenType, {
  required double mobile,
  double? tablet,
  double? desktop,
}) {
  switch (deviceScreenType) {
    case DeviceScreenType.mobile:
      return mobile;
    case DeviceScreenType.tablet:
      return tablet ?? mobile;
    case DeviceScreenType.desktop:
      return desktop ?? tablet ?? mobile;
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LocalizationCubit>().state;

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top + 5,
        left: 16.0,
        right: 16.0,
        bottom: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AppIcons.qasid,
            width: 25.h,
            height: 25.h,
          ),
          Text(
            formatTodayForHome(currentLocale.languageCode),
            style: AppTheme.of(context).typography.heading,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return const SettingsPage();
                  },
                ),
              );
            },
            icon: Icon(
              CupertinoIcons.settings,
              size: 25.h,
            ),
          ),
        ],
      ),
    );
  }
}
