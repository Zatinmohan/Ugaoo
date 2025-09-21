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
      eagerError: true,
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

    return TaskEither.tryCatch(() async {
      var value = none<T>();
      for (final handler in _handlers) {
        final result = await handler.read<T>(key).run();
        if (result.isRight()) {
          value = result.getRight();
          break;
        }
      }
      return value.getOrElse(
        () => throw const RemoteConfigFailure(
          message: 'No handler found for key',
          title: 'Error reading Remote Config',
        ),
      );
    }, (e, s) {
      log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
      return RemoteConfigFailure(
        message: e.toString(),
        title: 'Error reading Remote Config',
      );
    });
  }

  /// This method reads the value from the remote config manager
  /// from a specific handler.
  TaskEither<RemoteConfigFailure, T>
      readFrom<T extends Object, H extends RemoteConfigHandleable>(
    RemoteConfigKey key,
  ) {
    return TaskEither.tryCatch(() async {
      final handler = _handlers.whereType<H>().firstOrNull;
      if (handler == null) {
        throw const RemoteConfigFailure(
          message: 'Handler not found',
          title: 'Error reading Remote Config',
        );
      }
      final result = await handler.read<T>(key).run();
      return result.getOrElse((failure) => throw failure);
    }, (e, s) {
      log.e(e.toString(), config: LoggerModel(exception: e, stackTrace: s));
      return RemoteConfigFailure(
        message: e.toString(),
        title: 'Error reading Remote Config',
      );
    });
  }
}
