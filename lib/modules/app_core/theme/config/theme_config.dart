import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/models/semantics/semantics.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/token.dart';

part 'light_theme_config.dart';
part 'dark_theme_config.dart';

/// [ThemeConfig] is an abstract class that holds the complete
/// set of design tokens and semantics for the theme.
abstract class ThemeConfig {
  /// Returns the complete set of semantics for the theme.
  AppSemantics get semantics;

  /// Returns the complete set of design tokens for the theme.
  AppDesignToken get token;

  /// Returns the complete set of space tokens for the theme.
  SpaceToken get spaceToken => SpaceToken(
        space0: 0,
        space1: 4,
        space2: 8,
        space3: 12,
        space4: 16,
        space5: 24,
        space6: 32,
        space7: 48,
        space8: 64,
      );

  /// Returns the complete set of radius tokens for the theme.
  RadiusToken get radiusToken => RadiusToken(
        radius0: 0,
        radius1: 2,
        radius2: 4,
        radius3: 8,
        radius4: 12,
        radius5: 16,
        circle: 999,
      );

  /// Returns the complete set of thickness tokens for the theme.
  ThicknessToken get thicknessToken => ThicknessToken(
        thickness0: 0,
        thickness1: 1,
        thickness2: 2,
        thickness3: 4,
        thickness4: 8,
      );

  /// Returns the complete set of font family tokens for the theme.
  FontFamilyToken get fontFamilyToken => FontFamilyToken(
        body: 'Inter',
        title: 'Poppins',
      );

  /// Returns the complete set of font size tokens for the theme.
  FontSizeToken get fontSizeToken => FontSizeToken(
        xSmall: 12,
        small: 14,
        medium: 16,
        large: 20,
        xLarge: 24,
      );

  /// Returns the complete set of font line height tokens for the theme.
  FontLineHeightToken get fontLineHeightToken => FontLineHeightToken(
        height0: 1,
        height1: 1.25,
        height2: 1.5,
        height3: 1.75,
        height4: 2,
      );

  /// Returns the complete set of font letter spacing tokens for the theme.
  FontLetterSpacingToken get fontLetterSpacingToken => FontLetterSpacingToken(
        loose: -0.25,
        normal: 0,
        tight: 0.25,
      );

  /// Returns the complete set of typographic semantics for the theme.
  TypographicSemantics get typographicSemantics => TypographicSemantics(
        display: TextStyle(
          fontSize: fontSizeToken.xLarge,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamilyToken.title,
          height: fontLineHeightToken.height1,
          letterSpacing: fontLetterSpacingToken.tight,
        ),
        headline: TextStyle(
          fontSize: fontSizeToken.large,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamilyToken.title,
          height: fontLineHeightToken.height2,
          letterSpacing: fontLetterSpacingToken.normal,
        ),
        title: TextStyle(
          fontSize: fontSizeToken.medium,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamilyToken.title,
          height: fontLineHeightToken.height2,
          letterSpacing: fontLetterSpacingToken.normal,
        ),
        bodyLarge: TextStyle(
          fontSize: fontSizeToken.medium,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamilyToken.body,
          height: fontLineHeightToken.height3,
          letterSpacing: fontLetterSpacingToken.normal,
        ),
        bodyMedium: TextStyle(
          fontSize: fontSizeToken.small,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamilyToken.body,
          height: fontLineHeightToken.height3,
          letterSpacing: fontLetterSpacingToken.normal,
        ),
        label: TextStyle(
          fontSize: fontSizeToken.xSmall,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamilyToken.body,
          height: fontLineHeightToken.height1,
          letterSpacing: fontLetterSpacingToken.normal,
        ),
        caption: TextStyle(
          fontSize: fontSizeToken.xSmall,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamilyToken.body,
          height: fontLineHeightToken.height1,
          letterSpacing: fontLetterSpacingToken.tight,
        ),
      );
}
