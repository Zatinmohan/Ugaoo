import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:ugaoo/core/router/models/route_params.dart';

/// A callback function type for building a widget for a route.
typedef BuilderCallback = Widget Function(
  BuildContext context,
  RouteParams params,
);

/// A callback function that returns `Page` for building complex pages.
typedef PageBuilderCallback = Page<dynamic> Function(
  BuildContext context,
  RouteParams params,
);

/// A callback function type for handling redirection logic for a route.
typedef RedirectCallback = FutureOr<String?> Function(
  BuildContext context,
  RouteParams params,
);

/// This class contains the route configuration.
/// A wrapper class that contains route configuration to the route handler.
class RouteData {
  /// Constructor of [RouteData] that requries
  /// - [path] is the path of the route
  /// - [name] is the name of the route
  /// - [builder] is the callback function for building a widget for the route
  /// - [pageBuilder] is the callback function for building a page for the route
  /// - [redirect] is the callback function for handling redirection
  /// logic for the route
  /// - [children] is the list of child routes
  const RouteData({
    required this.path,
    required this.name,
    this.builder,
    this.pageBuilder,
    this.redirect,
    this.children,
  });

  /// Path of the route
  final String path;

  /// Name of the route
  final String name;

  /// Callback function for building a widget for the route
  final BuilderCallback? builder;

  /// This callback is to build pages with complex types.
  /// Eg., Pages having animation or generate multiple pages on the
  /// user interaction.
  final PageBuilderCallback? pageBuilder;

  /// Callback function for handling redirection logic for the route
  final RedirectCallback? redirect;

  /// List of child routes
  final List<RouteData>? children;
}
