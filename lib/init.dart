import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:collection';

Future<void> initializeApp() async {
  // read config file(keybinding, appearence)
  // load .desktop files and their current permissions
  // preset permissions combinations
  // Exec preset files
  //
  // add to a hashmap and return it to use it later in home page widget
  final Map<String, dynamic> configMap = HashMap();
  String home = Platform.environment['HOME']!;
  late final configFile = File('$home/.config/sanbo/config.conf');
  final configContent = await configFile.readAsString();

  List isValidRgba(String value) {
    final regex = RegExp(
      r'^\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*(0|1|0?\.\d+)\s*\)$',
    );

    final match = regex.firstMatch(value);
    if (match == null) return [false];

    int r = int.parse(match.group(1)!);
    int g = int.parse(match.group(2)!);
    int b = int.parse(match.group(3)!);
    double a = double.parse(match.group(4)!);

    if (r <= 255 && g <= 255 && b <= 255 && a <= 1) {
      return [true, r, g, b, a];
    } else {
      return [false];
    }
  }

  // reading background config in the file
  // returns something like (12,34,56,1)
  // and check if its a valid rgba color
  final backgroundRegex = RegExp(r'background=(\(.*?\))');
  final backgroundMatch = backgroundRegex.firstMatch(configContent);
  final String backgroundMatchedText =
      backgroundMatch?.group(1)?.toString() ?? '';
  final List backgroundRgbaList = isValidRgba(backgroundMatchedText);
  Color homepageBackground = backgroundRgbaList[0]
      ? Color.fromRGBO(
          backgroundRgbaList[1],
          backgroundRgbaList[2],
          backgroundRgbaList[3],
          backgroundRgbaList[4],
        )
      : Colors.black;
  print(homepageBackground);
  configMap.addAll({});
}
