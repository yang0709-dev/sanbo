import 'package:flutter/material.dart';

class HideSidebarButton extends StatefulWidget {
  var config;
  HideSidebarButton({super.key, required this.config});

  @override
  State<HideSidebarButton> createState() => _HideSidebarButtonState();
}

class _HideSidebarButtonState extends State<HideSidebarButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(Icons.fax_rounded, color: Colors.green),
    );
  }
}
