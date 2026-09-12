import 'package:flutter/material.dart';

class ExtraButtonsAboveApplications extends StatefulWidget {
  Function buttonPressed;
  String buttonText;
  IconData? buttonIcon;
  Map<String, dynamic> config;
  ExtraButtonsAboveApplications({
    super.key,
    required this.config,
    required this.buttonPressed,
    required this.buttonText,
    required this.buttonIcon,
  });

  @override
  State<ExtraButtonsAboveApplications> createState() =>
      _ExtraButtonsAboveApplicationsState();
}

class _ExtraButtonsAboveApplicationsState
    extends State<ExtraButtonsAboveApplications> {
  late Color appBackground = widget.config['app_background'];
  late Color lineColor = widget.config['line_color'];
  late Color foreground = widget.config['foreground'];
  @override
  Widget build(BuildContext context) {
    const double fontAndIconSize = 16;
    return SizedBox(
      height: 80,
      width: double.maxFinite,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          child: ElevatedButton(
            onPressed: () {
              widget.buttonPressed();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: appBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: BorderSide(width: 2, color: lineColor),
              enabledMouseCursor: SystemMouseCursors.click,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.buttonIcon,
                  color: foreground,
                  size: fontAndIconSize,
                ),
                SizedBox(width: 5),
                Text(
                  widget.buttonText,
                  style: TextStyle(
                    color: foreground,
                    fontSize: fontAndIconSize,
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
