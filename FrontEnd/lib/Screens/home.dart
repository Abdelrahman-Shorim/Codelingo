import 'package:codelingo/Screens/course_screen/course_tree.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int _currentIndex = 0;

  // Define completedLessons list here
  List<List<bool>> completedLessons = [
    // Unit 1
    [false, false, false, false, false, false, false, false, false, false, false],
    // Unit 2
    [false, false, false, false, false, false, false, false, false, false, false],
    // Unit 3
    [false, false, false, false, false, false, false, false, false, false, false],
    // Unit 4
    [false, false, false, false, false, false, false, false, false, false, false],
    // Unit 5
    [false, false, false, false, false, false, false, false, false, false, false],
    // Unit 6
    [false, false, false, false, false, false, false, false, false, false, false],
    // Unit 7
    [false, false, false, false, false, false, false, false, false, false, false],
    // Unit 8
    [false, false, false, false, false, false, false, false, false, false, false],
    // Unit 9
    [false, false, false, false, false, false, false, false, false, false, false],
    // Unit 10
    [false, false, false, false, false, false, false, false, false, false, false],
    // Unit 11
    [false, false, false, false, false, false, false, false, false, false, false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CourseTree(completedLessons: completedLessons),
    );
  }

  // Method to mark a lesson as completed
  void completeLesson(int unitIndex, int lessonIndex) {
    setState(() {
      completedLessons[unitIndex][lessonIndex] = true;
      // Automatically open the next lesson if it exists
      if (lessonIndex + 1 < completedLessons[unitIndex].length) {
        completedLessons[unitIndex][lessonIndex + 1] = true;
      }
    });
  }
}
