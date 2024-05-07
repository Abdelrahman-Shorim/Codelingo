import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/LevelsModel.dart';

class LevelsService {
  final CollectionReference _LevelssCollection =
      FirebaseFirestore.instance.collection('Levels');

  // Add a new Levels with automatically generated ID
  Future<void> addLevels({required LevelsModel Levels}) async {
    try {
      await _LevelssCollection.add(Levels.toJson());
    } catch (e) {
      throw Exception("Failed to add Levels: $e");
    }
  }

  // Update an existing Levels by document ID
  Future<void> updateLevelsById({required String LevelsId,required LevelsModel Levels}) async {
    try {
      await _LevelssCollection.doc(LevelsId).update(Levels.toJson());
    } catch (e) {
      throw Exception("Failed to update Levels: $e");
    }
  }

  // Get all Levelss
  Future<List<LevelsModel>> getAllLevelss() async {
    try {
      var querySnapshot = await _LevelssCollection.get();
      return querySnapshot.docs
          .map((doc) => LevelsModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all Levelss: $e");
    }
  }

  // Get a Levels by document ID
  Future<LevelsModel?> getLevelsById({required String LevelsId}) async {
    try {
      var LevelsDoc = await _LevelssCollection.doc(LevelsId).get();
      if (LevelsDoc.exists) {
        return LevelsModel.fromJson(LevelsDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get Levels: $e");
    }
  }

  // Delete a Levels by document ID
  Future<void> deleteLevelsById({required String LevelsId}) async {
    try {
      await _LevelssCollection.doc(LevelsId).delete();
    } catch (e) {
      throw Exception("Failed to delete Levels: $e");
    }
  }
}