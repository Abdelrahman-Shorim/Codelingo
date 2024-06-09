

import 'package:codelingo/Screens/Instructor_view/settings_screen_instructor/settings_screen/components/qr.dart';
import 'package:codelingo/Screens/Instructor_view/settings_screen_instructor/settings_screen/components/settings_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final String courseid; 
  const SettingsScreen({super.key, required this.courseid});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final preferenceController = TextEditingController();

  final name = "Dr.Taraagy";
  final email = "Dr.Taraagy@miuegypt.edu.eg";
  final password = "Taragy12345";
  // final preference = "10";

  String selectedAvatar = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingsAppBar(),
      body: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAvatarWidget(
              imagePath: selectedAvatar,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                  ),
                  builder: (context) => AvatarMenu(
                    onAvatarSelected: (imagePath) {
                      setState(() {
                        selectedAvatar = imagePath;
                      });
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
            Form(
              key: formKey,
              child: InputField(
                emailController: emailController,
                passwordController: passwordController,
                nameController: nameController,
              
                name: name,
                email: email,
                password: password,
              
              ),
            ),
            Container(margin: const EdgeInsets.only(top: 10)),
            QrCodeGen(courseid:widget.courseid)
            
          ],
        ),
      ),
    );
  }
}



class CustomAvatarWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const CustomAvatarWidget({super.key, required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF2AE69B),
            ),
            child: Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: imagePath.isEmpty ? null : AssetImage(imagePath),
                backgroundColor: const Color.fromARGB(255, 177, 255, 224),
                child: imagePath.isEmpty ? const Icon(Icons.person, size: 40, color: Colors.white) : null,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Center(
                child: Image.asset(
                  'assets/icons/edit.png',
                  width: 16,
                  height: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AvatarMenu extends StatelessWidget {
  final Function(String) onAvatarSelected;

  const AvatarMenu({Key? key, required this.onAvatarSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Avatars',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(42, (index) {
                return _buildAvatarCard(context, index);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarCard(BuildContext context, int index) {
    final imagePath = 'assets/images/avatar${index + 1}.png';
    return GestureDetector(
      onTap: () {
        onAvatarSelected(imagePath);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final bool obscureText;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.onChanged,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            icon,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
 
  final String name;
  final String email;
  final String password;
 

  const InputField({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,

    required this.name,
    required this.email,
    required this.password,
 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          RoundedInputField(
            hintText: name,
            icon: Icons.person,
            controller: nameController,
          ),
          RoundedInputField(
            hintText: email,
            icon: Icons.email,
            controller: emailController,
          ),
          RoundedInputField(
            hintText: password,
            icon: Icons.lock,
            controller: passwordController,
            obscureText: true,
          ),
          const SizedBox(height: 10,),
          
          
        
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle save action
                print("Name: ${nameController.text}");
                print("Email: ${emailController.text}");
                print("Password: ${passwordController.text}");
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2AE69B),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text("Save", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}