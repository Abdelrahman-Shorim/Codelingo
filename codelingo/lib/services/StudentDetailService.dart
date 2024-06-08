import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/StudentDetailModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentDetailService {
  final CollectionReference _StudentDetailsCollection =
      FirebaseFirestore.instance.collection('StudentDetail');

  Future<Future<StudentDetailModel?>> getstudentprofile(String userid) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    return  getStudentDetailById(StudentDetailId: currentUser!.uid);
  }

  // Add a new StudentDetail with automatically generated ID
  Future<void> addStudentDetail(
      {required StudentDetailModel StudentDetail}) async {
    try {
      await _StudentDetailsCollection.add(StudentDetail.toJson());
    } catch (e) {
      throw Exception("Failed to add StudentDetail: $e");
    }
  }

  // Update an existing StudentDetail by document ID
  Future<void> updateStudentDetailById(
      {required String StudentDetailId,
      required StudentDetailModel StudentDetail}) async {
    try {
      await _StudentDetailsCollection.doc(StudentDetailId)
          .update(StudentDetail.toJson());
    } catch (e) {
      throw Exception("Failed to update StudentDetail: $e");
    }
  }

  // Get all StudentDetails
  Future<List<StudentDetailModel>> getAllStudentDetails() async {
    try {
      var querySnapshot = await _StudentDetailsCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              StudentDetailModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all StudentDetails: $e");
    }
  }

  // Get a StudentDetail by document ID
  Future<StudentDetailModel?> getStudentDetailById(
      {required String StudentDetailId}) async {
    try {
      var StudentDetailDoc =
          await _StudentDetailsCollection.doc(StudentDetailId).get();
      if (StudentDetailDoc.exists) {
        return StudentDetailModel.fromJson(
            StudentDetailDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get StudentDetail: $e");
    }
  }

  // Delete a StudentDetail by document ID
  Future<void> deleteStudentDetailById(
      {required String StudentDetailId}) async {
    try {
      await _StudentDetailsCollection.doc(StudentDetailId).delete();
    } catch (e) {
      throw Exception("Failed to delete StudentDetail: $e");
    }
  }
}
