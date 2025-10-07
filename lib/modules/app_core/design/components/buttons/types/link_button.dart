part of 'leaf.dart';

final class _LinkButton extends Leaf {
  const _LinkButton({
    required super.label,
    required super.onPressed,
    super.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return RawButton(
      label: label,
      onPressed: onPressed,
      buttonColor: Colors.transparent,
      buttonRadius: 0,
      buttonBorder: Border.all(color: Colors.transparent),
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: context.padding.compact,
      ),
      buttonSize: Size(
        0,
        context.spaceToken.space6,
      ),
    );
  }
}
