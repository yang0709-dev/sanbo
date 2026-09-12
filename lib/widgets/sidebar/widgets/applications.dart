import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_svg/svg.dart';

// load configMap settings
// primary line_color for the border, app_background for background color of the app block

class ApplicationContainer extends StatefulWidget {
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
  State<ApplicationContainer> createState() => _ApplicationContainerState();
}

class _ApplicationContainerState extends State<ApplicationContainer> {
  late Color appBackground = widget.config['app_background'];
  late Color lineColor = widget.config['line_color'];
  late Color foreground = widget.config['foreground'];
  double imageSize = 45;

  @override
  Widget build(BuildContext context) {
    String applicationIconExtension = widget.applicationIconPath
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

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 5),
          child: ElevatedButton(
            onPressed: () {},
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
                        width: imageSize,
                        height: imageSize,
                        child: SvgPicture.file(
                          File(widget.applicationIconPath),
                        ),
                      )
                    : Image(
                        height: imageSize,
                        width: imageSize,
                        image: FileImage(File(widget.applicationIconPath)),
                        errorBuilder: ((context, error, stackTrace) {
                          return Icon(
                            Icons.broken_image,
                            color: foreground,
                            size: imageSize,
                          );
                        }),
                        fit: BoxFit.cover,
                      ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    widget.applicationName,
                    style: TextStyle(color: foreground, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
