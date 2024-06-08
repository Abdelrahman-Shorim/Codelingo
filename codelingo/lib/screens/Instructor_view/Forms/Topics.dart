import 'package:codelingo/models/TopicsModel.dart';
import 'package:codelingo/services/TopicsService.dart';
import 'package:flutter/material.dart';




class TopicsForm extends StatefulWidget {
  const TopicsForm({super.key});

  @override
  State<TopicsForm> createState() => _TopicsFormState();
}

class _TopicsFormState extends State<TopicsForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final TopicsService _topicsService=TopicsService();
  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      TopicsModel topics=TopicsModel(uid:'',name: _nameController.text,description:_descriptionController.text );
      _topicsService.addTopics(Topics: topics);
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
              MaterialButton(
                onPressed: _submitForm,
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
