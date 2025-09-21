import 'package:fpdart/fpdart.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ugaoo/core/permission_manager/model/permission_failure.dart';

/// [PermissionManager] is a class that manages the permission of the app.
class PermissionManager {
  /// Constructor of [PermissionManager] that requires:
  /// - [Permission] permission
  const PermissionManager(this._permission);

  final Permission _permission;

  /// This method returns the current status of the permission
  TaskEither<PermissionFailure, PermissionStatus> get currentStatus =>
      TaskEither.tryCatch(() async {
        final status = await _permission.status;
        return status;
      }, (e, s) {
        return PermissionFailure(
          message: e.toString(),
          title: 'Error checking permission',
        );
      });

  /// This method requests the permission
  TaskEither<PermissionFailure, PermissionStatus> request({
    void Function(PermissionStatus status)? onStatus,
  }) {
    return TaskEither.tryCatch(() async {
      final status = await _permission.request();
      onStatus?.call(status);
      return status;
    }, (e, s) {
      return PermissionFailure(
        message: e.toString(),
        title: 'Error requesting permission',
      );
    });
  }
}
