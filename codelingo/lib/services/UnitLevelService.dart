import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/UnitLevelModel.dart';
import 'package:uuid/uuid.dart';

class UnitLevelService {
  final CollectionReference _UnitLevelsCollection =
      FirebaseFirestore.instance.collection('UnitLevel');

  Future<void> addUnitLevel({required UnitLevelModel UnitLevel}) async {
    try {
      var uuid = const Uuid().v4();
      UnitLevel.uid = uuid;
        await _UnitLevelsCollection.doc(uuid).set(UnitLevel.toJson());
    } catch (e) {
      throw Exception("Failed to add UnitLevel: $e");
    }
  }

  Future<void> updateUnitLevelById(
      {required String UnitLevelId, required UnitLevelModel UnitLevel}) async {
    try {
      await _UnitLevelsCollection.doc(UnitLevelId).update(UnitLevel.toJson());
    } catch (e) {
      throw Exception("Failed to update UnitLevel: $e");
    }
  }

  Future<List<UnitLevelModel>> getAllUnitLevel() async {
    try {
      var querySnapshot = await _UnitLevelsCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              UnitLevelModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all UnitLevel: $e");
    }
  }

  Future<UnitLevelModel?> getUnitLevelById({required String UnitLevelId}) async {
    try {
      var UnitLevelDoc = await _UnitLevelsCollection.doc(UnitLevelId).get();
      if (UnitLevelDoc.exists) {
        return UnitLevelModel.fromJson(UnitLevelDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get UnitLevel: $e");
    }
  }

  Future<void> deleteUnitLevelById({required String UnitLevelId}) async {
    try {
      await _UnitLevelsCollection.doc(UnitLevelId).delete();
    } catch (e) {
      throw Exception("Failed to delete UnitLevel: $e");
    }
  }
}