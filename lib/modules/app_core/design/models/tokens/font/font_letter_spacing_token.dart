import 'package:ugaoo/modules/app_core/design/models/tokens/app_token.dart';

/// [FontLetterSpacingToken] is a class that represents the
/// font letter spacing token.
class FontLetterSpacingToken extends AppToken {
  /// Constructor of [FontLetterSpacingToken] that requires:
  /// - [loose] is the loose token
  /// - [normal] is the normal token
  /// - [tight] is the tight token
  FontLetterSpacingToken({
    required this.loose,
    required this.normal,
    required this.tight,
  });

  /// Loose token
  final double loose;

  /// Normal token
  final double normal;

  /// Tight token
  final double tight;
}
