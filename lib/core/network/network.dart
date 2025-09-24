import 'package:ugaoo/core/environment/models/environment_network_config.dart';
import 'package:ugaoo/core/network/factories/bearer_dio_factory.dart';
import 'package:ugaoo/core/network/factories/open_dio_factory.dart';
import 'package:ugaoo/core/package_info/package_info_manager.dart';

class Network {
  Network({
    required EnvironmentNetworkConfig networkConfig,
    required PackageInfoManager packageInfoManager,
  })  : _networkConfig = networkConfig,
        _packageInfoManager = packageInfoManager;

  final EnvironmentNetworkConfig _networkConfig;
  final PackageInfoManager _packageInfoManager;

  late final OpenDioFactory openDio = OpenDioFactory(
    environmentConfig: _networkConfig,
    packageInfoManager: _packageInfoManager,
  );

  late final BearerDioFactory bearerDio = BearerDioFactory(
    environmentConfig: _networkConfig,
    packageInfoManager: _packageInfoManager,
  );
}
