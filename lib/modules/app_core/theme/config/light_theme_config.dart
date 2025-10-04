part of 'theme_config.dart';

/// Holds the complete set of design tokens for the LIGHT theme.
class LightThemeConfig extends ThemeConfig {
  late final AppDesignToken _token = AppDesignToken(
    colors: ColorToken(
      green: ColorPaletteToken(
        shade50: const Color(0xffEAF7EC),
        shade100: const Color(0xffD5EFDA),
        shade200: const Color(0xffAADFB6),
        shade300: const Color(0xff80CE93),
        shade400: const Color(0xff55BD6F),
        shade500: const Color(0xff2E6F40),
        shade600: const Color(0xff275E36),
        shade700: const Color(0xff204D2C),
        shade800: const Color(0xff193C22),
        shade900: const Color(0xff122B18),
        shade950: const Color(0xff0C1A0F),
      ),
      brown: ColorPaletteToken(
        shade50: const Color(0xffF6F2EB),
        shade100: const Color(0xffE8E1D2),
        shade200: const Color(0xffD2C3A6),
        shade300: const Color(0xffBCA679),
        shade400: const Color(0xffA5804B),
        shade500: const Color(0xff936F3F),
        shade600: const Color(0xff805E32),
        shade700: const Color(0xff6E4E26),
        shade800: const Color(0xff5C3E1A),
        shade900: const Color(0xff4A2E0E),
        shade950: const Color(0xff381E02),
      ),
      blue: ColorPaletteToken(
        shade50: const Color(0xffE0F7FA),
        shade100: const Color(0xffB2EBF2),
        shade200: const Color(0xff80DEEA),
        shade300: const Color(0xff4DD0E1),
        shade400: const Color(0xff26C6DA),
        shade500: const Color(0xff00BCD4),
        shade600: const Color(0xff00ACC1),
        shade700: const Color(0xff0097A7),
        shade800: const Color(0xff00838F),
        shade900: const Color(0xff006064),
        shade950: const Color(0xff004245),
      ),
      yellow: ColorPaletteToken(
        shade50: const Color(0xffFFF9E6),
        shade100: const Color(0xffFFF2CC),
        shade200: const Color(0xffFFE999),
        shade300: const Color(0xffFFDF66),
        shade400: const Color(0xffFFD433),
        shade500: const Color(0xffFFC107),
        shade600: const Color(0xffE6AE06),
        shade700: const Color(0xffB38805),
        shade800: const Color(0xff806203),
        shade900: const Color(0xff4D3B02),
        shade950: const Color(0xff271E01),
      ),
      neutral: ColorPaletteToken(
        shade50: const Color(0xffFDF8F5),
        shade100: const Color(0xffF7F6F3),
        shade200: const Color(0xffE9E8E5),
        shade300: const Color(0xffDAD9D7),
        shade400: const Color(0xffCBCACA),
        shade500: const Color(0xffBCBCBC),
        shade600: const Color(0xffACACAC),
        shade700: const Color(0xff9C9C9C),
        shade800: const Color(0xff8D8D8D),
        shade900: const Color(0xff7D7D7D),
        shade950: const Color(0xff6D6D6D),
      ),
      gray: ColorPaletteToken(
        shade50: const Color(0xffFAFAFA),
        shade100: const Color(0xffF5F5F5),
        shade200: const Color(0xffEEEEEE),
        shade300: const Color(0xffE0E0E0),
        shade400: const Color(0xffBDBDBD),
        shade500: const Color(0xff9E9E9E),
        shade600: const Color(0xff757575),
        shade700: const Color(0xff727C6F),
        shade800: const Color(0xff424242),
        shade900: const Color(0xff2A2B2A),
        shade950: const Color(0xff1A1A1A),
      ),
      red: ColorPaletteToken(
        shade50: const Color(0xffFBEAEB),
        shade100: const Color(0xffF6D5D7),
        shade200: const Color(0xffEFAFB3),
        shade300: const Color(0xffE88A8F),
        shade400: const Color(0xffE1646B),
        shade500: const Color(0xffDC3545),
        shade600: const Color(0xffC62839),
        shade700: const Color(0xffB01B2D),
        shade800: const Color(0xff9A0E21),
        shade900: const Color(0xff840115),
        shade950: const Color(0xff6E0009),
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

  /// Returns the complete set of semantics for the LIGHT theme.
  late final AppSemantics _semantics = AppSemantics(
    color: ColorSemantics(
      primary: token.colors.green.shade500,
      secondary: token.colors.brown.shade400,
      accent: token.colors.blue.shade400,
      background: token.colors.neutral.shade50,
      surface: token.colors.neutral.shade100,
      textPrimary: token.colors.gray.shade900,
      textSecondary: token.colors.gray.shade700,
      success: token.colors.green.shade400,
      warning: token.colors.yellow.shade500,
      error: token.colors.red.shade500,
      info: token.colors.blue.shade500,
      disabled: token.colors.gray.shade400,
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
