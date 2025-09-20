import 'package:ugaoo/utilities/failure.dart';

/// [PackageInfoFailure] is a class that represents the failure for the package info.
class PackageInfoFailure extends Failure {
  /// Constructor of [PackageInfoFailure] that requires:
  /// - [message] is the message of the failure
  /// - [title] is the title of the failure
  PackageInfoFailure({
    required super.message,
    required super.title,
  });
}
