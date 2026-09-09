import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:collection';
import './initialize/init.dart';
import 'widgets/sidebar/application.dart';

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

  final Map<String, dynamic> config = await loadData();

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(
        widget.config["background"][0],
        widget.config["background"][1],
        widget.config["background"][2],
        widget.config["background"][3],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ApplicationContainer(
              applicationName: "abb",
              applicationIconPath:
                  "/home/jupiter/Pictures/svg-files/discord.svg",
              config: widget.config,
            ),
          ],
        ),
      ),
    );
  }
}
