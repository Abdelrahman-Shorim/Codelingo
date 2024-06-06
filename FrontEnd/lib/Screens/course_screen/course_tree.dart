import 'package:flutter/material.dart';

import 'components/course_node.dart';
import 'components/double_course_node.dart';
import 'components/triple_course_node.dart';

class CourseTree extends StatelessWidget {
  const CourseTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          // Unit Information
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.deepPurple[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Unit 1',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Introduction to C++',
                      style: TextStyle(color: Colors.white, fontSize: 14),
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
          // Course Nodes
          CourseNode(
            'Intro to C++',
            crown: 1,
            
          ),
          const Padding(padding: EdgeInsets.all(10)),
          DoubleCourseNode(
            CourseNode(
              'Expressions',
              image: 'assets/images/hand.png',
              color: Colors.yellow,
              percent: 0.5,
              crown: 1,
            ),
            CourseNode(
              'If-Statements',
              image: 'assets/images/pen.png',
              color: const Color(0xFFCE82FF),
              crown: 2,
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          DoubleCourseNode(
            CourseNode(
              'Switch cases',
              image: 'assets/images/fish.png',
              color: Colors.green,
              percent: 0.2,
              crown: 3,
            ),
            CourseNode(
              'For Loops',
              image: 'assets/images/bucket.png',
              color: Colors.blue,
              crown: 1,
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          CourseNode(
            'While Loops',
            image: 'assets/images/bandages.png',
            color: Colors.redAccent,
            crown: 4,
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TripleCourseNode(
            CourseNode(
              'Do-While',
              image: 'assets/images/heel.png',
              color: Colors.yellow.shade500,
            ),
            CourseNode(
              'Type Casting',
              image: 'assets/images/hammer.png',
              color: Colors.grey,
              percent: 0.7,
            ),
            CourseNode(
              'Nested Loops',
              image: 'assets/images/emotion.png',
              color: Colors.blue,
              crown: 2,
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          DoubleCourseNode(
            CourseNode(
              'Mathematical Functions',
              image: 'assets/images/dumbbell.png',
              color: Colors.purple.shade200,
              percent: 0.2,
            ),
            CourseNode(
              'Introduction \n to \n functions',
              image: 'assets/images/tree.png',
              color: Colors.pink,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
        ],
      ),
    );
  }
}
