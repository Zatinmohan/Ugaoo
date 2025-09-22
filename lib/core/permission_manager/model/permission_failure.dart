import 'package:ugaoo/utilities/failure.dart';

/// [PermissionFailure] is a class that represents the failure 
/// for the permission.
class PermissionFailure extends Failure {
  /// Constructor of [PermissionFailure] that requires:
  /// - [message] is the message of the failure
  /// - [title] is the title of the failure
  const PermissionFailure({
    required super.message,
    required super.title,
  });
}
