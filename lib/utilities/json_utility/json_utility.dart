import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/global_di/app_di.dart';
import 'package:ugaoo/core/logger/logger.dart';
import 'package:ugaoo/core/remote_config/models/remote_config_keys.dart';
import 'package:ugaoo/core/remote_config/remote_config_manager.dart';
import 'package:ugaoo/utilities/json_utility/failure/json_utility_failure.dart';

/// [JsonUtility] is a class that provides methods to load JSON
/// from a file or remote config.
class JsonUtility {
  /// This method loads JSON from assets or from a local file.
  TaskEither<JsonUtilityFailure, Map<String, dynamic>> loadJsonFromAsset({
    required String path,
    bool showLog = false,
  }) {
    return TaskEither.tryCatch(() async {
      final jsonString = await rootBundle.loadString(path);
      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      if (showLog) {
        log.i(
          'Loading JSON from $path',
          config: LoggerModel(exception: data),
        );
      }
      return data;
    }, (e, s) {
      log.e(
        e.toString(),
        config: LoggerModel(exception: e, stackTrace: s),
      );
      return JsonUtilityFailure(
        message: e.toString(),
        title: 'Error loading JSON',
      );
    });
  }

  /// This method loads JSON from a raw string.
  Either<JsonUtilityFailure, Map<String, dynamic>> loadRawJson(String rawJson) {
    return Either.tryCatch(() {
      final json = jsonDecode(rawJson) as Map<String, dynamic>;
      return json;
    }, (e, s) {
      log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
      return JsonUtilityFailure(
        message: e.toString(),
        title: 'Error decoding JSON',
      );
    });
  }

  /// This method loads JSON from remote config.
  /// [key] is the key of the remote config.
  TaskEither<JsonUtilityFailure, Map<String, dynamic>>
      loadJsonFromRemoteConfig({
    required RemoteConfigKey key,
    String? fallbackAssetPath,
  }) {
    return sl
        .get<RemoteConfigManager>()
        .read<String>(key)
        .mapLeft(
          (failure) {
            log.e(
              failure.message,
              config: LoggerModel(exception: failure),
            );
            return JsonUtilityFailure(
              message: failure.message,
              title: failure.title,
            );
          },
        )
        .flatMap((rawJson) => TaskEither.fromEither(loadRawJson(rawJson)))
        .orElse(
          (failure) => fallbackAssetPath != null
              ? loadJsonFromAsset(path: fallbackAssetPath)
              : TaskEither.left(failure),
        );
  }
}
