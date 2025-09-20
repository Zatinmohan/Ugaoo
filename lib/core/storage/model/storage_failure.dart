import 'package:ugaoo/utilities/failure.dart';

/// This class represents the failure for the storage.
/// Whatever storage related failure will be handled by this class.
class StorageFailure extends Failure {
  /// Constructor of [StorageFailure] that requires
  /// - [message] is the message of the failure
  /// - [title] is the title of the failure
  const StorageFailure({
    required super.message,
    required super.title,
  });
}
