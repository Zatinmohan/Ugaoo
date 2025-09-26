part of 'app_di.dart';

void _registerNetworkDependencies() {
  sl.registerLazySingletonAsync<Network>(() async {
    final environmentConfigManager = sl.get<EnvironmentConfigManager>();
    final packageInfoManager = sl.get<PackageInfoManager>();

    final networkConfig =
        await environmentConfigManager.environmentConfig.networkConfig;

    return Network(
      networkConfig: networkConfig,
      packageInfoManager: packageInfoManager,
    );
  });
}
