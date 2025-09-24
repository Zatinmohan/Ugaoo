import 'package:dio/dio.dart';
import 'package:ugaoo/core/network/factories/dio_factory.dart';

final class OpenDioFactory extends DioFactory {
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
