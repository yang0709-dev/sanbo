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
  late Color sidebarBackground = widget.config["sidebar_background"];
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.3,
      height: screenHeight,
      color: sidebarBackground,
      child: FutureBuilder(
        future: appInfoList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            // 0 = app name
            // 1 = app icon
            final applicationInfos = snapshot.data!;

            // https://stackoverflow.com/questions/69853729/flutter-the-scrollbars-scrollcontroller-has-no-scrollposition-attached
            final scrollController = ScrollController();
            return Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: applicationInfos.map((item) {
                    return ApplicationContainer(
                      applicationName: item[0],
                      applicationIconPath: item[1],
                      config: widget.config,
                    );
                  }).toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
