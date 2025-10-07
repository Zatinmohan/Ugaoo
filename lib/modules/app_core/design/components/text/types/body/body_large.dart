part of '../bud.dart';

final class _BodyLarge extends Bud with BudMixin {
  const _BodyLarge({
    required super.text,
    super.maxLines,
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
    return context.typographic.bodyLarge;
  }

  @override
  Widget build(BuildContext context) {
    return buildText(context);
  }
}
