import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/package_info/models/package_info_failures.dart';

/// [PackageInfoHandleable] is an abstract class that represents the package
/// info handleable interface.
abstract class PackageInfoHandleable {
  /// This method is used to configure the package info handleable.
  Future<void> configure();

  /// Gets the app name
  TaskEither<PackageInfoFailure, String> get appName;

  /// Gets the package name
  TaskEither<PackageInfoFailure, String> get packageName;

  /// Gets the version
  TaskEither<PackageInfoFailure, String> get version;

  /// Gets the build number
  TaskEither<PackageInfoFailure, String> get buildNumber;
}
