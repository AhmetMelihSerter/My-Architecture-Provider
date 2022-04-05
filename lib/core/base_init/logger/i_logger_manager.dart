import 'package:logger/logger.dart';

abstract class ILoggerManager extends Logger {
  ILoggerManager({LogPrinter? printer}) : super(printer: printer);
}
