// print debug messages
import 'package:flutter/foundation.dart';

void logDebug(String message) {
  final stackLines = StackTrace.current.toString().split('\n');

  // 0 = StackTrace.current
  // 1 = logDebug
  // 2 = the code that called logDebug
  final caller = stackLines.length > 2 ? stackLines[2].trim() : 'unknown';

  debugPrint('[DEBUG] $caller — $message');
}

// import 'dart:developer' as developer;
//
// void logDebug(String message) {
//   developer.log(
//     message,
//     name: 'my_app',
//     level: 500,
//     stackTrace: StackTrace.current,
//   );
// }
