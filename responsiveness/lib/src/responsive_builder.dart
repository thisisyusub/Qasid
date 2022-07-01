import 'package:flutter/material.dart';

enum DeviceScreenType { mobile, tablet, desktop }

/// It is used by [ResponsiveBuilder] to provide information about [Orientation], [DeviceScreenType], [ScreenSize]
/// and [LocalWidgetSize].
/// can be used to provide responsiveness according to calculations.
class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    required this.orientation,
    required this.deviceScreenType,
    required this.screenSize,
    required this.localWidgetSize,
  });

  @override
  String toString() {
    return '''
    Orientation: $orientation,
    DeviceScreenType: $deviceScreenType,
    ScreenSize: $screenSize,
    LocalWidgetSize: $localWidgetSize''';
  }
}

/// A Simple [StatelessWidget] to implement responsiveness
/// [builder] parameter returns relevant information about current device.
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  const ResponsiveBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, boxConstraints) {
        var sizingInformation = SizingInformation(
            orientation: mediaQuery.orientation,
            deviceScreenType: _getDeviceType(mediaQuery),
            screenSize: mediaQuery.size,
            localWidgetSize: Size(
              boxConstraints.maxWidth,
              boxConstraints.maxHeight,
            ));

        return builder(context, sizingInformation);
      },
    );
  }

  DeviceScreenType _getDeviceType(MediaQueryData mediaQuery) {
    var orientation = mediaQuery.orientation;

    double deviceWidth = 0;

    if (orientation == Orientation.landscape) {
      deviceWidth = mediaQuery.size.height;
    } else {
      deviceWidth = mediaQuery.size.width;
    }

    if (deviceWidth > 950) {
      return DeviceScreenType.desktop;
    } else if (deviceWidth > 600) {
      return DeviceScreenType.tablet;
    } else {
      return DeviceScreenType.mobile;
    }
  }
}
