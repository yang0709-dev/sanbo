import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import './widgets/top_buttons.dart';

class MainPage extends StatefulWidget {
  var config;
  Function hideSidebarFunction;
  MainPage({
    super.key,
    required this.config,
    required this.hideSidebarFunction,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Color background = widget.config["background"];

  bool isSidebarVisible = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: background,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // hide sidebar button
                IconButtonsAtTheTop(
                  config: widget.config,
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
                Spacer(),

                // minimize app
                IconButtonsAtTheTop(
                  config: widget.config,
                  buttonClicked: () {
                    windowManager.minimize();
                  },
                  buttonIcon: Icons.remove,
                ),

                // maximize app
                IconButtonsAtTheTop(
                  config: widget.config,
                  buttonClicked: () {
                    windowManager.maximize();
                  },
                  buttonIcon: Icons.crop_square,
                ),

                // close app
                IconButtonsAtTheTop(
                  config: widget.config,
                  buttonClicked: () {
                    windowManager.close();
                  },
                  buttonIcon: Icons.close,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
