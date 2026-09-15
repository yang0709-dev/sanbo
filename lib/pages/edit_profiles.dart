import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditProfiles extends StatefulWidget {
  const EditProfiles({super.key});
  @override
  State<EditProfiles> createState() => _EditProfilesState();
}

class _EditProfilesState extends State<EditProfiles> {
  @override
  Widget build(BuildContext context) {
    print("edit profiles");
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          context.go('/home/edit-profiles');
          print("edit profiles");
        },
        child: Text("hello"),
      ),
    );
  }
}
