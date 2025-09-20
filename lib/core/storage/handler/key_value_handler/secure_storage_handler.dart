import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/logger/logger.dart';
import 'package:ugaoo/core/storage/constants/storage_keys.dart';
import 'package:ugaoo/core/storage/handler/key_value_handler/key_value_pair_handleable.dart';
import 'package:ugaoo/core/storage/model/storage_failure.dart';

/// [SecureStorageHandler] is a class that implements the [KeyValuePairHandleable]
/// interface and uses the [FlutterSecureStorage] package
/// to store and retrieve data.
class SecureStorageHandler extends KeyValuePairHandleable {
  late final FlutterSecureStorage _secureStorage;
  @override
  TaskEither<StorageFailure, void> configure() {
    return TaskEither.tryCatch(() async {
      _secureStorage = const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      );
      log.i('Secure Storage Configured');
    }, (e, s) {
      log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
      return StorageFailure(
        message: e.toString(),
        title: 'Error configuring Secure Storage',
      );
    });
  }

  @override
  TaskEither<StorageFailure, void> delete({required StorageKeys key}) {
    return TaskEither.tryCatch(() async {
      await _secureStorage.delete(key: key.name);
    }, (e, s) {
      log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
      return StorageFailure(
        message: e.toString(),
        title: 'Error deleting Secure Storage',
      );
    });
  }

  @override
  TaskEither<StorageFailure, S?> read<S extends Object>({
    required StorageKeys key,
  }) {
    return TaskEither.tryCatch(() async {
      return await _secureStorage.read(key: key.name) as S?;
    }, (e, s) {
      log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
      return StorageFailure(
        message: e.toString(),
        title: 'Error reading Secure Storage',
      );
    });
  }

  @override
  TaskEither<StorageFailure, void> write<T extends Object>({
    required StorageKeys key,
    required T value,
  }) {
    return TaskEither.tryCatch(() async {
      if (value is! String) {
        throw const StorageFailure(
          message: 'Value is not a string',
          title: 'Value is not a string',
        );
      }
      return _secureStorage.write(
        key: key.name,
        value: value.toString(),
      );
    }, (e, s) {
      log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
      return StorageFailure(
        message: e.toString(),
        title: 'Error writing Secure Storage',
      );
    });
  }
}
