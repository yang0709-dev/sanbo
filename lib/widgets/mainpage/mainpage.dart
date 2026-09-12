import 'package:flutter/material.dart';
import './hide_sidebar_button.dart';
import './hide_sidebar_button.dart';

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
                HideSidebarButton(config: config),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
