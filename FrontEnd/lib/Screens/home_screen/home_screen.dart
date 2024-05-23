import 'package:codelingo/Screens/home.dart';
import 'package:codelingo/Screens/explore_screen/explore_screen.dart';
import 'package:codelingo/Screens/home_screen/components/explore_app_bar.dart';
import 'package:codelingo/Screens/home_screen/components/leaderboard_app_bar.dart';
import 'package:codelingo/Screens/home_screen/components/shop_app_bar.dart';
import 'package:codelingo/Screens/home_screen/components/stat_app_bar.dart';
import 'package:codelingo/Screens/home_screen/components/bottom_navigator.dart';
// import 'package:codelingo/Screens/leaderboard_screen/leaderboard_screen.dart';
import 'package:codelingo/Screens/profile_screen/profile_screen.dart';
import 'package:codelingo/Screens/shop_screen/shop_screen.dart';
import 'package:flutter/material.dart';

import 'components/profile_app_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      Home(),
      ProfileScreen(),
      // LeaderboardScreen(),
      ShopScreen(),
      ExploreScreen(),
    ];

    final List<PreferredSizeWidget> appBars = [
      StatAppBar(),
      ProfileAppBar(),
      // LeaderboardAppBar(),
      ShopAppBar(),
      ExploreAppBar(),
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
