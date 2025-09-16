import 'package:ugaoo/core/router/models/route_data.dart';
import 'package:ugaoo/core/router/models/routes_name.dart';
import 'package:ugaoo/modules/home_screen/home_screen.dart';

/// This class contains the route configuration for the app
class AppRoutes {
  /// This method returns the list of routes that are available in the app
  List<RouteData> get routes => [
        RouteData(
          path: Routes.root.path,
          name: Routes.root.name,
          builder: (context, params) => const HomeScreen(),
        ),
      ];
}
