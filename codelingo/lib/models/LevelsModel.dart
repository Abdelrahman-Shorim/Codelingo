import 'package:flutter/foundation.dart';

class LevelsModel {
  final String uid;
  final String name;
  final String difficulty;
  final int order;
  final List<String> topicsuid;

  LevelsModel({
    required this.uid,
    required this.name,
    required this.difficulty,
    required this.order,
    required this.topicsuid,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'difficulty': difficulty,
      'order': order,
      'topicsuid': topicsuid,
    };
  }

  factory LevelsModel.fromJson(Map<String, dynamic>? data) {
    var topicsData = data?['topicsuid'] as List<dynamic>;
    List<String> topicsList = topicsData.map((topicData) {
      return topicData as String;
    }).toList();

    return LevelsModel(
      uid: data?['uid'],
      name: data?['name'],
      difficulty: data?['difficulty'],
      order: data?['order'],
      topicsuid: topicsList,
    );
  }
}
