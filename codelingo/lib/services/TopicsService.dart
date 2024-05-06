import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/TopicsModel.dart';

class TopicsService {
  final CollectionReference _TopicssCollection =
      FirebaseFirestore.instance.collection('Topics');

  // Add a new Topics with automatically generated ID
  Future<void> addTopics({required TopicsModel Topics}) async {
    try {
      await _TopicssCollection.add(Topics.toJson());
    } catch (e) {
      throw Exception("Failed to add Topics: $e");
    }
  }

  // Update an existing Topics by document ID
  Future<void> updateTopicsById({required String TopicsId,required TopicsModel Topics}) async {
    try {
      await _TopicssCollection.doc(TopicsId).update(Topics.toJson());
    } catch (e) {
      throw Exception("Failed to update Topics: $e");
    }
  }

  // Get all Topicss
  Future<List<TopicsModel>> getAllTopicss() async {
    try {
      var querySnapshot = await _TopicssCollection.get();
      return querySnapshot.docs
          .map((doc) => TopicsModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all Topicss: $e");
    }
  }

  // Get a Topics by document ID
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

  // Delete a Topics by document ID
  Future<void> deleteTopicsById({required String TopicsId}) async {
    try {
      await _TopicssCollection.doc(TopicsId).delete();
    } catch (e) {
      throw Exception("Failed to delete Topics: $e");
    }
  }
}