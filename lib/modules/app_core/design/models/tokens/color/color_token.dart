import 'package:ugaoo/modules/app_core/design/models/tokens/app_token.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/color/color_palette_token.dart';

/// [ColorToken] is a class that represents the color token.
class ColorToken extends AppToken {
  /// Constructor of [ColorToken] that requires:
  /// - [green] is the green color palette token
  /// - [brown] is the brown color palette token
  /// - [yellow] is the yellow color palette token
  /// - [blue] is the blue color palette token
  /// - [pink] is the pink color palette token
  /// - [neutral] is the neutral color palette token
  /// - [gray] is the gray color palette token
  ColorToken({
    required this.green,
    required this.brown,
    required this.yellow,
    required this.blue,
    required this.pink,
    required this.neutral,
    required this.gray,
  });

  /// Green color palette token
  final ColorPaletteToken green;

  /// Brown color palette token
  final ColorPaletteToken brown;

  /// Yellow color palette token
  final ColorPaletteToken yellow;

  /// Blue color palette token
  final ColorPaletteToken blue;

  /// Pink color palette token
  final ColorPaletteToken pink;

  /// Neutral color palette token
  final ColorPaletteToken neutral;

  /// Gray color palette token
  final ColorPaletteToken gray;
}
