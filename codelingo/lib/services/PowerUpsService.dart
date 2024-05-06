import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/PowerUpsModel.dart';

class PowerUpsService {
  final CollectionReference _PowerUpssCollection =
      FirebaseFirestore.instance.collection('PowerUpss');

  // Add a new PowerUps with automatically generated ID
  Future<void> addPowerUps({required PowerUpsModel PowerUps}) async {
    try {
      await _PowerUpssCollection.add(PowerUps.toJson());
    } catch (e) {
      throw Exception("Failed to add PowerUps: $e");
    }
  }

  // Update an existing PowerUps by document ID
  Future<void> updatePowerUpsById({required String PowerUpsId,required PowerUpsModel PowerUps}) async {
    try {
      await _PowerUpssCollection.doc(PowerUpsId).update(PowerUps.toJson());
    } catch (e) {
      throw Exception("Failed to update PowerUps: $e");
    }
  }

  // Get all PowerUpss
  Future<List<PowerUpsModel>> getAllPowerUpss() async {
    try {
      var querySnapshot = await _PowerUpssCollection.get();
      return querySnapshot.docs
          .map((doc) => PowerUpsModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all PowerUpss: $e");
    }
  }

  // Get a PowerUps by document ID
  Future<PowerUpsModel?> getPowerUpsById({required String PowerUpsId}) async {
    try {
      var PowerUpsDoc = await _PowerUpssCollection.doc(PowerUpsId).get();
      if (PowerUpsDoc.exists) {
        return PowerUpsModel.fromJson(PowerUpsDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get PowerUps: $e");
    }
  }

  // Delete a PowerUps by document ID
  Future<void> deletePowerUpsById({required String PowerUpsId}) async {
    try {
      await _PowerUpssCollection.doc(PowerUpsId).delete();
    } catch (e) {
      throw Exception("Failed to delete PowerUps: $e");
    }
  }
}