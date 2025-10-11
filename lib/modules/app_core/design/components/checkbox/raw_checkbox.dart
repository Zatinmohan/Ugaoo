part of '../checkbox/types/sprout.dart';

/// [_RawCheckbox] is a styled, primitive checkbox component
/// for the design system.
///
/// This widget wraps Flutter's `Checkbox.adaptive` to provide a consistent
/// look and feel that aligns with the app's design tokens for colors, shapes,
/// and states (e.g., error, disabled).
///
/// It's designed as a "controlled component," meaning its state (`value`) is
/// managed by a parent widget and updated via the `onChanged` callback.
class _RawCheckbox extends StatelessWidget {
  /// Creates a styled checkbox.
  ///
  /// * [value] determines whether the checkbox is checked.
  /// * [onChanged] is a callback that fires when the user taps the checkbox.
  ///   If `onChanged` is `null`, the checkbox will be visually and functionally
  ///   disabled.
  /// * [isError] can be set to `true` to display the checkbox in an error state,
  ///   which overrides other visual states.
  const _RawCheckbox({
    required this.value,
    this.onChanged,
    this.semanticLabel,
    this.isError = false,
  });

  /// The current state of the checkbox
  /// (`true` for checked, `false` for unchecked).
  final bool value;

  /// A callback that is called when the user taps the checkbox.
  ///
  /// If this callback is `null`, the checkbox will be
  /// displayed in a disabled state and will not respond to user input.
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool?)? onChanged;

  /// The semantic label for the checkbox, used by accessibility tools like
  /// screen readers.
  final String? semanticLabel;

  /// Whether the checkbox should be displayed in an error state.
  ///
  /// When `true`, the border will be rendered using the semantic `error` color,
  /// taking precedence over other states.
  final bool isError;

  BorderSide _getBorder(BuildContext context, Set<WidgetState> states) {
    if (isError) {
      return BorderSide(
        color: context.color.error,
        width: 2,
      );
    }
    if (states.contains(WidgetState.disabled)) {
      return BorderSide(
        color: context.color.disabled.withValues(alpha: 0.5),
        width: 2,
      );
    }

    if (states.contains(WidgetState.selected)) {
      return BorderSide(
        color: context.color.primary,
        width: 2,
      );
    }

    return BorderSide(
      color: context.color.disabled,
      width: 1.5,
    );
  }

  Color _getFillColor(BuildContext context, Set<WidgetState> states) {
    if (isError) return context.color.error.withValues(alpha: value ? 1 : 0.1);
    if (states.contains(WidgetState.disabled)) {
      return context.color.disabled.withValues(alpha: 0.2);
    }
    if (states.contains(WidgetState.selected)) return context.color.primary;
    return context.color.surface;
  }

  Color? _getOverlayColor(BuildContext context, Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      return context.color.primary.withValues(alpha: 0.08);
    }
    if (states.contains(WidgetState.hovered)) {
      return context.color.primary.withValues(alpha: 0.06);
    }
    if (states.contains(WidgetState.focused)) {
      return context.color.primary.withValues(alpha: 0.10);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox.adaptive(
      key: key,
      value: value,
      onChanged: onChanged,
      semanticLabel: semanticLabel,
      visualDensity: VisualDensity.compact,
      isError: isError,
      fillColor: WidgetStateProperty.resolveWith<Color?>(
        (states) => _getFillColor(context, states),
      ),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (states) => _getOverlayColor(context, states),
      ),
      side: WidgetStateBorderSide.resolveWith(
          (states) => _getBorder(context, states)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.r(context.radius.small)),
      ),
    );
  }
}
