import 'dart:collection';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'home/home.dart';

var outputFile = new File('sample.log');

Future<void> main() async {

  // Queue<LogRecord> logs = Queue();

  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((LogRecord record) {

    outputFile.writeAsStringSync("${record.time} | ${record.level} | ${record.message} | ${record.loggerName}\n", mode: FileMode.append);

    // print('${record.loggerName}: ${record.time}: ${record.level.name}:  ${record.message}');
    // logs.addLast(record);
    // while(logs.length  > 10) {
    //   logs.removeFirst();
    // }
  });

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}




