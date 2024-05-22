import 'package:codelingo/Screens/appbar.dart';
import 'package:codelingo/Screens/course_screen/course_tree.dart';
import 'package:codelingo/Screens/levels.dart';
import 'package:codelingo/Screens/nav.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CourseTree(),
    );
  }
}