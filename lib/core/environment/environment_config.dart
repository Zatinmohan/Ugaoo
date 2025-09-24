import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/environment/dtos/environment_config_dto.dart';
import 'package:ugaoo/core/environment/environment_type.dart';
import 'package:ugaoo/core/environment/extensions/environment_config_extension.dart';
import 'package:ugaoo/core/environment/models/environment_config_failure.dart';
import 'package:ugaoo/core/environment/models/environment_network_config.dart';
import 'package:ugaoo/core/logger/logger.dart';
import 'package:ugaoo/core/remote_config/models/remote_config_keys.dart';
import 'package:ugaoo/core/remote_config/remote_config_manager.dart';
import 'package:ugaoo/gen/assets.gen.dart';
import 'package:ugaoo/utilities/json_utility/json_utility.dart';

/// [EnvironmentConfig] is a class that represents
/// the environment configuration
class EnvironmentConfig {
  /// Constructor of [EnvironmentConfig] that requires:
  /// - [type] is the type of the environment
  /// - [remoteConfigManager] is the remote config manager of the environment
  EnvironmentConfig({
    required this.type,
    required this.remoteConfigManager,
  });

  /// The type of the environment
  final EnvironmentType type;

  /// The remote config manager of the environment
  final RemoteConfigManager remoteConfigManager;

  /// The network configuration of the environment
  EnvironmentNetworkConfig? _cachedEnvNetworkConfig;

  /// The network configuration of the environment
  Future<EnvironmentNetworkConfig> get networkConfig async {
    if (_cachedEnvNetworkConfig != null) {
      return _cachedEnvNetworkConfig!;
    }

    final result = await _networkConfig.run();
    result.fold(
      (l) {
        log.e(l.message, config: LoggerModel(exception: l));
      },
      (r) => _cachedEnvNetworkConfig = r,
    );
    return _cachedEnvNetworkConfig!;
  }

  /// The network configuration of the environment
  TaskEither<EnvironmentConfigFailure, EnvironmentNetworkConfig>
      get _networkConfig => JsonUtility()
              .loadJsonFromRemoteConfig(
            key: RemoteConfigKey.networkEnvConfig,
            fallbackAssetPath: Assets.data.json.networkEnvConfig,
          )
              .mapLeft(
            (failure) {
              log.e(failure.message, config: LoggerModel(exception: failure));
              return EnvironmentConfigFailure(
                message: failure.message,
                title: failure.title,
              );
            },
          ).map(
            (json) => EnvironmentConfigDto.fromJson(json).toModel(type),
          );
}
