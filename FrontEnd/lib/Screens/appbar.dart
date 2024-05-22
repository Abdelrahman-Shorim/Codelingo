import 'package:flutter/material.dart';

class Appbars extends StatefulWidget implements PreferredSizeWidget {
   const Appbars({Key? key}) : super(key: key);

  @override
  State<Appbars> createState() => _AppbarsState();
  
  @override
  Size get preferredSize => const Size.fromHeight(65);
}

class _AppbarsState extends State<Appbars> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 1.7,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('images/spain.png', height: 30),
            appBarItem('images/crown.png', '12', Colors.yellow),
            appBarItem('images/offFire.png', '0', Colors.grey),
            appBarItem('images/gem.png', '120', Colors.red),
             
          ],
          
        ),
      
      
    );
  }
}

Widget appBarItem(String image, String num, Color color) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(image, height: 30),
      Text(num, style: TextStyle(color: color, fontSize: 16)),
    ],
  );
}
