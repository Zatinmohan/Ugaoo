import 'package:ugaoo/core/storage/handler/database_handler/database_handleable.dart';
import 'package:ugaoo/core/storage/handler/key_value_handler/key_value_pair_handleable.dart';

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
        _realmStorageHandler.configure().run(),
        _sharedPreferenceHandler.configure().run(),
        _secureStorageHandler.configure().run(),
      ],
      eagerError: true,
    );
  }

  /// This method returns the realm storage handler
  DatabaseHandleable<Object> get realmStorageHandler => _realmStorageHandler;

  /// This method returns the shared preference handler
  KeyValuePairHandleable get sharedPreferenceHandler =>
      _sharedPreferenceHandler;
}
