import 'package:flutter/widgets.dart';

/// Base class for all image configurations.
///
/// This class holds common properties used across different image types
/// (Asset, Network, Icon).
sealed class ImageConfig {
  /// Creates an image configuration.
  ///
  /// [semanticLabel] - A semantic description of the image.
  /// [fit] - How the image should be inscribed into the space.
  /// [filterQuality] - The quality of the image filtering.
  /// [colorFilter] - A color filter to apply to the image.
  /// [cacheWidth] - The width to cache the image at.
  /// [cacheHeight] - The height to cache the image at.
  /// [blendMode] - The blend mode to apply to the image.
  const ImageConfig({
    this.semanticLabel,
    this.fit = BoxFit.contain,
    this.filterQuality = FilterQuality.medium,
    this.colorFilter,
    this.cacheWidth,
    this.cacheHeight,
    this.blendMode,
  });

  /// Semantic label for the image, used for accessibility.
  final String? semanticLabel;

  /// How the image should be inscribed into the space allocated during layout.
  /// Defaults to [BoxFit.contain].
  final BoxFit fit;

  /// The quality of the image filtering.
  /// Defaults to [FilterQuality.medium].
  final FilterQuality filterQuality;

  /// A color filter to apply to the image.
  final ColorFilter? colorFilter;

  /// The width to cache the image at.
  /// This is useful for reducing memory usage when displaying large images.
  final int? cacheWidth;

  /// The height to cache the image at.
  /// This is useful for reducing memory usage when displaying large images.
  final int? cacheHeight;

  /// The blend mode to apply to the image.
  final BlendMode? blendMode;
}

/// Configuration for an asset image.
class AssetImageConfig extends ImageConfig {
  /// Creates an asset image configuration.
  ///
  /// [assetPath] - The path to the asset image.
  /// [width] - The width of the image.
  /// [height] - The height of the image.
  /// [semanticLabel] - A semantic description of the image.
  /// [fit] - How the image should be inscribed into the space.
  /// [filterQuality] - The quality of the image filtering.
  /// [alignment] - The alignment of the image within its bounds.
  /// [placeholder] - A builder for a placeholder widget.
  /// [errorBuilder] - A builder for an error widget.
  /// [blendMode] - The blend mode to apply to the image.
  /// [colorFilter] - A color filter to apply to the image.
  /// [cacheHeight] - The height to cache the image at.
  /// [cacheWidth] - The width to cache the image at.
  const AssetImageConfig({
    required this.assetPath,
    this.width,
    this.height,
    super.semanticLabel,
    super.fit,
    super.filterQuality,
    this.alignment = Alignment.center,
    this.placeholder,
    this.errorBuilder,
    super.blendMode,
    super.colorFilter,
    super.cacheHeight,
    super.cacheWidth,
  });

  /// Path to the asset image (e.g., 'assets/images/logo.png').
  final String assetPath;

  /// Width of the image.
  final double? width;

  /// Height of the image.
  final double? height;

  /// Alignment of the image within its bounds.
  /// Defaults to [Alignment.center].
  final AlignmentGeometry alignment;

  /// A builder function that returns a widget to display while the image is loading.
  /// Note: This is primarily used for SVG assets.
  final Widget Function(BuildContext)? placeholder;

  /// A builder function that returns a widget to display if the image fails to load.
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
}

/// Configuration for a network image.
class NetworkImageConfig extends ImageConfig {
  /// Creates a network image configuration.
  ///
  /// [url] - The URL of the network image.
  /// [width] - The width of the image.
  /// [height] - The height of the image.
  /// [alignment] - The alignment of the image within its bounds.
  /// [fadeInDuration] - The duration of the fade-in animation.
  /// [fadeOutDuration] - The duration of the fade-out animation.
  /// [fadeInCurve] - The curve of the fade-in animation.
  /// [fadeOutCurve] - The curve of the fade-out animation.
  /// [scale] - The scale to display the image at.
  /// [httpHeaders] - Optional HTTP headers to send with the request.
  /// [errorListener] - A listener for image loading errors.
  /// [errorWidget] - A builder for an error widget.
  /// [placeholder] - A builder for a placeholder widget.
  /// [semanticLabel] - A semantic description of the image.
  /// [fit] - How the image should be inscribed into the space.
  /// [filterQuality] - The quality of the image filtering.
  /// [colorFilter] - A color filter to apply to the image.
  /// [blendMode] - The blend mode to apply to the image.
  const NetworkImageConfig({
    required this.url,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeOutDuration = const Duration(milliseconds: 1000),
    this.fadeInCurve = Curves.easeIn,
    this.fadeOutCurve = Curves.easeOut,
    this.scale = 1.0,
    this.httpHeaders,
    this.errorListener,
    this.errorWidget,
    this.placeholder,
    super.semanticLabel,
    super.fit,
    super.filterQuality,
    super.colorFilter,
    super.blendMode,
    super.cacheHeight,
    super.cacheWidth,
  });

  /// URL of the network image.
  final String url;

  /// Width of the image.
  final double? width;

  /// Height of the image.
  final double? height;

  /// Alignment of the image within its bounds.
  /// Defaults to [Alignment.center].
  final Alignment alignment;

  /// Duration of the fade-in animation when the image loads.
  /// Defaults to 500ms.
  final Duration fadeInDuration;

  /// Duration of the fade-out animation for the placeholder.
  /// Defaults to 1000ms.
  final Duration fadeOutDuration;

  /// Curve of the fade-in animation.
  /// Defaults to [Curves.easeIn].
  final Curve fadeInCurve;

  /// Curve of the fade-out animation.
  /// Defaults to [Curves.easeOut].
  final Curve fadeOutCurve;

  /// Scale to display the image at.
  /// Defaults to 1.0.
  final double scale;

  /// Optional HTTP headers to send with the image request.
  final Map<String, String>? httpHeaders;

  /// A listener that is called when an error occurs while loading the image.
  final void Function(Object)? errorListener;

  /// A builder function that returns a widget to display if the image fails to load.
  final Widget Function(BuildContext, String, Object)? errorWidget;

  /// A builder function that returns a widget to display while the image is loading.
  final Widget Function(BuildContext, String)? placeholder;
}

/// Configuration for an icon.
class IconConfig extends ImageConfig {
  /// Creates an icon configuration.
  ///
  /// [icon] - The icon data to display.
  /// [size] - The size of the icon.
  /// [color] - The color of the icon.
  /// [semanticLabel] - A semantic description of the icon.
  /// [blendMode] - The blend mode to apply to the icon.
  const IconConfig({
    required this.icon,
    required this.size,
    this.color,
    super.semanticLabel,
    super.blendMode,
  });

  /// The icon data to display.
  final IconData icon;

  /// Size of the icon in logical pixels.
  final double size;

  /// Color of the icon.
  final Color? color;
}
