part of '../petal.dart';

final class _NetworkImageWidget extends Petal {
  const _NetworkImageWidget({
    required this.config,
    super.key,
  });

  final NetworkImageConfig config;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      image: true,
      label: config.semanticLabel,
      child: CachedNetworkImage(
        imageUrl: config.url,
        width: config.width != null ? context.w(config.width!) : null,
        height: config.height != null ? context.h(config.height!) : null,
        fit: config.fit,
        alignment: config.alignment,
        filterQuality: config.filterQuality,
        memCacheHeight: config.cacheHeight,
        memCacheWidth: config.cacheWidth,
        fadeInDuration: config.fadeInDuration,
        fadeOutDuration: config.fadeOutDuration,
        fadeInCurve: config.fadeInCurve,
        fadeOutCurve: config.fadeOutCurve,
        scale: config.scale,
        maxHeightDiskCache: config.cacheHeight,
        maxWidthDiskCache: config.cacheWidth,
        httpHeaders: config.httpHeaders,
        errorListener: config.errorListener,
        errorWidget: config.errorWidget,
        placeholder: config.placeholder,
        colorBlendMode: config.blendMode,
      ),
    );
  }
}
