import 'package:ugaoo/modules/app_core/design/models/tokens/app_token.dart';

/// [FontSizeToken] is a class that represents the font size token.
class FontSizeToken extends AppToken {
  /// Constructor of [FontSizeToken] that requires:
  /// - [xSmall] is the xSmall token
  /// - [small] is the small token
  /// - [medium] is the medium token
  /// - [large] is the large token
  /// - [xLarge] is the xLarge token
  FontSizeToken({
    required this.xSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.xLarge,
  });

  /// XSmall token
  final double xSmall;

  /// Small token
  final double small;

  /// Medium token
  final double medium;

  /// Large token
  final double large;

  /// XLarge token
  final double xLarge;
}
