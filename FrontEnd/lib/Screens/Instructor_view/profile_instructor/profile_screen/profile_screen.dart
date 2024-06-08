

import 'package:codelingo/Screens/Instructor_view/profile_instructor/profile_screen/components/account_app_bar.dart';
import 'package:codelingo/Screens/leaderboard_screen/leaderboard_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AccountAppBar(),
      body: LeaderboardScreen(),
      // body: SingleChildScrollView(
      //   child: SizedBox(
      //     height: 1540,
      //     child: Column(
      //       children: [
      //         Padding(padding: EdgeInsets.all(10)),
           
      //         // Expanded(child: Column(children: [Text('yo')],)),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
