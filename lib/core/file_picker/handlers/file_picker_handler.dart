import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/file_picker/handlers/file_picker_handleable.dart';
import 'package:ugaoo/core/file_picker/models/file_extension_types.dart';
import 'package:ugaoo/core/file_picker/models/file_picker_failure.dart';
import 'package:ugaoo/core/file_picker/models/file_unit.dart';
import 'package:ugaoo/core/file_picker/models/selected_file_model.dart';
import 'package:ugaoo/core/logger/logger.dart';

/// [FilePickerHandler] is a class that implements the [FilePickerHandleable]
/// interface and uses the [FilePicker] package to pick files.
class FilePickerHandler extends FilePickerHandleable {
  @override
  TaskEither<FilePickerFailure, List<SelectedFileModel>> pickFiles({
    List<String>? allowedExtensions,
    bool withData = false,
    int compressionQuality = 0,
    bool allowMultiple = true,
  }) {
    return TaskEither.tryCatch(() async {
      final files = await FilePicker.platform.pickFiles(
        allowedExtensions: allowedExtensions,
        withData: withData,
        compressionQuality: compressionQuality,
        allowMultiple: allowMultiple,
      );

      if (files == null) {
        return [];
      }

      return files.files
          .map((e) => SelectedFileModel(
                path: e.path ?? '',
                name: e.name,
                size: e.size.toDouble(),
                extension: FileExtensionType.fromString(e.extension ?? ''),
                unit: FileUnit.bytes,
              ))
          .toList();
    }, (e, s) {
      log.e(
        e.toString(),
        config: LoggerModel(
          exception: e,
          stackTrace: s,
        ),
      );
      return FilePickerFailure(
        message: e.toString(),
        title: 'Error picking files',
      );
    });
  }
}
