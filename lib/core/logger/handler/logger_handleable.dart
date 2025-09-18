import 'package:ugaoo/core/logger/model/logger_model.dart';

/// [LoggerHandleable] is an abstract class that represents
/// the log handleable interface
abstract class LoggerHandleable {
  /// This method is used to configure the log handleable.
  void configure();

  /// This method is used to log a message.
  void log(String message, LoggerModel? config);

  /// This method is used to log an error message.
  void error(String message, LoggerModel? config);

  /// This method is used to log a warning message.
  void warning(String message, LoggerModel? config);

  /// This method is used to log an info message.
  void info(String message, LoggerModel? config);

  /// This method is used to log a debug message.
  void debug(String message, LoggerModel? config);
}
