part of 'app_di.dart';

void _registerStorageDependencies() {
  sl
    ..registerSingletonAsync<StorageManager>(() async {
      final storageManager = StorageManager(
        realmStorageHandler: RealmStorageHandler(),
        sharedPreferenceHandler: SharedPreferenceHandler(),
        secureStorageHandler: SecureStorageHandler(),
      );
      await storageManager.configure();
      log.i('Storage Dependencies Registered');
      return storageManager;
    })
    ..registerSingletonAsync<CacheHandler>(() async {
      log.i('Cache Dependencies Registered');
      final cacheHandler = CacheHandler(
        cacheConfig: cacheConfig.cacheConfigModel,
      );
      await cacheHandler.configure();
      return cacheHandler;
    });
}
