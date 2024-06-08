import 'package:codelingo/models/CoursesModel.dart';
import 'package:codelingo/services/CoursesService.dart';
import 'package:flutter/material.dart';


class CoursesPage extends StatefulWidget {
  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final CoursesService _coursesService = CoursesService();
  late Future<List<CoursesModel>> _coursesFuture;
  String _courseId = "";

  @override
  void initState() {
    super.initState();
    _coursesFuture = _coursesService.getAllCourses();
  }

  Future<void> _refreshCourses() async {
    setState(() {
      _coursesFuture = _coursesService.getAllCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses CRUD'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final newCourse = CoursesModel(
                uid: '2',
                coursename: 'Advanced Flutter',
                instructoruid: 'instr2',
                numberofunits: '4',
                description: 'An advanced course on Flutter development.',
              );
              await _coursesService.addCourse(Course: newCourse);
              await _refreshCourses();
            },
            child: Text('Add Course'),
          ),
          ElevatedButton(
            onPressed: () async {
              final updatedCourse = CoursesModel(
                uid: '2',
                coursename: 'Advanced Flutter - Updated',
                instructoruid: 'instr2',
                numberofunits: '4',
                description: 'An updated advanced course on Flutter development.',
              );
              await _coursesService.updateCourseById(CourseId:'a099567c-99f1-4ebc-bfa9-887f95441189', Course:updatedCourse );
              await _refreshCourses();
            },
            child: Text('Update Course'),
          ),
          ElevatedButton(
            onPressed: () async {
              await _coursesService.deleteCourseById(CourseId:'935ad953-55cf-4f2a-bd90-88673cd67c53');
              await _refreshCourses();
            },
            child: Text('Delete Course'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Enter Course ID',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _courseId = value;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final course = await _coursesService.getCourseById(CourseId:_courseId);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Course Details'),
                    content: Text(course!.toJson().toString()),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text(e.toString()),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: Text('Get Course by ID'),
          ),
          Expanded(
            child: FutureBuilder<List<CoursesModel>>(
              future: _coursesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No courses found'));
                } else {
                  final courses = snapshot.data!;
                  return ListView.builder(
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      final course = courses[index];
                      return ListTile(
                        title: Text(course.coursename),
                        subtitle: Text(course.description),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
