import 'package:codelingo/models/QuestionsModel.dart';
import 'package:codelingo/models/TopicsModel.dart';
import 'package:codelingo/services/QuestionsService.dart';
import 'package:codelingo/services/TopicsService.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class QuestionMaker extends StatefulWidget {

  final String courseid;

  const QuestionMaker({ required this.courseid,super.key});


  @override
  _QuestionMakerState createState() => _QuestionMakerState();
}

class _QuestionMakerState extends State<QuestionMaker> {
  final TopicsService _topicsService = TopicsService();
  final QuestionsService _questionsService=QuestionsService();
  final List<TopicsModel> _topicsList = [];
  final Map<String, String> _topicsMap = {};
  String? selectedLesson;
  File? _image;
  final ImagePicker picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController textQuestionController = TextEditingController();
  final TextEditingController answer1Controller = TextEditingController();
  final TextEditingController answer2Controller = TextEditingController();
  final TextEditingController answer3Controller = TextEditingController();
  final TextEditingController solutionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTopics();
  }

  Future<void> _loadTopics() async {
    List<TopicsModel> topics = await _topicsService.getAllTopics();
    setState(() {
      for (var topic in topics) {
        _topicsList.add(topic);
        _topicsMap[topic.name] = topic.uid;
      }
      if (_topicsList.isNotEmpty) {
        selectedLesson = _topicsList.first.name;
      }
    });
  }

  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> showOptions() async {
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

  Future<void> createQuestion() async {
    if (_formKey.currentState!.validate()) {
      String textQuestion = textQuestionController.text;
      String answer1 = answer1Controller.text;
      String answer2 = answer2Controller.text;
      String answer3 = answer3Controller.text;
      String solution = solutionController.text;
      bool isimage=_image!=null?true:false;
      List<Map<String, String>> questions = [
        {answer1: answer1 == solution ? "100" :"0"},
        {answer2: answer2 == solution ? "100" : "0"},
        {answer3: answer3 == solution ? "100" : "0"},
      ];

      var questionData = {
        'question': _image != null ? _image!.path : textQuestion,
        'answer1': answer1,
        'answer2': answer2,
        'answer3': answer3,
        'solution': solution,
        'topic': _topicsMap[selectedLesson],
      };
    List<String> topic=[questionData['topic'].toString()];
    print(topic);
    QuestionsModel question=  QuestionsModel(uid: "", isImage: isimage, question: questionData['question']!, choices: questions, difficulty: "", topicsuid:topic, courseuid: widget.courseid);
      print(widget.courseid);
 await _questionsService.addQuestion(questions: question,questionimage: isimage==true?_image:null);
  
  ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Added Question')),
      );
    }else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not add the question')),
      );
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
                      borderSide: BorderSide(color: Color(0xFF2AE69B)),
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
                const Text('Topics', textAlign: TextAlign.left),
                SizedBox(
                  width: 100,
                  child: DropdownButton<String>(
                      value: selectedLesson,
                      items: _topicsList
                          .map(
                            (topic) => DropdownMenuItem(
                              value: topic.name,
                              child: Text(
                                topic.name,
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
