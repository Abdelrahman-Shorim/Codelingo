import 'package:flutter/material.dart';
import 'package:forms/History.dart';
// import 'package:forms/Levels.dart';
// import 'package:forms/PowerUps.dart';
// import 'package:forms/Questions.dart';
// import 'package:forms/Topics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Admin Form',
      //home: HistoryForm(),
      home: HistoryForm(),
    );
  }
}
