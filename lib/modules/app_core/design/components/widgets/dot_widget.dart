import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

/// A widget that displays a dot.
class DotWidget extends StatelessWidget {
  /// Create instance of [DotWidget] that requires
  /// - [width] - The width of the dot.
  /// - [height] - The height of the dot.
  /// - [aroundPadding] - The padding around the dot.
  /// - [dotColor] - The color of the dot.
  const DotWidget({
    this.width = 4,
    this.height = 4,
    this.aroundPadding,
    this.dotColor,
    super.key,
  });

  /// The width of the dot.
  final double width;

  /// The height of the dot.
  final double height;

  /// The padding around the dot.
  final EdgeInsets? aroundPadding;

  /// The color of the dot.
  final Color? dotColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: aroundPadding == null
          ? EdgeInsets.symmetric(
              horizontal: context.i(context.padding.condensed),
            )
          : aroundPadding!,
      child: SizedBox(
        width: context.w(width),
        height: context.w(height),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: dotColor ?? context.color.disabled.withAlpha(225),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
