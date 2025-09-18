import 'package:talker/talker.dart';
import 'package:ugaoo/core/logger/handler/logger_handleable.dart';
import 'package:ugaoo/core/logger/model/logger_model.dart';

/// [TalkerLoggerHandler] is a class that implements the [LoggerHandleable] interface
/// and uses the [Talker] package to log messages.
class TalkerLoggerHandler implements LoggerHandleable {
  /// Factory constructor returns the single instance
  factory TalkerLoggerHandler() => _instance;

  /// Private constructor
  TalkerLoggerHandler._internal() {
    _configureIfNeeded();
  }

  /// Singleton instance
  static final TalkerLoggerHandler _instance = TalkerLoggerHandler._internal();

  /// Instance of [Talker] that is used to log messages.
  late final Talker _talker;

  /// Tracks whether configuration has already been performed
  bool _isConfigured = false;

  void _configureIfNeeded() {
    if (_isConfigured) return;
    _talker = Talker();
    _isConfigured = true;
  }

  @override
  void configure() => _configureIfNeeded();

  @override
  void debug(String message, LoggerModel? config) => _talker.debug(
        message,
        config?.exception,
        config?.stackTrace,
      );

  @override
  void error(String message, LoggerModel? config) => _talker.error(
        message,
        config?.exception,
        config?.stackTrace,
      );

  @override
  void info(String message, LoggerModel? config) => _talker.info(
        message,
        config?.exception,
        config?.stackTrace,
      );

  @override
  void log(String message, LoggerModel? config) => _talker.log(
        message,
        stackTrace: config?.stackTrace,
        exception: config?.exception,
        logLevel: _getLogLevel(config?.level ?? LoggerLevel.info),
      );

  @override
  void warning(String message, LoggerModel? config) => _talker.warning(
        message,
        config?.exception,
        config?.stackTrace,
      );

  LogLevel _getLogLevel(LoggerLevel level) {
    return switch (level) {
      LoggerLevel.error => LogLevel.error,
      LoggerLevel.warning => LogLevel.warning,
      LoggerLevel.info => LogLevel.info,
      LoggerLevel.debug => LogLevel.debug,
    };
  }
}
