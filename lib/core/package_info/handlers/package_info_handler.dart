import 'package:fpdart/fpdart.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:ugaoo/core/logger/logger.dart';
import 'package:ugaoo/core/package_info/handlers/package_info_handleable.dart';
import 'package:ugaoo/core/package_info/models/package_info_failures.dart';

/// [PackageInfoHandler] is a class that implements the [PackageInfoHandleable]
/// interface and uses the [PackageInfo] package to get the package info.
class PackageInfoHandler implements PackageInfoHandleable {
  late final PackageInfo _packageInfo;
  @override
  Future<void> configure() async {
    try {
      _packageInfo = await PackageInfo.fromPlatform();
      log.i('Package Info Configured');
    } on Exception catch (error, stackTrace) {
      log.e(
        error.toString(),
        config: LoggerModel(exception: error, stackTrace: stackTrace),
      );
    }
  }

  @override
  TaskEither<PackageInfoFailure, String> get appName => TaskEither.tryCatch(
        () async {
          return _packageInfo.appName;
        },
        (e, s) {
          log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
          return PackageInfoFailure(
            message: e.toString(),
            title: 'Error getting App Name',
          );
        },
      );

  @override
  TaskEither<PackageInfoFailure, String> get buildNumber => TaskEither.tryCatch(
        () async {
          return _packageInfo.buildNumber;
        },
        (e, s) {
          log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
          return PackageInfoFailure(
            message: e.toString(),
            title: 'Error getting Build Number',
          );
        },
      );

  @override
  TaskEither<PackageInfoFailure, String> get packageName => TaskEither.tryCatch(
        () async {
          return _packageInfo.packageName;
        },
        (e, s) {
          log.e(
            e.toString(),
            config: LoggerModel(exception: e, stackTrace: s),
          );
          return PackageInfoFailure(
            message: e.toString(),
            title: 'Error getting Package Name',
          );
        },
      );

  @override
  TaskEither<PackageInfoFailure, String> get version => TaskEither.tryCatch(
        () async {
          return _packageInfo.version;
        },
        (e, s) {
          log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
          return PackageInfoFailure(
            message: e.toString(),
            title: 'Error getting Version',
          );
        },
      );
}
