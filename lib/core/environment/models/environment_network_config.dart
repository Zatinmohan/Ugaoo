import 'package:ugaoo/core/environment/environment_type.dart';

/// [EnvironmentConfigModel] is a class that represents
/// the environment configuration model.
abstract class EnvironmentConfigModel {}

/// [EnvironmentNetworkConfig] is a class that represents
/// the network configuration for the environment.
class EnvironmentNetworkConfig extends EnvironmentConfigModel {
  /// Constructor of [EnvironmentNetworkConfig] that requires:
  /// - [baseUrl] is the base URL of the environment
  /// - [sendTimeout] is the send timeout of the environment
  /// - [receiveTimeout] is the receive timeout of the environment
  /// - [connectTimeout] is the connect timeout of the environment
  EnvironmentNetworkConfig({
    required this.baseUrl,
    required this.sendTimeout,
    required this.receiveTimeout,
    required this.connectTimeout,
  });

  /// The base URL of the environment
  final String baseUrl;

  /// The send timeout of the environment
  final int sendTimeout;

  /// The receive timeout of the environment
  final int receiveTimeout;

  /// The connect timeout of the environment
  final int connectTimeout;
}

/// [EnvironmentFeatureConfigModel] is a class that represents
/// the feature configuration for the environment.
class EnvironmentFeatureConfigModel extends EnvironmentConfigModel {
  /// Constructor of [EnvironmentFeatureConfigModel] that requires:
  /// - [networkLogs] is the network logs of the environment
  /// - [devMode] is the dev mode of the environment
  EnvironmentFeatureConfigModel({
    required this.networkLogs,
    required this.devMode,
  });

  /// This method returns the feature configuration model from the
  ///  environment type
  factory EnvironmentFeatureConfigModel.fromType(EnvironmentType type) {
    return switch (type) {
      EnvironmentType.dev => EnvironmentFeatureConfigModel(
          networkLogs: true,
          devMode: true,
        ),
      EnvironmentType.prod => EnvironmentFeatureConfigModel(
          networkLogs: true,
          devMode: true,
        ),
      EnvironmentType.stg => EnvironmentFeatureConfigModel(
          networkLogs: true,
          devMode: true,
        ),
    };
  }

  /// The network logs of the environment
  final bool networkLogs;

  /// The dev mode of the environment
  final bool devMode;
}
