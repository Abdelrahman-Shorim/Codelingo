import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/TopicsModel.dart';
import 'package:uuid/uuid.dart';

class TopicsService {
  final CollectionReference _TopicssCollection =
      FirebaseFirestore.instance.collection('Topics');

  Future<void> addTopics({required TopicsModel Topics}) async {
    try {
      var uuid = const Uuid().v4();
      Topics.uid = uuid;
        await _TopicssCollection.doc(uuid).set(Topics.toJson());
    } catch (e) {
      throw Exception("Failed to add Topics: $e");
    }
  }

  Future<void> updateTopicsById(
      {required String TopicsId, required TopicsModel Topics}) async {
    try {
      await _TopicssCollection.doc(TopicsId).update(Topics.toJson());
    } catch (e) {
      throw Exception("Failed to update Topics: $e");
    }
  }

  Future<List<TopicsModel>> getAllTopics() async {
    try {
      var querySnapshot = await _TopicssCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              TopicsModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all Topics: $e");
    }
  }

  Future<TopicsModel?> getTopicsById({required String TopicsId}) async {
    try {
      var TopicsDoc = await _TopicssCollection.doc(TopicsId).get();
      if (TopicsDoc.exists) {
        return TopicsModel.fromJson(TopicsDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get Topics: $e");
    }
  }

  Future<void> deleteTopicsById({required String TopicsId}) async {
    try {
      await _TopicssCollection.doc(TopicsId).delete();
    } catch (e) {
      throw Exception("Failed to delete Topics: $e");
    }
  }
}