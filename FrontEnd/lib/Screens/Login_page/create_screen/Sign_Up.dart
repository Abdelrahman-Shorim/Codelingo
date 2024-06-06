// import 'package:duolingo/s/firebase_authentication.dart';
// import 'package:duolingo/views/login_screen/components/facebook_button.dart';
import 'components/google_button.dart';
// import 'components/forgot_password.dart';
// import 'package:duolingo/views/login_screen/components/google_button.dart';
import 'components/create_button.dart';
import 'components/policy_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'components/app_bar.dart';
import 'components/input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();


  // late FirebaseAuthentication auth;

  String loginMessage = '';

  @override
  void initState() {
    super.initState();

    // Firebase.initializeApp().whenComplete(() {
    //   auth = FirebaseAuthentication();
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      body: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: InputField(emailController, passwordController,nameController),
            ),
            
            
            CreateButton( emailController, passwordController,nameController),
            Container(margin: const EdgeInsets.only(top: 10)),
            Image.asset('assets/images/signup-man.png', height: 250),
            Container(padding: const EdgeInsets.all(5)),
            bottomDisplay(),
          ],
        ),
      ),
    );
  }

  bottomDisplay() {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              // mainAxisSize: MainAxisSize.max,
              children: [
                // FacebookButton(),
                GoogleButton(),
              ],
            ),
            PolicyText(),
          ],
        ),
      ),
    );
  }
}
