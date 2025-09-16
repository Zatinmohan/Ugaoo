part of 'app_di.dart';

void _registerRouterDependencies() {
  sl.registerLazySingleton<RouterManager>(() {
    return RouterManager(
      routerHandler: GoRouterHandler(
        rootNavigatorKey: GlobalKey<NavigatorState>(),
      )..configure(),
    );
  });
}
