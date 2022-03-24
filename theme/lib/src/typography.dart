import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:responsiveness/responsiveness.dart';
import 'named.dart';

class AppTypographyData extends Equatable {
  const AppTypographyData({
    required this.heading,
    required this.title,
    required this.subtitle,
  });

  factory AppTypographyData.regular() => AppTypographyData(
        heading: TextStyle(
          fontSize: 16.w,
          fontWeight: FontWeight.w500,
        ),
        title: TextStyle(
          fontSize: 14.w,
          fontWeight: FontWeight.w500,
        ),
        subtitle: TextStyle(
          fontSize: 12.w,
        ),
      );

  final TextStyle heading;
  final TextStyle title;
  final TextStyle subtitle;

  @override
  List<Object?> get props => [
        heading.named('heading'),
        title.named('title'),
        subtitle.named('subtitle'),
      ];
}
