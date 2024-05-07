import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/HistoryModel.dart';

class HistoryService {
  final CollectionReference _HistorysCollection =
      FirebaseFirestore.instance.collection('History');



  Future<List<HistoryModel>> getAllUserHistory({required String userid}) async {
    try {
      var querySnapshot = await _HistorysCollection.get();
      return querySnapshot.docs
          .map((doc) => HistoryModel.fromJson(doc.data() as Map<String, dynamic>))
          .where((element) => element.useruid==userid)
          .toList();
    } catch (e) {
      throw Exception("Failed to get all Historys: $e");
    }
  }

  // Add a new History with automatically generated ID
  Future<void> addHistory({required HistoryModel History}) async {
    try {
      await _HistorysCollection.add(History.toJson());
    } catch (e) {
      throw Exception("Failed to add History: $e");
    }
  }

  // Update an existing History by document ID
  Future<void> updateHistoryById({required String HistoryId,required HistoryModel History}) async {
    try {
      await _HistorysCollection.doc(HistoryId).update(History.toJson());
    } catch (e) {
      throw Exception("Failed to update History: $e");
    }
  }

  // Get all Historys
  Future<List<HistoryModel>> getAllHistorys() async {
    try {
      var querySnapshot = await _HistorysCollection.get();
      return querySnapshot.docs
          .map((doc) => HistoryModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all Historys: $e");
    }
  }

  // Get a History by document ID
  Future<HistoryModel?> getHistoryById({required String HistoryId}) async {
    try {
      var HistoryDoc = await _HistorysCollection.doc(HistoryId).get();
      if (HistoryDoc.exists) {
        return HistoryModel.fromJson(HistoryDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get History: $e");
    }
  }

  // Delete a History by document ID
  Future<void> deleteHistoryById({required String HistoryId}) async {
    try {
      await _HistorysCollection.doc(HistoryId).delete();
    } catch (e) {
      throw Exception("Failed to delete History: $e");
    }
  }
}