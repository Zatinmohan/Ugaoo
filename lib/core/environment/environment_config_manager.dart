import 'package:ugaoo/core/environment/environment_config.dart';
import 'package:ugaoo/core/environment/environment_type.dart';
import 'package:ugaoo/core/remote_config/remote_config_manager.dart';

/// [EnvironmentConfigManager] is a class that manages
/// the environment configuration
class EnvironmentConfigManager {
  /// This requires the [EnvironmentType] to be passed in the constructor
  EnvironmentConfigManager(
    this._environmentType,
    this._remoteConfigManager,
  );

  final EnvironmentType _environmentType;

  final RemoteConfigManager _remoteConfigManager;

  late final EnvironmentConfig _environmentConfig = EnvironmentConfig(
    type: _environmentType,
    remoteConfigManager: _remoteConfigManager,
  );

  /// It returns the name of the environment based on the [EnvironmentType]
  String get environmentName => _environmentType.name;

  /// It returns the environment configuration based on the [EnvironmentType]
  EnvironmentConfig get environmentConfig => _environmentConfig;
}
