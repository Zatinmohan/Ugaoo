import 'package:flutter/material.dart';

/// [AppWidgetExtension] is an extension on [Widget] that provides a
/// convenient way to access the app widget.
extension AppWidgetExtension on Widget {
  /// This method returns the widget with the safe area.
  Widget supportOnScreenNavigationButtonWidget({
    bool top = false,
    bool left = false,
    bool right = false,
  }) =>
      SafeArea(
        top: top,
        left: left,
        right: right,
        child: this,
      );
}
