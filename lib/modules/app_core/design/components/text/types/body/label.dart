part of '../bud.dart';

final class _Label extends Bud with BudMixin {
  const _Label({
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
    return context.typographic.label;
  }

  @override
  Widget build(BuildContext context) {
    return buildText(context);
  }
}
