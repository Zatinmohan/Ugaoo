import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/storage/handler/storage_handleable.dart';
import 'package:ugaoo/core/storage/model/storage_failure.dart';

/// [DatabaseHandleable] is an abstract class that represents
/// the database handleable interface
abstract class DatabaseHandleable<T> extends StorageHandleable {
  /// This method is used to read the value from the database
  ///
  /// [S] is the type of the value to read
  /// [primaryKey] is the primary key of the value to read
  TaskEither<StorageFailure, S?> read<S extends T>(Object primaryKey);

  /// This method is used to write the value to the database
  ///
  /// [S] is the type of the value to write
  /// [value] is the value to write
  /// [shouldUpdate] is a boolean to determine if the value should be updated
  TaskEither<StorageFailure, void> write<S extends T>(
    S value, {
    bool shouldUpdate = true,
  });

  /// This method is used to delete the value from the database
  ///
  /// [S] is the type of the value to delete
  /// [primaryKey] is the primary key of the value to delete
  TaskEither<StorageFailure, void> delete<S extends T>(Object primaryKey);
}
