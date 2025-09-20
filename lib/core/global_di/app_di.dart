import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:ugaoo/core/environment/environment_config_manager.dart';
import 'package:ugaoo/core/environment/environment_type.dart';
import 'package:ugaoo/core/logger/log.dart';
import 'package:ugaoo/core/router/handler/go_router_handler.dart';
import 'package:ugaoo/core/router/manager/router_manager.dart';
import 'package:ugaoo/core/storage/handler/database_handler/realm_storage_handler.dart';
import 'package:ugaoo/core/storage/handler/key_value_handler/secure_storage_handler.dart';
import 'package:ugaoo/core/storage/handler/key_value_handler/shared_preference_handler.dart';
import 'package:ugaoo/core/storage/manager/storage_manager.dart';
import 'package:ugaoo/utilities/enum_util.dart';

part 'app_flavor_di.dart';
part 'app_route_dependencies.dart';
part 'storage_di.dart';

/// [sl] is the singleton instance of [GetIt]
final GetIt sl = GetIt.instance;

/// [AppDependencyInjection] is a class that registers the core dependencies
class AppDependencyInjection {
  /// This registers the core dependencies
  ///
  /// [flavor] is the flavor of the app
  void registerCoreDependencies(String? flavor) {
    try {
      _registerAppFlavorDependencies(flavor: flavor);
      _registerRouterDependencies();
      _registerStorageDependencies();
    } catch (error) {
      log.e('Error registering core dependencies: $error');
      rethrow;
    }
  }
}
