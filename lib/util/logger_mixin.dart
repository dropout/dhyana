import 'package:logger/logger.dart';

/// A mixin that provides a logger instance with class name prefix
/// to any class that uses it.
/// Try to avoid using this mixin with Widgets and performance critical classes
/// so that it's doesn't get recreated very often.
mixin LoggerMixin {

  late final _logger = Logger(
    printer: PrefixPrinter(
      PrettyPrinter(
        colors: false,
        methodCount: 0,
        excludeBox: {
          Level.trace: true,
        }
      ),
      trace: '[${runtimeType.toString()}]',
    )
  );

  Logger get logger => _logger;

}

