import 'package:codelingo/Screens/explore_screen/explore_screen.dart';
import 'package:codelingo/Screens/home.dart';
import 'package:codelingo/Screens/home_screen/home_screen.dart';
import 'package:codelingo/Screens/roadmap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
              //child:Home(),
                //child:RoadMap(),
                child: HomeScreen(),
      ),
    );
  }
}
