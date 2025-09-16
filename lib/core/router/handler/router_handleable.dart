import 'package:flutter/material.dart';

/// [RouterHandleable] is an abstract class that represents
/// the router handleable interface
abstract class RouterHandleable<T extends RouterConfig<Object>> {
  /// Get the router config
  T get routerConfig;

  /// This method returns the key of the root navigator
  /// that is used to navigate the router and contains extra configurations.
  GlobalKey<NavigatorState> get rootNavigatorKey;

  /// This method is used to configure the router with the routes configuration
  Future<void> configure();

  /// This method pushes a new route to the route stack
  /// Requries:
  /// - `path` is the path of the route to push
  /// - `extras` is the extras to pass to the route
  Future<U?> push<U extends Object?>(
    String path, {
    Object? extras,
  });

  /// This method pushes a new route to the route stack by name
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
  });

  /// This method checks if the route stack can be popped
  bool canPop();

  /// This method pops the current route from the route stack
  /// Requries:
  /// - `result` is the result to pass to the previous route
  void pop<U extends Object?>([U? result]);

  /// This method pops the route until the target route is reached.
  /// Requries:
  /// - `path` is the path of the route to pop until
  /// - `result` is the result to pass to the previous route
  /// - `fallback` is the fallback route to navigate to if the target
  /// route is not found
  void popUntil<U extends Object?>(
    String path, {
    U? result,
    String? fallback,
  });

  /// This method pushes a new route by replacing the current route
  /// in the route stack
  /// Requries:
  /// - `name` is the name of the route to push
  /// - `path` is the path of the route to push
  /// - `extras` is the extras to pass to the route
  Future<U?> pushReplacement<U extends Object?>(String path, {Object? extras});

  /// This method pushes a new route by replacing the current route
  /// in the route stack by name
  /// - `pathParameters` is the path parameters to pass to the route
  /// - `queryParameters` is the query parameters to pass to the route
  /// - `extra` is the extra to pass to the route
  Future<U?> pushReplacementNamed<U extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  });

  /// This method navigates to a new route by name
  /// Requries:
  /// - `name` is the name of the route to navigate to
  /// - `pathParameters` is the path parameters to pass to the route
  /// - `queryParameters` is the query parameters to pass to the route
  /// - `extra` is the extra to pass to the route
  void goNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  });

  /// This method navigates to a new route by path
  /// Requries:
  /// - `path` is the path of the route to navigate to
  /// - `extras` is the extras to pass to the route
  void go(
    String path, {
    Object? extras,
  });

  /// This method returns the current route path
  /// Requries:
  /// - `pathWithQueryParams` is the flag to include the query parameters
  /// in the path returns the current route path
  String? getCurrentRoutePath();
}
