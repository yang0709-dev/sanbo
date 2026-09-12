import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';
import './hide_sidebar_button.dart';
import './widgets/top_buttons.dart';

class MainPage extends StatelessWidget {
  var config;
  MainPage({super.key, required this.config});

  late Color background = config["background"];
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
                  config: config,
                  buttonClicked: () {},
                  buttonIcon: Icons.arrow_back_ios_new,
                ),
                Spacer(),

                // minimize app
                IconButtonsAtTheTop(
                  config: config,
                  buttonClicked: () {
                    windowManager.minimize();
                  },
                  buttonIcon: Icons.remove,
                ),

                // maximize app
                IconButtonsAtTheTop(
                  config: config,
                  buttonClicked: () {
                    windowManager.maximize();
                  },
                  buttonIcon: Icons.crop_square,
                ),

                // close app
                IconButtonsAtTheTop(
                  config: config,
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
