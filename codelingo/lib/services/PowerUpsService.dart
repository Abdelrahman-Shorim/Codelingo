import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/PowerUpsModel.dart';
import 'package:uuid/uuid.dart';

class PowerUpsService {
  final CollectionReference _PowerUpssCollection =
      FirebaseFirestore.instance.collection('PowerUps');

  Future<void> addPowerUps({required PowerUpsModel PowerUps}) async {
    try {
      var uuid = const Uuid().v4();
      PowerUps.uid = uuid;
        await _PowerUpssCollection.doc(uuid).set(PowerUps.toJson());
    } catch (e) {
      throw Exception("Failed to add PowerUps: $e");
    }
  }

  Future<void> updatePowerUpsById(
      {required String PowerUpsId, required PowerUpsModel PowerUps}) async {
    try {
      await _PowerUpssCollection.doc(PowerUpsId).update(PowerUps.toJson());
    } catch (e) {
      throw Exception("Failed to update PowerUps: $e");
    }
  }

  Future<List<PowerUpsModel>> getAllPowerUps() async {
    try {
      var querySnapshot = await _PowerUpssCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              PowerUpsModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all PowerUps: $e");
    }
  }

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

  Future<void> deletePowerUpsById({required String PowerUpsId}) async {
    try {
      await _PowerUpssCollection.doc(PowerUpsId).delete();
    } catch (e) {
      throw Exception("Failed to delete PowerUps: $e");
    }
  }
}