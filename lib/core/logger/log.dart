import 'package:ugaoo/core/logger/handler/logger_handleable.dart';
import 'package:ugaoo/core/logger/handler/talker_logger_handler.dart';
import 'package:ugaoo/core/logger/model/logger_model.dart';

class _LoggerFacade {
  final LoggerHandleable _logger = TalkerLoggerHandler();

  void call(String message, {LoggerModel? config}) =>
      _logger.log(message, config);

  void e(String message, {LoggerModel? config}) =>
      _logger.error(message, config);

  void w(String message, {LoggerModel? config}) =>
      _logger.warning(message, config);

  void i(String message, {LoggerModel? config}) =>
      _logger.info(message, config);

  void d(String message, {LoggerModel? config}) =>
      _logger.debug(message, config);
}

final log = _LoggerFacade();
