import 'package:flutter/widgets.dart';
import 'package:ugaoo/core/global_di/app_di.dart';
import 'package:ugaoo/core/router/manager/router_manager.dart';

/// [RouterExtension] is an extension on [BuildContext] that provides
/// a convenient way to navigate the router.
/// Using this we can directly use the route handler methods without importing
/// the router package in our presentation layer.
extension RouterExtension on BuildContext {
  /// This method pushes a new route to the route stack
  /// Requries:
  /// - `path` is the path of the route to push
  /// - `extras` is the extras to pass to the route
  Future<U?> push<U extends Object?>(String path, {Object? extras}) {
    return sl.get<RouterManager>().routerHandler.push(path, extras: extras);
  }

  /// This method pushes a new route to the route stack using a route name
  /// Requries:
  /// - `name` is the name of the route to push
  /// - `pathParameters` is the path parameters to pass to the route
  /// - `queryParameters` is the query parameters to pass to the route
  /// - `extra` is the extra to pass to the route
  Future<U?> pushNamed<U extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return sl.get<RouterManager>().routerHandler.pushNamed(name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra);
  }

  /// This method pops the current route from the route stack
  /// Requries:
  /// - `result` is the result to pass to the previous route
  void pop<U extends Object?>([U? result]) {
    sl.get<RouterManager>().routerHandler.pop(result);
  }

  /// This method pops the route until the target route is reached.
  /// Requries:
  /// - `path` is the path of the route to pop until
  /// - `result` is the result to pass to the previous route
  /// - `fallback` is the fallback route to navigate to if the target
  /// route is not found
  void popUntil<U extends Object?>(String path, {U? result, String? fallback}) {
    sl
        .get<RouterManager>()
        .routerHandler
        .popUntil(path, result: result, fallback: fallback);
  }

  /// This method navigates to a new route by path
  /// Requries:
  /// - `path` is the path of the route to navigate to
  /// - `extras` is the extras to pass to the route
  void go(String path, {Object? extras}) {
    sl.get<RouterManager>().routerHandler.go(path, extras: extras);
  }

  /// This method navigates to a new route by name
  /// Requries:
  /// - `name` is the name of the route to navigate to
  /// - `pathParameters` is the path parameters to pass to the route
  /// - `queryParameters` is the query parameters to pass to the route
  /// - `extra` is the extra to pass to the route
  void goNamed(String name,
      {Map<String, String> pathParameters = const <String, String>{},
      Map<String, dynamic> queryParameters = const <String, dynamic>{},
      Object? extra}) {
    sl.get<RouterManager>().routerHandler.goNamed(name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra);
  }

  /// This method checks if the route stack can be popped
  /// Requries:
  /// - `result` is the result to pass to the previous route
  bool canPop() {
    return sl.get<RouterManager>().routerHandler.canPop();
  }

  /// This method returns the current route path
  /// Requries:
  /// - `pathWithQueryParams` is the flag to include the query parameters
  /// in the path returns the current route path
  String? getCurrentRoutePath() {
    return sl.get<RouterManager>().routerHandler.getCurrentRoutePath();
  }
}
