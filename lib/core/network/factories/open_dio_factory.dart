import 'package:dio/dio.dart';
import 'package:ugaoo/core/network/factories/dio_factory.dart';

/// [OpenDioFactory] is a class that extends [DioFactory] and
/// adds a bearer token to the request headers.
final class OpenDioFactory extends DioFactory {
  /// Constructor of [OpenDioFactory] that requires:
  /// - [environmentConfig] is the environment configuration
  /// - [packageInfoManager] is the package info manager
  OpenDioFactory({
    required super.environmentConfig,
    required super.packageInfoManager,
  });

  @override
  Set<Interceptor> configureInterceptors(
      Dio dio, Set<Interceptor> interceptors) {
    return {};
  }
}
