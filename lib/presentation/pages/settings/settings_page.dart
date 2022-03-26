import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final unweightedTitle = appTheme.typography.title.copyWith(
    //   color: appTheme.colors.secondaryColor,
    //   fontWeight: FontWeight.normal,
    // );

    return Scaffold(
      //backgroundColor: appTheme.colors.primaryColor,
      body: ListView(
        children: [
          ListTile(
            onTap: () {},
            title: Text(
              'Change Language',
              //style: unweightedTitle,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              'Change Theme',
              // style: unweightedTitle,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              'About App',
              //style: unweightedTitle,
            ),
          ),
          // ListTile(
          //   onTap: () {
          //     Share.share('app link');
          //   },
          //   title: Text(
          //     'Share',
          //     style: unweightedTitle,
          //   ),
          // ),
        ],
      ),
    );
  }
}
