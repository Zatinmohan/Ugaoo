import 'package:ugaoo/core/cache/models/cache_config_model.dart';

/// [CacheConfig] is a class that represents the cache configuration
class CacheConfig {
  /// Constructor of [CacheConfig] that requires:
  /// - [cacheConfigModel] is the cache configuration model
  const CacheConfig({
    required this.cacheConfigModel,
  });

  /// The cache configuration model
  final CacheConfigModel cacheConfigModel;
}

/// The cache configuration
const cacheConfig = CacheConfig(
  cacheConfigModel: CacheConfigModel(
    cacheName: 'ugaoo',
    maxCacheSize: 100,
    cacheDurationPeriod: Duration(days: 10),
  ),
);
