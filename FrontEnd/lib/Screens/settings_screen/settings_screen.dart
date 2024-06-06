// import 'package:codelingo/Screens/settings_screen/components/input_field.dart';
// import 'package:codelingo/Screens/home_screen/components/profile_app_bar.dart';
// import 'package:flutter/material.dart';
// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({Key? key}) : super(key: key);

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   final formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final nameController = TextEditingController();

//   final name = "mina";
//   final email = "mina2011237@miuegypt.edu.eg";
//   final password = "mina12345";
//   final preference = "10";

//   String selectedAvatar = 'assets/avatars/ann.png';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CustomAvatarWidget(
//               imagePath: selectedAvatar,
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
//                   ),
//                   builder: (context) => AvatarMenu(
//                     onAvatarSelected: (imagePath) {
//                       setState(() {
//                         selectedAvatar = imagePath;
//                       });
//                       Navigator.pop(context);
//                     },
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   RoundedInputField(
//                     controller: emailController,
//                     hintText: "Email",
//                     icon: Icons.email,
//                   ),
//                   SizedBox(height: 20),
//                   RoundedInputField(
//                     controller: passwordController,
//                     hintText: "Password",
//                     icon: Icons.lock,
//                     obscureText: true,
//                   ),
//                   SizedBox(height: 20),
//                   RoundedInputField(
//                     controller: nameController,
//                     hintText: "Name",
//                     icon: Icons.person,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
            
//             ElevatedButton(
//               onPressed: () {
//                 // Save button logic
//               },
//               child: Text("Save"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomAvatarWidget extends StatelessWidget {
//   final String imagePath;
//   final VoidCallback onPressed;

//   const CustomAvatarWidget({required this.imagePath, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Theme.of(context).primaryColor, // Use primary color as background
//             ),
//             child: Center(
//               child: CircleAvatar(
//                 radius: 40,
//                 backgroundImage: AssetImage(imagePath), // Use the selected avatar image
//               ),
//             ),
//           ),
//           Positioned(
//             top: 10,
//             right: 10,
//             child: Container(
//               width: 24,
//               height: 24,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.black,
//               ),
//               child: Center(
//                 child: Image.asset(
//                   'assets/icons/edit.png', // Replace with your pencil icon image asset
//                   width: 16,
//                   height: 16,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AvatarMenu extends StatelessWidget {
//   final Function(String) onAvatarSelected;

//   const AvatarMenu({Key? key, required this.onAvatarSelected}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(5.0),
//       height: 700, // Adjust height as needed
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Avatars',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           Expanded(
//             child: GridView.count(
//               crossAxisCount: 4,
//               children: List.generate(42, (index) {
//                 return _buildAvatarCard(context, index);
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAvatarCard(BuildContext context, int index) {
//     final imagePath = 'assets/images/avatar${index + 1}.png'; // Generate image path
//     return GestureDetector(
//       onTap: () {
//         onAvatarSelected(imagePath);
//       },
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Padding(
//           padding: EdgeInsets.all(8),
//           child: Image.asset(
//             imagePath,
//             fit: BoxFit.cover, // Ensure the image covers the entire card
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RoundedInputField extends StatelessWidget {
//   final String hintText;
//   final IconData icon;
//   final ValueChanged<String>? onChanged;
//   final TextEditingController controller;
//   final bool obscureText;

//   const RoundedInputField({
//     Key? key,
//     required this.hintText,
//     required this.icon,
//     this.onChanged,
//     required this.controller,
//     this.obscureText = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       onChanged: onChanged,
//       decoration: InputDecoration(
//         hintText: hintText,
//         icon: Icon(
//           icon,
//           color: Colors.grey,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide.none,
//         ),
//         filled: true,
//         fillColor: Colors.grey.shade200,
//         contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//       ),
//     );
//   }


// }



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
  final nameController = TextEditingController();

  final name = "mina";
  final email = "mina2011237@miuegypt.edu.eg";
  final password = "mina12345";
  final preference = "10";

  String selectedAvatar = 'assets/avatars/ann.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
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
              child: InputField(emailController, passwordController, nameController, name, email, password, preference),
            ),
            // CreateButton( emailController, passwordController,nameController),
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
              color: Theme.of(context).primaryColor, 
            ),
            child: Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(imagePath), 
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
      height: 700, // Adjust height as needed
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
  final imagePath = 'assets/images/avatar${index + 1}.png'; // Generate image path
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
          fit: BoxFit.cover, // Ensure the image covers the entire card
        ),
      ),
    ),
  );
  
}


}

