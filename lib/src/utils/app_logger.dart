import 'package:logger/logger.dart';

class AppLogger {
  AppLogger._();

  static final _logger = Logger(
    printer: PrettyPrinter(),
    filter: DevelopmentFilter(),
  );

  static void debug(dynamic message) {
    _logger.d(message);
  }

  static void error(dynamic message) {
    _logger.e(message);
  }

  static void fatal(dynamic message) {
    _logger.f(message);
  }

  static void info(dynamic message) {
    _logger.i(message);
  }

  static void trace(dynamic message) {
    _logger.t(message);
  }

  static void warning(dynamic message) {
    _logger.w(message);
  }
}
