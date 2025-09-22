/// [EnvironmentNetworkConfig] is a class that represents
/// the network configuration for the environment.
class EnvironmentNetworkConfig {
  /// Constructor of [EnvironmentNetworkConfig] that requires:
  /// - [baseUrl] is the base URL of the environment
  /// - [sendTimeout] is the send timeout of the environment
  /// - [receiveTimeout] is the receive timeout of the environment
  /// - [connectTimeout] is the connect timeout of the environment
  const EnvironmentNetworkConfig({
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
