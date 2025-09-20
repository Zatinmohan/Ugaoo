import 'dart:io';

/// This tells the source of file (Cache, Online or None)
enum CacheFileSource {
  /// Unknown
  na,

  /// Coming from cache
  cache,

  /// Coming from Web (Online)
  network;
}

/// This model is used to store the file in the cache.
/// A wrapper over File that is going to be stored in cache.
class CacheFileModel {
  /// Constructor of [CacheFileModel] that requires:
  /// - [file] is the file to store in the cache
  /// - [source] is the source of the file
  /// - [validTill] is the valid till date of the file
  /// - [statusCode] is the status code of the file
  const CacheFileModel({
    required this.file,
    required this.validTill,
    this.source = CacheFileSource.na,
    this.statusCode = 200,
  });

  /// stores the value of [file] that is needed from cache
  final File? file;

  /// Tells the source of file (Cache, Online or None)
  final CacheFileSource? source;

  /// Tells for how long data is stored in cache
  final DateTime? validTill;

  /// tells status code in case, image is downloaded from online data.
  final int statusCode;
}
