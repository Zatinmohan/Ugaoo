part of 'types/tendril.dart';

/// Low-level, animated toggle used by all `Tendril` variants.
///
/// - Driven by generic type `T` via [currentValue] and [values].
/// - Uses Ugaoo design tokens for color and interaction styling.
/// - Interprets [height], [indicatorSize], [spacing] with `context.w`
///   and [padding] with `context.i` for responsive scaling.
/// - Supports [isLoading] and [semanticLabel] for UX and accessibility.
class _RawSwitcher<T extends Object> extends StatelessWidget {
  const _RawSwitcher({
    required this.currentValue,
    required this.values,
    this.padding,
    this.onChanged,
    this.semanticLabel,
    this.isLoading = false,
    this.height = 34,
    this.indicatorSize = 24,
    this.spacing = 4,
    super.key,
  });

  /// Current value of the toggle switch.
  final T currentValue;

  /// List of possible values for the switch.
  final List<T> values;

  /// Callback for when value is toggled.
  final ValueChanged<T>? onChanged;

  /// Optional accessibility label.
  final String? semanticLabel;

  /// Optional loading state.
  final bool isLoading;

  /// The height of the switcher.
  final double height;

  /// The size of the indicator.
  final double indicatorSize;

  /// The spacing of the indicator.
  final double spacing;

  /// The padding of the switcher.
  final EdgeInsetsGeometry? padding;

  ToggleStyle _getToggleStyle(BuildContext context, bool selected) {
    return ToggleStyle(
      indicatorColor: selected
          ? context.color.surface
          : context.color.surface.withValues(alpha: 0.9),
      backgroundColor: selected
          ? context.color.primary
          : context.color.disabled.withValues(alpha: 0.3),
      borderColor: selected
          ? context.color.primary.withValues(alpha: 0.4)
          : context.color.disabled.withValues(alpha: 0.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      toggled: currentValue == values.last,
      enabled: onChanged != null,
      child: AnimatedToggleSwitch<T>.rolling(
        loading: isLoading,
        current: currentValue,
        values: values,
        onChanged: onChanged,
        indicatorTransition: const ForegroundIndicatorTransition.fading(),
        height: context.w(height),
        indicatorSize: Size.square(context.w(indicatorSize)),
        animationDuration: const Duration(milliseconds: 250),
        spacing: context.w(spacing),
        padding: EdgeInsets.symmetric(
          horizontal: context.i(padding?.horizontal ?? 0),
          vertical: context.i(padding?.vertical ?? 0),
        ),
        styleBuilder: (value) => _getToggleStyle(context, value == values.last),
      ),
    );
  }
}
