import 'package:ugaoo/core/logger/logger.dart';
import 'package:ugaoo/core/package_info/handlers/package_info_handler.dart';

/// [PackageInfoManager] is a class that manages the package info of the app.
class PackageInfoManager {
  /// Constructor of [PackageInfoManager] that requires:
  /// - [PackageInfoHandler] package info handler
  const PackageInfoManager({
    required PackageInfoHandler packageInfoHandler,
  }) : _packageInfoHandler = packageInfoHandler;

  final PackageInfoHandler _packageInfoHandler;

  /// This method configures the package info manager
  Future<void> configure() async {
    final result = await _packageInfoHandler.configure().run();

    if (result.isLeft()) {
      result.mapLeft(
        (error) => log.e(error.toString()),
      );
    }
  }
}
