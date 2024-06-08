import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/HistoryModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class HistoryService {
  final CollectionReference _HistorysCollection =
      FirebaseFirestore.instance.collection('History');

  // Future<List<HistoryModel>> getAllUserHistory({required String userid}) async {
  //   try {
  //     var querySnapshot = await _HistorysCollection.get();
  //     return querySnapshot.docs
  //         .map((doc) => HistoryModel.fromJson(doc.data() as Map<String, dynamic>))
  //         .where((element) => element.useruid==userid)
  //         .toList();
  //   } catch (e) {
  //     throw Exception("Failed to get all Historys: $e");
  //   }
  // }

  Future<void> addHistory({required HistoryModel History}) async {
    try {
      var uuid = const Uuid().v4();
      History.uid = uuid;
      History.date = DateTime.now();
      var currentuser = FirebaseAuth.instance.currentUser;
      if (currentuser != null) {
        History.useruid = currentuser.uid;
        await _HistorysCollection.doc(uuid).set(History.toJson());
      } else {
        throw Exception("error getting current user");
      }
    } catch (e) {
      throw Exception("Failed to add History: $e");
    }
  }

  Future<void> updateHistoryById(
      {required String HistoryId, required HistoryModel History}) async {
    try {
      await _HistorysCollection.doc(HistoryId).update(History.toJson());
    } catch (e) {
      throw Exception("Failed to update History: $e");
    }
  }

  Future<List<HistoryModel>> getAllHistory() async {
    try {
      var querySnapshot = await _HistorysCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              HistoryModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all History: $e");
    }
  }

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

  Future<void> deleteHistoryById({required String HistoryId}) async {
    try {
      await _HistorysCollection.doc(HistoryId).delete();
    } catch (e) {
      throw Exception("Failed to delete History: $e");
    }
  }
}
