import 'package:ugaoo/utilities/failure.dart';

/// [FilePickerFailure] is a class that represents the failure for the file picker.
class FilePickerFailure extends Failure {
  /// Constructor of [FilePickerFailure] that requires:
  /// - [message] is the message of the failure
  /// - [title] is the title of the failure
  FilePickerFailure({
    required super.message,
    required super.title,
  });
}
