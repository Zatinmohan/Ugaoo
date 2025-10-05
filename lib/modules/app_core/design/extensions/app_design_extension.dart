import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';
import 'package:ugaoo/modules/app_core/design/models/semantics/semantics.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/token.dart';

/// [DesignContextExtension] is an extension on [BuildContext] that provides
/// a convenient way to access the app semantics.
extension DesignContextExtension on BuildContext {
  /// This method returns the width of the screen.
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// This method returns the height of the screen.
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// This method returns the radius of the screen.
  /// This method returns the color semantics of the app.
  ///
  /// Returns the color semantics of the app.
  ColorSemantics get semantics =>
      Theme.of(this).extension<AppSemanticExtension>()!.color;

  /// This method returns the spacing semantics of the app.
  SpacingSemantic get spacing =>
      Theme.of(this).extension<AppSemanticExtension>()!.spacing;

  /// This method returns the padding semantics of the app.
  PaddingSemantic get padding =>
      Theme.of(this).extension<AppSemanticExtension>()!.padding;

  /// This method returns the radius semantics of the app.
  RadiusSemantic get radius =>
      Theme.of(this).extension<AppSemanticExtension>()!.radius;

  /// This method returns the color token of the app.
  ColorToken get colorToken =>
      Theme.of(this).extension<AppTokenExtension>()!.colors;

  /// This method returns the space token of the app.
  SpaceToken get spaceToken =>
      Theme.of(this).extension<AppTokenExtension>()!.spaces;

  /// This method returns the radius token of the app.
  RadiusToken get radiusToken =>
      Theme.of(this).extension<AppTokenExtension>()!.radii;

  /// This method returns the thickness token of the app.
  ThicknessToken get thicknessToken =>
      Theme.of(this).extension<AppTokenExtension>()!.thicknesses;

  /// This method returns the font token of the app.
  FontToken get fontToken =>
      Theme.of(this).extension<AppTokenExtension>()!.fonts;
}
