import 'package:codelingo/Screens/settings_screen/settings_screen.dart';
import 'package:codelingo/qr_code_scanner.dart';
// import 'package:codelingo/qrscanner.dart';
import 'package:flutter/material.dart';

class CourseSelectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CourseSelectAppBar({Key? key}) : super(key: key);

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
        'Course',
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
      
      ],
    );
  }
}
