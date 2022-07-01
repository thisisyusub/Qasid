import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:responsiveness/responsiveness.dart';
import 'named.dart';

class AppTypographyData extends Equatable {
  const AppTypographyData({
    required this.heading,
    required this.title,
    required this.subtitle,
    required this.caption,
  });

  factory AppTypographyData.regular() => AppTypographyData(
        heading: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        title: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
        subtitle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        caption: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
      );

  final TextStyle heading;
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle caption;

  @override
  List<Object?> get props => [
        heading.named('heading'),
        title.named('title'),
        subtitle.named('subtitle'),
        caption.named('caption'),
      ];
}
