import 'package:codelingo/Screens/settings_screen/settings_screen.dart';
// import 'package:codelingo/qrscanner.dart';
import 'package:flutter/material.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: Colors.white,
      elevation: 1.5,
      centerTitle: true,
      title: const Text(
        'Profile',
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
      
    );
  }
}
