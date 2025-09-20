import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/storage/model/storage_failure.dart';

abstract class StorageHandleable {
  TaskEither<StorageFailure, void> configure();
}
