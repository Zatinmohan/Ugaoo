import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/basic/radius_token.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/basic/space_token.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/basic/thickness_token.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/color/color_token.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/font/font_token.dart';

/// [AppTokenExtension] is a class that extends [ThemeExtension] to provide
/// the app primitives.
class AppTokenExtension extends ThemeExtension<AppTokenExtension> {
  /// Constructor of [AppTokenExtension] that requires:
  /// - [colors] is the color token
  /// - [spaces] is the space token
  /// - [radii] is the radius token
  /// - [thicknesses] is the thickness token
  /// - [fonts] is the font token
  const AppTokenExtension({
    required this.colors,
    required this.spaces,
    required this.radii,
    required this.thicknesses,
    required this.fonts,
  });

  @override
  ThemeExtension<AppTokenExtension> copyWith({
    ColorToken? colors,
    SpaceToken? spaces,
    RadiusToken? radii,
    ThicknessToken? thicknesses,
    FontToken? fonts,
  }) =>
      AppTokenExtension(
        colors: colors ?? this.colors,
        spaces: spaces ?? this.spaces,
        radii: radii ?? this.radii,
        thicknesses: thicknesses ?? this.thicknesses,
        fonts: fonts ?? this.fonts,
      );

  @override
  ThemeExtension<AppTokenExtension> lerp(
          covariant ThemeExtension<AppTokenExtension>? other, double t) =>
      this;

  /// Color token
  final ColorToken colors;

  /// Space token
  final SpaceToken spaces;

  /// Radius token
  final RadiusToken radii;

  /// Thickness token
  final ThicknessToken thicknesses;

  /// Font token
  final FontToken fonts;
}
