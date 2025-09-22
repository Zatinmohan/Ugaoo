import 'package:ugaoo/utilities/failure.dart';

/// [EnvironmentConfigFailure] is a class that represents the failure
/// for the environment config.
class EnvironmentConfigFailure extends Failure {
  /// Constructor of [EnvironmentConfigFailure] that requires:
  /// - [message] is the message of the failure
  /// - [title] is the title of the failure
  const EnvironmentConfigFailure({
    required super.message,
    required super.title,
  });
}
