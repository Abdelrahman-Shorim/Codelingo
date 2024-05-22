import 'package:codelingo/Screens/appbar.dart';
import 'package:codelingo/Screens/nav.dart';
import 'package:flutter/material.dart';

class RoadMap extends StatefulWidget {
  @override
  _RoadMapState createState() => _RoadMapState();
}

class _RoadMapState extends State<RoadMap> {
  // List to track the state of each tick (whether it has been clicked)
  List<bool> tickStates = List<bool>.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Nav(),
      appBar: const Appbars(),
      body: Column(
        children: [
          buildHeader(),
          Expanded(child: buildBody()),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.deepPurple[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(Icons.list, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.only(top: 20),
          children: [
            SizedBox(height: 100),
            // _lesson('images/man.png', Colors.orange[100], 3),
            SizedBox(height: 20),
            // _lesson('images/level.png', Colors.blue[100], 1),
          ],
        ),
        buildTickMarks(),
      ],
    );
  }

  Widget buildTickMarks() {
  List<Widget> ticks = [];
  List<double> topPositions = [10.0, 80.0, 170.0, 280.0, 370.0, 480.0, 570.0, 680.0, 770.0, 880.0];
  List<double> leftPositions = [-16.0, 60.0, 120.0, 60.0, -16.0, -80.0, 120.0, 140.0, 160.0, 180.0];

  for (int i = 0; i < 10; i++) {
    ticks.add(Positioned(
      top: topPositions[i],
      left: MediaQuery.of(context).size.width / 2 + leftPositions[i] - 20, // Adjust left position
      child: GestureDetector(
        onTap: () {
          setState(() {
            tickStates[i] = !tickStates[i]; 
          });
        },
        child: CircleAvatar(
          radius: 35,
          backgroundColor: tickStates[i] ? Colors.deepPurple[200] : Colors.grey, // Change color based on state
          child: Icon(Icons.check, color: Colors.white),
        ),
      ),
    ));
  }
  return Stack(children: ticks);
}



  Widget _lesson(String image, Color? color, int status) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            children: [
              Image.asset(image, height: 60),
              SizedBox(height: 10),
              Row(
                children: List.generate(3, (index) {
                  return Icon(
                    Icons.star,
                    color: index < status ? Colors.yellow : Colors.grey,
                    size: 20,
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
