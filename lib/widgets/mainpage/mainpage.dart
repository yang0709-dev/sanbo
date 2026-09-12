import 'package:flutter/material.dart';
import './widgets/topbar_of_mainpage.dart';

class MainPage extends StatefulWidget {
  var config;
  Function hideSidebarFunction;
  MainPage({
    super.key,
    required this.config,
    required this.hideSidebarFunction,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Color background = widget.config["background"];

  bool isSidebarVisible = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: background,
        child: Column(
          children: [
            TopbarOfMainpage(
              config: widget.config,
              hideSidebarFunction: widget.hideSidebarFunction,
            ),
          ],
        ),
      ),
    );
  }
}
