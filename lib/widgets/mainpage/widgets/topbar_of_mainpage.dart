import 'package:flutter/material.dart';
import './top_buttons.dart';
import 'package:window_manager/window_manager.dart';

class TopbarOfMainpage extends StatefulWidget {
  var config;
  Function hideSidebarFunction;
  TopbarOfMainpage({
    super.key,
    required this.config,
    required this.hideSidebarFunction,
  });

  @override
  State<TopbarOfMainpage> createState() => _TopbarOfMainpageState();
}

class _TopbarOfMainpageState extends State<TopbarOfMainpage> {
  bool isSidebarVisible = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // hide sidebar button
        IconButtonsAtTheTop(
          config: widget.config,
          tooltip: isSidebarVisible ? "Hide Sidebar" : "Show Sidebar",

          buttonClicked: () {
            widget.hideSidebarFunction();
            setState(() {
              isSidebarVisible = !isSidebarVisible;
            });
          },
          buttonIcon: isSidebarVisible
              ? Icons.arrow_back_ios_new
              : Icons.arrow_forward_ios,
        ),
        IconButtonsAtTheTop(
          tooltip: "Search for app properties",
          config: widget.config,
          buttonClicked: () {},
          buttonIcon: Icons.search,
        ),
        Spacer(),

        IconButtonsAtTheTop(
          tooltip: "Settings",
          config: widget.config,
          buttonClicked: () {},
          buttonIcon: Icons.settings,
        ),
        // minimize app
        IconButtonsAtTheTop(
          tooltip: "Minimize App",
          config: widget.config,
          buttonClicked: () {
            windowManager.minimize();
          },
          buttonIcon: Icons.remove,
        ),

        // maximize app
        IconButtonsAtTheTop(
          tooltip: "Maximize App",
          config: widget.config,
          buttonClicked: () {
            windowManager.maximize();
          },
          buttonIcon: Icons.crop_square,
        ),

        // close app
        IconButtonsAtTheTop(
          tooltip: "Close App",
          config: widget.config,
          buttonClicked: () {
            windowManager.close();
          },
          buttonIcon: Icons.close,
        ),
      ],
    );
  }
}
