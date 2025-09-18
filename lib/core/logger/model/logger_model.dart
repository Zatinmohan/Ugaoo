/// This class contains configuration for the log details for the logger.
class LoggerModel {
  /// Constructor of [LoggerModel] that requries
  /// - [exception] is the exception to log
  /// - [stackTrace] is the stack trace to log
  /// - [name] is the name of the logger
  /// - [level] is the level of the logger
  const LoggerModel({
    this.exception,
    this.stackTrace,
    this.name,
    this.level,
  });

  /// Exception to log
  final Object? exception;

  /// Stack trace to log
  final StackTrace? stackTrace;

  /// Name of the logger
  final String? name;

  /// Level of the logger
  final LoggerLevel? level;
}

/// Enum for the level of the logger
enum LoggerLevel {
  /// Error level
  error,

  /// Warning level
  warning,

  /// Info level
  info,

  /// Debug level
  debug,
}
