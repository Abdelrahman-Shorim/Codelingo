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

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      TopicsModel topics=TopicsModel(uid:'',name: _nameController.text,description:_descriptionController.text );
      await _topicsService.addTopics(Topics: topics);
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
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: "Description",
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2AE69B)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF2AE69B).withOpacity(0.5), width: 1.0),
                  ),
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Description required";
                  }
                  return null;
                },
                cursorColor: Color(0xFF2AE69B),
              ),
              const SizedBox(
                height: 20,
              ),
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
