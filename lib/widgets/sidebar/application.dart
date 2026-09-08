import 'package:flutter/material.dart';
import '../../initialize/init.dart';

// load configMap settings
// primary line_color for the border, app_background for background color of the app block

class ApplicationContainer extends StatelessWidget {
  final String applicationName;
  final String applicationIconPath;
  var config;
  ApplicationContainer({
    super.key,
    required this.applicationName,
    required this.applicationIconPath,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 3),
      child: ElevatedButton(
        onPressed: () {
          print(config["line_color"][1]);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          side: BorderSide(
            width: 2,
            color: Color.fromRGBO(
              config["line_color"][0],
              config["line_color"][1],
              config["line_color"][2],
              config["line_color"][3],
            ),
          ),
        ),
        child: Text(applicationName),
      ),
    );
  }
}
