import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/models/tokens/app_token.dart';

/// [ColorPaletteToken] is a class that represents the color palette token.
class ColorPaletteToken extends AppToken {
  /// Constructor of [ColorPaletteToken] that requires:
  /// - [shade50] is the shade50 token
  /// - [shade100] is the shade100 token
  /// - [shade200] is the shade200 token
  /// - [shade300] is the shade300 token
  /// - [shade400] is the shade400 token
  /// - [shade500] is the shade500 token
  /// - [shade600] is the shade600 token
  /// - [shade700] is the shade700 token
  /// - [shade800] is the shade800 token
  /// - [shade900] is the shade900 token
  /// - [shade950] is the shade950 token
  ColorPaletteToken({
    required this.shade50,
    required this.shade100,
    required this.shade200,
    required this.shade300,
    required this.shade400,
    required this.shade500,
    required this.shade600,
    required this.shade700,
    required this.shade800,
    required this.shade900,
    required this.shade950,
  });

  /// Shade50 token
  final Color shade50;

  /// Shade100 token
  final Color shade100;

  /// Shade200 token
  final Color shade200;

  /// Shade300 token
  final Color shade300;

  /// Shade400 token
  final Color shade400;

  /// Shade500 token
  final Color shade500;

  /// Shade600 token
  final Color shade600;

  /// Shade700 token
  final Color shade700;

  /// Shade800 token
  final Color shade800;

  /// Shade900 token
  final Color shade900;

  /// Shade950 token
  final Color shade950;
}
