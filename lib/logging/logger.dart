// import 'dart:async';
// import 'dart:convert';
//
// import 'package:logger/logger.dart';
// import 'package:meta/meta.dart';
//
// mixin Logging {
//   Logger _logger;
//
//   // Logger get log {
//   //   return _logger ??= Logger(
//   //     printer: SimpleLogPrinter(scope: '$runtimeType', colorsEnabled: false),
//   //   );
//   // }
//
//
//   Logger get log {
//     return _logger ??= Logger(
//       printer: PrettyPrinter(
//           methodCount: 2,
//           // number of method calls to be displayed
//           errorMethodCount: 8,
//           // number of method calls if stacktrace is provided
//           lineLength: 120,
//           // width of the output
//           colors: true,
//           // Colorful log messages
//           printEmojis: true,
//           // Print an emoji for each log message
//           printTime: true // Should each log print contain a timestamp
//       ),
//
//     );
//   }
//
//
// }
//
// class SimpleLogPrinter extends LogPrinter {
//   final String scope;
//   final bool colorsEnabled;
//
//
//   SimpleLogPrinter({
//     @required this.scope,
//     this.colorsEnabled = false,
//   });
//
//   @override
//   List<String> log(LogEvent event) {
//     final logColor = PrettyPrinter.levelColors[event.level];
//     final emoji = PrettyPrinter.levelEmojis[event.level];
//     final message = event.message;
//     final splitter = LineSplitter();
//     final splitMessage = splitter.convert('$message');
//     splitMessage[0] = '- $emoji - [$scope] - ${splitMessage[0]}';
//     if (colorsEnabled) {
//       return splitMessage.map((line) => logColor(line)).toList();
//     }
//
//     return splitMessage;
//   }
// }