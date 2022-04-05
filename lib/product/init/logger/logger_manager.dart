import 'package:logger/logger.dart';

import '../../../core/base_init/logger/i_logger_manager.dart';

class LoggerManager extends ILoggerManager {
  LoggerManager()
      : super(
          printer: PrettyPrinter(
            methodCount: 1,
            errorMethodCount: 5,
            lineLength: 50,
            printTime: true,
          ),
        );
}
