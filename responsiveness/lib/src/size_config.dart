import 'package:flutter/material.dart';

/// Class to initialize calculation for responsiveness
/// must be called when the app is started

class SizeConfig {
  /// [width] of current device
  static late double width;

  /// [height] of current device
  static late double height;

  /// value to get information about [orientation]
  static bool isPortrait = true;

  /// value to get information about [portrait] in in [mobile] or [not]
  static bool isMobilePortrait = false;

  /// the method to initialize [SizeConfig] for responsive calculation
  static void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      width = constraints.maxWidth;
      height = constraints.maxHeight;
      isPortrait = true;

      if (width < 450) {
        isMobilePortrait = true;
      }
    } else {
      width = constraints.maxHeight;
      height = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }
  }
}
