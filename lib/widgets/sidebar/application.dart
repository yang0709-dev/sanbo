import 'package:flutter/material.dart';
import '../../initialize/init.dart';

// load configMap settings
// primary line_color for the border, app_background for background color of the app block

class ApplicationContainer extends StatelessWidget {
  // Color lineColor = Color.fromRGBO(
  //   configMap["line_color"][1],
  //   configMap["line_color"][2],
  //   configMap["line_color"][3],
  //   configMap["line_color"][4],
  // );
  // Color appBackground = Color.fromRGBO(
  //   configMap["app_background"][1],
  //   configMap["app_background"][2],
  //   configMap["app_background"][3],
  //   configMap["app_background"][4],
  // );
  final String applicationName;
  final String applicationIconPath;
  ApplicationContainer({
    super.key,
    required this.applicationName,
    required this.applicationIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 3),
      child: ElevatedButton(
        onPressed: () {
          print(configMap);
        },
        child: Text("test"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
