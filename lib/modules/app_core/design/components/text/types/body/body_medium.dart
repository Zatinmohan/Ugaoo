part of '../bud.dart';

final class _BodyMedium extends Bud with BudMixin {
  const _BodyMedium({
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
    return context.typographic.bodyMedium;
  }

  @override
  Widget build(BuildContext context) {
    return buildText(context);
  }
}
