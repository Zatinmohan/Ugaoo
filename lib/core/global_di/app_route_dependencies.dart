part of 'app_di.dart';

void _registerRouterDependencies() {
  sl.registerLazySingleton<RouterManager>(() {
    log.i('Router Dependencies Registered');
    return RouterManager(
      routerHandler: GoRouterHandler(
        rootNavigatorKey: GlobalKey<NavigatorState>(),
      )..configure(),
    );
  });
}
