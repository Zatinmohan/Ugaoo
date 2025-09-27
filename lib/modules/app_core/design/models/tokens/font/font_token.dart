import 'package:ugaoo/modules/app_core/design/models/tokens/app_token.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/font/font_family_token.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/font/font_letter_spacing_token.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/font/font_line_height_token.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/font/font_size_token.dart';

/// [FontToken] is a class that represents the font token.
class FontToken extends AppToken {
  /// Constructor of [FontToken] that requires:
  /// - [family] is the font family token
  /// - [size] is the font size token
  /// - [lineHeight] is the font line height token
  /// - [letterSpacing] is the font letter spacing token
  FontToken({
    required this.family,
    required this.size,
    required this.lineHeight,
    required this.letterSpacing,
  });

  /// Font family token
  final FontFamilyToken family;

  /// Font size token
  final FontSizeToken size;

  /// Font line height token
  final FontLineHeightToken lineHeight;

  /// Font letter spacing token
  final FontLetterSpacingToken letterSpacing;
}
