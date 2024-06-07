import 'package:codelingo/Screens/settings_screen/components/input_field.dart';
import 'package:codelingo/Screens/settings_screen/components/settings_app_bar.dart';

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
  final nameController = TextEditingController();
  final preferenceController = TextEditingController();

  final name = "mina";
  final email = "mina2011237@miuegypt.edu.eg";
  final password = "mina12345";
  final preference = "10";

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
                  shape: RoundedRectangleBorder(
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
                preferenceController: preferenceController,
                name: name,
                email: email,
                password: password,
                preference: preference,
              ),
            ),
            Container(margin: const EdgeInsets.only(top: 10)),
          ],
        ),
      ),
    );
  }
}

class CustomAvatarWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const CustomAvatarWidget({required this.imagePath, required this.onPressed});

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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF2AE69B),
            ),
            child: Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: imagePath.isEmpty ? null : AssetImage(imagePath),
                backgroundColor: Color.fromARGB(255, 177, 255, 224),
                child: imagePath.isEmpty ? Icon(Icons.person, size: 40, color: Colors.white) : null,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
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
      padding: EdgeInsets.all(5.0),
      height: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Avatars',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
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
          padding: EdgeInsets.all(8),
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
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController preferenceController;
  final String name;
  final String email;
  final String password;
  final String preference;

  const InputField({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.preferenceController,
    required this.name,
    required this.email,
    required this.password,
    required this.preference,
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
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Duration Preference',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 10,),
          PreferenceSelector(
            preference: preference,
            onPreferenceSelected: (newPreference) {
              preferenceController.text = newPreference;
            },
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle save action
                print("Name: ${nameController.text}");
                print("Email: ${emailController.text}");
                print("Password: ${passwordController.text}");
                print("Preference: ${preferenceController.text}");
              },
              child: Text("Save", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF2AE69B),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PreferenceSelector extends StatefulWidget {
  final String preference;
  final Function(String) onPreferenceSelected;

  const PreferenceSelector({required this.preference, required this.onPreferenceSelected, Key? key}) : super(key: key);

  @override
  _PreferenceSelectorState createState() => _PreferenceSelectorState();
}

class _PreferenceSelectorState extends State<PreferenceSelector> {
  late String selectedPreference;
  final List<String> preferences = ['5', '10', '15', '30'];

  @override
  void initState() {
    super.initState();
    selectedPreference = widget.preference;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: preferences.map((pref) => _buildPreferenceCircle(pref)).toList(),
    );
  }

  Widget _buildPreferenceCircle(String pref) {
    bool isSelected = selectedPreference == pref;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPreference = pref;
        });
        widget.onPreferenceSelected(pref);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Color(0xFF2AE69B) : Colors.grey,
          border: Border.all(color: Colors.white, width: 2),
        ),
        alignment: Alignment.center,
        child: Text(
          pref,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}