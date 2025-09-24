import 'package:dio/dio.dart';
import 'package:ugaoo/core/environment/models/environment_network_config.dart';
import 'package:ugaoo/core/package_info/package_info_manager.dart';

/// [DioFactory] is a class that implements the [DioFactory] interface
/// \and uses the [Dio] package to create a dio client.
abstract class DioFactory {
  /// Constructor of [DioFactory] that requires:
  /// - [environmentConfig] is the environment configuration
  /// - [packageInfoManager] is the package info manager
  DioFactory({
    required EnvironmentNetworkConfig environmentConfig,
    required PackageInfoManager packageInfoManager,
  })  : _networkConfig = environmentConfig,
        _packageInfoManager = packageInfoManager {
    _dio = Dio(_baseOptions);
  }

  final EnvironmentNetworkConfig _networkConfig;
  final PackageInfoManager _packageInfoManager;

  /// The dio client
  late final Dio _dio;

  /// This method returns the dio client
  Dio get client => _dio;

  BaseOptions get _baseOptions {
    return BaseOptions(
      contentType: 'application/json',
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
      baseUrl: _networkConfig.baseUrl,
      sendTimeout: Duration(seconds: _networkConfig.sendTimeout),
      receiveTimeout: Duration(seconds: _networkConfig.receiveTimeout),
      connectTimeout: Duration(seconds: _networkConfig.connectTimeout),
    );
  }

  /// This method configures the interceptors for the dio client
  Set<Interceptor> configureInterceptors(
      Dio dio, Set<Interceptor> interceptors) {
    return {};
  }
}
