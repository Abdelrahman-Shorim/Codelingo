import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:codelingo/screens/Login_page/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(child: Lottie.asset("assets/animation/coding.json")),
      nextScreen: const WelcomeScreen(),
      //duration: 7000,
      backgroundColor: Colors.white,
      splashIconSize: 800,
      splashTransition: SplashTransition.fadeTransition,
      //pageTransitionType: PageTransitionType.fade
    );
  }
}
