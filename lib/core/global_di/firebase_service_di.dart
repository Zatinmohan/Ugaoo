part of 'app_di.dart';

Future<void> _registerFirebaseServiceDependencies() async {
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

        try {
          await remoteConfigManager
              .configure()
              .timeout(const Duration(seconds: 1));
          log.i('Firebase Service Dependencies Registered');
        } on Exception catch (e, s) {
          log.e(
            'Error registering Firebase Remote Config Dependencies',
            config: LoggerModel(
              exception: e,
              stackTrace: s,
            ),
          );
        }

        return remoteConfigManager;
      },
      dependsOn: [
        FirebaseApp,
      ],
    );

  await sl.allReady();
}
