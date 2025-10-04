part of 'theme_config.dart';

/// Holds the complete set of design tokens and semantics for the DARK theme.
class DarkThemeConfig extends ThemeConfig {
  /// Returns the complete set of design tokens for the DARK theme.
  /// Storing it like this so that each instance is created only once.
  late final AppDesignToken _token = AppDesignToken(
    colors: ColorToken(
      green: ColorPaletteToken(
        shade50: const Color(0xff143C22),
        shade100: const Color(0xff296A3F),
        shade200: const Color(0xff439860),
        shade300: const Color(0xff6FCF97),
        shade400: const Color(0xff8BD9AB),
        shade500: const Color(0xffA8E2BF),
        shade600: const Color(0xffC4ECD3),
        shade700: const Color(0xffD0F0DA),
        shade800: const Color(0xffDCF3E1),
        shade900: const Color(0xffE7F7E8),
        shade950: const Color(0xffF3FBF5),
      ),
      brown: ColorPaletteToken(
        shade50: const Color(0xff4A2E0E),
        shade100: const Color(0xff6E4E26),
        shade200: const Color(0xff936F3F),
        shade300: const Color(0xffBDA072),
        shade400: const Color(0xffC9B38B),
        shade500: const Color(0xffD5C5A5),
        shade600: const Color(0xffE1D8BE),
        shade700: const Color(0xffE8E1CB),
        shade800: const Color(0xffEEE9D8),
        shade900: const Color(0xffF4F2E5),
        shade950: const Color(0xffFAF8F2),
      ),
      blue: ColorPaletteToken(
        shade50: const Color(0xff004245),
        shade100: const Color(0xff006064),
        shade200: const Color(0xff00838F),
        shade300: const Color(0xff0097A7),
        shade400: const Color(0xff00ACC1),
        shade500: const Color(0xff00BCD4),
        shade600: const Color(0xff26C6DA),
        shade700: const Color(0xff4DD0E1),
        shade800: const Color(0xff80DEEA),
        shade900: const Color(0xffB2EBF2),
        shade950: const Color(0xffE0F7FA),
      ),
      yellow: ColorPaletteToken(
        shade50: const Color(0xff4D3B02),
        shade100: const Color(0xff806203),
        shade200: const Color(0xffB38805),
        shade300: const Color(0xffE6AE06),
        shade400: const Color(0xffFFC107),
        shade500: const Color(0xffFFD433),
        shade600: const Color(0xffFFDF66),
        shade700: const Color(0xffFFE999),
        shade800: const Color(0xffFFF2CC),
        shade900: const Color(0xffFFF9E6),
        shade950: const Color(0xffFFFCF2),
      ),
      neutral: ColorPaletteToken(
        shade50: const Color(0xffE9E8E5),
        shade100: const Color(0xffDAD9D7),
        shade200: const Color(0xffCBCACA),
        shade300: const Color(0xffBCBCBC),
        shade400: const Color(0xffACACAC),
        shade500: const Color(0xff9C9C9C),
        shade600: const Color(0xff8D8D8D),
        shade700: const Color(0xff263B36),
        shade800: const Color(0xff232823),
        shade900: const Color(0xff181D1A),
        shade950: const Color(0xff0C1A0F),
      ),
      gray: ColorPaletteToken(
        shade50: const Color(0xffF7F6F3),
        shade100: const Color(0xffE0E0E0),
        shade200: const Color(0xffCBCBCB),
        shade300: const Color(0xffA8A8A8),
        shade400: const Color(0xff8D8D8D),
        shade500: const Color(0xff727272),
        shade600: const Color(0xff575757),
        shade700: const Color(0xff47544C),
        shade800: const Color(0xff212825),
        shade900: const Color(0xff1A1A1A),
        shade950: const Color(0xff000000),
      ),
      red: ColorPaletteToken(
        shade50: const Color(0xff9A0E21),
        shade100: const Color(0xffB01B2D),
        shade200: const Color(0xffC62839),
        shade300: const Color(0xffE1646B),
        shade400: const Color(0xffFF6F6F),
        shade500: const Color(0xffFF8F8F),
        shade600: const Color(0xffFFAFAF),
        shade700: const Color(0xffFFCFCF),
        shade800: const Color(0xffFFEFEF),
        shade900: const Color(0xffFFF5F5),
        shade950: const Color(0xffFFFAFA),
      ),
    ),
    spaces: spaceToken,
    radii: radiusToken,
    thicknesses: thicknessToken,
    fonts: FontToken(
      family: fontFamilyToken,
      size: fontSizeToken,
      lineHeight: fontLineHeightToken,
      letterSpacing: fontLetterSpacingToken,
    ),
  );

  @override
  AppDesignToken get token => _token;

  @override
  AppSemantics get semantics => _semantics;

  late final AppSemantics _semantics = AppSemantics(
    color: ColorSemantics(
      primary: token.colors.green.shade300,
      secondary: token.colors.brown.shade300,
      accent: token.colors.yellow.shade400,
      background: token.colors.neutral.shade900,
      surface: token.colors.neutral.shade700,
      textPrimary: token.colors.gray.shade50,
      textSecondary: token.colors.gray.shade300,
      success: token.colors.green.shade400,
      warning: token.colors.yellow.shade400,
      error: token.colors.red.shade400,
      info: token.colors.blue.shade500,
      disabled: token.colors.gray.shade700,
    ),
    spacing: SpacingSemantic(
      intimate: token.spaces.space1,
      personal: token.spaces.space2,
      social: token.spaces.space4,
      public: token.spaces.space6,
      global: token.spaces.space8,
    ),
    padding: PaddingSemantic(
      condensed: token.spaces.space1,
      compact: token.spaces.space2,
      regular: token.spaces.space4,
      relaxed: token.spaces.space5,
      expanded: token.spaces.space6,
    ),
    radius: RadiusSemantic(
      small: token.radii.radius2,
      medium: token.radii.radius3,
      large: token.radii.radius5,
    ),
  );
}
