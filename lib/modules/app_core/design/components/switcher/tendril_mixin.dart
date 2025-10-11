part of 'types/tendril.dart';

/// Internal mixin that bridges `Tendril` to the raw switcher.
///
/// - Standardizes boolean semantics with values `[false, true]`.
/// - Forwards sizing and padding to `_RawSwitcher` while keeping
///   color and interaction styling centralized in the raw component.
mixin _TendrilMixin on Tendril {
  Widget buildTendril(
    BuildContext context, {
    required double height,
    required double indicatorSize,
    required double spacing,
    required EdgeInsetsGeometry? padding,
  }) {
    return _RawSwitcher<bool>(
      currentValue: value,
      values: const [false, true],
      onChanged: onChanged,
      semanticLabel: semanticLabel,
      isLoading: isLoading,
      height: height,
      indicatorSize: indicatorSize,
      spacing: spacing,
      padding: padding,
    );
  }
}
