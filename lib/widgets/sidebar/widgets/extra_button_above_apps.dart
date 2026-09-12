import 'package:flutter/material.dart';

class ExtraButtonsAboveApplications extends StatefulWidget {
  var config;
  ExtraButtonsAboveApplications({super.key, required this.config});

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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        ),
      ),
    );
  }
}
