part of 'tendril.dart';

final class _CustomTendril extends Tendril with _TendrilMixin {
  const _CustomTendril({
    required super.value,
    required super.onChanged,
    required super.semanticLabel,
    required super.isLoading,
    required this.height,
    required this.spacing,
    required this.indicatorSize,
    this.padding,
    super.key,
  });

  final double height;
  final double indicatorSize;
  final double spacing;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return buildTendril(
      context,
      height: height,
      indicatorSize: indicatorSize,
      spacing: spacing,
      padding: padding,
    );
  }
}
