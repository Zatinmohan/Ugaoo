import 'package:fpdart/fpdart.dart';
import 'package:ugaoo/core/logger/logger.dart';
import 'package:ugaoo/core/remote_config/handlers/remote_config_handleable.dart';
import 'package:ugaoo/core/remote_config/models/remote_config_failures.dart';
import 'package:ugaoo/core/remote_config/models/remote_config_keys.dart';

/// [RemoteConfigManager] is a class that manages the remote config of the app.
class RemoteConfigManager {
  /// Constructor of [RemoteConfigManager] that requires:
  /// - [RemoteConfigHandleable] firebase remote config handler
  const RemoteConfigManager({
    required List<RemoteConfigHandleable> handlers,
  }) : _handlers = handlers;

  final List<RemoteConfigHandleable> _handlers;

  /// This method configures the remote config manager
  Future<void> configure() async {
    await Future.wait(
      _handlers.map(_configureHandler),
    );
  }

  Future<void> _configureHandler(RemoteConfigHandleable handler) async {
    final result = await handler.configure().run();
    if (result.isLeft()) {
      result.mapLeft(
        (error) => log.e(error.toString()),
      );
    }
  }

  /// This method reads the value from the remote config manager.
  TaskEither<RemoteConfigFailure, T> read<T extends Object>(
    RemoteConfigKey key, {
    RemoteConfigHandleable? handler,
  }) {
    if (handler != null) return handler.read<T>(key);

    return _handlers.fold<TaskEither<RemoteConfigFailure, T>>(
      TaskEither.left(
        RemoteConfigFailure(
          message: 'No Hnadler as the ${key.key}',
          title: 'Key - ${key.key} not found',
        ),
      ),
      (acc, h) => acc.orElse((_) => h.read<T>(key)),
    );
  }

  /// This method reads the value from the remote config manager
  /// from a specific handler.
  TaskEither<RemoteConfigFailure, T>
      readFrom<T extends Object, H extends RemoteConfigHandleable>(
    RemoteConfigKey key,
  ) {
    final handler = _handlers.whereType<H>().firstOrNull;
    return TaskEither.fromNullable(
      handler,
      () => const RemoteConfigFailure(
        message: 'Specified handler not found',
        title: 'Error reading Remote Config',
      ),
    ).flatMap((handler) => handler.read<T>(key));
  }
}
