import 'package:ugaoo/utilities/failure.dart';

/// [NetworkModuleFailure] is a class that represents the failure
/// for the network module.
class NetworkModuleFailure extends Failure {
  /// Constructor of [NetworkModuleFailure] that requires:
  /// - [message] is the message of the failure
  /// - [title] is the title of the failure
  const NetworkModuleFailure({
    required super.message,
    required super.title,
  });
}
