import 'package:flutter/material.dart';

import 'components/course_node.dart';
import 'components/double_course_node.dart';

class CourseTree extends StatelessWidget {
  
  static const List<Color> unitColors = [
    Color.fromARGB(255, 42, 230, 155),
    Color.fromARGB(255, 255, 175, 197),
    Color.fromARGB(255, 224, 71, 158),
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.indigo,
    Colors.amber,
    Colors.cyan,
    Colors.lime,
  ];

  final List<List<bool>> completedLessons; // List of completed lessons for each unit

  const CourseTree({required this.completedLessons, Key? key}) : super(key: key);

  Widget buildUnit(BuildContext context, String unitName, String unitDescription, List<String> nodeTitles, Color color, int unitIndex) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    unitName,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    unitDescription,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(Icons.list, color: Colors.white),
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        CourseNode(nodeTitles[0], color: color, crown: 1, clickable: true), // First node title is always clickable
        const Padding(padding: EdgeInsets.all(10)),
        DoubleCourseNode(
          CourseNode(nodeTitles[1], image: 'assets/images/hand.png', color: color, percent: 0.5, crown: 1, clickable: completedLessons[unitIndex][0]),
          CourseNode(nodeTitles[2], image: 'assets/images/pen.png', color: color, crown: 2, clickable: completedLessons[unitIndex][1]),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        DoubleCourseNode(
          CourseNode(nodeTitles[3], image: 'assets/images/fish.png', color: color, percent: 0.2, crown: 3, clickable: completedLessons[unitIndex][2]),
          CourseNode(nodeTitles[4], image: 'assets/images/bucket.png', color: color, crown: 1, clickable: completedLessons[unitIndex][3]),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        CourseNode(nodeTitles[5], image: 'assets/images/bandages.png', color: color, crown: 4, clickable: true), // Last node title
        const Padding(padding: EdgeInsets.all(10)),
        const Padding(padding: EdgeInsets.only(bottom: 15)),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildUnit(
            context,
            'Unit 1',
            'Introduction to C++',
            [
              'Lesson 1', 
              'Lesson 2', 
              'Lesson 3', 
              'Lesson 4', 
              'Lesson 5', 
              'Unit Quiz', 
 
            ],
            unitColors[0],
            0, // Unit index
          ),
          buildUnit(
            context,
            'Unit 2',
            'Expressions',
            [
              'Lesson 1', 
              'Lesson 2', 
              'Lesson 3', 
              'Lesson 4', 
              'Lesson 5', 
              'Unit Quiz', 
 
            ],
            unitColors[1],
            1,
          ),
                      buildUnit(
            context,
            'Unit 3',
            'If-statements',
            [
              'Lesson 1', 
              'Lesson 2', 
              'Lesson 3', 
              'Lesson 4', 
              'Lesson 5', 
              'Unit Quiz', 
 
            ],
            unitColors[2],
            2,
          ),
          buildUnit(
            context,
            'Unit 4',
            'Switch Cases',
            [
              'Lesson 1', 
              'Lesson 2', 
              'Lesson 3', 
              'Lesson 4', 
              'Lesson 5', 
              'Unit Quiz', 
 
            ],
            unitColors[3],
            3,
          ),
          buildUnit(
            context,
            'Unit 5',
            'For Loops',
            [
              'Lesson 1', 
              'Lesson 2', 
              'Lesson 3', 
              'Lesson 4', 
              'Lesson 5', 
              'Unit Quiz', 
 
            ],
            unitColors[4],
            4,
          ),
          buildUnit(
            context,
            'Unit 6',
            'While Loops',
            [
              'Lesson 1', 
              'Lesson 2', 
              'Lesson 3', 
              'Lesson 4', 
              'Lesson 5', 
              'Unit Quiz', 
 
            ],
            unitColors[5],
            5,
          ),
          buildUnit(
            context,
            'Unit 7',
            'Do-While',
            [
              'Lesson 1', 
              'Lesson 2', 
              'Lesson 3', 
              'Lesson 4', 
              'Lesson 5', 
              'Unit Quiz', 
 
            ],
            unitColors[6],
            6,
          ),
          buildUnit(
            context,
            'Unit 8',
            'Type Casting',
            [
              'Lesson 1', 
              'Lesson 2', 
              'Lesson 3', 
              'Lesson 4', 
              'Lesson 5', 
              'Unit Quiz', 
 
            ],
            unitColors[7],
            7,
          ),
          buildUnit(
            context,
            'Unit 9',
            'Nested Loops',
            [
              'Lesson 1', 
              'Lesson 2', 
              'Lesson 3', 
              'Lesson 4', 
              'Lesson 5', 
              'Unit Quiz', 
 
            ],
            unitColors[8],
            8,
          ),
          buildUnit(
            context,
            'Unit 10',
            'Mathematical Functions',
            [
              'Lesson 1', 
              'Lesson 2', 
              'Lesson 3', 
              'Lesson 4', 
              'Lesson 5', 
              'Unit Quiz', 
 
            ],
            unitColors[9],
            9,
          ),
          buildUnit(
            context,
            'Unit 11',
            'Into to functions',
            [
              'Lesson 1', 
              'Lesson 2', 
              'Lesson 3', 
              'Lesson 4', 
              'Lesson 5', 
              'Unit Quiz', 
 
              

            ],
            unitColors[10],
            10,
          ),
        ],
      ),
    );
  }
}

