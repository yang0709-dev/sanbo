import 'package:flutter/material.dart';
import '../../initialize/scan_dirs.dart';
import 'dart:io';
import './applications.dart';

// the sidebar might need to be Stateful instead,
// because of search function on the application
// animation to slide to the left and disappear

class Sidebar extends StatefulWidget {
  var config;
  Sidebar({super.key, required this.config});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  Future<List<dynamic>> appInfoList = scanDirectory(
    "${Platform.environment['HOME']!}/.local/share/applications",
  );
  @override
  late Color sidebarBackground = Color.fromRGBO(
    widget.config["sidebar_background"][0],
    widget.config["sidebar_background"][1],
    widget.config["sidebar_background"][2],
    widget.config["sidebar_background"][3],
  );
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.4,
      height: screenHeight,
      color: sidebarBackground,
      child: FutureBuilder(
        future: appInfoList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            final applicationInfos = snapshot.data!;
            return Column(
              children: applicationInfos.map((item) {
                return ApplicationContainer(
                  applicationName: item[0],
                  applicationIconPath: item[1],
                  config: widget.config,
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
