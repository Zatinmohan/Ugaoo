part of '../petal.dart';

final class _AssetImageWidget extends Petal {
  const _AssetImageWidget({
    required this.config,
    super.key,
  });

  final AssetImageConfig config;

  bool get _isImageSvg => config.assetPath.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return _isImageSvg
        ? SvgPicture.asset(
            semanticsLabel: config.semanticLabel,
            config.assetPath,
            width: config.width != null ? context.w(config.width!) : null,
            height: config.height != null ? context.h(config.height!) : null,
            fit: config.fit,
            alignment: config.alignment,
            colorFilter: config.colorFilter,
            placeholderBuilder: config.placeholder,
            errorBuilder: config.errorBuilder,
          )
        : Image.asset(
            semanticLabel: config.semanticLabel,
            config.assetPath,
            width: config.width != null ? context.w(config.width!) : null,
            height: config.height != null ? context.h(config.height!) : null,
            fit: config.fit,
            alignment: config.alignment,
            filterQuality: config.filterQuality,
            cacheWidth: config.cacheWidth,
            cacheHeight: config.cacheHeight,
            errorBuilder: config.errorBuilder,
            colorBlendMode: config.blendMode,
          );
  }
}
