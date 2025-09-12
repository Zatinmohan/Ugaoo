import 'package:ugaoo/core/environment/environment_config.dart';
import 'package:ugaoo/core/environment/environment_type.dart';

/// [EnvironmentConfigManager] is a class that manages
/// the environment configuration
class EnvironmentConfigManager {
  /// This requires the [EnvironmentType] to be passed in the constructor
  const EnvironmentConfigManager(this._environmentConfig);

  final EnvironmentType _environmentConfig;

  /// It returns the name of the environment based on the [EnvironmentType]
  String get environmentName => _environmentConfig.name;

  /// It returns the environment configuration based on the [EnvironmentType]
  EnvironmentConfig get environmentConfig => switch (_environmentConfig) {
        EnvironmentType.dev => DevEnvironmentConfig(),
        EnvironmentType.prod => ProdEnvironmentConfig(),
        EnvironmentType.stg => StgEnvironmentConfig(),
      };
}
