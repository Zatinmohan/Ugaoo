import 'package:flutter/material.dart';

/// [ColorSemantics] is a class that represents the color semantics.
class ColorSemantics {
  /// Constructor of [ColorSemantics] that requires:
  /// - [primary] is the primary color
  /// - [secondary] is the secondary color
  /// - [accent] is the accent color
  /// - [background] is the background color
  /// - [surface] is the surface color
  /// - [textPrimary] is the primary text color
  /// - [textSecondary] is the secondary text color
  /// - [success] is the success color
  /// - [warning] is the warning color
  /// - [error] is the error color
  /// - [info] is the info color
  /// - [disabled] is the disabled color
  const ColorSemantics({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.disabled,
  });

  /// Primary color
  final Color primary;

  /// Secondary color
  final Color secondary;

  /// Accent color
  final Color accent;

  /// Background color
  final Color background;

  /// Surface color
  final Color surface;

  /// Primary text color
  final Color textPrimary;

  /// Secondary text color
  final Color textSecondary;

  /// Success color
  final Color success;

  /// Warning color
  final Color warning;

  /// Error color
  final Color error;

  /// Info color
  final Color info;

  /// Disabled color
  final Color disabled;
}
