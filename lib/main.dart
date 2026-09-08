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

void main() {
  initializeApp();
  runApp(const MyApp());
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
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ApplicationContainer(
              applicationName: "abb",
              applicationIconPath: "fjalds",
            ),
          ],
        ),
      ),
    );
  }
}
