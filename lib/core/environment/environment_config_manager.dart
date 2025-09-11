import 'package:ugaoo/core/environment/environment_config.dart';
import 'package:ugaoo/core/environment/environment_type.dart';

class EnvironmentConfigManager {
  final EnvironmentType _environmentConfig;

  EnvironmentConfigManager(this._environmentConfig);

  EnvironmentConfig get environmentConfig => switch (_environmentConfig) {
        EnvironmentType.dev => DevEnvironmentConfig(),
        EnvironmentType.prod => ProdEnvironmentConfig(),
        EnvironmentType.stg => StgEnvironmentConfig(),
      };
}
