import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ugaoo/modules/app_core/design/components/sizebox/stem.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';
import 'package:ugaoo/modules/app_core/design/widgets/custom_animated_switcher.dart';

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
  /// - [child] is the child widget to be shimmer.
  /// - [highlightColor] is the color of the shimmer highlight.
  /// - [baseColor] is the color of the shimmer base.
  /// - [duration] is the duration of the shimmer animation.
  const ShimmerWidget({
    required this.child,
    this.highlightColor,
    this.baseColor,
    this.duration = const Duration(milliseconds: 1500),
    this.isLoading = false,
    super.key,
  });

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

  /// The loading state of the shimmer.
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        IgnorePointer(
          ignoring: isLoading,
          child: Bloom(
            child: isLoading
                ? Shimmer.fromColors(
                    highlightColor: highlightColor ??
                        context.color.surface.withValues(alpha: 0.5),
                    baseColor: baseColor ??
                        context.color.disabled.withValues(alpha: 0.3),
                    period: duration,
                    child: child,
                  )
                : Stem.none(),
          ),
        ),
      ],
    );
  }
}
