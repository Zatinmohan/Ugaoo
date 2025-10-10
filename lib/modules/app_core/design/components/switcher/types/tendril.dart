import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

part '../raw_switcher.dart';

/// The [Tendril] widget is the main semantic "switch" (toggle) component
/// for the Ugaoo design system.
///
/// It provides a themed, accessible toggle control representing an ON/OFF or true/false state,
/// styled using the app's design tokens for color and interaction feedback.
///
/// - **Controlled Component:** Its state ([value]) is managed by a parent
/// and changed via [onChanged].
/// - **Thematic Naming:** The name "Tendril" fits
/// Ugaoo's plant-inspired system.
/// - **Accessibility:** Designed for accessible, interactive toggles.
/// - **Customization:** Uses design tokens and internal [_RawSwitcher]
///  for consistent system styling.
///
/// ## Example Usage
/// ```dart
/// Tendril(
///   value: isEnabled,
///   onChanged: (newValue) {
///     setState(() {
///       isEnabled = newValue;
///     });
///   },
/// )
/// ```
class Tendril extends StatelessWidget {
  /// Creates a Ugaoo design system switch (toggle) control.
  ///
  /// - [value]: The current ON/OFF state of the switch.
  /// - [onChanged]: Called when the user toggles the switch.
  ///   If `null`, the switch is disabled and cannot be interacted with.
  const Tendril({
    required this.value,
    super.key,
    this.onChanged,
    this.semanticLabel,
  });

  /// The current ON/OFF state of the switch.
  ///
  /// `true`: Switch is ON.
  /// `false`: Switch is OFF.
  final bool value;

  /// Called when the user toggles the switch.
  ///
  /// Receives the new value (`true` or `false`) as a callback.
  /// If this is `null`, the switch will appear disabled and
  /// be non-interactable.
  final ValueChanged<bool>? onChanged;

  /// The semantic label for the switch.
  ///
  /// Used by accessibility tools like screen readers to describe the switch.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return _RawSwitcher(
      value: value,
      onChanged: onChanged,
      semanticLabel: semanticLabel,
    );
  }
}
