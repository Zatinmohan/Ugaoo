import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/logger/logger.dart';
import 'package:ugaoo/core/remote_config/handlers/remote_config_handleable.dart';
import 'package:ugaoo/core/remote_config/models/remote_config_failures.dart';
import 'package:ugaoo/core/remote_config/models/remote_config_keys.dart';

/// [FirebaseRemoteConfigHandler] is a class that implements the
/// [RemoteConfigHandleable] interface and uses the [FirebaseRemoteConfig]
/// package to configure and read the remote config.
class FirebaseRemoteConfigHandler implements RemoteConfigHandleable {
  late final FirebaseRemoteConfig _firebaseRemoteConfig;
  @override
  TaskEither<RemoteConfigFailure, void> configure() {
    return TaskEither.tryCatch(() async {
      _firebaseRemoteConfig = FirebaseRemoteConfig.instance;
      await _cofigureRemoteConfig;
      log.i('Firebase Remote Config Configured');
    }, (e, s) {
      log.e(
        e.toString(),
        config: LoggerModel(exception: e, stackTrace: s),
      );
      return RemoteConfigFailure(
        message: e.toString(),
        title: 'Error configuring Firebase Remote Config',
      );
    });
  }

  Future<void> get _cofigureRemoteConfig async {
    try {
      final values = await defaultValues();
      await _firebaseRemoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(seconds: 1),
        ),
      );
      await _firebaseRemoteConfig.setDefaults(values);
      await _firebaseRemoteConfig.fetchAndActivate();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> defaultValues() async {
    /// TODO: Implement default values
    return {};
  }

  @override
  TaskEither<RemoteConfigFailure, T> read<T extends Object>(
    RemoteConfigKey key,
  ) {
    return TaskEither.tryCatch(() async {
      final result = switch (T) {
        const (String) => _firebaseRemoteConfig.getString(key.key),
        const (int) => _firebaseRemoteConfig.getInt(key.key),
        const (double) => _firebaseRemoteConfig.getDouble(key.key),
        const (bool) => _firebaseRemoteConfig.getBool(key.key),
        _ => throw const RemoteConfigFailure(
            message: 'The current type is not supported',
            title: 'Unsupported type',
          ),
      };
      return result as T;
    }, (e, s) {
      log.e(
        e.toString(),
        config: LoggerModel(exception: e, stackTrace: s),
      );
      return RemoteConfigFailure(
        message: e.toString(),
        title: 'Error reading Firebase Remote Config',
      );
    });
  }
}
