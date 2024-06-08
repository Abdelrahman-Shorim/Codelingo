

import 'package:flutter/material.dart';

class ListLesson extends StatefulWidget {
  final String instructionText;
  final String question;
  final List<String> answers;
  final String correctAnswer;
  final Widget Function(BuildContext, String, VoidCallback) checkButton;

  const ListLesson(
    this.instructionText,
    this.question,
    this.answers, {
    required this.correctAnswer,
    required this.checkButton,
    Key? key,
  }) : super(key: key);

  @override
  _ListLessonState createState() => _ListLessonState();
}

class _ListLessonState extends State<ListLesson> {
  int? _selectedAnswerIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        instruction(widget.instructionText),
        const Padding(padding: EdgeInsets.only(top: 15)),
        questionRow(widget.question),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                listChoice(widget.answers[0], 0),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
                listChoice(widget.answers[1], 1),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
                listChoice(widget.answers[2], 2),
              ],
            ),
          ),
        ),
        const Spacer(),
        widget.checkButton(context, 'CHECK', _checkAnswer),
      ],
    );
  }

  Widget listChoice(String title, int index) {
    bool isSelected = _selectedAnswerIndex == index;

    return GestureDetector(
      onTap: () => choosingAnswer(index),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 15, right: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2.5,
            color: const Color(0xFFE5E5E5),
          ),
          color: isSelected ? Colors.grey[300] : Colors.white,
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  void choosingAnswer(int index) {
    setState(() {
      _selectedAnswerIndex = index;
    });
    print('Chosen answer: ${widget.answers[index]} (Index: $index)');
  }

  void _checkAnswer() {
    print("Checking.. for : ${widget.correctAnswer}");
    if (_selectedAnswerIndex == null) {
      showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return dialog(context,'Incorrect',widget.correctAnswer);
                  });
      print('No answer chosen');
      return;
    }
    if (widget.answers[_selectedAnswerIndex!] == widget.correctAnswer) {
      print('Correct');
      showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return dialog(context,'Great job');
                  },
                );
    } else {
      print('Incorrect');
    showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return dialog(context,'Incorrect',widget.correctAnswer);
                  },
                );
    }
  }

  Widget questionRow(String question) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 5),
      child: Row(
        children: [
          speakButton(),
          const Padding(padding: EdgeInsets.only(right: 15)),
          Text(
            question,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B4B4B)),
          )
        ],
      ),
    );
  }

  Widget speakButton() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFF1CB0F6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.volume_up,
        color: Colors.white,
        size: 35,
      ),
    );
  }

  Widget instruction(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 15),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4B4B4B),
          ),
        ),
      ),
    );
  }
}

 Widget dialog(BuildContext context,String title,[String? correctAnswer]) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: const BoxDecoration(color:Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dialogTitle(title,correctAnswer),
            if(correctAnswer!=null)
              Align(
              alignment: Alignment.centerLeft,
             
              child: Container(
                 
                  padding: const EdgeInsets.only(left: 15),
                child: Text(
                  
                  'Correct Answer is: $correctAnswer',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
               const SizedBox(height: 10),
          Container(
             width: double.infinity,
        height: 40,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: ElevatedButton(
              
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                
                backgroundColor: correctAnswer!=null?Colors.red :const Color(0xFF58CC02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child:  Text(correctAnswer!=null?"GOT IT!":"CONTINUE", style:  
                const TextStyle( 
                          color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                              ),),
            ),
          ),
          ],
          )
      )
    );
  }

  Widget dialogTitle(String text,[String? correctAnswer]) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 15),
        child: DefaultTextStyle(
          style:  TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: correctAnswer!=null?Colors.red:const Color(0xFF43C000),
          ),
          child: Text(text),
        ),
      ),
    );
  }
