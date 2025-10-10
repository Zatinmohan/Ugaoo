import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

part '../bud_mixin.dart';
part '../raw_text.dart';

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
  /// - [text] is the text to display in the text.
  /// - [color] is the color of the text.
  /// - [maxLines] is the number of lines to display in the text.
  /// - [overflow] configuration for the text if text overflows
  /// from the given space.
  /// - [softWrap] makes the text wrap.
  /// - [textAlign] is the text align to display in the text field.
  /// - [decoration] is the decoration of the text
  /// [Underline, Overline, LineThrough].
  /// - [textDirection] is the text direction.
  /// - [isSelectable] makes the text selectable.
  /// - [semanticLabel] is the semantics label that helps screen readers
  /// to understand the text.
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
    this.isSelectable = false,
    this.semanticLabel,
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
    bool isSelectable = false,
    String? semanticLabel,
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
        isSelectable: isSelectable,
        semanticLabel: semanticLabel,
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
    bool isSelectable = false,
    String? semanticLabel,
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
        isSelectable: isSelectable,
        semanticLabel: semanticLabel,
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
    bool isSelectable = false,
    String? semanticLabel,
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
        isSelectable: isSelectable,
        semanticLabel: semanticLabel,
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
    bool isSelectable = false,
    String? semanticLabel,
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
        isSelectable: isSelectable,
        semanticLabel: semanticLabel,
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
    bool isSelectable = false,
    String? semanticLabel,
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
        isSelectable: isSelectable,
        semanticLabel: semanticLabel,
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
    bool isSelectable = false,
    String? semanticLabel,
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
        isSelectable: isSelectable,
        semanticLabel: semanticLabel,
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
    bool isSelectable = false,
    String? semanticLabel,
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
        isSelectable: isSelectable,
        semanticLabel: semanticLabel,
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

  /// The is selectable to display in the text field.
  final bool isSelectable;

  /// The semantics label to display in the text field.
  final String? semanticLabel;
}
