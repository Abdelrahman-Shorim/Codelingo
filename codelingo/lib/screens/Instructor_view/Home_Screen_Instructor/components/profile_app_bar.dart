
import 'package:codelingo/Screens/Instructor_view/settings_screen_instructor/settings_screen.dart';
import 'package:codelingo/qr_code_scanner.dart';
import 'package:codelingo/screens/Instructor_view/Forms/UnitLevel.dart';
// import 'package:codelingo/qrscanner.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String cid;
  const ProfileAppBar({Key? key, required this.cid}) ;

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
      actions: <Widget>[
       
        IconButton(
          icon: const Icon(Icons.settings, color: Color(0xFF2B70C9), size: 30),
          tooltip: 'Settings',
          onPressed: () {

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>  SettingsScreen(courseid:cid))
            );

          },
        ),
        
      ],
    );
  }
}
