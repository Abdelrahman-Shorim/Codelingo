import 'package:codelingo/models/CourseUnitsModel.dart';
import 'package:codelingo/services/CourseUnitsService.dart';
import 'package:flutter/material.dart';

class UnitLevelForm extends StatefulWidget {
  final int formCount;
  final String courseid;

  const UnitLevelForm({required this.formCount, required this.courseid,super.key});

  @override
  State<UnitLevelForm> createState() => _UnitLevelFormState();
}

class _UnitLevelFormState extends State<UnitLevelForm> {
  final CourseUnitsService _courseUnitService = CourseUnitsService();
  final List<GlobalKey<FormState>> _formKeys = [];
  final List<TextEditingController> _nameControllers = [];
  final List<TextEditingController> _levelControllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.formCount; i++) {
      _formKeys.add(GlobalKey<FormState>());
      _nameControllers.add(TextEditingController());
      _levelControllers.add(TextEditingController());
    }
  }

  Future<void> _submitForms() async {
    for (int i = 0; i < widget.formCount; i++) {
      if (_formKeys[i].currentState!.validate()) {
        String name = _nameControllers[i].text;
        String level = _levelControllers[i].text;
        int onumber=i+1;
        CourseUnitsModel courseunit=CourseUnitsModel(uid: "", courseuid: widget.courseid, unitname: name, numberoflevels: level, description: "", ordernumber:onumber );
       await _courseUnitService.addCourseUnit(CourseUnit: courseunit);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fix the errors in form ${i + 1}')),
        );
        return;
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('All forms submitted successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Unit Level Form",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(widget.formCount, (index) => buildForm(index)),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: _submitForms,
                color: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Submit All",
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

  Widget buildForm(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Form(
        key: _formKeys[index],
        child: Column(
          children: <Widget>[
            Text('Form number ${index + 1}'),
            const SizedBox(height: 10),
            TextFormField(
              controller: _nameControllers[index],
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
              controller: _levelControllers[index],
              decoration: InputDecoration(
                hintText: "Number of Levels",
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
                  return "Level required";
                }
                return null;
              },
              cursorColor: Colors.green,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _nameControllers) {
      controller.dispose();
    }
    for (var controller in _levelControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
