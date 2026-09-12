import 'package:flutter/material.dart';

class IconButtonsAtTheTop extends StatefulWidget {
  var config;
  Function buttonClicked;
  IconData? buttonIcon;
  IconButtonsAtTheTop({
    super.key,
    required this.config,
    required this.buttonClicked,
    required this.buttonIcon,
  });

  @override
  State<IconButtonsAtTheTop> createState() => _IconButtonsAtTheTopState();
}

class _IconButtonsAtTheTopState extends State<IconButtonsAtTheTop> {
  @override
  late Color foregroundColor = widget.config["foreground"];
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          widget.buttonClicked();
        },
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(widget.buttonIcon, color: foregroundColor),
        ),
      ),
    );
  }
}
