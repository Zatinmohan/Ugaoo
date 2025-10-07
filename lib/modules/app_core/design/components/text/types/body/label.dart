part of '../bud.dart';

final class _Label extends Bud {
  const _Label({
    required super.text,
    super.maxLines,
    super.overflow,
    super.softWrap,
    super.textAlign,
    super.decoration,
    super.textDirection,
    super.color,
  });

  @override
  Widget build(BuildContext context) {
    return RawText(
      text: text,
      style: context.typographic.label.copyWith(
        color: color ?? context.color.textPrimary,
      ),
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textAlign: textAlign,
      decoration: decoration,
      textDirection: textDirection,
    );
  }
}
