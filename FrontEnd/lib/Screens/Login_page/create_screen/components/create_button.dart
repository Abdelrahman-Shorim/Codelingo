// import 'package:duolingo/shared/firebase_authentication.dart';
import 'package:codelingo/Screens/home.dart';
import 'package:codelingo/Screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:codelingo/Shared/constants.dart';
class CreateButton extends StatefulWidget {
  // final FirebaseAuthentication auth;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  // const LoginButton(this.auth, this.emailController, this.passwordController,
  const CreateButton( this.emailController, this.passwordController,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CreateButtonState();
  }
}

class CreateButtonState extends State<CreateButton> {
  String loginMessage = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(loginMessage),
        Container(padding: const EdgeInsets.all(5)),
        Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          padding: const EdgeInsets.only(bottom: 2),
          child: ElevatedButton(
            child: const Text(
              'CREATE ACCOUNT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: logoTextColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: (){
              Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>  HomeScreen(),

          ));
            },
          ),
        ),
      ],
    );
  }

  loginPressed() {
    String userId = '';
    String email = widget.emailController.text;
    String password = widget.passwordController.text;
  //   widget.auth.login(email, password).then((value) {
  //     print('Login Info: ${email} - ${password}');
  //     if (value == null) {
  //       setState(() {
  //         print('login failed');
  //         loginMessage = 'Login Error';
  //       });
  //     } else {
  //       userId = value;
  //       setState(() {
  //         print('login successfully');
  //         loginMessage = 'User $userId successfully logged in';
  //       });
  //     }
  //   });
  }
}

////// create user
// else {
// auth.createUser(txtUserName.text, txtPassword.text).then((value) {
// if (value == null) {
// setState(() {
// _message = 'Registration Error';
// });
// } else {
// userId = value;
// setState(() {
// _message = 'User $userId successfully signed in';
// });
// }
// });
// };
