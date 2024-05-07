class LevelsModel {
  final String uid;
  final String name;
  final String difficulty;
  final int order;
  final List<String> topicsId;

  LevelsModel({
    required this.uid,
    required this.name,
    required this.difficulty,
    required this.order,
    required this.topicsId,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'difficulty': difficulty,
      'order': order,
      'topicsId': topicsId,
    };
  }

  static LevelsModel fromJson(Map<String, dynamic>? data) {
    var topicsData = data?['topicsId'] as List<dynamic>;
    List<String> topicsList = topicsData.map((topicData) {
      return topicData as String;
    }).toList();

    return LevelsModel(
      uid: data?['uid'],
      name: data?['name'],
      difficulty: data?['difficulty'],
      order: data?['order'],
      topicsId: topicsList,
    );
  }
}
