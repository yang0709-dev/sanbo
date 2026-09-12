import 'package:flutter/material.dart';
import '../../initialize/scan_dirs.dart';
import 'dart:io';
import './widgets/applications.dart';
import './widgets/extra_button_above_apps.dart';

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
            // applicationInfos[0] = app name
            // applicationInfos[1] = app icon path
            // applicationInfos[2] = .desktop file absolute path
            final List<dynamic> applicationInfos = snapshot.data!;

            // https://stackoverflow.com/questions/69853729/flutter-the-scrollbars-scrollcontroller-has-no-scrollposition-attached
            final scrollController = ScrollController();
            return Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    // add files
                    ExtraButtonsAboveApplications(
                      config: widget.config,
                      buttonIcon: Icons.add,
                      buttonPressed: () {
                        setState(() {});
                      },
                      buttonText: "Add Files",
                    ),

                    ExtraButtonsAboveApplications(
                      config: widget.config,
                      buttonIcon: Icons.edit,
                      buttonPressed: () {},
                      buttonText: "Edit Profiles",
                    ),
                    ...applicationInfos.map((item) {
                      return ApplicationContainer(
                        applicationName: item[0],
                        applicationIconPath: item[1],
                        config: widget.config,
                      );
                    }),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
