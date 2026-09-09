import 'package:flutter/material.dart';
import 'dart:io';

// scan ~/.local/share/application
// and /usr/share/applications (how)
// d rwx r-x r-x root root
//
// informations
// Name=
// Icon= (all /usr/share/applications/ uses icon name, no idea how to handle that)
//
// returns a two layer list, that looks like [["name","iconPath"],["name","iconPath"]]

Future<List> scanDirectory(String directoryPath) async {
  // check if the directory actually exist
  bool isDesktopFile(String filename) {
    if (filename.split(".").last.trim() == "desktop") {
      return false;
    } else {
      return true;
    }
  }

  if (!await Directory(directoryPath).exists()) {
    return [];
  } else {
    // scan the directory for every single file
    // check .desktop file validation
    final List entities = await Directory(directoryPath).list().toList();
    final Iterable<File> files = entities.whereType<File>();
    for (File file in files) {
      if (isDesktopFile(directoryPath.split("/").last.trim())) {
        final configResponse = await file.readAsString();
      }
    }
  }
  return [];
}
