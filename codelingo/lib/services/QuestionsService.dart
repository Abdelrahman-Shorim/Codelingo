import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/QuestionsModel.dart';
import 'package:codelingo/models/UnitLevelModel.dart';
import 'package:codelingo/models/UserModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class QuestionsService {
  final CollectionReference _QuestionssCollection =
      FirebaseFirestore.instance.collection('Questions');

  Future<List<QuestionsModel>> getLevelQuestionsForUser({required UnitLevelModel unitlevel}) async {
    try {
      var querySnapshot = await _QuestionssCollection.get();
      return querySnapshot.docs
          .map((doc) => QuestionsModel.fromJson(doc.data() as Map<String, dynamic>))
          .where((element) => false)
          .toList();
    } catch (e) {
      throw Exception("Failed to get all Questionss: $e");
    }
  }

  // Add a new Questions with automatically generated ID
  Future<void> addQuestion(
      {required QuestionsModel questions, File? questionimage}) async {
    try {
      var uuid = const Uuid().v4();
      questions.uid = uuid;

      if (questions.isImage && questionimage != null) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('QuestionsImages/${questions.courseuid}/${uuid}/pic');
        await ref.putFile(questionimage!);
        String picurl = await ref.getDownloadURL();

        questions.question = picurl;
      }

      await _QuestionssCollection.doc(uuid).set(questions.toJson());
    } catch (e) {
      throw Exception("Failed to add Questions: $e");
    }
  }

  // Update an existing Questions by document ID
  Future<void> updateQuestionsById(
      {required String QuestionsId, required QuestionsModel Questions}) async {
    try {
      await _QuestionssCollection.doc(QuestionsId).update(Questions.toJson());
    } catch (e) {
      throw Exception("Failed to update Questions: $e");
    }
  }

  // Get all Questionss
  Future<List<QuestionsModel>> getAllQuestionss() async {
    try {
      var querySnapshot = await _QuestionssCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              QuestionsModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all Questionss: $e");
    }
  }

  // Get a Questions by document ID
  Future<QuestionsModel?> getQuestionsById(
      {required String QuestionsId}) async {
    try {
      var QuestionsDoc = await _QuestionssCollection.doc(QuestionsId).get();
      if (QuestionsDoc.exists) {
        return QuestionsModel.fromJson(
            QuestionsDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get Questions: $e");
    }
  }

  // Delete a Questions by document ID
  Future<void> deleteQuestionsById({required String QuestionsId}) async {
    try {
      await _QuestionssCollection.doc(QuestionsId).delete();
    } catch (e) {
      throw Exception("Failed to delete Questions: $e");
    }
  }
}
