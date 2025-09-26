import 'package:ugaoo/utilities/failure.dart';

/// [RemoteConfigFailure] is a class that represents the
/// failure for the remote config.
class RemoteConfigFailure extends Failure {
  /// Constructor of [RemoteConfigFailure] that requires:
  /// - [message] is the message of the failure
  /// - [title] is the title of the failure
  const RemoteConfigFailure({
    required super.message,
    required super.title,
  });
}
