import 'dart:io';
import 'package:flutter/material.dart';
import 'scan_dirs.dart';
import 'dart:collection';
import 'dart:convert';

Future<void> initializeApp() async {
  // read config file(keybinding, appearence)
  // load .desktop files and their current permissions
  // preset permissions combinations
  // Exec preset files
  //
  // add to a hashmap and return it to use it later in home page widget
  // the config file is a json
  final Map<String, dynamic> configMap = HashMap();
  String home = Platform.environment['HOME']!;
  late final configFile = File('$home/.config/sanbo/config.json');
  final configResponse = await configFile.readAsString();
  final configData = await json.decode(configResponse);

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

  List colorConfigOptions = ["background", "foreground", "line_color"];
  for (var option in colorConfigOptions) {
    List optionRgbaList = isValidRgba(configData[option]);
    if (optionRgbaList[0]) {
      configMap.addAll({
        option: [optionRgbaList[1], optionRgbaList[2], optionRgbaList[3]],
      });
    } else if (optionRgbaList[1]) {
      switch (option) {
        case "background":
          break;
        case "foreground":
          break;
        case "line_color":
          break;
      }
    }
  }

  // reading background config in the file
  // returns something like (12,34,56,1)
  // and check if its a valid rgba color

  configMap.addAll({});
}
