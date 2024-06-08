import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/HistoryDetailModel.dart';
import 'package:uuid/uuid.dart';

class HistoryDetailService {
  final CollectionReference _HistoryDetailsCollection =
      FirebaseFirestore.instance.collection('HistoryDetail');

  Future<void> addHistoryDetail({required HistoryDetailModel HistoryDetail}) async {
    try {
      var uuid = const Uuid().v4();
      HistoryDetail.uid = uuid;
        await _HistoryDetailsCollection.doc(uuid).set(HistoryDetail.toJson());
    } catch (e) {
      throw Exception("Failed to add HistoryDetail: $e");
    }
  }

  Future<void> updateHistoryDetailById(
      {required String HistoryDetailId, required HistoryDetailModel HistoryDetail}) async {
    try {
      await _HistoryDetailsCollection.doc(HistoryDetailId).update(HistoryDetail.toJson());
    } catch (e) {
      throw Exception("Failed to update HistoryDetail: $e");
    }
  }

  Future<List<HistoryDetailModel>> getAllHistoryDetail() async {
    try {
      var querySnapshot = await _HistoryDetailsCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              HistoryDetailModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all HistoryDetail: $e");
    }
  }

  Future<HistoryDetailModel?> getHistoryDetailById({required String HistoryDetailId}) async {
    try {
      var HistoryDetailDoc = await _HistoryDetailsCollection.doc(HistoryDetailId).get();
      if (HistoryDetailDoc.exists) {
        return HistoryDetailModel.fromJson(HistoryDetailDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get HistoryDetail: $e");
    }
  }

  Future<void> deleteHistoryDetailById({required String HistoryDetailId}) async {
    try {
      await _HistoryDetailsCollection.doc(HistoryDetailId).delete();
    } catch (e) {
      throw Exception("Failed to delete HistoryDetail: $e");
    }
  }
}