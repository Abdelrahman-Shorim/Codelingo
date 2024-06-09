
import 'package:codelingo/models/CoursesModel.dart';
import 'package:codelingo/screens/Instructor_view/Forms/UnitLevel.dart';
import 'package:codelingo/services/CoursesService.dart';
import 'package:flutter/material.dart';

class CourseForm extends StatefulWidget {
  const CourseForm({super.key});

  @override
  State<CourseForm> createState() => _CourseFormState();
}

class _CourseFormState extends State<CourseForm> {
   final _formKey = GlobalKey<FormState>();
  final _coursenameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _numberofunitController = TextEditingController();
  final CoursesService _coursesService=CoursesService();

   Future<void> _submitForm() async {
      
    if (_formKey.currentState!.validate()) {
      // print(_coursenameController);
      CoursesModel course=CoursesModel(uid: "", coursename: _coursenameController.text, instructoruid: "", numberofunits:_numberofunitController.text , description: _descriptionController.text);
      String x= await _coursesService.addCourse(Course: course);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form is valid!')),

      );
      int numberOfForms = int.parse(_numberofunitController.text);
     
    Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>  UnitLevelForm(formCount:numberOfForms,courseid:x))
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
          "Add course",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key:_formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _coursenameController,
                decoration: InputDecoration(
                  hintText: "Name",
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green.withOpacity(0.5), width: 1.0),
                  ),
                ),
                cursorColor: Colors.green,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Name required";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: "Description",
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green.withOpacity(0.5), width: 1.0),
                  ),
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Description required";
                  }
                  return null;
                },
                cursorColor: Colors.green,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _numberofunitController,
                decoration: InputDecoration(
                  hintText: "Number of Units",
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green.withOpacity(0.5), width: 1.0),
                  ),
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Number of units required";
                  }
                  return null;
                },
                cursorColor: Colors.green,
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  _submitForm();

                },
                color: Colors.green,
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
