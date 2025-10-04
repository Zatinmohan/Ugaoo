import 'package:ugaoo/modules/app_core/design/models/tokens/app_token.dart';

/// [ThicknessToken] is a class that represents the thickness token.
class ThicknessToken extends AppToken {
  /// Constructor of [ThicknessToken] that requires:
  /// - [thickness0] is the thickness0 token
  /// - [thickness1] is the thickness1 token
  /// - [thickness2] is the thickness2 token
  /// - [thickness3] is the thickness3 token
  /// - [thickness4] is the thickness4 token
  ThicknessToken({
    required this.thickness0,
    required this.thickness1,
    required this.thickness2,
    required this.thickness3,
    required this.thickness4,
  });

  /// Thickness0 token
  final double thickness0;

  /// Thickness1 token
  final double thickness1;

  /// Thickness2 token
  final double thickness2;

  /// Thickness3 token
  final double thickness3;

  /// Thickness4 token
  final double thickness4;
}
