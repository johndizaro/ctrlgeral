import 'dart:convert';

import 'package:logger/logger.dart';

Logger getLoggerStyle(String className) {
  return Logger(printer: LoggerStyle(className), level: Level.wtf);
}

class LoggerStyle extends LogPrinter {
  final String className;

  LoggerStyle(this.className);

  @override
  List<String> log(LogEvent event) {
    final logColor = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final message = event.message;
    final splitter = LineSplitter();
    final splitMessage = splitter.convert('$message');
    final printGetTime = PrettyPrinter().getTime();
    splitMessage[0] =
        '$emoji - [$className] - ${splitMessage[0]}  - $printGetTime';

    return splitMessage.map((line) => logColor(line)).toList();

    // throw UnimplementedError();
  }
}
