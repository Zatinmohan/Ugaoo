import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

part '../raw_switcher.dart';

part '../tendril_mixin.dart';

part 'custom_tendril.dart';
part 'small_tendril.dart';
part 'large_tendril.dart';
part 'medium_tendril.dart';

/// The [Tendril] widget is the main semantic "switch" (toggle) component
/// for the Ugaoo design system.
///
/// It provides a themed, accessible toggle control representing an ON/OFF or true/false state,
/// styled using the app's design tokens for color and interaction feedback.
///
/// - **Controlled Component:** Its state ([value]) is managed by a parent
/// and changed via [onChanged]. The boolean semantics are
/// `false → OFF` and `true → ON`.
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
abstract class Tendril extends StatelessWidget {
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
    this.isLoading = false,
  });

  /// Creates a compact, small-sized toggle with system spacing presets.
  ///
  /// Sizing (via design tokens): height = `space6`, indicator = `space5`,
  /// spacing = `space1`, padding = `padding.condensed`.
  ///
  /// Use for dense UI regions like lists or settings.
  factory Tendril.small({
    required bool value,
    required ValueChanged<bool> onChanged,
    Key? key,
    String? semanticLabel,
    bool isLoading = false,
  }) =>
      _SmallTendril(
        key: key,
        value: value,
        onChanged: onChanged,
        semanticLabel: semanticLabel,
        isLoading: isLoading,
      );

  /// Creates a medium-sized toggle with balanced ergonomics.
  ///
  /// Sizing (via design tokens): height = `space7`, indicator = `space6`,
  /// spacing = `space1`, padding = `padding.condensed`.
  factory Tendril.medium({
    required bool value,
    required ValueChanged<bool> onChanged,
    String? semanticLabel,
    bool isLoading = false,
    Key? key,
  }) =>
      _MediumTendril(
        key: key,
        value: value,
        onChanged: onChanged,
        semanticLabel: semanticLabel,
        isLoading: isLoading,
      );

  /// Creates a large toggle optimized for emphasis and touch targets.
  ///
  /// Sizing (via design tokens): height = `space8`, indicator = `space7`,
  /// spacing = `space2`, padding = `padding.condensed`.
  factory Tendril.large({
    required bool value,
    required ValueChanged<bool> onChanged,
    Key? key,
    String? semanticLabel,
    bool isLoading = false,
  }) =>
      _LargeTendril(
        key: key,
        value: value,
        onChanged: onChanged,
        semanticLabel: semanticLabel,
        isLoading: isLoading,
      );

  /// Creates a customizable toggle where sizing is supplied by the caller.
  ///
  /// Colors and interaction feedback remain consistent with the design system
  /// and are applied by the underlying raw switcher.
  factory Tendril.custom({
    required bool value,
    required ValueChanged<bool> onChanged,
    required String semanticLabel,
    required bool isLoading,
    required double height,
    required double indicatorSize,
    required double spacing,
    required EdgeInsetsGeometry? padding,
    Key? key,
  }) =>
      _CustomTendril(
        key: key,
        value: value,
        onChanged: onChanged,
        semanticLabel: semanticLabel,
        isLoading: isLoading,
        height: height,
        indicatorSize: indicatorSize,
        spacing: spacing,
        padding: padding,
      );

  /// The current ON/OFF state of the switch.
  ///
  /// `true` means ON, `false` means OFF.
  final bool value;

  /// Called when the user toggles the switch.
  ///
  /// Receives the new value (`true` or `false`). If this is `null`,
  /// the switch will appear disabled and be non-interactable.
  final ValueChanged<bool>? onChanged;

  /// Optional, descriptive label for assistive technologies 
  /// (e.g. screen readers).
  ///
  /// Keep this concise and contextual (e.g. "Receive notifications").
  final String? semanticLabel;

  /// Visual loading affordance for the switch.
  ///
  /// This indicates a pending change or background operation. It may limit
  /// interactive feedback depending on the underlying widget, but if you
  /// must fully prevent interaction, also ensure [onChanged] is `null`.
  final bool isLoading;
}
