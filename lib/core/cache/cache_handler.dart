import 'dart:typed_data';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/cache/cahce_handleable.dart';
import 'package:ugaoo/core/cache/models/cache_config_model.dart';
import 'package:ugaoo/core/cache/models/cache_failures.dart';
import 'package:ugaoo/core/cache/models/cache_file_model.dart';
import 'package:ugaoo/core/logger/logger.dart';
import 'package:ugaoo/utilities/basic_utility.dart';

/// [CacheHandler] is a class that implements the [CacheHandleable] interface
/// and uses the [CacheManager] package to store and retrieve data.
class CacheHandler extends CacheHandleable {
  /// Constructor of [CacheHandler] that requires:
  /// - [cacheConfig] is the configuration of the cache
  CacheHandler({
    CacheConfigModel? cacheConfig,
  }) : _cacheConfig = cacheConfig;
  final CacheConfigModel? _cacheConfig;
  late CacheManager _cacheClient;

  @override
  Future<void> configure() async {
    try {
      if (_cacheConfig == null) {
        _cacheClient = DefaultCacheManager();
        return;
      }

      _cacheClient = CacheManager(Config(
        _cacheConfig.cacheName,
        maxNrOfCacheObjects: _cacheConfig.maxCacheSize,
        stalePeriod: _cacheConfig.cacheDurationPeriod,
      ));
      log.i('Cache Handler Configured');
    } on Exception catch (error, stackTrace) {
      log.e(
        error.toString(),
        config: LoggerModel(exception: error, stackTrace: stackTrace),
      );
    }
  }

  @override
  TaskEither<CacheFailure, void> clearCache() {
    return TaskEither.tryCatch(
      () => _cacheClient.emptyCache(),
      (e, s) {
        log.i(
          'Error clearing cache',
          config: LoggerModel(exception: e, stackTrace: s),
        );
        return CacheFailure(
          message: e.toString(),
          title: 'Error clearing cache',
        );
      },
    );
  }

  @override
  TaskEither<CacheFailure, void> deleteFile(String key) {
    return TaskEither.tryCatch(
      () => _cacheClient.removeFile(key),
      (e, s) {
        log.i(
          'Error deleting file',
          config: LoggerModel(exception: e, stackTrace: s),
        );
        return CacheFailure(
          message: e.toString(),
          title: 'Error deleting file',
        );
      },
    );
  }

  @override
  TaskEither<CacheFailure, CacheFileModel> downloadAndStoreFile({
    required String url,
    required String key,
  }) {
    return TaskEither.tryCatch(
      () async {
        final file = await _cacheClient.downloadFile(url, key: key);
        return CacheFileModel(
          file: file.file,
          validTill: file.validTill,
          source: CacheFileSource.values.byNameOrNull(file.source.name) ??
              CacheFileSource.na,
          statusCode: file.statusCode,
        );
      },
      (e, s) {
        log.i(
          'Error downloading file',
          config: LoggerModel(exception: e, stackTrace: s),
        );
        return CacheFailure(
          message: e.toString(),
          title: 'Error downloading file',
        );
      },
    );
  }

  @override
  TaskEither<CacheFailure, CacheFileModel?> getFile(String key) {
    return TaskEither.tryCatch(
      () async {
        final file = await _cacheClient.getFileFromCache(key);
        if (file == null) {
          return null;
        }
        return CacheFileModel(
          file: file.file,
          validTill: file.validTill,
          source: CacheFileSource.values.byNameOrNull(file.source.name) ??
              CacheFileSource.na,
          statusCode: file.statusCode,
        );
      },
      (e, s) {
        log.i(
          'Error getting file',
          config: LoggerModel(exception: e, stackTrace: s),
        );
        return CacheFailure(message: e.toString(), title: 'Error getting file');
      },
    );
  }

  @override
  TaskEither<CacheFailure, Object> storeFile({
    required String path,
    required Uint8List fileBytes,
    required String key,
  }) {
    return TaskEither.tryCatch(
        () async => _cacheClient.putFile(
              path,
              fileBytes,
              key: key,
            ), (e, s) {
      log.i(
        'Error storing file',
        config: LoggerModel(exception: e, stackTrace: s),
      );
      return CacheFailure(
        message: e.toString(),
        title: 'Error storing file',
      );
    });
  }
}
