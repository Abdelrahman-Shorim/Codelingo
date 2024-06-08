import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  const InputField(this.emailController, this.passwordController, this.nameController, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InputFieldState();
  }
}

class InputFieldState extends State<InputField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          accountField(),
          nameField(),
          passwordField(),
        ],
      ),
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // Basic email validation
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  accountField() {
    return TextFormField(
      controller: widget.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          ),
        ),
        hintText: 'Email',
      ),
      validator: validateEmail,
    );
  }

  nameField() {
    return TextFormField(
      controller: widget.nameController,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            
          ),
        ),
        hintText: 'Name',
      ),
    );
  }

  passwordField() {
    return TextFormField(
      controller: widget.passwordController,
      obscureText: isObscure,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFF1CB0F6),
          ),
          onPressed: () {
            isObscure = !isObscure;
            setState(() {});
          },
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
        ),
        hintText: 'Password',
      ),
      validator: validatePassword,
    );
  }
}
