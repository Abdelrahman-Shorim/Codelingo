import 'dart:math';
import 'package:flutter/material.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(height: 60),
              lesson('assets/images/easter-egg.png', '2', 'Intro', Colors.blue[100]  ?? Colors.blue),
              const SizedBox(height:15 ,),

              twoLessons(
                lesson('assets/images/message.png', '3', 'Loops', Colors.orange[100] ?? Colors.orange),
                lesson('assets/images/airplane.png', '3', 'Data Types', Colors.teal[100] ?? Colors.teal ) ,
                ),
              
              const SizedBox(height:15 ,),

              twoLessons(
                lesson('assets/images/food.png', '1', 'Variables', Colors.green[100] ?? Colors.green),
                lesson('assets/images/family.png', '4', 'if condition', Colors.red[100] ?? Colors.red ) ,
                ),

              const SizedBox(height:15 ,),
              const Divider(thickness: 2,),
              const SizedBox(height:15 ,),  
              twoLessons(bonus(), bonus()),
              const SizedBox(height:15 ,),
              const Divider(thickness: 2,),

              lesson('assets/images/clothes.png', '1', 'Palindromes', Colors.deepPurple[200] ?? Colors.deepPurple),
              const SizedBox(height:15 ,),
              twoLessons(
                lesson('assets/images/pencil.png', '3', 'Lists', Colors.pink[200] ?? Colors.pink),
                lesson('assets/images/man.png', '5', 'Arrays', Colors.red[200] ?? Colors.red ) ,
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
                  foregroundColor: Colors.white, backgroundColor: Colors.blue[600],
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
        const SizedBox(height: 10,),
        Text('Bonus', style: TextStyle(color: Colors.grey[300] ?? Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),),
  ],
    );
  }

  Widget twoLessons(Widget lesson1 , Widget lesson2){
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  lesson1,
                  const SizedBox(width:40 ,),
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
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 42,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: color,
                      child: Image.asset(image , height: 50,),
                                  
                    ),
                  )
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/crown.png', height: 29,),
                  Text(number, style: const TextStyle(color: Colors.deepOrangeAccent),),
                ],
              
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ),),
        ],
        ), 
    );

  }  
}

