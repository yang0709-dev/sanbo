import 'package:flutter/material.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});
  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  @override
  Widget build(BuildContext context) {
    print("add new");
    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(onPressed: () {}, child: Text("hello")),
    );
  }
}
