part of 'leaf.dart';

final class _SecondaryButton extends Leaf {
  const _SecondaryButton({
    required super.label,
    required super.onPressed,
    required super.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return RawButton(
      label: label,
      isLoading: isLoading,
      onPressed: onPressed,
      buttonSize: Size(
        context.screenWidth,
        context.spaceToken.space7,
      ),
      padding: EdgeInsets.symmetric(horizontal: context.padding.regular),
      buttonRadius: context.radius.large,
      buttonColor: context.semantics.surface,
      buttonBorder: Border.all(color: context.semantics.primary),
    );
  }
}
