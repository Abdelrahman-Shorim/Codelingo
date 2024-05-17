import 'dart:math';

import 'package:flutter/material.dart';

class Levels extends StatefulWidget {
  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.7,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('images/spain.png', height: 30),
            appBarItem('images/crown.png', '12', Colors.yellow),
            appBarItem('images/offFire.png', '0', Colors.grey),
            appBarItem('images/gem.png', '120', Colors.red),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.directions_bike, color: Colors.blue[400], size: 30),
        backgroundColor: Colors.white,
        onPressed: () {},
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(height: 60),
              lesson('images/easter-egg.png', '2', 'Intro', Colors.blue[100]  ?? Colors.blue),
              SizedBox(height:15 ,),

              twoLessons(
                lesson('images/message.png', '3', 'Loops', Colors.orange[100] ?? Colors.orange),
                lesson('images/airplane.png', '3', 'Data Types', Colors.teal[100] ?? Colors.teal ) ,
                ),
              
              SizedBox(height:15 ,),

              twoLessons(
                lesson('images/food.png', '1', 'Variables', Colors.green[100] ?? Colors.green),
                lesson('images/family.png', '4', 'if condition', Colors.red[100] ?? Colors.red ) ,
                ),

              SizedBox(height:15 ,),
              Divider(thickness: 2,),
              SizedBox(height:15 ,),  
              twoLessons(bonus(), bonus()),
              SizedBox(height:15 ,),
              Divider(thickness: 2,),

              lesson('images/clothes.png', '1', 'Palindromes', Colors.deepPurple[200] ?? Colors.deepPurple),
              SizedBox(height:15 ,),
              twoLessons(
                lesson('images/pencil.png', '3', 'Lists', Colors.pink[200] ?? Colors.pink),
                lesson('images/man.png', '5', 'Arrays', Colors.red[200] ?? Colors.red ) ,
                ),

            ],
          ),
          ButtonTheme(
            height: 50,
            minWidth: 800,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Positioned(
              top: 20,
              right:10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[600],
                  onPrimary: Colors.white,
                ),
                onPressed: () {},
                child: Text('Try Premium'.toUpperCase()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appBarItem(String image, String num, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(image, height: 30),
        Text(num, style: TextStyle(color: color, fontSize: 16)),
      ],
    );
  }

  Widget bonus(){
    return Column(
      children:[
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            shape:BoxShape.circle,
            border: Border.all(color: Colors.grey[300] ?? Colors.grey, width: 2)
            ),
          child: Icon(Icons.add,color: Colors.grey[300] ?? Colors.grey, size: 50,),   
        ),
        SizedBox(height: 10,),
        Text('Bonus', style: TextStyle(color: Colors.grey[300] ?? Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),),
  ],
    );
  }

  Widget twoLessons(Widget lesson1 , Widget lesson2){
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  lesson1,
                  SizedBox(width:40 ,),
                  lesson2,
                ],
              );

  }

  Widget lesson(String image,String number, String title, Color color ){
    return Container(
      child:Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: 3*pi/4,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color?>(Colors.yellow[600]), 
                      value: Random().nextDouble(),
                      strokeWidth: 60,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 42,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      child: Image.asset(image , height: 50,),
                      radius: 35,
                      backgroundColor: color,
                                  
                    ),
                  )
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('images/crown.png', height: 29,),
                  Text(number, style: TextStyle(color: Colors.deepOrangeAccent),),
                ],
              
              ),
            ],
          ),
          SizedBox(height: 10,),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ),),
        ],
        ), 
    );

  }  
}

