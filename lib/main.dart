import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:collection';

// .desktop files directories
// ~/.local/share/applications/ --> no root needed
// /usr/share/application --> need root to modify, readable by all(implement root password prompt)
// maybe custom directories
//
// settings: vim keybindings, change appearance, load presets

void main() {
  initializeApp();
  runApp(const MyApp());
}

Future<void> initializeApp() async {
  // read config file(keybinding, appearence)
  // load .desktop files and their current permissions
  // preset permissions combinations
  // Exec preset files
  final Map<String, dynamic> configMap = HashMap();
  Color homepageBackground = Colors.black;
  String home = Platform.environment['HOME']!;
  final backgroundRegex = RegExp(r'background=(\(.*?\))');
  configMap.addAll({});
  late final configFile = File('$home/.config/sanbo/config.conf');
  final configContent = await configFile.readAsString();
  print(configContent);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sanbo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> loadConfig() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(mainAxisAlignment: .center, children: [
          ],
        ),
      ),
    );
  }
}
