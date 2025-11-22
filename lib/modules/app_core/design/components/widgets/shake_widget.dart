import 'dart:math';

import 'package:flutter/material.dart';

/// A reusable shake/tilt effect that translates its [child] horizontally
/// using a sinusoidal motion driven by an external [AnimationController].
///
/// This widget:
/// - Listens to the provided [animationController] and maps its 0–1 progress
///   to a horizontal oscillation via `sin(2π * shakeCounts * progress)`.
/// - Uses [shakeIntensity] as the maximum pixel offset amplitude.
/// - Applies an easing [curve] to the animation using [CurvedAnimation].
/// - Supports left-to-right or right-to-left bias via [shakeDirection].
///
/// Important:
/// - The [animationController] is owned and disposed by the caller. Ensure you
///   set its `duration` and trigger it (e.g., `forward(from: 0)`).
/// - The [duration] parameter here is informational; it is not applied to the
///   provided controller. Keep them consistent to avoid confusion.
///
class ShakeWidget extends StatefulWidget {
  /// Parameters:
  /// - [child]: The widget to shake.
  /// - [animationController]: External controller; drives the
  /// animation progress.
  /// - [shakeCounts]: Number of full oscillations over the
  /// controller’s 0–1 span.
  /// - [shakeIntensity]: Max horizontal offset in logical pixels (amplitude).
  /// - [curve]: Easing for the animation progress
  /// (default: [Curves.bounceOut]).
  /// - [shakeDirection]: Horizontal direction bias (default: left-to-right).
  /// - [duration]: Intended total duration of the shake; informational only.
  ///
  const ShakeWidget({
    required this.child,
    required this.animationController,
    this.shakeCounts = 4,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.bounceOut,
    this.shakeIntensity = 5,
    this.shakeDirection = ShakeDirection.leftToRight,
    super.key,
  });

  /// The widget to apply the shake transform to.
  final Widget child;

  /// Intended total duration of the shake animation.
  ///
  /// Note: This value is not applied to [animationController]. You should set
  /// the same duration on the provided controller for consistency.
  final Duration duration;

  /// Number of complete oscillations over the animation’s 0–1 progress.
  ///
  /// For example, a value of 4 creates four back-and-forth cycles.
  final int shakeCounts;

  /// Easing curve applied to the animation via [CurvedAnimation].
  final Curve curve;

  /// External controller that drives the animation progress.
  ///
  /// The caller is responsible for lifecycle management and triggering.
  final AnimationController animationController;

  /// Maximum horizontal offset in logical pixels (amplitude of the shake).
  final int shakeIntensity;

  /// Directional bias for the shake movement.
  final ShakeDirection shakeDirection;

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin<ShakeWidget> {
  late Animation<double> animation;

  @override
  void initState() {
    animation = CurvedAnimation(
        parent: widget.animationController, curve: widget.curve);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      key: widget.key,
      animation: animation,
      builder: (context, child) {
        var shakeOffset = 0.0;

        if (widget.animationController.isAnimating) {
          final progress = animation.value;
          // Sine wave: amplitude * sin(2π * frequency * t)
          shakeOffset = widget.shakeIntensity *
              sin(
                2 * pi * widget.shakeCounts * progress,
              );
        }

        return Transform.translate(
          offset: Offset(
              shakeOffset *
                  (widget.shakeDirection == ShakeDirection.leftToRight
                      ? 1
                      : -1),
              0),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

/// Direction of the horizontal shake bias.
enum ShakeDirection {
  /// Positive horizontal offset first (left-to-right motion).
  leftToRight,

  /// Negative horizontal offset first (right-to-left motion).
  rightToLeft,
}
