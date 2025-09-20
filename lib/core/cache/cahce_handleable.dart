import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/cache/models/cache_failures.dart';
import 'package:ugaoo/core/cache/models/cache_file_model.dart';

/// [CacheHandleable] is an abstract class that represents
/// the cache handleable interface
abstract class CacheHandleable {
  /// This method is used to configure the cache handleable.
  TaskEither<CacheFailure, void> configure();

  /// This function is used to store the file
  /// from the Remote [url] and store it in the cache.
  TaskEither<CacheFailure, CacheFileModel> downloadAndStoreFile({
    required String url,
    required String key,
  });

  /// This function is used to store file in cache if it is already downloaded.
  /// [path] provides the location of the file.
  TaskEither<CacheFailure, Object> storeFile({
    required String path,
    required Uint8List fileBytes,
    required String key,
  });

  /// This function is used to get files from the cache.
  /// Can provide multiple files if there are more files present
  /// with the same key.
  /// Required [key] to identify a file or store values in cache client.
  /// returns [Null] if no value is found associated with the [key]
  TaskEither<CacheFailure, CacheFileModel?> getFile(String key);

  /// This function delete a particular entry from the cache client.
  /// Requries [key] in order to identify the file from cache database.
  TaskEither<CacheFailure, void> deleteFile(String key);

  /// This functions clear cache database.
  TaskEither<CacheFailure, void> clearCache();
}
