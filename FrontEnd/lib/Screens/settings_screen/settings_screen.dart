import 'package:codelingo/Screens/settings_screen/components/input_field.dart';
import 'package:codelingo/Screens/home_screen/components/profile_app_bar.dart';
import 'package:flutter/material.dart';
class AvatarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      height: 400, // Adjust height as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Avatars',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/avatars/ann.png'),
                  ),
                  
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/avatars/shehab.png'),
                  ),
                  title: Text('User 2'),
                  subtitle: Text('Details about user 2'),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/avatars/avatar3.png'),
                  ),
                  title: Text('User 3'),
                  subtitle: Text('Details about user 3'),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/avatars/avatar4.png'),
                  ),
                  title: Text('User 4'),
                  subtitle: Text('Details about user 4'),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/avatars/avatar5.png'),
                  ),
                  title: Text('User 5'),
                  subtitle: Text('Details about user 5'),
                ),
                // Add more ListTiles as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
         
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              ),
              builder: (context) => AvatarMenu(),
            );
          },
          icon:  CustomAvatarWidget(),
        ),
      
        
            // CreateButton( emailController, passwordController,nameController),
            Container(margin: const EdgeInsets.only(top: 10)),
        ]
        )));
  }
}



class CustomAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade800,
          ),
          child: Center(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/abdelrahman.png'), // Replace with your avatar image asset
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
                'assets/icons/edit.png', // Replace with your pencil icon image asset
                width: 16,
                height: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}