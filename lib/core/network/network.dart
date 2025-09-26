import 'package:ugaoo/core/environment/models/environment_network_config.dart';
import 'package:ugaoo/core/network/factories/bearer_dio_factory.dart';
import 'package:ugaoo/core/network/factories/open_dio_factory.dart';
import 'package:ugaoo/core/package_info/package_info_manager.dart';

/// [Network] is a class that represents the network layer.
class Network {
  /// Constructor of [Network] that requires:
  /// - [networkConfig] is the environment configuration
  /// - [packageInfoManager] is the package info manager
  Network({
    required EnvironmentNetworkConfig networkConfig,
    required PackageInfoManager packageInfoManager,
  })  : _networkConfig = networkConfig,
        _packageInfoManager = packageInfoManager;

  final EnvironmentNetworkConfig _networkConfig;
  final PackageInfoManager _packageInfoManager;

  /// The open dio factory
  late final OpenDioFactory openDio = OpenDioFactory(
    environmentConfig: _networkConfig,
    packageInfoManager: _packageInfoManager,
  );

  /// The bearer dio factory
  late final BearerDioFactory bearerDio = BearerDioFactory(
    environmentConfig: _networkConfig,
    packageInfoManager: _packageInfoManager,
  );
}
