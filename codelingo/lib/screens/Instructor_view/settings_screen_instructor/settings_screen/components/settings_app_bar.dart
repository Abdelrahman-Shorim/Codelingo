// import 'package:codelingo/qrscanner.dart';
import 'package:codelingo/screens/Instructor_view/Forms/Course.dart';
import 'package:flutter/material.dart';
import 'package:codelingo/screens/Instructor_view/settings_screen_instructor/settings_screen.dart';

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
       actions: <Widget>[
       
        IconButton(
          icon: const Icon(Icons.add_box, color: Color(0xFF2B70C9), size: 30),
          tooltip: 'Add a course',
          onPressed: () {

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CourseForm())
            );

          },
        ),
    ],);
}
}
