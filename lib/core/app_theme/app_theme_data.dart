import 'package:equatable/equatable.dart';

import 'app_colors.dart';
import 'typography.dart';

class AppThemeData extends Equatable {
  const AppThemeData({
    required this.colors,
    required this.typography,
  });

  final AppColorsData colors;
  final AppTypographyData typography;

  @override
  List<Object?> get props => [
        colors,
        typography,
      ];
}
