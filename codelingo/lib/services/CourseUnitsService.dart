import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/CourseUnitsModel.dart';
import 'package:uuid/uuid.dart';

class CourseUnitsService {
  final CollectionReference _CourseUnitssCollection =
      FirebaseFirestore.instance.collection('CourseUnits');

  Future<void> addCourseUnit({required CourseUnitsModel CourseUnit}) async {
    try {
      var uuid = const Uuid().v4();
      CourseUnit.uid = uuid;
        await _CourseUnitssCollection.doc(uuid).set(CourseUnit.toJson());
    } catch (e) {
      throw Exception("Failed to add CourseUnits: $e");
    }
  }

  Future<void> updateCourseUnitById(
      {required String CourseUnitId, required CourseUnitsModel CourseUnit}) async {
    try {
      await _CourseUnitssCollection.doc(CourseUnitId).update(CourseUnit.toJson());
    } catch (e) {
      throw Exception("Failed to update CourseUnits: $e");
    }
  }

  Future<List<CourseUnitsModel>> getAllCourseUnits() async {
    try {
      var querySnapshot = await _CourseUnitssCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              CourseUnitsModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all CourseUnits: $e");
    }
  }

  Future<CourseUnitsModel?> getCourseUnitById({required String CourseUnitId}) async {
    try {
      var CourseUnitsDoc = await _CourseUnitssCollection.doc(CourseUnitId).get();
      if (CourseUnitsDoc.exists) {
        return CourseUnitsModel.fromJson(CourseUnitsDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get CourseUnits: $e");
    }
  }

  Future<void> deleteCourseUnitById({required String CourseUnitId}) async {
    try {
      await _CourseUnitssCollection.doc(CourseUnitId).delete();
    } catch (e) {
      throw Exception("Failed to delete CourseUnits: $e");
    }
  }
}