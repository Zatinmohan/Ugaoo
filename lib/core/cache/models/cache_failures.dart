import 'package:ugaoo/utilities/failure.dart';

/// [CacheFailure] is a class that represents the failure for the cache.
class CacheFailure extends Failure {
  /// Constructor of [CacheFailure] that requires:
  /// - [message] is the message of the failure
  /// - [title] is the title of the failure
  const CacheFailure({
    required super.message,
    required super.title,
  });
}
