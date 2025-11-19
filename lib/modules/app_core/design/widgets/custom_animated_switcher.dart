import 'package:flutter/material.dart';

/// [Bloom] is a class that extends [StatelessWidget] to create a
/// animated switcher.
class Bloom extends StatelessWidget {
  /// Constructor of [Bloom] that requires:
  /// - [child] is the child widget to be animated.
  /// - [duration] is the duration of the animation.
  /// - [reverseDuration] is the duration of the reverse animation.
  /// - [switchInCurve] is the curve of the switch in animation.
  /// - [switchOutCurve] is the curve of the switch out animation.
  /// - [transitionBuilder] is the transition builder of the animation.
  const Bloom({
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration,
    this.switchInCurve = Curves.easeInOut,
    this.switchOutCurve = Curves.easeInOut,
    this.transitionBuilder,
    this.layoutBuilder,
    super.key,
  });

  /// The duration of the animation.
  final Duration duration;

  /// The duration of the reverse animation.
  final Duration? reverseDuration;

  /// The curve of the switch in animation.
  final Curve switchInCurve;

  /// The curve of the switch out animation.
  final Curve switchOutCurve;

  /// The transition builder of the animation.
  final Widget Function(Widget, Animation<double>)? transitionBuilder;

  /// The layout builder of the animation.
  final AnimatedSwitcherLayoutBuilder? layoutBuilder;

  /// The child widget to be animated.
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      duration: duration,
      reverseDuration: reverseDuration,
      layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
      transitionBuilder: transitionBuilder ??
          (child, animation) =>
              FadeTransition(opacity: animation, child: child),
      child: child,
    );
  }
}
