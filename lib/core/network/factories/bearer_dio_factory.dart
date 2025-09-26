import 'package:dio/dio.dart';
import 'package:ugaoo/core/network/factories/dio_factory.dart';

/// [BearerDioFactory] is a class that extends [DioFactory] and
/// adds a bearer token to the request headers.
final class BearerDioFactory extends DioFactory {
  /// Constructor of [BearerDioFactory] that requires:
  /// - [environmentConfig] is the environment configuration
  /// - [packageInfoManager] is the package info manager
  BearerDioFactory({
    required super.environmentConfig,
    required super.packageInfoManager,
  });

  @override
  Set<Interceptor> configureInterceptors(
    Dio dio,
    Set<Interceptor> interceptors,
  ) {
    return {};
  }
}
