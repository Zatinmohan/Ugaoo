import 'package:ugaoo/modules/app_core/design/models/tokens/app_token.dart';

/// [RadiusToken] is a class that represents the radius token.
class RadiusToken extends AppToken {
  /// Constructor of [RadiusToken] that requires:
  /// - [radius0] is the radius0 primitive
  /// - [radius1] is the radius1 primitive
  /// - [radius2] is the radius2 primitive
  /// - [radius3] is the radius3 primitive
  /// - [radius4] is the radius4 primitive
  /// - [radius5] is the radius5 primitive
  /// - [circle] is the circle primitive
  RadiusToken({
    required this.radius0,
    required this.radius1,
    required this.radius2,
    required this.radius3,
    required this.radius4,
    required this.radius5,
    required this.circle,
  });

  /// Radius0 primitive
  final double radius0;

  /// Radius1 primitive
  final double radius1;

  /// Radius2 primitive
  final double radius2;

  /// Radius3 primitive
  final double radius3;

  /// Radius4 primitive
  final double radius4;

  /// Radius5 primitive
  final double radius5;

  /// Circle primitive
  final double circle;
}
