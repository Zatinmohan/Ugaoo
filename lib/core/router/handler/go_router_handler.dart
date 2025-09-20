import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ugaoo/core/logger/log.dart';
import 'package:ugaoo/core/router/handler/router_handleable.dart';

import 'package:ugaoo/core/router/models/route_data.dart' as app_route;
import 'package:ugaoo/core/router/models/route_params.dart';
import 'package:ugaoo/core/router/models/routes_name.dart';
import 'package:ugaoo/modules/app_core/config/route_config/app_routes.dart';

/// [GoRouterHandler] is a class that implements the [RouterHandleable]
/// interface and uses the [GoRouter] package to handle the router.
class GoRouterHandler implements RouterHandleable<GoRouter> {
  /// Constructor of [GoRouterHandler] that requires:
  /// - [GlobalKey<NavigatorState>] root navigator key
  GoRouterHandler({
    required GlobalKey<NavigatorState> rootNavigatorKey,
  }) : _rootNavigatorKey = rootNavigatorKey;

  late GoRouter _goRouter;

  final GlobalKey<NavigatorState> _rootNavigatorKey;

  @override
  GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;

  @override
  Future<void> configure() async {
    _goRouter = GoRouter(
      routes: AppRoutes()
          .routes
          .map(
            (route) => _getRoutes(route: route),
          )
          .toList(),
      navigatorKey: _rootNavigatorKey,
      // debugLogDiagnostics: false,
      onException: (context, state, router) {
        // TODO(Jatin): Need to add proper logs
      },
      redirect: (context, state) async {
        // TODO(Jatin): Need to handle this properly
        return null;
      },
      initialLocation: Routes.root.path,
    );

    log.i('GoRouter Configured');
  }

  GoRoute _getRoutes({required app_route.RouteData route}) {
    return GoRoute(
      path: route.path,
      name: route.name,
      builder: route.builder == null
          ? null
          : (context, state) => route.builder!(
                context,
                RouteParams(
                  pathParam: state.pathParameters,
                  queryParam: state.uri.queryParameters,
                  extras: state.extra,
                ),
              ),
      pageBuilder: route.pageBuilder == null
          ? null
          : (context, state) => route.pageBuilder!(
                context,
                RouteParams(
                  pathParam: state.pathParameters,
                  queryParam: state.uri.queryParameters,
                  extras: state.extra,
                ),
              ),
      redirect: route.redirect == null
          ? null
          : (context, state) => route.redirect!(
                context,
                RouteParams(
                  pathParam: state.pathParameters,
                  queryParam: state.uri.queryParameters,
                  extras: state.extra,
                ),
              ),
      routes: route.children
              ?.map((childRoute) => _getRoutes(route: childRoute))
              .toList() ??
          [],
    );
  }

  @override
  bool canPop() {
    return _goRouter.canPop();
  }

  @override
  void pop<U extends Object?>([U? result]) {
    return _goRouter.pop(result);
  }

  @override
  void popUntil<U extends Object?>(
    String path, {
    U? result,
    String? fallback,
  }) {
    while (canPop() && getCurrentRoutePath() != path) {
      pop(result);
    }
    if (fallback != null && getCurrentRoutePath() != path) {
      go(fallback);
    }
  }

  @override
  Future<U?> push<U extends Object?>(String path, {Object? extras}) {
    return _goRouter.push(path, extra: extras);
  }

  @override
  Future<U?> pushNamed<U extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return _goRouter.pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  @override
  Future<U?> pushReplacement<U extends Object?>(String path, {Object? extras}) {
    return _goRouter.pushReplacement(path, extra: extras);
  }

  @override
  Future<U?> pushReplacementNamed<U extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return _goRouter.pushReplacementNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  @override
  GoRouter get routerConfig => _goRouter;

  @override
  void go(String path, {Object? extras}) => _goRouter.go(path, extra: extras);

  @override
  void goNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) =>
      _goRouter.goNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );

  @override
  String? getCurrentRoutePath() {
    if (rootNavigatorKey.currentContext != null) {
      return _goRouter.routerDelegate.currentConfiguration.last.matchedLocation;
    }
    return null;
  }
}
