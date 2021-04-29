import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'home/home.dart';

Future<void> main() async {
  Queue<LogRecord> logs = Queue();

  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.loggerName}: ${record.level.name}: ${record.time}: ${record.message}');
    logs.addLast(record);
    while(logs.length  > 10) {
      logs.removeFirst();
    }
  });

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}




