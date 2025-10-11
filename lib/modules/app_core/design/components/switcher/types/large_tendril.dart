part of 'tendril.dart';

final class _LargeTendril extends Tendril with _TendrilMixin {
  const _LargeTendril({
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
      height: context.spaceToken.space8,
      indicatorSize: context.spaceToken.space7,
      spacing: context.spaceToken.space2,
      padding: EdgeInsets.all(context.padding.condensed),
    );
  }
}
