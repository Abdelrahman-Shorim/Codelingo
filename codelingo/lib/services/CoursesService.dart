import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/CoursesModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class CoursesService {
  final CollectionReference _CoursessCollection =
      FirebaseFirestore.instance.collection('Courses');

  Future<void> addCourse({required CoursesModel Course}) async {
    try {
      var uuid = const Uuid().v4();
      Course.uid = uuid;
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        Course.instructoruid = currentUser.uid;
        await _CoursessCollection.doc(uuid).set(Course.toJson());
      }
      else {
        throw Exception("error getting current user");
      }
    } catch (e) {
      throw Exception("Failed to add Courses: $e");
    }
  }

  Future<void> updateCourseById(
      {required String CourseId, required CoursesModel Course}) async {
    try {
      await _CoursessCollection.doc(CourseId).update(Course.toJson());
    } catch (e) {
      throw Exception("Failed to update Courses: $e");
    }
  }

  Future<List<CoursesModel>> getAllCourses() async {
    try {
      var querySnapshot = await _CoursessCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              CoursesModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all Coursess: $e");
    }
  }

  Future<CoursesModel?> getCourseById({required String CourseId}) async {
    try {
      var CoursesDoc = await _CoursessCollection.doc(CourseId).get();
      if (CoursesDoc.exists) {
        return CoursesModel.fromJson(CoursesDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get Courses: $e");
    }
  }

  Future<void> deleteCourseById({required String CourseId}) async {
    try {
      await _CoursessCollection.doc(CourseId).delete();
    } catch (e) {
      throw Exception("Failed to delete Courses: $e");
    }
  }
}
