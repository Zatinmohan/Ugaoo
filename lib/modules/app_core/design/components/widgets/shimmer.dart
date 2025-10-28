import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

// A responsive, theme-aware skeleton placeholder built on top of [FadeShimmer].
///
/// This widget wraps [Shimmer] to:
/// - Apply responsive sizing via `context.w`, `context.h`, and `context.r`.
/// - Use theme-derived default colors when none are provided.
/// - Provide a consistent loading state for list items, cards, and text bars.
///
/// Defaults:
/// - [highlightColor] falls back to `context.color.surface` with 50% alpha.
/// - [baseColor] falls back to `context.color.disabled` with 30% alpha
///
class ShimmerWidget extends StatelessWidget {
  /// Creates a shimmer placeholder with responsive sizing and optional colors.
  ///
  /// The [width], [height], and [duration] are specified in logical units and
  /// scaled using `context.w`, `context.h`, and `context.r` respectively.
  const ShimmerWidget({
    required this.width,
    required this.height,
    required this.child,
    this.highlightColor,
    this.baseColor,
    this.duration = const Duration(milliseconds: 1500),
    super.key,
  });

  /// Target width before responsive scaling via `context.w`.
  final double width;

  /// Target height before responsive scaling via `context.h`.
  final double height;

  /// Optional shimmer highlight color.
  /// If null, defaults to theme surface with 50% alpha.
  final Color? highlightColor;

  /// Optional base color underneath the shimmer.
  /// If null, defaults to theme disabled color with 30% alpha.
  final Color? baseColor;

  /// The child widget to be shimmer.
  final Widget child;

  /// The duration of the shimmer animation.
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor:
          highlightColor ?? context.color.surface.withValues(alpha: 0.5),
      baseColor: baseColor ?? context.color.disabled.withValues(alpha: 0.3),
      period: duration,
      child: child,
    );
  }
}
