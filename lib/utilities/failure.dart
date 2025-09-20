/// This is the base class for all failures
/// or can be known as error/exceptions.
abstract class Failure implements Exception {
  /// Constructor of [Failure] that requires
  /// - [message] is the message of the failure
  /// - [title] is the title of the failure
  /// - [errorCode] is the error code of the failure
  const Failure({
    required this.message,
    required this.title,
    this.errorCode,
  });

  /// The message of the failure
  final String message;

  /// The title of the failure
  final String title;

  /// The error code of the failure
  final int? errorCode;
}
