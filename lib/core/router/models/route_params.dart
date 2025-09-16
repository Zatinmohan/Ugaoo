/// This class is used to pass parameters to the route handler
/// A wrapper class that contains the data that need to be passed to the route.
class RouteParams {
  /// Constructor of [RouteParams] that requries
  /// - [pathParam] is the path parameters to pass to the route
  /// - [queryParam] is the query parameters to pass to the route
  /// - [extras] is the extras to pass to the route
  const RouteParams({
    required this.pathParam,
    required this.queryParam,
    required this.extras,
  });

  /// Path parameters to pass to the route
  final Map<String, String> pathParam;

  /// Query parameters to pass to the route
  final Map<String, dynamic> queryParam;

  /// Extras to pass to the route
  final Object? extras;
}
