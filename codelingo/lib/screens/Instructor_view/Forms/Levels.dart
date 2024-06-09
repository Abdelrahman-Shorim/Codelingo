import 'package:flutter/material.dart';

class LevelsForm extends StatefulWidget {
  const LevelsForm({super.key});

  @override
  State<LevelsForm> createState() => _LevelsFormState();
}

class _LevelsFormState extends State<LevelsForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  final List<String> _units = ["Unit 1", "Unit 2", "Unit 3"];
  final List<String> _topics = ["Topic A", "Topic B", "Topic C"];
  final List<String> _course = ["course A", "course B", "course C"];

  String? _selectedUnit;
  String? _selectedTopic;
  String? _selectedcourse;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If all validators pass, this will be called
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form is valid!')),
      );
      // Here, you can also handle the submission logic,
      // such as sending the data to a server or saving it locally.
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
                    borderSide: BorderSide(color: Color(0xFF2AE69B)),
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
                items: _units.map((String unit) {
                  return DropdownMenuItem<String>(
                    value: unit,
                    child: Text(unit),
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
                    borderSide: BorderSide(color: Color(0xFF2AE69B)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF2AE69B).withOpacity(0.5), width: 1.0),
                  ),
                ),
                items: _topics.map((String topic) {
                  return DropdownMenuItem<String>(
                    value: topic,
                    child: Text(topic),
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
                    borderSide: BorderSide(color: Color(0xFF2AE69B)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF2AE69B).withOpacity(0.5), width: 1.0),
                  ),
                ),
                items: _course.map((String course) {
                  return DropdownMenuItem<String>(
                    value: course,
                    child: Text(course),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedcourse = newValue;
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
