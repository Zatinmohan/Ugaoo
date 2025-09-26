import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:ugaoo/core/cache/cache_handler.dart';
import 'package:ugaoo/core/environment/environment_config_manager.dart';
import 'package:ugaoo/core/environment/environment_type.dart';
import 'package:ugaoo/core/environment/models/environment_network_config.dart';
import 'package:ugaoo/core/logger/log.dart';
import 'package:ugaoo/core/logger/model/logger_model.dart';
import 'package:ugaoo/core/network/network.dart';
import 'package:ugaoo/core/package_info/handlers/package_info_handler.dart';
import 'package:ugaoo/core/package_info/package_info_manager.dart';
import 'package:ugaoo/core/remote_config/handlers/firebase_remote_config_handler.dart';
import 'package:ugaoo/core/remote_config/remote_config_manager.dart';
import 'package:ugaoo/core/router/handler/go_router_handler.dart';
import 'package:ugaoo/core/router/manager/router_manager.dart';
import 'package:ugaoo/core/storage/handler/database_handler/realm_storage_handler.dart';
import 'package:ugaoo/core/storage/handler/key_value_handler/secure_storage_handler.dart';
import 'package:ugaoo/core/storage/handler/key_value_handler/shared_preference_handler.dart';
import 'package:ugaoo/core/storage/manager/storage_manager.dart';
import 'package:ugaoo/modules/app_core/config/cache_config/cache_config.dart';
import 'package:ugaoo/utilities/basic_utility.dart';

part 'app_flavor_di.dart';
part 'app_route_dependencies.dart';
part 'storage_di.dart';
part 'package_info_di.dart';
part 'firebase_service_di.dart';
part 'network_di.dart';

/// [sl] is the singleton instance of [GetIt]
final GetIt sl = GetIt.instance;

/// [AppDependencyInjection] is a class that registers the core dependencies
class AppDependencyInjection {
  /// This registers the core dependencies
  ///
  /// [flavor] is the flavor of the app
  Future<void> registerCoreDependencies(String? flavor) async {
    try {
      await _registerFirebaseServiceDependencies();
      _registerAppFlavorDependencies(flavor: flavor);
      _registerRouterDependencies();
      _registerNetworkDependencies();
      _registerStorageDependencies();
      _registerPackageInfoDependencies();
    } catch (error) {
      log.e('Error registering core dependencies: $error');
      rethrow;
    }
  }
}
