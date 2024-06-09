import 'package:codelingo/Screens/Instructor_view/Forms/Levels.dart';
import 'package:codelingo/Screens/Instructor_view/Forms/Question_screen.dart';
import 'package:codelingo/Screens/Instructor_view/Home_Screen_Instructor/components/bottom_navigator.dart';
import 'package:codelingo/Screens/Instructor_view/Home_Screen_Instructor/components/explore_app_bar.dart';
import 'package:codelingo/Screens/Instructor_view/Home_Screen_Instructor/components/profile_app_bar.dart';
import 'package:codelingo/Screens/Instructor_view/Home_Screen_Instructor/components/stat_app_bar.dart';
import 'package:codelingo/Screens/Instructor_view/profile_instructor/profile_screen/profile_screen.dart';
// import 'package:codelingo/Screens/explore_screen/explore_screen.dart';
import 'package:codelingo/screens/Instructor_view/Forms/Topics.dart';
import 'package:flutter/material.dart';

class InstructorViewHome extends StatefulWidget {

  final String courseid;

  const InstructorViewHome({required this.courseid,super.key});


  @override
  State<StatefulWidget> createState() {
    return _InstructorViewHomeState();
  }
}

class _InstructorViewHomeState extends State<InstructorViewHome> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final screens = [
      QuestionMaker( courseid: widget.courseid), 
      const ProfileScreen(),
      const LevelsForm(),
      const TopicsForm(),
    ];

    final List<PreferredSizeWidget> appBars = [
      const StatAppBar(),
      const ProfileAppBar(),
      const StatAppBar(),
      const ExploreAppBar(),
    ];

    return Scaffold(
      appBar: appBars[currentIndex],
      bottomNavigationBar: BottomNavigator(currentIndex: currentIndex, onPress: onBottomNavigatorTapped),
      body: screens[currentIndex],
      );
  }

  void onBottomNavigatorTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }


}
