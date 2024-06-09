import 'package:codelingo/Screens/home.dart';
import 'package:codelingo/Screens/explore_screen/explore_screen.dart';
import 'package:codelingo/Screens/home_screen/components/explore_app_bar.dart';
import 'package:codelingo/Screens/home_screen/components/leaderboard_app_bar.dart';
import 'package:codelingo/Screens/home_screen/components/shop_app_bar.dart';
import 'package:codelingo/Screens/home_screen/components/stat_app_bar.dart';
import 'package:codelingo/Screens/home_screen/components/bottom_navigator.dart';
import 'package:codelingo/Screens/leaderboard_screen/leaderboard_screen.dart';
import 'package:codelingo/Screens/profile_screen/profile_screen.dart';
import 'package:codelingo/Screens/shop_screen/shop_screen.dart';
import 'package:flutter/material.dart';

import 'components/profile_app_bar.dart';


class HomeScreen extends StatefulWidget {
  final String courseid;
  const HomeScreen({Key? key,required this.courseid});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final screens = [
       Home(cid:widget.courseid), 
      const ProfileScreen(),
      const LeaderboardScreen(),
      const ShopScreen(),
      const ExploreScreen(),
    ];

    final List<PreferredSizeWidget> appBars = [
      const StatAppBar(),
      const ProfileAppBar(),
      const LeaderboardAppBar(),
      const ShopAppBar(),
      const ExploreAppBar(),
    ];

    return Scaffold(
      appBar: appBars[currentIndex],
      bottomNavigationBar: BottomNavigator(currentIndex: currentIndex, onPress: onBottomNavigatorTapped),
      body: screens[currentIndex],
      );
  }

  void onBottomNavigatorTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }


}
