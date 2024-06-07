import 'package:codelingo/Screens/levels.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
      ),
      body: const Levels(),
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
