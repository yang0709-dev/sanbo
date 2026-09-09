import 'package:flutter/material.dart';
import '../../initialize/scan_dirs.dart';

class Sidebar extends StatelessWidget {
  var config;
  Sidebar({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.4,
      height: screenHeight,
      color: Colors.green,
    );
  }
}
