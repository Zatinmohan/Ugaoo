import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/logger/logger.dart';
import 'package:ugaoo/core/storage/handler/database_handler/database_handleable.dart';
import 'package:ugaoo/core/storage/handler/key_value_handler/key_value_pair_handleable.dart';
import 'package:ugaoo/core/storage/handler/storage_handleable.dart';
import 'package:ugaoo/core/storage/model/storage_failure.dart';

/// [StorageManager] is a class that manages the storage of the app.
class StorageManager {
  /// Constructor of [StorageManager] that requires:
  /// - [DatabaseHandleable<Object>] realm storage handler
  /// - [KeyValuePairHandleable] shared preference handler
  const StorageManager({
    required DatabaseHandleable<Object> realmStorageHandler,
    required KeyValuePairHandleable sharedPreferenceHandler,
    required KeyValuePairHandleable secureStorageHandler,
  })  : _realmStorageHandler = realmStorageHandler,
        _sharedPreferenceHandler = sharedPreferenceHandler,
        _secureStorageHandler = secureStorageHandler;

  final DatabaseHandleable<Object> _realmStorageHandler;
  final KeyValuePairHandleable _sharedPreferenceHandler;
  final KeyValuePairHandleable _secureStorageHandler;

  /// This method configures the storage manager
  Future<void> configure() async {
    await Future.wait(
      [
        _initHandlers(_realmStorageHandler),
        _initHandlers(_sharedPreferenceHandler),
        _initHandlers(_secureStorageHandler),
      ],
      eagerError: true,
    );
  }

  Future<void> _initHandlers(StorageHandleable handlers) async {
    final result = await handlers.configure().run();

    if (result.isLeft()) {
      result.mapLeft(
        (error) => log.e(error.toString()),
      );
    }
  }

  /// This method returns the realm storage handler
  DatabaseHandleable<Object> get realmStorageHandler => _realmStorageHandler;

  /// This method returns the shared preference handler
  KeyValuePairHandleable get sharedPreferenceHandler =>
      _sharedPreferenceHandler;
}
