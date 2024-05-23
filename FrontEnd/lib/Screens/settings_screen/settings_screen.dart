import 'package:codelingo/Screens/settings_screen/components/input_field.dart';
import 'package:codelingo/Screens/home_screen/components/profile_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController=TextEditingController();

    final name="mina";
    final email="mina2011237@miuegypt.edu.eg";
    final password="mina12345";
    final preference="10";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const  ProfileAppBar(),
      body: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: InputField(emailController, passwordController,nameController,name,email,password,preference),
            ),
            
            
            // CreateButton( emailController, passwordController,nameController),
            Container(margin: const EdgeInsets.only(top: 10)),
        ]
        )));
  }
}