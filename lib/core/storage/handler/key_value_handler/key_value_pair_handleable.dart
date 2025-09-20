import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/storage/constants/storage_keys.dart';
import 'package:ugaoo/core/storage/handler/storage_handleable.dart';
import 'package:ugaoo/core/storage/model/storage_failure.dart';

/// [KeyValuePairHandleable] is an abstract class that represents
/// the key value pair handleable interface
abstract class KeyValuePairHandleable extends StorageHandleable {
  /// This method is used to write the value in key value pair handlers.
  TaskEither<StorageFailure, void> write<T extends Object>({
    required StorageKeys key,
    required T value,
  });

  /// This method is used to read the value from the key value pair handlers.
  TaskEither<StorageFailure, T?> read<T extends Object>({
    required StorageKeys key,
  });

  /// This method is used to delete the value from the key
  ///  value pair handleable.
  TaskEither<StorageFailure, void> delete({required StorageKeys key});
}
