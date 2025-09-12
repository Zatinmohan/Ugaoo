part of 'app_dependency_injection.dart';

void _registerAppFlavorDependencies({required String? flavor}) {
  if (flavor?.isEmpty ?? true) throw Exception('Flavor is required');
  final environment = EnvironmentType.values.byNameOrNull(flavor!);

  if (environment == null) throw Exception('Invalid flavor: $flavor');

  final environmentConfigManager = EnvironmentConfigManager(environment);
  sl.registerSingleton<EnvironmentConfigManager>(environmentConfigManager);
}
