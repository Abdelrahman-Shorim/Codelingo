import 'package:codelingo/Screens/settings_screen/settings_screen.dart';
import 'package:codelingo/qr_code_scanner.dart';
// import 'package:codelingo/qrscanner.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

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
          icon: Image.asset("assets/icons/qr.png"),
          tooltip: 'Scan',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  const QRScannerPage()));
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings, color: Color(0xFF2B70C9), size: 30),
          tooltip: 'Settings',
          onPressed: () {

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingsScreen())
            );

          },
        ),
      ],
    );
  }
}
