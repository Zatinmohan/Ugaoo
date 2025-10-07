import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/modules/app_core/design/components/text/raw_text.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

part 'titles/display_bud.dart';
part 'titles/headline_bud.dart';
part 'titles/title_bud.dart';

part 'body/body_large.dart';
part 'body/body_medium.dart';
part 'body/label.dart';
part 'body/caption.dart';

/// [Bud] is an abstract class that extends [RawText] and
/// is used to display text.
@sealed
abstract class Bud extends StatelessWidget {
  /// Constructor of [Bud] that requires:
  /// - [text] is the text to display in the text field.
  /// - [color] is the color to display in the text field.
  /// - [maxLines] is the max lines to display in the text field.
  /// - [overflow] is the overflow to display in the text field.
  /// - [softWrap] is the soft wrap to display in the text field.
  /// - [textAlign] is the text align to display in the text field.
  /// - [decoration] is the decoration to display in the text field.
  /// - [textDirection] is the text direction to display in the text field.
  const Bud({
    required this.text,
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.textAlign,
    this.decoration,
    this.textDirection,
  });

  /// Creates a display bud.
  /// This method creates a display bud with the given text.
  factory Bud.display({
    required String text,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    TextAlign? textAlign,
    TextDecoration? decoration,
    TextDirection? textDirection,
    Color? color,
  }) =>
      _DisplayBud(
        text: text,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        textAlign: textAlign,
        decoration: decoration,
        textDirection: textDirection,
        color: color,
      );

  /// Creates a headline bud.
  /// This method creates a headline bud with the given text.
  factory Bud.headline({
    required String text,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    TextAlign? textAlign,
    TextDecoration? decoration,
    TextDirection? textDirection,
    Color? color,
  }) =>
      _HeadlineBud(
        text: text,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        textAlign: textAlign,
        decoration: decoration,
        textDirection: textDirection,
        color: color,
      );

  /// Creates a title bud.
  /// This method creates a title bud with the given text.
  factory Bud.title({
    required String text,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    TextAlign? textAlign,
    TextDecoration? decoration,
    TextDirection? textDirection,
    Color? color,
  }) =>
      _TitleBud(
        text: text,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        textAlign: textAlign,
        decoration: decoration,
        textDirection: textDirection,
        color: color,
      );

  /// Creates a body large bud.
  /// This method creates a body large bud with the given text.
  factory Bud.bodyLarge({
    required String text,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    TextAlign? textAlign,
    TextDecoration? decoration,
    TextDirection? textDirection,
    Color? color,
  }) =>
      _BodyLarge(
        text: text,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        textAlign: textAlign,
        decoration: decoration,
        textDirection: textDirection,
        color: color,
      );

  /// Creates a body medium bud.
  /// This method creates a body medium bud with the given text.
  factory Bud.bodyMedium({
    required String text,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    TextAlign? textAlign,
    TextDecoration? decoration,
    TextDirection? textDirection,
    Color? color,
  }) =>
      _BodyMedium(
        text: text,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        textAlign: textAlign,
        decoration: decoration,
        textDirection: textDirection,
        color: color,
      );

  /// Creates a label bud.
  /// This method creates a label bud with the given text.
  factory Bud.label({
    required String text,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    TextAlign? textAlign,
    TextDecoration? decoration,
    TextDirection? textDirection,
    Color? color,
  }) =>
      _Label(
        text: text,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        textAlign: textAlign,
        decoration: decoration,
        textDirection: textDirection,
        color: color,
      );

  /// Creates a caption bud.
  /// This method creates a caption bud with the given text.
  factory Bud.caption({
    required String text,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    TextAlign? textAlign,
    TextDecoration? decoration,
    TextDirection? textDirection,
    Color? color,
  }) =>
      _Caption(
        text: text,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        textAlign: textAlign,
        decoration: decoration,
        textDirection: textDirection,
        color: color,
      );

  /// The text to display in the text field.
  final String text;

  /// The color to display in the text field.
  final Color? color;

  /// The max lines to display in the text field.
  final int? maxLines;

  /// The overflow to display in the text field.
  final TextOverflow? overflow;

  /// The soft wrap to display in the text field.
  final bool? softWrap;

  /// The text align to display in the text field.
  final TextAlign? textAlign;

  /// The decoration to display in the text field.
  final TextDecoration? decoration;

  /// The text direction to display in the text field.
  final TextDirection? textDirection;
}
