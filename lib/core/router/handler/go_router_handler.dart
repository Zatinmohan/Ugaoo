import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ugaoo/core/router/handler/router_handleable.dart';

import 'package:ugaoo/core/router/models/route_data.dart' as appRoutes;
import 'package:ugaoo/core/router/models/route_params.dart';
import 'package:ugaoo/core/router/models/routes_name.dart';
import 'package:ugaoo/modules/app_core/route_config/app_routes.dart';

class GoRouterHandler implements RouterHandleable<GoRouter> {
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
      routes: _getRoutes(routes: AppRoutes().routes),
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      onException: (context, state, router) {
        // TODO(Jatin): Need to add proper logs
      },
      redirect: (context, state) async {
        // TODO(Jatin): Need to handle this properly
        return null;
      },
      initialLocation: Routes.root.path,
    );
  }

  List<RouteBase> _getRoutes({required List<appRoutes.RouteData> routes}) {
    return routes
        .map(
          (route) => GoRoute(
            path: route.path,
            builder: route.builder != null
                ? (context, state) => route.builder!.call(
                      context,
                      RouteParams(
                        pathParam: state.pathParameters,
                        queryParam: state.uri.queryParameters,
                        extras: state.extra,
                      ),
                    )
                : null,
            pageBuilder: route.pageBuilder != null
                ? (context, state) => route.pageBuilder!.call(
                      context,
                      RouteParams(
                        pathParam: state.pathParameters,
                        queryParam: state.uri.queryParameters,
                        extras: state.extra,
                      ),
                    )
                : null,
            redirect: route.redirect != null
                ? (context, state) => route.redirect!.call(
                      context,
                      RouteParams(
                        pathParam: state.pathParameters,
                        queryParam: state.uri.queryParameters,
                        extras: state.extra,
                      ),
                    )
                : null,
            routes: _getRoutes(routes: route.children ?? []),
          ),
        )
        .toList();
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
