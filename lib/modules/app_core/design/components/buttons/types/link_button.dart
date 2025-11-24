part of 'leaf.dart';

final class _LinkButton extends Leaf {
  const _LinkButton({
    required super.label,
    super.onPressed,
    super.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return RawButton(
      semanticLabel: semanticLabel,
      label: label,
      textStyle: context.typographic.bodyMedium.copyWith(
        color: context.color.textPrimary,
        decoration: TextDecoration.underline,
      ),
      onPressed: onPressed,
      buttonColor: Colors.transparent,
      buttonRadius: 0,
      buttonBorder: Border.all(color: Colors.transparent),
      padding: EdgeInsetsGeometry.zero,
      buttonSize: Size(
        0,
        context.spaceToken.space6,
      ),
      showDisableState: false,
    );
  }
}
