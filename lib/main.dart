import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:collection';
import './initialize/init.dart';
import 'widgets/sidebar/sidebar.dart';
import 'widgets/mainpage/mainpage.dart';
import 'package:window_manager/window_manager.dart';
import './initialize/scan_dirs.dart';

// .desktop files directories
// ~/.local/share/applications/ --> no root needed
// /usr/share/application --> need root to modify, readable by all(implement root password prompt)
// maybe custom directories
//
// settings: vim keybindings, change appearance, load presets
Future<Map<String, dynamic>> loadData() async {
  var configMap = await initializeApp();
  return Map<String, dynamic>.from(configMap);
}

// void main() {
// final Map<String, dynamic> config = await loadData();
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = WindowOptions(
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  final Map<String, dynamic> config = await loadData();
  String home = Platform.environment['HOME']!;
  final appList = await scanDirectory('$home/.local/share/applications');

  runApp(MyApp(config: config));
}

class MyApp extends StatelessWidget {
  final Map<String, dynamic> config;
  const MyApp({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sanbo',
      home: HomePage(config: config),
    );
  }
}

class HomePage extends StatefulWidget {
  final Map<String, dynamic> config;
  const HomePage({super.key, required this.config});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool sidebarVisible = true;
  void toggleSidebar() {
    setState(() {
      sidebarVisible = !sidebarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sidebarWidth = (MediaQuery.of(context).size.width) * 0.3;

    return Scaffold(
      backgroundColor: widget.config["background"],
      body: Center(
        child: Row(
          mainAxisAlignment: .start,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: sidebarVisible ? sidebarWidth : 0,
              child: Sidebar(config: widget.config),
            ),
            MainPage(config: widget.config, hideSidebarFunction: toggleSidebar),
          ],
        ),
      ),
    );
  }
}
