part of '../petal.dart';

final class _IconWidget extends Petal {
  const _IconWidget({
    required this.config,
    super.key,
  });

  final IconConfig config;

  @override
  Widget build(BuildContext context) {
    return Icon(
      config.icon,
      size: context.sp(config.size),
      color: config.color,
      semanticLabel: config.semanticLabel,
      blendMode: config.blendMode,
    );
  }
}
