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
// returns a two layer list, that looks like [["name","iconPath","absolutePath"],["name","iconPath","absolutePath"]]
// also stores the original Exec so its easier to revert (don't store in .config)
//
// some apps in ~/.local/share/applications/ also uses icon name instead of the absolute path
// some doesnt have icon at all
//

enum SidebarItem { notNameAndIcon, name, icon }

Future<List> scanDirectory(String directoryPath) async {
  // check if the directory actually exist
  bool isDesktopFile(String filename) {
    if (filename.split(".").last.trim() == "desktop") {
      return true;
    } else {
      return false;
    }
  }

  if (!await Directory(directoryPath).exists()) {
    return [];
  } else {
    // scan the directory for every single file
    // check .desktop file validation
    final List entities = await Directory(directoryPath).list().toList();
    final Iterable<File> files = entities.whereType<File>();

    // returns [namePath,iconPath] after all the stuff
    // in this function returns something like [SidebarItem.{propertyName},val]
    // where the first value is the property of the .desktop file
    List propertyCheck(String property) {
      RegExp nameRegx = RegExp(r'^(Name=)(.*)');
      RegExp iconRegx = RegExp(r'^(Icon=)(.*)');

      if (nameRegx.hasMatch(property)) {
        final name = nameRegx.firstMatch(property);
        return [SidebarItem.name, name?.group(2)];
      } else if (iconRegx.hasMatch(property)) {
        final icon = iconRegx.firstMatch(property);
        return [SidebarItem.icon, icon?.group(2)];
      } else {
        return [SidebarItem.notNameAndIcon];
      }
    }

    List applicationData = [];
    for (File file in files) {
      if (isDesktopFile(file.path.split("/").last.trim())) {
        final List<String> lines = await file.readAsLines();
        List res = ["", "", file.path];
        for (String line in lines) {
          // print(line);
          List propertyList = propertyCheck(line);
          if (propertyList[0] == SidebarItem.notNameAndIcon) {
            continue;
          } else if (propertyList[0] == SidebarItem.name) {
            res[0] = propertyList[1];
          } else if (propertyList[0] == SidebarItem.icon) {
            res[1] = propertyList[1];
          }
        }

        if (res[0] == "") {
          continue;
        } else {
          // have both name and icon, or no icon
          applicationData.add(res);
          // print(file.path);
        }
      }
    }
    // print(applicationData);
    return applicationData;
  }
}
