import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/modules/app_core/design/components/images/models/image_model.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

part 'types/asset_image.dart';
part 'types/network_image.dart';
part 'types/icon_image.dart';

@sealed

/// Petal is a widget that displays an image based on the image configuration.
abstract class Petal extends StatelessWidget {
  /// Creates a petal widget that displays an image based
  /// on the image configuration.
  /// Requires:
  /// - `config`: The image configuration that contains
  /// all the image configuration required to display an image.
  const Petal({
    super.key,
  });

  /// Creates a network image petal.
  factory Petal.network(
    String url, {
    double? width,
    double? height,
    Alignment alignment = Alignment.center,
    Duration fadeInDuration = const Duration(milliseconds: 500),
    Duration fadeOutDuration = const Duration(milliseconds: 1000),
    Curve fadeInCurve = Curves.easeIn,
    Curve fadeOutCurve = Curves.easeOut,
    double scale = 1.0,
    Map<String, String>? httpHeaders,
    void Function(Object)? errorListener,
    Widget Function(BuildContext, String, Object)? errorWidget,
    Widget Function(BuildContext, String)? placeholder,
    String? semanticLabel,
    BoxFit fit = BoxFit.contain,
    FilterQuality filterQuality = FilterQuality.medium,
    ColorFilter? colorFilter,
    BlendMode? blendMode,
    int? cacheWidth,
    int? cacheHeight,
    Key? key,
  }) {
    return _NetworkImageWidget(
      key: key,
      config: NetworkImageConfig(
        url: url,
        width: width,
        height: height,
        alignment: alignment,
        fadeInDuration: fadeInDuration,
        fadeOutDuration: fadeOutDuration,
        fadeInCurve: fadeInCurve,
        fadeOutCurve: fadeOutCurve,
        scale: scale,
        httpHeaders: httpHeaders,
        errorListener: errorListener,
        errorWidget: errorWidget,
        placeholder: placeholder,
        semanticLabel: semanticLabel,
        fit: fit,
        filterQuality: filterQuality,
        colorFilter: colorFilter,
        blendMode: blendMode,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
      ),
    );
  }

  /// Creates an asset image petal.
  factory Petal.asset(
    String assetPath, {
    double? width,
    double? height,
    String? semanticLabel,
    BoxFit fit = BoxFit.contain,
    FilterQuality filterQuality = FilterQuality.medium,
    AlignmentGeometry alignment = Alignment.center,
    Widget Function(BuildContext)? placeholder,
    Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
    BlendMode? blendMode,
    ColorFilter? colorFilter,
    int? cacheHeight,
    int? cacheWidth,
    Key? key,
  }) {
    return _AssetImageWidget(
      key: key,
      config: AssetImageConfig(
        assetPath: assetPath,
        width: width,
        height: height,
        semanticLabel: semanticLabel,
        fit: fit,
        filterQuality: filterQuality,
        alignment: alignment,
        placeholder: placeholder,
        errorBuilder: errorBuilder,
        blendMode: blendMode,
        colorFilter: colorFilter,
        cacheHeight: cacheHeight,
        cacheWidth: cacheWidth,
      ),
    );
  }

  /// Creates an icon petal.
  factory Petal.icon(
    IconData icon, {
    required double size,
    Color? color,
    String? semanticLabel,
    BlendMode? blendMode,
    Key? key,
  }) {
    return _IconWidget(
      key: key,
      config: IconConfig(
        icon: icon,
        size: size,
        color: color,
        semanticLabel: semanticLabel,
        blendMode: blendMode,
      ),
    );
  }
}
