import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  var config;
  MainPage({super.key, required this.config});

  late Color background = Color.fromRGBO(
    config["background"][0],
    config["background"][1],
    config["background"][2],
    config["background"][3],
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(color: background));
  }
}
