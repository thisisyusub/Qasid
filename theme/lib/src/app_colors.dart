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
    required this.blueColor,
  });

  factory AppColorsData.light() => const AppColorsData(
        statusBarIconBrightness: Brightness.dark,
        primaryColor: Colors.white,
        secondaryColor: Color(0xFF272932),
        accentColor: Color(0xFF818287),
        buttonColor: Colors.black,
        blueColor: Color(0xFF6280E8),
      );

  factory AppColorsData.dark() => AppColorsData(
        statusBarIconBrightness: Brightness.light,
        primaryColor: const Color(0xFF121212),
        secondaryColor: Colors.white,
        accentColor: Colors.grey.withOpacity(0.6),
        buttonColor: Colors.white.withOpacity(0.07),
        blueColor: const Color(0xFF6280E8),
      );

  final Brightness statusBarIconBrightness;
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final Color buttonColor;
  final Color blueColor;

  @override
  List<Object?> get props => [
        statusBarIconBrightness.named('statusBarIconBrightness'),
        primaryColor.named('primaryColor'),
        secondaryColor.named('secondaryColor'),
        accentColor.named('accentColor'),
        buttonColor.named('buttonColor'),
        blueColor.named('blueColor'),
      ];
}
