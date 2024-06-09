import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/StudentDetailModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class StudentDetailService {
  final CollectionReference _StudentDetailsCollection =
      FirebaseFirestore.instance.collection('StudentDetail');



// increase score
// increase pocket
// update finished lessons
// buy powerups
// update icon and duration


  Future<Future<StudentDetailModel?>> getstudentprofile(String userid) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    return  getStudentDetailById(StudentDetailId: currentUser!.uid);
  }

  Future<void> addStudentDetail({required StudentDetailModel StudentDetail}) async {
    try {
        await _StudentDetailsCollection.doc(StudentDetail.uid).set(StudentDetail.toJson());
    } catch (e) {
      throw Exception("Failed to add StudentDetail: $e");
    }
  }

  Future<void> updateStudentDetailById(
      {required String StudentDetailId, required StudentDetailModel StudentDetail}) async {
    try {
      await _StudentDetailsCollection.doc(StudentDetailId).update(StudentDetail.toJson());
    } catch (e) {
      throw Exception("Failed to update StudentDetail: $e");
    }
  }

  Future<List<StudentDetailModel>> getAllStudentDetail() async {
    try {
      var querySnapshot = await _StudentDetailsCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              StudentDetailModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all StudentDetail: $e");
    }
  }

  Future<StudentDetailModel?> getStudentDetailById({required String StudentDetailId}) async {
    try {
      var StudentDetailDoc = await _StudentDetailsCollection.doc(StudentDetailId).get();
      if (StudentDetailDoc.exists) {
        return StudentDetailModel.fromJson(StudentDetailDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get StudentDetail: $e");
    }
  }

  Future<void> deleteStudentDetailById({required String StudentDetailId}) async {
    try {
      await _StudentDetailsCollection.doc(StudentDetailId).delete();
    } catch (e) {
      throw Exception("Failed to delete StudentDetail: $e");
    }
  }
}