import 'package:flutter/material.dart';
import 'package:codelingo/Shared/constants.dart';
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
          color: isSelected ? logoTextColor : Colors.grey,
          border: Border.all(color: Colors.black, width: 2),
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

class InputField extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final String name;
  final String email;
  final String password;
  final String preference;

  const InputField(this.emailController, this.passwordController, this.nameController, this.name, this.email, this.password, this.preference, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InputFieldState();
  }
}

class InputFieldState extends State<InputField> {
  bool isObscure = true;
  late String selectedPreference;

  @override
  void initState() {
    super.initState();
    widget.emailController.text = widget.email;
    widget.nameController.text = widget.name;
    widget.passwordController.text = widget.password;
    selectedPreference = widget.preference;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          inputRow('Name', nameField()),
          const SizedBox(height: 10),
          inputRow('Email', accountField()),
          const SizedBox(height: 10),
          inputRow('Password', passwordField()),
          const SizedBox(height: 10),
          inputRow('Daily Duration Preference', PreferenceSelector(
            preference: selectedPreference,
            onPreferenceSelected: (newPreference) {
              setState(() {
                selectedPreference = newPreference;
              });
            },
          )),
          const SizedBox(height: 20),
          SizedBox(
             width: double.infinity,
          height: 50,
          
            child: ElevatedButton(
          style: 
          ElevatedButton.styleFrom(backgroundColor: logoTextColor),
              onPressed: () {
                // Handle save action here
              },
              child: const Text('Save', style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputRow(String label, Widget field) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Expanded(child: field),
      ],
    );
  }

  Widget accountField() {
    return TextFormField(
      controller: widget.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
          
          ),
        ),
        hintText: 'Email',
      ),
      // validator: validateEmail,
      onChanged: (value) {
        // bloc.changeEmail(value);
      },
    );
  }

  Widget nameField() {
    return TextFormField(
      controller: widget.nameController,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(),
        ),
        hintText: 'Name',
      ),
      // validator: validateEmail,
      onChanged: (value) {
        // bloc.changeEmail(value);
      },
    );
  }

  Widget passwordField() {
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
            
          ),
        ),
        hintText: 'Password',
      ),
      // validator: validatePassword,
    );
  }
}


