part of 'app_di.dart';

void _registerAppFlavorDependencies({required String? flavor}) {
  if (flavor?.isEmpty ?? true) {
    log.e('App Flavor is empty');
    throw Exception('App Flavor is empty');
  }
  final environment = EnvironmentType.values.byNameOrNull(flavor!);

  if (environment == null) {
    log.e('Invalid flavor: $flavor');
    throw Exception('Invalid flavor: $flavor');
  }

  final environmentConfigManager = EnvironmentConfigManager(environment);
  sl.registerSingleton<EnvironmentConfigManager>(environmentConfigManager);
  log.i('App Flavor Registered - ${environment.name}');
}
