import 'package:ugaoo/modules/app_core/design/models/semantics/color_semantics.dart';
import 'package:ugaoo/modules/app_core/design/models/semantics/padding_semantic.dart';
import 'package:ugaoo/modules/app_core/design/models/semantics/radius_semantic.dart';
import 'package:ugaoo/modules/app_core/design/models/semantics/spacing_semantic.dart';

/// [AppSemantics] is a class that represents the app semantics.
class AppSemantics {
  /// Constructor of [AppSemantics] that requires:
  /// - [color] is the color semantics
  /// - [spacing] is the spacing semantics
  /// - [padding] is the padding semantics
  /// - [radius] is the radius semantics
  const AppSemantics({
    required this.color,
    required this.spacing,
    required this.padding,
    required this.radius,
  });

  /// Color semantics
  final ColorSemantics color;

  /// Spacing semantics
  final SpacingSemantic spacing;

  /// Padding semantics
  final PaddingSemantic padding;

  /// Radius semantics
  final RadiusSemantic radius;
}
