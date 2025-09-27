import 'package:ugaoo/modules/app_core/design/models/tokens/app_token.dart';

/// [FontFamilyToken] is a class that represents the font family token.
class FontFamilyToken extends AppToken {
  /// Constructor of [FontFamilyToken] that requires:
  /// - [body] is the body token
  /// - [title] is the title token
  FontFamilyToken({
    required this.body,
    required this.title,
  });

  /// Name of the body font family
  final String body;

  /// Name of the title font family
  final String title;
}
