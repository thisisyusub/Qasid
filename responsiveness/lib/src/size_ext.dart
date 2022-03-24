import 'size_config.dart';

/// Extension to use values using [num]
extension SizeExt on num {
  /// [getter] to get [responsive height] according to device height
  double get h {
    final percentage = (this * 100) / 568;
    return SizeConfig.height / 100 * percentage;
  }

  /// [getter] to get [responsive width] according to device width
  double get w {
    final percentage = (this * 100) / 320;
    return SizeConfig.width / 100 * percentage;
  }

  double get radius => SizeConfig.width / 100 * this;
}
