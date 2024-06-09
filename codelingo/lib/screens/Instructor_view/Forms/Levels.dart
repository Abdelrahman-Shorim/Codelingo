import 'package:codelingo/models/CourseUnitsModel.dart';
import 'package:codelingo/models/CoursesModel.dart';
import 'package:codelingo/models/TopicsModel.dart';
import 'package:codelingo/models/UnitLevelModel.dart';
import 'package:codelingo/services/CourseUnitsService.dart';
import 'package:codelingo/services/CoursesService.dart';
import 'package:codelingo/services/TopicsService.dart';
import 'package:codelingo/services/UnitLevelService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LevelsForm extends StatefulWidget {
  final String courseid;
  const LevelsForm({super.key, required this.courseid});

  @override
  State<LevelsForm> createState() => _LevelsFormState();
}

class _LevelsFormState extends State<LevelsForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final CoursesService _coursesService = CoursesService();
  final CourseUnitsService _unitservice = CourseUnitsService();
  final TopicsService _topicsService = TopicsService();

  List<CoursesModel> _courseModel = [];
  List<TopicsModel> _topicsModel = [];
  List<CourseUnitsModel> _unitModel = [];

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    print("id $widget.courseid");
    List<CoursesModel> courses = await _coursesService.getDoctorCourses(FirebaseAuth.instance.currentUser!.uid);
    List<TopicsModel> topics = await _topicsService.getAllTopics();
    List<CourseUnitsModel> units = await _unitservice.getCourseCourseUnits(widget.courseid);
    setState(() {
      _courseModel = courses;
      _topicsModel=topics;
      _unitModel=units;

    });
  }

  final List<String> _units = ["Unit 1", "Unit 2", "Unit 3"];
  final List<String> _topics = ["Topic A", "Topic B", "Topic C"];

  String? _selectedUnit;
  String? _selectedTopic;
  String? _selectedCourse;

  List<String> _selectedListTopics=[];

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _selectedListTopics.add(_selectedTopic!);
      final  UnitLevelService _unitlevelservice=UnitLevelService();
      final UnitLevelModel unitLevelModel=UnitLevelModel(uid: "", courseunitid:_selectedCourse!  , levelname: _nameController.text, leveltopics: _selectedListTopics, ordernumber: 0);
      await _unitlevelservice.addUnitLevel(UnitLevel:unitLevelModel );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form is valid!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fix the errors in red before submitting.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Levels Form",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF2AE69B).withOpacity(0.5), width: 1.0),
                  ),
                ),
                cursorColor: Color(0xFF2AE69B),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Name required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                
                decoration: InputDecoration(

                  hintText: "Select Unit",
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF2AE69B).withOpacity(0.5), width: 1.0),
                  ),
                ),
                items: _unitModel.map((unit) {
                  return DropdownMenuItem<String>(
                    value: null,
                    child: Text(unit.unitname),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedUnit = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Unit required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: "Select Topic",
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF2AE69B).withOpacity(0.5), width: 1.0),
                  ),
                ),
                items: _topicsModel.map(( topic) {
                  return DropdownMenuItem<String>(
                    value: topic.uid,
                    child: Text(topic.name),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedTopic = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Topic required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: "Select Course",
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF2AE69B).withOpacity(0.5), width: 1.0),
                  ),
                ),
                items: _courseModel.map((course) {
                  return DropdownMenuItem<String>(
                    value: course.uid,
                    child: Text(course.coursename),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCourse = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Course required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: _submitForm,
                color: Color(0xFF2AE69B),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
