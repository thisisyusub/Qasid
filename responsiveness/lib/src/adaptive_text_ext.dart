import 'package:responsiveness/responsiveness.dart';

extension AdaptiveTextExt on num {
  double get sp {
    if (SizeConfig.width <= 359) {
      return toDouble();
    } else if (SizeConfig.width <= 399) {
      return this + 1;
    } else if (SizeConfig.width <= 479) {
      return this + 2;
    } else if (SizeConfig.width <= 599) {
      return this + 3;
    } else {
      return toDouble();
    }
  }
}
