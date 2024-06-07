import 'package:codelingo/Screens/Login_page/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:codelingo/Shared/constants.dart';
class LogInButton extends StatelessWidget {
  final BuildContext context;
  const LogInButton(this.context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(width: 3, color:logoTextColor),
      ),
      child: ElevatedButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/login');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 5,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text(
          'I ALREADY HAVE AN ACCOUNT',
          style: TextStyle(
              color:Color(0xFF2AE69B) , fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
