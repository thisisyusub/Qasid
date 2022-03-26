import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'named.dart';

class AppColorsData extends Equatable {
  const AppColorsData({
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.buttonColor,
    required this.statusBarIconBrightness,
  });

  factory AppColorsData.light() => AppColorsData(
        statusBarIconBrightness: Brightness.dark,
        primaryColor: Colors.white,
        secondaryColor: Colors.black,
        accentColor: Colors.grey.withOpacity(0.6),
        buttonColor: Colors.black,
      );

  factory AppColorsData.dark() => AppColorsData(
        statusBarIconBrightness: Brightness.light,
        primaryColor: const Color(0xFF121212),
        secondaryColor: Colors.white,
        accentColor: Colors.grey.withOpacity(0.6),
        buttonColor: Colors.white.withOpacity(0.07),
      );

  final Brightness statusBarIconBrightness;
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final Color buttonColor;

  @override
  List<Object?> get props => [
        primaryColor.named('primaryColor'),
        secondaryColor.named('secondaryColor'),
        accentColor.named('accentColor'),
      ];
}
