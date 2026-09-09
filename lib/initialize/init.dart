import 'dart:io';
import 'package:flutter/material.dart';
import 'scan_dirs.dart';
import 'dart:collection';
import 'dart:convert';

Future<Map> initializeApp() async {
  final Map<String, dynamic> configMap = HashMap();
  // read config file(keybinding, appearence)
  // load .desktop files and their current permissions
  // preset permissions combinations
  // Exec preset files
  //
  // add to a hashmap and return it to use it later in home page widget
  // the config file is a json
  String home = Platform.environment['HOME']!;
  late final configFile = File('$home/.config/sanbo/config.json');
  final configResponse = await configFile.readAsString();
  final configData = await json.decode(configResponse);

  List isValidRgba(String? maybeValue) {
    final regex = RegExp(
      r'^\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*(0|1|0?\.\d+)\s*\)$',
    );
    String value;

    if (maybeValue == null) {
      return [false];
    } else {
      value = maybeValue;
    }

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

  List colorConfigOptions = [
    "background",
    "foreground",
    "line_color",
    "app_background",
    "sidebar_background",
  ];

  // currently does not handle the situation where one of the colorConfigOptions doesnt actually exist in the config file
  // because isValidRgba only accepts String value, when the option doesnt exist, config[option] returns null
  for (var option in colorConfigOptions) {
    List optionRgbaList = isValidRgba(configData[option]);
    if (optionRgbaList[0]) {
      configMap.addAll({
        option: [
          optionRgbaList[1],
          optionRgbaList[2],
          optionRgbaList[3],
          optionRgbaList[4],
        ],
      });
    } else if (!optionRgbaList[0]) {
      switch (option) {
        case "background":
          configMap.addAll({
            option: [20, 20, 20, 1],
          });
          break;
        case "foreground":
          configMap.addAll({
            option: [255, 255, 255, 1],
          });
          break;
        case "line_color":
          configMap.addAll({
            option: [200, 200, 200, 1],
          });
          break;
        case "app_background":
          configMap.addAll({
            option: [200, 200, 200, 1],
          });
          break;
        case "sidebar_background":
          configMap.addAll({
            option: [200, 200, 200, 1],
          });
          break;
      }
    }
  }
  return configMap;
}
