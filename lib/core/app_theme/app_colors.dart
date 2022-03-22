import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'named.dart';

class AppColorsData extends Equatable {
  const AppColorsData({
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
  });

  factory AppColorsData.light() => AppColorsData(
        primaryColor: Colors.white,
        secondaryColor: Colors.black,
        accentColor: Colors.grey.withOpacity(0.6),
      );

  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;

  @override
  List<Object?> get props => [
        primaryColor.named('primaryColor'),
        secondaryColor.named('secondaryColor'),
        accentColor.named('accentColor'),
      ];
}
