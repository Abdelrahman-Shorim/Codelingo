import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/UserTypesModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class UserTypesService {
  final CollectionReference _UserTypessCollection =
      FirebaseFirestore.instance.collection('UserTypes');

  Future<void> addUserType({required UserTypesModel UserType}) async {
    try {
      var uuid = const Uuid().v4();
      UserType.uid = uuid;
        await _UserTypessCollection.doc(uuid).set(UserType.toJson());
    } catch (e) {
      throw Exception("Failed to add UserTypes: $e");
    }
  }

  Future<void> updateUserTypeById(
      {required String UserTypeId, required UserTypesModel UserType}) async {
    try {
      await _UserTypessCollection.doc(UserTypeId).update(UserType.toJson());
    } catch (e) {
      throw Exception("Failed to update UserTypes: $e");
    }
  }

  Future<List<UserTypesModel>> getAllUserTypes() async {
    try {
      var querySnapshot = await _UserTypessCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              UserTypesModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all UserTypes: $e");
    }
  }

  Future<UserTypesModel?> getUserTypeById({required String UserTypeId}) async {
    try {
      var UserTypesDoc = await _UserTypessCollection.doc(UserTypeId).get();
      if (UserTypesDoc.exists) {
        return UserTypesModel.fromJson(UserTypesDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get UserTypes: $e");
    }
  }

  Future<void> deleteUserTypeById({required String UserTypeId}) async {
    try {
      await _UserTypessCollection.doc(UserTypeId).delete();
    } catch (e) {
      throw Exception("Failed to delete UserTypes: $e");
    }
  }
}