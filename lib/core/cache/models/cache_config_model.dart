/// [CacheConfigModel] is a class that represents the cache configuration.
class CacheConfigModel {
  /// Constructor of [CacheConfigModel] that requires:
  /// - [cacheName] is the name of the cache
  /// - [maxCacheSize] is the maximum size of the cache
  /// - [cacheDurationPeriod] is the duration of the cache
  const CacheConfigModel({
    required this.cacheName,
    required this.maxCacheSize,
    required this.cacheDurationPeriod,
  });

  /// The name of the cache
  final String cacheName;

  /// The maximum size of the cache
  final int maxCacheSize;

  /// The duration of the cache
  final Duration cacheDurationPeriod;
}
