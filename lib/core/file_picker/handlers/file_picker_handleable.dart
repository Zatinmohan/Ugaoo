import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/file_picker/models/file_picker_failure.dart';
import 'package:ugaoo/core/file_picker/models/selected_file_model.dart';

/// [FilePickerHandleable] is an abstract class that represents
/// the file picker handleable interface
abstract class FilePickerHandleable {
  /// This method is used to pick files from the system.
  /// It returns a [TaskEither] that contains a list of [SelectedFileModel]
  /// or a [FilePickerFailure].
  /// - [allowedExtensions] is the allowed extensions of the files
  /// - [withData] is the flag to include the data of the files
  /// - [compressionQuality] is the compression quality of the files
  /// - [allowMultiple] is the flag to allow multiple files to be picked
  /// It returns a [TaskEither] that contains a list of [SelectedFileModel]
  /// or a [FilePickerFailure].
  TaskEither<FilePickerFailure, List<SelectedFileModel>> pickFiles({
    List<String>? allowedExtensions,
    bool withData = false,
    int compressionQuality = 0,
    bool allowMultiple = true,
  });
}
