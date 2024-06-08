import 'package:codelingo/Screens/Login_page/create_screen/Sign_Up.dart';
import 'package:flutter/material.dart';
import 'package:codelingo/Shared/constants.dart';
class GetStartedButton extends StatelessWidget {
  final BuildContext context;
  const GetStartedButton(this.context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.only(bottom: 2),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SignupScreen(),

          ));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: logoTextColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'GET STARTED',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
