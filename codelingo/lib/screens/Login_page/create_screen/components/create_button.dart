// import 'package:duolingo/shared/firebase_authentication.dart';
import 'package:codelingo/Screens/Select_Course_Screen/Course_Select.dart';
import 'package:codelingo/Screens/home_screen/home_screen.dart';
import 'package:codelingo/services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:codelingo/Shared/constants.dart';

class CreateButton extends StatefulWidget {
  // final FirebaseAuthentication auth;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  // const LoginButton(this.auth, this.emailController, this.passwordController,
  const CreateButton(
      this.emailController, this.passwordController, this.nameController,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CreateButtonState();
  }
}

class CreateButtonState extends State<CreateButton> {
  String loginMessage = '';
  final UserService _userservice = UserService();
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
            style: ElevatedButton.styleFrom(
              backgroundColor: logoTextColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              loginPressed(context);
            },
            child: const Text(
              'CREATE ACCOUNT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  loginPressed(BuildContext context) async {
    String userId = '';
    String email = widget.emailController.text;
    String password = widget.passwordController.text;
    String name = widget.nameController.text;
        try {
      await _userservice.signup(email, password);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signup successful'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CourseSelectTypePage(),
                ),
              );
            },
          ),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signup failed: $error'),
        ),
      );
    }
  }
  }


////// create user
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
