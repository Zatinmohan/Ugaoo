import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

part '../raw_checkbox.dart';

/// [Sprout] is the main semantic checkbox component for
/// the Ugaoo design system.
///
/// It's a "controlled component," meaning its state (`value`) is managed by a
/// parent widget and updated via the `onChanged` callback.
///
/// ```dart
/// Sprout(
///   value: _agreedToTerms,
///   onChanged: (newValue) {
///     setState(() {
///       _agreedToTerms = newValue ?? false;
///     });
///   },
/// )
/// ```
class Sprout extends StatelessWidget {
  /// Creates a checkbox.
  ///
  /// * [value] determines whether the checkbox is checked.
  /// * [onChanged] is a callback that fires when the user taps the checkbox.
  ///   If `onChanged` is `null`, the checkbox will be visually and functionally
  ///   disabled.
  /// * [isError] can be set to `true` to display the checkbox in an error state,
  ///   which overrides other visual states.
  const Sprout({
    required this.value,
    this.onChanged,
    this.semanticLabel,
    this.isError = false,
    super.key,
  });

  /// The current state of the checkbox (true for checked, false for unchecked).
  final bool value;

  /// A callback that is called when the user taps the checkbox or its label.
  /// If this callback is null, the checkbox will be displayed
  /// in a disabled state
  /// and will not respond to user input.
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool?)? onChanged;

  /// Optional semantic label for improved accessibility.
  ///
  /// Used by screen readers to describe this checkbox.
  final String? semanticLabel;

  /// Whether the checkbox should show error styling.
  ///
  /// Useful for form validation and user feedback.
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return _RawCheckbox(
      value: value,
      onChanged: onChanged,
      semanticLabel: semanticLabel,
      isError: isError,
    );
  }
}
