import 'package:logger/logger.dart';

Logger getLogger(String className) {
  return Logger(
    printer: PrefixPrinter(
      PrettyPrinter(
        colors: false,
        methodCount: 0,
        excludeBox: {
          Level.trace: true,
        }
      ),
      trace: '[$className]',
    )
  );
}
