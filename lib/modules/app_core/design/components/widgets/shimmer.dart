import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

// A responsive, theme-aware skeleton placeholder built on top of [FadeShimmer].
///
/// This widget wraps [FadeShimmer] to:
/// - Apply responsive sizing via `context.w`, `context.h`, and `context.r`.
/// - Use theme-derived default colors when none are provided.
/// - Provide a consistent loading state for list items, cards, and text bars.
///
/// Defaults:
/// - [highlightColor] falls back to `context.color.surface` with 50% alpha.
/// - [baseColor] falls back to `context.color.disabled` with 30% alpha.
/// - [radius] defaults to 0.
///
class Shimmer extends StatelessWidget {
  /// Creates a shimmer placeholder with responsive sizing and optional colors.
  ///
  /// The [width], [height], and [radius] are specified in logical units and
  /// scaled using `context.w`, `context.h`, and `context.r` respectively.
  const Shimmer({
    required this.width,
    required this.height,
    this.radius = 0,
    this.highlightColor,
    this.baseColor,
    super.key,
  });

  /// Target width before responsive scaling via `context.w`.
  final double width;

  /// Target height before responsive scaling via `context.h`.
  final double height;

  /// Corner radius before responsive scaling via `context.r`.
  final double radius;

  /// Optional shimmer highlight color.
  /// If null, defaults to theme surface with 50% alpha.
  final Color? highlightColor;

  /// Optional base color underneath the shimmer.
  /// If null, defaults to theme disabled color with 30% alpha.
  final Color? baseColor;

  @override
  Widget build(BuildContext context) {
    return FadeShimmer(
      width: context.w(width),
      height: context.h(height),
      radius: context.r(radius),
      highlightColor:
          highlightColor ?? context.color.surface.withValues(alpha: 0.5),
      baseColor: baseColor ?? context.color.disabled.withValues(alpha: 0.3),
    );
  }
}
