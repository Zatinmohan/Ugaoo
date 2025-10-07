part of '../bud.dart';

final class _TitleBud extends Bud with _BudMixin {
  const _TitleBud({
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
    return context.typographic.title;
  }

  @override
  Widget build(BuildContext context) {
    return buildText(context);
  }
}
