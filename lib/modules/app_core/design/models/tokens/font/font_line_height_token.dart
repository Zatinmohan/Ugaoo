import 'package:ugaoo/modules/app_core/design/models/tokens/app_token.dart';

/// [FontLineHeightToken] is a class that represents the
/// font line height token.
class FontLineHeightToken extends AppToken {
  /// Constructor of [FontLineHeightToken] that requires:
  /// - [height0] is the height0 token
  /// - [height1] is the height1 token
  /// - [height2] is the height2 token
  /// - [height3] is the height3 token
  /// - [height4] is the height4 token
  FontLineHeightToken({
    required this.height0,
    required this.height1,
    required this.height2,
    required this.height3,
    required this.height4,
  });

  /// Height0 token
  final double height0;

  /// Height1 token
  final double height1;

  /// Height2 token
  final double height2;

  /// Height3 token
  final double height3;

  /// Height4 token
  final double height4;
}
