part of '../text/types/bud.dart';

/// [RawText] is a widget that displays a text with a given style.
class RawText extends StatelessWidget {
  /// Constructor of [RawText] that requires:
  /// - [text] is the text to display in the text field.
  /// - [style] is the style to display in the text field.
  /// - [maxLines] is the max lines to display in the text field.
  /// - [overflow] is the overflow to display in the text field.
  /// - [softWrap] is the soft wrap to display in the text field.
  /// - [textAlign] is the text align to display in the text field.
  /// - [decoration] is the decoration to display in the text field.
  /// - [textDirection] is the text direction to display in the text field.
  /// - [isSelectable] is the is selectable to display in the text field.
  /// - [semanticLabel] is the semantics label to display in the text field.
  const RawText({
    required this.text,
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.textAlign,
    this.decoration,
    this.textDirection,
    this.isSelectable = false,
    this.semanticLabel,
  });

  /// The text to display in the text field.
  final String text;

  /// The max lines to display in the text field.
  final int? maxLines;

  /// The overflow to display in the text field.
  final TextOverflow? overflow;

  /// The soft wrap to display in the text field.
  final bool? softWrap;

  /// The text align to display in the text field.
  final TextAlign? textAlign;

  /// The style to display in the text field.
  final TextStyle? style;

  /// The decoration to display in the text field.
  final TextDecoration? decoration;

  /// The text direction to display in the text field.
  final TextDirection? textDirection;

  /// The is selectable to display in the text field.
  final bool isSelectable;

  /// The semantics label to display in the text field.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style?.copyWith(
      fontSize: style?.fontSize != null ? context.sp(style!.fontSize!) : null,
      decoration: decoration ?? style?.decoration,
    );
    return isSelectable
        ? SelectableText(
            text,
            maxLines: maxLines,
            textAlign: textAlign,
            textDirection: textDirection,
            style: effectiveStyle,
            semanticsLabel: semanticLabel,
          )
        : Text(
            text,
            maxLines: maxLines,
            overflow: overflow,
            softWrap: softWrap,
            textAlign: textAlign,
            textDirection: textDirection,
            style: effectiveStyle,
            semanticsLabel: semanticLabel,
          );
  }
}
