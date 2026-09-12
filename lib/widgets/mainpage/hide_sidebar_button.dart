import 'package:flutter/material.dart';

class HideSidebarButton extends StatefulWidget {
  var config;
  HideSidebarButton({super.key, required this.config});

  @override
  State<HideSidebarButton> createState() => _HideSidebarButtonState();
}

class _HideSidebarButtonState extends State<HideSidebarButton> {
  @override
  late Color foregroundColor = widget.config["foreground"];
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: foregroundColor),
        onPressed: () {},

        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          shape: WidgetStatePropertyAll(CircleBorder()),
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          shadowColor: WidgetStatePropertyAll(Colors.transparent),
        ),
      ),
    );
  }
}
