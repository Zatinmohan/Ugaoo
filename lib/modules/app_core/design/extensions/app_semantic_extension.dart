import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/models/semantics/semantics.dart';

/// [AppSemanticExtension] is a class that extends [ThemeExtension] to provide
/// the app semantics.
class AppSemanticExtension extends ThemeExtension<AppSemanticExtension> {
  /// Constructor of [AppSemanticExtension] that requires:
  /// - [color] is the color semantics
  /// - [spacing] is the spacing semantics
  /// - [padding] is the padding semantics
  /// - [radius] is the radius semantics
  const AppSemanticExtension({
    required this.color,
    required this.spacing,
    required this.padding,
    required this.radius,
    required this.typographic,
  });

  @override
  ThemeExtension<AppSemanticExtension> copyWith({
    ColorSemantics? color,
    SpacingSemantic? spacing,
    PaddingSemantic? padding,
    RadiusSemantic? radius,
    TypographicSemantics? typographic,
  }) =>
      AppSemanticExtension(
        color: color ?? this.color,
        spacing: spacing ?? this.spacing,
        padding: padding ?? this.padding,
        radius: radius ?? this.radius,
        typographic: typographic ?? this.typographic,
      );

  @override
  ThemeExtension<AppSemanticExtension> lerp(
          covariant ThemeExtension<AppSemanticExtension>? other, double t) =>
      this;

  /// Color semantics

  final ColorSemantics color;

  /// Spacing semantics
  final SpacingSemantic spacing;

  /// Padding semantics
  final PaddingSemantic padding;

  /// Radius semantics
  final RadiusSemantic radius;

  /// Typographic semantics
  final TypographicSemantics typographic;
}
