import 'package:codelingo/Screens/lesson_screen/components/bottom_button.dart';
import 'package:codelingo/Screens/lesson_screen/components/lesson_app_bar.dart';
import 'package:codelingo/Screens/lesson_screen/components/list_lesson.dart';
import 'package:flutter/material.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LessonScreenState();
  }
}

class LessonScreenState extends State<LessonScreen> {
  double percent = 0.4;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var lessons = [
      ListLesson(
        'What is the output?',
        'cout<<"Hello World!";',
        const ['Hello Wrld!.', 'cout<<"Hello World!"', 'Hello World!'],
        correctAnswer: "Hello World!",
        checkButton: bottomButton,
      ),
      ListLesson(
        'What is the datatype of the variable i ? ',
        ' i=20;',
        const ['Int', 'String', 'Char'],
        correctAnswer: 'Int',
        checkButton: bottomButton,
      ),
      ListLesson(
        'Is this statement True or False',
        'int i="20";',
        const ['True', 'False', 'Neither'],
        correctAnswer: 'False',
        checkButton: bottomButton,
      ),
      ListLesson(
        'What is the output for this code?',
        'int i=5; \n int y=1 \n int result=i+y; \n cout<<"result = "<<result;',

        const ['result = 6', ' result = 5 ', "Can't be determined"],
        correctAnswer: 'result = 6',
        checkButton: bottomButton,
      ),
    ];

    return Scaffold(
      appBar: LessonAppBar(percent: percent),
      body: lessons[index],
    );
  }

  void _checkAnswer() {
    print("Answer checked.");
  }

  Widget bottomButton(BuildContext context, String title, VoidCallback answer) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ElevatedButton(
          onPressed: () {
         
            setState(() {
              
               if (percent < 1) {
                percent += 0.2;
                index++;
                answer();
              } 
              else {
              
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                   
                    return dialog('Great job');
                  },
          
                );
              answer();
              }
              
            });
            
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF58CC02),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget dialog(String title) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFFd7ffb8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dialogTitle(title),
            BottomButton(context, title: 'CONTINUE'),
          ],
        ),
      ),
    );
  }

  Widget dialogTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 15),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF43C000),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
