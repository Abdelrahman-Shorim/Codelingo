import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/UserModel.dart';

class UserService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  // Add a new user with automatically generated ID
  Future<void> addUser(UserModel user) async {
    try {
      await _usersCollection.add(user.toJson());
    } catch (e) {
      throw Exception("Failed to add user: $e");
    }
  }

  // Update an existing user by document ID
  Future<void> updateUserById({required String userId,required UserModel user}) async {
    try {
      await _usersCollection.doc(userId).update(user.toJson());
    } catch (e) {
      throw Exception("Failed to update user: $e");
    }
  }

  // Get all users
  Future<List<UserModel>> getAllUsers() async {
    try {
      var querySnapshot = await _usersCollection.get();
      return querySnapshot.docs
          .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all users: $e");
    }
  }

  // Get a user by document ID
  Future<UserModel?> getUserById(String userId) async {
    try {
      var userDoc = await _usersCollection.doc(userId).get();
      if (userDoc.exists) {
        return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get user: $e");
    }
  }

  // Delete a user by document ID
  Future<void> deleteUserById(String userId) async {
    try {
      await _usersCollection.doc(userId).delete();
    } catch (e) {
      throw Exception("Failed to delete user: $e");
    }
  }
}