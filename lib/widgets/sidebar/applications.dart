import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_svg/svg.dart';

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
  late Color appBackground = Color.fromRGBO(
    config["app_background"][0],
    config["app_background"][1],
    config["app_background"][2],
    config["app_background"][3],
  );

  late Color lineColor = Color.fromRGBO(
    config["line_color"][0],
    config["line_color"][1],
    config["line_color"][2],
    config["line_color"][3],
  );

  late Color foreground = Color.fromRGBO(
    config["foreground"][0],
    config["foreground"][1],
    config["foreground"][2],
    config["foreground"][3],
  );

  @override
  Widget build(BuildContext context) {
    String applicationIconExtension = applicationIconPath
        .split(".")
        .last
        .trim();
    bool isExtensionSvg() {
      if (applicationIconExtension == 'svg') {
        return true;
      } else {
        return false;
      }
    }

    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 3),
        child: ElevatedButton(
          onPressed: () {
            print(applicationIconExtension);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: appBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            side: BorderSide(width: 2, color: lineColor),
          ),
          child: Row(
            children: [
              isExtensionSvg()
                  ? SizedBox(
                      width: 55,
                      height: 55,
                      child: SvgPicture.file(File(applicationIconPath)),
                    )
                  : Image(
                      height: 55,
                      width: 55,
                      image: FileImage(File(applicationIconPath)),
                      errorBuilder: ((context, error, stackTrace) {
                        return Icon(
                          Icons.broken_image,
                          color: foreground,
                          size: 55,
                        );
                      }),
                      fit: BoxFit.cover,
                    ),
              SizedBox(width: 20),
              Text(
                applicationName,
                style: TextStyle(color: foreground, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
