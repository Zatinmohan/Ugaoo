import 'package:get_it/get_it.dart';
import 'package:ugaoo/core/environment/environment_config_manager.dart';
import 'package:ugaoo/core/environment/environment_type.dart';
import 'package:ugaoo/utilities/enum_util.dart';

final sl = GetIt.instance;

class AppDependencyInjection {
  void registerCoreDependencies(String? flavor) {
    if (flavor?.isEmpty ?? true) throw Exception('Flavor is required');
    final environment = EnvironmentType.values.byNameOrNull(flavor!);

    if (environment == null) throw Exception('Invalid flavor: $flavor');

    final environmentConfigManager = EnvironmentConfigManager(environment);
    sl.registerSingleton<EnvironmentConfigManager>(environmentConfigManager);
  }
}
