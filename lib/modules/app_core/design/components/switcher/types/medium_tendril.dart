part of 'tendril.dart';

final class _MediumTendril extends Tendril with _TendrilMixin {
  const _MediumTendril({
    required super.value,
    required super.onChanged,
    required super.semanticLabel,
    required super.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return buildTendril(
      context,
      height: context.spaceToken.space7,
      indicatorSize: context.spaceToken.space6,
      spacing: context.spaceToken.space1,
      padding: EdgeInsets.all(context.padding.condensed),
    );
  }
}
