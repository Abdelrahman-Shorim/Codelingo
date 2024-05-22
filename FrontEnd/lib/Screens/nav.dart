import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // ayza akhleehom kolohom f nafs el mostawa
        currentIndex: _currentIndex,
        items:[
          navBarItem('images/level.png', 'images/level2.png'),
          navBarItem('images/book.png', 'images/book2.png'),
          navBarItem('images/person.png', 'images/person2.png'),
          navBarItem('images/shield.png', 'images/shield2.png'),
          navBarItem('images/market.png', 'images/market2.png'),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      );
  }

   BottomNavigationBarItem navBarItem(String image, String activeImage)
   {
    return BottomNavigationBarItem(
            icon: Image.asset(image, height: 30,),
            label: ' ',
            activeIcon: Image.asset(activeImage, height: 30,),
          );
   }
}
  