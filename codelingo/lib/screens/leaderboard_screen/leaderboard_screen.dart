import 'package:flutter/material.dart';
import 'dart:math';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // generate mock data
    var ranks = List<int>.generate(30, (i) => i + 1);
    Random random = Random();
    var xps = List<int>.generate(30, (i) => random.nextInt(1000));
    var nameList = ['Habiba', 'Shehab', 'Mina', 'Abdelrahman', 'Jasmine', 'Ahmed', 'Mohamed', 'Salem'];
    var imageList = ['avatar1.png', 'avatar35.png', 'avatar2.png', 'avatar41.png', 'avatar7.png'];

    var names = List<String>.generate(30, (i) => nameList[random.nextInt(nameList.length)]);
    var images = List<String>.generate(30, (i) => 'assets/images/${imageList[random.nextInt(imageList.length)]}');

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Leaderboard'),
      // ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Students Enrolled Leaderboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: const EdgeInsets.only(top: 17),
                  horizontalTitleGap: 12,
                  leading: rank(ranks[index]),
                  title: avatarWithName(images[index], names[index]),
                  trailing: xpAmountWithLevel(xps[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget xpAmountWithLevel(int xp) {
    String level = getLevel(xp);
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Text(
        '$xp XP\n(Level $level)',
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }

  String getLevel(int xp) {
    if (xp < 200) return '1';
    if (xp < 400) return '2';
    if (xp < 600) return '3';
    if (xp < 800) return '4';
    return '5';
  }

  Widget avatarWithName(String image, String name) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          avatar(image),
          const Padding(padding: EdgeInsets.only(right: 20)),
          friendName(name),
        ],
      ),
    );
  }

  Widget friendName(String name) {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF4B4B4B),
        fontSize: 20,
      ),
    );
  }

  Widget avatar(String image) {
    return Container(
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 22,
      ),
    );
  }

  Widget rank(int rank) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Text(
        '$rank',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2AE69B),
        ),
      ),
    );
  }
}
