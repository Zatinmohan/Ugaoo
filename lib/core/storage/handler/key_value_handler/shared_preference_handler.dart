import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ugaoo/core/logger/logger.dart';
import 'package:ugaoo/core/storage/constants/storage_keys.dart';
import 'package:ugaoo/core/storage/handler/key_value_handler/key_value_pair_handleable.dart';
import 'package:ugaoo/core/storage/model/storage_failure.dart';

/// [SharedPreferenceHandler] is a class that implements the [KeyValuePairHandleable]
/// interface and uses the [SharedPreferences] package
/// to store and retrieve data.
class SharedPreferenceHandler extends KeyValuePairHandleable {
  late final SharedPreferencesWithCache _sharedPreferences;
  @override
  TaskEither<StorageFailure, void> configure() {
    return TaskEither.tryCatch(() async {
      _sharedPreferences = await SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(),
      );
      log.i('Shared Preference Configured');
    }, (e, s) {
      log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
      return StorageFailure(
        message: e.toString(),
        title: 'Error configuring Shared Preference',
      );
    });
  }

  @override
  TaskEither<StorageFailure, void> delete({
    required StorageKeys key,
  }) {
    return TaskEither.tryCatch(() async {
      await _sharedPreferences.remove(key.name);
    }, (e, s) {
      log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
      return StorageFailure(
        message: e.toString(),
        title: 'Error deleting Shared Preference',
      );
    });
  }

  @override
  TaskEither<StorageFailure, S?> read<S extends Object>({
    required StorageKeys key,
  }) {
    return TaskEither.tryCatch(() {
      return Future.value(_sharedPreferences.get(key.name) as S?);
    }, (e, s) {
      log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
      return StorageFailure(
        message: e.toString(),
        title: 'Error reading Shared Preference',
      );
    });
  }

  @override
  TaskEither<StorageFailure, void> write<T extends Object>({
    required StorageKeys key,
    required T value,
  }) {
    return TaskEither.tryCatch(() async {
      return switch (value.runtimeType) {
        const (String) =>
          await _sharedPreferences.setString(key.name, value as String),
        const (int) => await _sharedPreferences.setInt(key.name, value as int),
        const (double) =>
          await _sharedPreferences.setDouble(key.name, value as double),
        const (bool) =>
          await _sharedPreferences.setBool(key.name, value as bool),
        const (List<String>) => await _sharedPreferences.setStringList(
            key.name, value as List<String>),
        _ => throw const StorageFailure(
            message: 'Unsupported type',
            title: 'Type not supported',
          ),
      };
    }, (e, s) {
      log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
      return StorageFailure(
        message: e.toString(),
        title: 'Error writing Shared Preference',
      );
    });
  }
}
