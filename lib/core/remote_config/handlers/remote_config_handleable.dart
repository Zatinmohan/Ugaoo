import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/remote_config/models/remote_config_failures.dart';
import 'package:ugaoo/core/remote_config/models/remote_config_keys.dart';

/// [RemoteConfigHandleable] is an abstract class that represents the remote config handleable interface.
abstract class RemoteConfigHandleable {
  /// This method is used to configure the remote config handleable.
  TaskEither<RemoteConfigFailure, void> configure();

  /// This method is used to read the value from the remote config handleable.
  TaskEither<RemoteConfigFailure, T> read<T extends Object>(
      RemoteConfigKey key);

  /// This method is used to configure the remote config handleable.
  Future<Map<String, dynamic>> defaultValues();
}
