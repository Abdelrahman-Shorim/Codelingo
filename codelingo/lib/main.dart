import 'package:codelingo/firebase_options.dart';
import 'package:codelingo/models/UserModel.dart';
import 'package:codelingo/services/UserService.dart';
import 'package:codelingo/screens/userlistscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TestService());
}

class TestService extends StatefulWidget {
  const TestService({super.key});

  @override
  State<TestService> createState() => _TestServiceState();
}

class _TestServiceState extends State<TestService> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserListScreen(),
    );
  }
}
