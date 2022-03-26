import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppTheme.of(context).colors.secondaryColor,
      ),
    );
  }
}
