import 'package:ugaoo/core/file_picker/models/file_extension_types.dart';
import 'package:ugaoo/core/file_picker/models/file_unit.dart';

/// This class is used to represent a file selected by the user
/// from the system.
/// It can also be used to send information to the remote server.
class SelectedFileModel {
  /// Constructor of [SelectedFileModel] that requires:
  /// - [path] is the path of the file
  /// - [name] is the name of the file
  /// - [extension] is the extension of the file
  /// - [size] is the size of the file
  /// - [unit] is the unit of the file
  const SelectedFileModel({
    required this.path,
    required this.name,
    required this.extension,
    required this.size,
    required this.unit,
  });

  /// The path of the file
  final String path;

  /// The name of the file
  final String name;

  /// The extension of the file
  final FileExtensionType extension;

  /// The size of the file
  final double size;

  /// The unit of the file
  final FileUnit unit;
}
