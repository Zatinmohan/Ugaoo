part of 'app_di.dart';

void _registerFirebaseServiceDependencies() {
  sl
    ..registerSingletonAsync<FirebaseApp>(() async {
      final firebaseApp = await Firebase.initializeApp();
      log.i('Firebase Service Dependencies Registered');
      return firebaseApp;
    })
    ..registerSingletonAsync<RemoteConfigManager>(
      () async {
        final remoteConfigManager = RemoteConfigManager(
          handlers: [
            FirebaseRemoteConfigHandler(),
          ],
        );
        await remoteConfigManager.configure();
        log.i('Firebase Service Dependencies Registered');
        return remoteConfigManager;
      },
      dependsOn: [FirebaseApp],
    );
}
