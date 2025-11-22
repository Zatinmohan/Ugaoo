import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ugaoo/modules/app_core/design/extensions/app_design_extension.dart';
import 'package:ugaoo/utilities/basic_utility.dart';

/// [AssetManager] is a class that provides a convenient way to access assets.
class AssetManager {
  /// A list of available assets retrieved from `AssetManifest.json`.
  static late List<String> _availableAssets;

  /// This method configures the asset manager.
  static Future<void> configure() async {
    // Prefer the SDK's binary asset manifest loader for speed
    //and correct caching.
    try {
      final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
      // The listAssets result includes main asset keys, which
      //in our app include
      // the themed directories (dark/light/neutral) declared in pubspec.
      _availableAssets = manifest.listAssets();

      final assetManifestContent =
          await rootBundle.loadString('AssetManifest.json');
      final decodedAssetManifest =
          jsonDecode(assetManifestContent) as Map<String, Object?>;
      final assets = decodedAssetManifest.keys.toList().cast<String>();
      _availableAssets = assets;
      return;
    } catch (_) {
      // Fallback to JSON manifest if the binary loader is unavailable.
    }
  }

  /// This method returns the asset path based on the asset name.
  /// Requires:
  /// [context] - The build context
  /// [assetName] - The name of the asset
  /// [inverse] - Whether to invert the asset name
  /// [fallbackAsset] - The fallback asset name
  static String getAsset(
    BuildContext context,
    String assetName, {
    bool inverse = false,
    String? fallbackAsset,
  }) {
    final isDarkMode = context.isDarkTheme ^ inverse;

    try {
      final path = _getAssetName(
        assetName,
        isDarkMode,
        fallbackAsset: fallbackAsset,
      );
      if (path != null) return path;
      throw Exception('Asset not found');
    } catch (e) {
      rethrow;
    }
  }

  /// This method returns the asset path based on the asset name.
  /// Requires:
  /// [isDarkModeEnabled] - Whether the dark mode is enabled
  /// [assetName] - The name of the asset
  /// [fallbackAsset] - The fallback asset name
  static String getAssetWithoutContext(
    String assetName, {
    required bool isDarkModeEnabled,
    String? fallbackAsset,
  }) {
    try {
      final path = _getAssetName(
        assetName,
        isDarkModeEnabled,
        fallbackAsset: fallbackAsset,
      );
      if (path != null) return path;
      throw Exception('Asset not found');
    } catch (e) {
      rethrow;
    }
  }

  static String? _getAssetName(
    String assetName,
    bool isDarkMode, {
    String? fallbackAsset,
  }) {
    final themeFolder = isDarkMode ? 'dark' : 'light';

    final path = _availableAssets.firstWhereOrNull(
      (asset) => asset.contains('$themeFolder/$assetName'),
    );

    if (path != null) return path;

    return _availableAssets.firstWhereOrNull(
      (asset) => asset.contains('$themeFolder/$fallbackAsset'),
    );
  }
}
