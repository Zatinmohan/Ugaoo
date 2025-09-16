import 'package:flutter/material.dart';
import 'package:ugaoo/core/router/handler/router_handleable.dart';

/// [RouterManager] is a class that manages the router configuration
/// of the application.
class RouterManager<T extends RouterConfig<Object>> {
  /// Constructor of [RouterManager] that requries
  /// - [RouterHandleable] contains router implementation.
  const RouterManager({required RouterHandleable<T> routerHandler})
      : _routerHandler = routerHandler;

  /// Instance of `Router Handler` that conatins router implementation.
  final RouterHandleable<T> _routerHandler;

  /// This method returns the router handler
  RouterHandleable<T> get routerHandler => _routerHandler;

  /// This method returns the router configuration
  RouterConfig<Object> get routerConfig => _routerHandler.routerConfig;
}
