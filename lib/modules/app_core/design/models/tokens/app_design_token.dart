import 'package:ugaoo/modules/app_core/design/models/tokens/basic/radius_token.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/basic/space_token.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/basic/thickness_token.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/color/color_token.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/font/font_token.dart';

/// [AppDesignToken] is a class that represents the app design token.
class AppDesignToken {
  /// Constructor of [AppDesignToken] that requires:
  /// - [colors] is the color token
  /// - [spaces] is the space token
  /// - [radii] is the radius token
  /// - [thicknesses] is the thickness token
  /// - [fonts] is the font token
  const AppDesignToken({
    required this.colors,
    required this.spaces,
    required this.radii,
    required this.thicknesses,
    required this.fonts,
  });

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
