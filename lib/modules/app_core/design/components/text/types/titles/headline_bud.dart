part of '../bud.dart';

final class _HeadlineBud extends Bud with _BudMixin {
  const _HeadlineBud({
    required super.text,
    super.maxLines = 1,
    super.overflow,
    super.softWrap,
    super.textAlign,
    super.decoration,
    super.textDirection,
    super.color,
    super.isSelectable,
    super.semanticLabel,
  });

  @override
  TextStyle resolveStyle(BuildContext context) {
    return context.typographic.headline;
  }

  @override
  Widget build(BuildContext context) {
    return buildText(context);
  }
}
