import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class QuestionMaker extends StatefulWidget {
  const QuestionMaker({super.key});

  @override
  _QuestionMakerState createState() => _QuestionMakerState();
}

class _QuestionMakerState extends State<QuestionMaker> {
  List<String> lessons = ["Unit 1", "Unit 2", "Unit 3"];
  String? selectedLesson = "Unit 1";
  File? _image;
  final ImagePicker picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController textQuestionController = TextEditingController();
  final TextEditingController answer1Controller = TextEditingController();
  final TextEditingController answer2Controller = TextEditingController();
  final TextEditingController answer3Controller = TextEditingController();
  final TextEditingController solutionController = TextEditingController();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Pick Image'),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromGallery();
            },
          ),
        ],
      ),
    );
  }

  void createQuestion() {
    if (_formKey.currentState!.validate()) {
      String textQuestion = textQuestionController.text;
      String answer1 = answer1Controller.text;
      String answer2 = answer2Controller.text;
      String answer3 = answer3Controller.text;
      String solution = solutionController.text;

      var questionData = {
        'question': _image != null ? _image!.path : textQuestion,
        'answer1': answer1,
        'answer2': answer2,
        'answer3': answer3,
        'solution': solution,
        'lesson': selectedLesson,
      };

      print(questionData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Questions Maker'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextButton(
                  onPressed: showOptions,
                  child: const Text('Select Image'),
                ),
                Container(
                  child: Center(
                    child: _image == null
                        ? const Text('No Image selected')
                        : Image.file(_image!),
                  ),
                ),
                TextFormField(
                  controller: textQuestionController,
                  decoration: InputDecoration(
                    hintText: "Text Question",
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF2AE69B)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF2AE69B).withOpacity(0.5), width: 1.0),
                    ),
                  ),
                  cursorColor: Color(0xFF2AE69B),
                ),
                TextFormField(
                  controller: answer1Controller,
                  decoration: InputDecoration(
                    hintText: "Answer 1",
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
                      return "Answer 1 required";
                    }
                    return null;
                  },
                  cursorColor: Color(0xFF2AE69B),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: answer2Controller,
                  decoration: InputDecoration(
                    hintText: "Answer 2",
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF2AE69B).withOpacity(0.5), width: 1.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Answer 2 required";
                    }
                    return null;
                  },
                  cursorColor: Color(0xFF2AE69B),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: answer3Controller,
                  decoration: InputDecoration(
                    hintText: "Answer 3",
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
                      return "Answer 3 required";
                    }
                    return null;
                  },
                  cursorColor: Color(0xFF2AE69B),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: solutionController,
                  decoration: InputDecoration(
                    hintText: "Solution",
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF2AE69B).withOpacity(0.5), width: 1.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Solution required";
                    }
                    return null;
                  },
                  cursorColor: Color(0xFF2AE69B),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Unit', textAlign: TextAlign.left),
                SizedBox(
                  width: 100,
                  child: DropdownButton<String>(
                      value: selectedLesson,
                      items: lessons
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (item) => setState(() {
                            selectedLesson = item;
                          })),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    createQuestion();
                  },
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
      ),
    );
  }
}
