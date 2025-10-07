part of 'leaf.dart';

final class _PrimaryButton extends Leaf {
  const _PrimaryButton({
    required super.label,
    required super.onPressed,
    required super.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return RawButton(
      label: label,
      onPressed: onPressed,
      isLoading: isLoading,
      buttonSize: Size(
        context.screenWidth,
        context.spaceToken.space7,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.padding.regular,
      ),
      buttonRadius: context.radius.large,
      buttonColor: context.color.primary,
      buttonBorder: Border.all(
        color: context.color.primary,
        width: context.thicknessToken.thickness1,
      ),
    );
  }
}
