import 'package:flutter/material.dart';
//import 'package:codelingo/Forms/History.dart';
//import 'package:codelingo/Forms/Levels.dart';
// import 'package:codelingo/Forms/PowerUps.dart';
// import 'package:codelingo/Forms/Questions.dart';
// import 'package:codelingo/Forms/Topics.dart';
import 'package:codelingo/Forms/QuestionMaker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Admin Form',
      //home: HistoryForm(),
      home: const QuestionMaker(),
    );
  }
}
