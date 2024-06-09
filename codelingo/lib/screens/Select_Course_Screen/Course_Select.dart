import 'package:codelingo/Screens/Select_Course_Screen/components/Course_Select_Appbar.dart';
import 'package:codelingo/Screens/home.dart';
import 'package:codelingo/Screens/home_screen/home_screen.dart';
import 'package:codelingo/models/CoursesModel.dart';
import 'package:codelingo/services/CoursesService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class CourseSelectTypePage extends StatefulWidget {

  @override
  _CourseSelectPageState createState() => _CourseSelectPageState();
}

class _CourseSelectPageState extends State<CourseSelectTypePage> {
 String selectedUserType = '';
  String courseuid='';
  final CoursesService _coursesService = CoursesService();
  List<CoursesModel> _courseModel = [];

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    List<CoursesModel> courses = await _coursesService.getStudentCourses();
    setState(() {
      _courseModel = courses;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CourseSelectAppBar(),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'SELECT COURSE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 2,
                width: 50,
                color: const Color(0xFF2AE69B),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.center,
                children: _courseModel.map((course) {
                  return UserTypeCard(
                    title: course.coursename,
                    isSelected: selectedUserType == course.coursename,
                    onTap: () {
                      setState(() {
                        selectedUserType = course.coursename;
                        courseuid=course.uid;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(courseid:courseuid),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2AE69B),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserTypeCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  UserTypeCard({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 120,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2AE69B).withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF2AE69B) : Colors.white,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? const Color(0xFF2AE69B) : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
