import 'package:codelingo/Screens/course_screen/course_tree.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int _currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CourseTree(),
    );
  }
}