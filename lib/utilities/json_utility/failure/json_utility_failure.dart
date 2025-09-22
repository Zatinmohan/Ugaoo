import 'package:ugaoo/utilities/failure.dart';

/// [JsonUtilityFailure] is a class that represents the failure
/// for the json utility.
class JsonUtilityFailure extends Failure {
  /// Constructor of [JsonUtilityFailure] that requires:
  /// - [message] is the message of the failure
  /// - [title] is the title of the failure
  const JsonUtilityFailure({
    required super.message,
    required super.title,
  });
}
