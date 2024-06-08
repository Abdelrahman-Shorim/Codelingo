import 'package:codelingo/models/UserModel.dart';
import 'package:codelingo/services/UserService.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserService _userService = UserService();
  List<UserModel> _users = [];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addStaticUserData,
          ),
        ],
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : _users.isEmpty
                ? const Text('No users yet')
                : ListView.builder(
                    itemCount: _users.length,
                    itemBuilder: (context, index) {
                      final user = _users[index];
                      return ListTile(
                        title: Text(user.name),
                        subtitle: Text('Age: ${user.name}'),
                      );
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchUsers,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _fetchUsers() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final users = await _userService.getAllUsers();
      setState(() {
        _users = users;
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch users: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _addStaticUserData() async {
    try {
      // Add static user data
      await _userService.deleteUserById('LUfxI6FKggge6JVXsSbQ');
      // print(x?.toJson());
      // await _userService.addUser(UserModel(name: 'Bob', age: 30));

      // Refresh user list
      _fetchUsers();
    } catch (e) {
      print('Failed to add static user data: $e');
    }
  }
}