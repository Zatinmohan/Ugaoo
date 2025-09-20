part of 'app_di.dart';

void _registerPackageInfoDependencies() {
  sl.registerSingletonAsync<PackageInfoManager>(() async {
    final packageInfo = PackageInfoManager(
      packageInfoHandler: PackageInfoHandler(),
    );
    await packageInfo.configure();
    log.i('Package Info Dependencies Registered');
    return packageInfo;
  });
}
