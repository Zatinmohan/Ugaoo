import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/storage/model/storage_failure.dart';

/// [StorageHandleable] is an abstract class that represents
/// the storage handleable interface
// ignore: one_member_abstracts
abstract class StorageHandleable {
  /// This method is used to configure the storage handleable.
  TaskEither<StorageFailure, void> configure();
}
