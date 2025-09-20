import 'package:fpdart/fpdart.dart';
import 'package:realm/realm.dart';
import 'package:ugaoo/core/logger/logger.dart';
import 'package:ugaoo/core/storage/handler/database_handler/database_handleable.dart';
import 'package:ugaoo/core/storage/model/storage_failure.dart';
import 'package:ugaoo/modules/app_core/config/realm_config/example.dart';

/// [RealmStorageHandler] is a class that implements the [DatabaseHandleable]
/// interface and uses the [Realm] package to store and retrieve data.
class RealmStorageHandler implements DatabaseHandleable<RealmObject> {
  late final Realm _realm;
  @override
  TaskEither<StorageFailure, void> configure() {
    return TaskEither.tryCatch(() async {
      _realm = Realm(_configurations);
      log.i('Realm Configured');
    }, (e, s) {
      log.e(
        'Error configuring Realm: $e',
        config: LoggerModel(exception: e, stackTrace: s),
      );
      return StorageFailure(
        message: e.toString(),
        title: 'Error configuring Realm',
      );
    });
  }

  Configuration get _configurations => Configuration.local(
        [
          Example.schema,
        ],
        schemaVersion: 2,
      );
  @override
  TaskEither<StorageFailure, void> delete<S extends RealmObject>(Object key) {
    return TaskEither.tryCatch(
      () async {
        final data = _realm.find<S>(key);
        if (data == null) {
          left<StorageFailure, void>(const StorageFailure(
            message: 'Data not found',
            title: 'Error deleting Realm',
          ));
          return;
        }
        return _realm.writeAsync(() => _realm.delete(data));
      },
      (e, s) {
        log.e(
          'Error deleting Realm: $e',
          config: LoggerModel(exception: e, stackTrace: s),
        );
        return StorageFailure(
          message: e.toString(),
          title: 'Error deleting Realm',
        );
      },
    );
  }

  @override
  TaskEither<StorageFailure, S?> read<S extends RealmObject>(Object key) {
    return TaskEither.tryCatch(
      () {
        return Future.value(_realm.find<S>(key));
      },
      (e, s) {
        log.e(
          'Error reading Realm: $e',
          config: LoggerModel(exception: e, stackTrace: s),
        );
        return StorageFailure(
          message: e.toString(),
          title: 'Error reading Realm',
        );
      },
    );
  }

  @override
  TaskEither<StorageFailure, void> write<S extends RealmObject>(
    S value, {
    bool shouldUpdate = true,
  }) {
    return TaskEither.tryCatch(
      () async {
        await _realm.writeAsync<S>(() {
          final x = _realm.add(value, update: shouldUpdate);
          return x;
        });
      },
      (e, s) {
        log.e(
          'Error writing Realm: $e',
          config: LoggerModel(exception: e, stackTrace: s),
        );
        return StorageFailure(
          message: e.toString(),
          title: 'Error writing Realm',
        );
      },
    );
  }
}
