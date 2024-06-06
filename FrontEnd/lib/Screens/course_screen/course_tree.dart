import 'package:flutter/material.dart';

import 'components/course_node.dart';
import 'components/double_course_node.dart';
import 'components/triple_course_node.dart';

class CourseTree extends StatelessWidget {
  // const CourseTree({Key? key}) : super(key: key);

  // Define a list of colors for unit containers
  final List<Color> unitColors = [
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

  // Build function for each unit
  Widget buildUnit(BuildContext context, String unitName, String unitDescription, List<String> nodeTitles, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          color: color, // Assign color to the unit container
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
        CourseNode(nodeTitles[0], color: color, crown: 1), // First node title
        const Padding(padding: EdgeInsets.all(10)),
        DoubleCourseNode(
          CourseNode(nodeTitles[1], image: 'assets/images/hand.png', color: color, percent: 0.5, crown: 1),
          CourseNode(nodeTitles[2], image: 'assets/images/pen.png', color: color, crown: 2),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        DoubleCourseNode(
          CourseNode(nodeTitles[3], image: 'assets/images/fish.png', color: color, percent: 0.2, crown: 3),
          CourseNode(nodeTitles[4], image: 'assets/images/bucket.png', color: color, crown: 1),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        CourseNode(nodeTitles[5], image: 'assets/images/bandages.png', color: color, crown: 4), // Last node title
        const Padding(padding: EdgeInsets.all(10)),
        // TripleCourseNode(
        //   CourseNode(nodeTitles[6], image: 'assets/images/heel.png', color: color),
        //   CourseNode(nodeTitles[7], image: 'assets/images/hammer.png', color: color, percent: 0.7),
        //   CourseNode(nodeTitles[8], image: 'assets/images/emotion.png', color: color, crown: 2),
        // ),
        // const Padding(padding: EdgeInsets.all(10)),
        // DoubleCourseNode(
        //   CourseNode(nodeTitles[9], image: 'assets/images/dumbbell.png', color: color, percent: 0.2),
        //   CourseNode(nodeTitles[10], image: 'assets/images/tree.png', color: color),
        // ),
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
              'Lesson 6', 
              'Lesson 7', 
              'Lesson 8', 
              'Lesson 9', 
              'Lesson 10', 
              'Lesson 11', 
            ],
            unitColors[0],
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
              'Lesson 6', 
              'Lesson 7', 
              'Lesson 8', 
              'Lesson 9', 
              'Lesson 10', 
              'Lesson 11', 
            ],
            unitColors[1],
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
              'Lesson 6', 
              'Lesson 7', 
              'Lesson 8', 
              'Lesson 9', 
              'Lesson 10', 
              'Lesson 11', 
            ],
            unitColors[2],
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
              'Lesson 6', 
              'Lesson 7', 
              'Lesson 8', 
              'Lesson 9', 
              'Lesson 10', 
              'Lesson 11', 
            ],
            unitColors[3],
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
              'Lesson 6', 
              'Lesson 7', 
              'Lesson 8', 
              'Lesson 9', 
              'Lesson 10', 
              'Lesson 11', 
            ],
            unitColors[4],
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
              'Lesson 6', 
              'Lesson 7', 
              'Lesson 8', 
              'Lesson 9', 
              'Lesson 10', 
              'Lesson 11', 
            ],
            unitColors[5],
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
              'Lesson 6', 
              'Lesson 7', 
              'Lesson 8', 
              'Lesson 9', 
              'Lesson 10', 
              'Lesson 11', 
            ],
            unitColors[6],
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
              'Lesson 6', 
              'Lesson 7', 
              'Lesson 8', 
              'Lesson 9', 
              'Lesson 10', 
              'Lesson 11', 
            ],
            unitColors[7],
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
              'Lesson 6', 
              'Lesson 7', 
              'Lesson 8', 
              'Lesson 9', 
              'Lesson 10', 
              'Lesson 11', 
            ],
            unitColors[8],
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
              'Lesson 6', 
              'Lesson 7', 
              'Lesson 8', 
              'Lesson 9', 
              'Lesson 10', 
              'Lesson 11', 
            ],
            unitColors[9],
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
              'Lesson 6', 
              'Lesson 7', 
              'Lesson 8', 
              'Lesson 9', 
              'Lesson 10', 
              'Lesson 11', 
              

            ],
            unitColors[10],
          ),
        ],
      ),
    );
  }
}

