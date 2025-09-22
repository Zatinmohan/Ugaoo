import 'package:ugaoo/core/environment/dtos/environment_config_dto.dart';
import 'package:ugaoo/core/environment/environment_type.dart';
import 'package:ugaoo/core/environment/models/environment_config_failure.dart';
import 'package:ugaoo/core/environment/models/environment_network_config.dart';
import 'package:ugaoo/utilities/basic_utility.dart';

/// [EnvironmentConfigExtension] is an extension on [EnvironmentConfigDto] that
/// provides a method to convert the environment config to
/// a [EnvironmentNetworkConfig] model.
extension EnvironmentConfigExtension on EnvironmentConfigDto {
  /// This method converts the environment config to a
  /// [EnvironmentNetworkConfig] model.
  ///  [selectedEnvironment] is the environment type to convert to.
  /// Returns the [EnvironmentNetworkConfig] model.
  EnvironmentNetworkConfig toModel(EnvironmentType selectedEnvironment) {
    var selectedEnvironmentConfig = networkConfig
        .firstWhereOrNull((e) => e.key == selectedEnvironment.name);
    selectedEnvironmentConfig ??=
        networkConfig.firstWhereOrNull((e) => e.key == 'default');
    if (selectedEnvironmentConfig == null) {
      throw EnvironmentConfigFailure(
        title: 'Environment Configuration Failure',
        message:
            'Network configuration not found for "${selectedEnvironment.name}" and no "default" fallback was available.',
      );
    }
    return EnvironmentNetworkConfig(
      baseUrl: selectedEnvironmentConfig.baseUrl,
      sendTimeout: selectedEnvironmentConfig.sendTimeout,
      receiveTimeout: selectedEnvironmentConfig.receiveTimeout,
      connectTimeout: selectedEnvironmentConfig.connectTimeout,
    );
  }
}
