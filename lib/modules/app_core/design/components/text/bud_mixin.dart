part of 'types/bud.dart';

/// [_BudMixin] is a mixin that provides the necessary methods
/// to build a [Bud] widget.
mixin _BudMixin on Bud {
  /// This method resolves the style of the [Bud] widget.
  TextStyle resolveStyle(BuildContext context);

  /// This method builds the [Bud] widget.
  Widget buildText(BuildContext context) {
    final style = resolveStyle(context).copyWith(
      color: color ?? context.color.textPrimary,
      decoration: decoration,
    );

    return RawText(
      text: text,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textAlign: textAlign,
      textDirection: textDirection,
      isSelectable: isSelectable,
      semanticLabel: semanticLabel,
    );
  }
}
