import 'dart:ui';

import 'package:flutter/material.dart';

/// A widget that applies a blur effect to its child.
class BlurWidget extends StatelessWidget {
  /// Create instance of [BlurWidget] that requires
  /// - [child] - The widget to be blurred.
  /// - [sigmaX] - The amount of blur in the x direction.
  /// - [sigmaY] - The amount of blur in the y direction.
  /// - [blendMode] - The blend mode to use when applying the blur.
  /// - [enable] - Whether to enable the blur effect.
  const BlurWidget({
    required this.child,
    this.sigmaX = 10,
    this.sigmaY = 10,
    this.blendMode = BlendMode.srcOver,
    this.enable = true,
    super.key,
  });

  /// The amount of blur in the x direction.
  final double sigmaX;

  /// The amount of blur in the y direction.
  final double sigmaY;

  /// The widget to be blurred.
  final Widget child;

  /// The blend mode to use when applying the blur.
  final BlendMode blendMode;

  /// Whether to enable the blur effect.
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
      blendMode: blendMode,
      enabled: enable,
      child: child,
    );
  }
}
