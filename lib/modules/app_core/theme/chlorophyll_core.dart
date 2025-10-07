import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';
import 'package:ugaoo/modules/app_core/theme/config/theme_config.dart';

/// [ChlorophyllCore] is a class that sets the theme for the app.
class ChlorophyllCore {
  /// Constructor of [ChlorophyllCore] that initializes
  /// the light and dark theme configs.
  ChlorophyllCore() {
    _lightThemeConfig = LightThemeConfig();
    _darkThemeConfig = DarkThemeConfig();
  }

  /// This is the light theme config.
  late final LightThemeConfig _lightThemeConfig;

  /// This is the dark theme config.
  late final DarkThemeConfig _darkThemeConfig;

  /// This returns the theme data for the app.
  ///
  /// [type] is the type of theme to return.
  ///
  /// Returns the theme data for the app.
  ///
  ThemeData theme(ThemeMode type) => switch (type) {
        ThemeMode.dark => darkTheme,
        ThemeMode.light => lightTheme,
        _ => lightTheme,
      };

  /// This returns the dark theme data for the app.
  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: _darkThemeConfig.semantics.color.primary,
        scaffoldBackgroundColor: _darkThemeConfig.semantics.color.background,
        cardColor: _darkThemeConfig.semantics.color.surface,
        canvasColor: _darkThemeConfig.semantics.color.surface,
        dividerColor: _darkThemeConfig.token.colors.gray.shade700,
        disabledColor: _darkThemeConfig.semantics.color.disabled,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          primary: _darkThemeConfig.semantics.color.primary,
          secondary: _darkThemeConfig.semantics.color.secondary,
          tertiary: _darkThemeConfig.semantics.color.accent,
          surface: _darkThemeConfig.semantics.color.surface,
          error: _darkThemeConfig.semantics.color.error,
          onPrimary: _darkThemeConfig.semantics.color.background,
          onSecondary: _darkThemeConfig.semantics.color.textSecondary,
          onSurface: _darkThemeConfig.semantics.color.textPrimary,
          seedColor: _darkThemeConfig.semantics.color.primary,
        ),
        textTheme: TextTheme(
          bodyLarge:
              TextStyle(color: _darkThemeConfig.semantics.color.textPrimary),
          bodyMedium:
              TextStyle(color: _darkThemeConfig.semantics.color.textSecondary),
        ),
      ).copyWith(
        extensions: [
          AppSemanticExtension(
            color: _darkThemeConfig.semantics.color,
            spacing: _darkThemeConfig.semantics.spacing,
            padding: _darkThemeConfig.semantics.padding,
            radius: _darkThemeConfig.semantics.radius,
            typographic: _darkThemeConfig.semantics.typographic,
          ),
          AppTokenExtension(
            colors: _darkThemeConfig.token.colors,
            spaces: _darkThemeConfig.token.spaces,
            radii: _darkThemeConfig.token.radii,
            thicknesses: _darkThemeConfig.token.thicknesses,
            fonts: _darkThemeConfig.token.fonts,
          ),
        ],
      );

  /// This returns the light theme data for the app.
  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: _lightThemeConfig.semantics.color.primary,
        scaffoldBackgroundColor: _lightThemeConfig.semantics.color.background,
        cardColor: _lightThemeConfig.semantics.color.surface,
        canvasColor: _lightThemeConfig.semantics.color.surface,
        dividerColor: _lightThemeConfig.token.colors.gray.shade700,
        disabledColor: _lightThemeConfig.semantics.color.disabled,
        colorScheme: ColorScheme.fromSeed(
          primary: _lightThemeConfig.semantics.color.primary,
          secondary: _lightThemeConfig.semantics.color.secondary,
          tertiary: _lightThemeConfig.semantics.color.accent,
          surface: _lightThemeConfig.semantics.color.surface,
          error: _lightThemeConfig.semantics.color.error,
          onPrimary: _lightThemeConfig.semantics.color.background,
          onSecondary: _lightThemeConfig.semantics.color.textSecondary,
          onSurface: _lightThemeConfig.semantics.color.textPrimary,
          seedColor: _lightThemeConfig.semantics.color.primary,
        ),
        textTheme: TextTheme(
          bodyLarge:
              TextStyle(color: _lightThemeConfig.semantics.color.textPrimary),
          bodyMedium:
              TextStyle(color: _lightThemeConfig.semantics.color.textSecondary),
        ),
      ).copyWith(
        extensions: [
          AppSemanticExtension(
            color: _lightThemeConfig.semantics.color,
            spacing: _lightThemeConfig.semantics.spacing,
            padding: _lightThemeConfig.semantics.padding,
            radius: _lightThemeConfig.semantics.radius,
            typographic: _lightThemeConfig.semantics.typographic,
          ),
          AppTokenExtension(
            colors: _lightThemeConfig.token.colors,
            spaces: _lightThemeConfig.token.spaces,
            radii: _lightThemeConfig.token.radii,
            thicknesses: _lightThemeConfig.token.thicknesses,
            fonts: _lightThemeConfig.token.fonts,
          ),
        ],
      );
}
