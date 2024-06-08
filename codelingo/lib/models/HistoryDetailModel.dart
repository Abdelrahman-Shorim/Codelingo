class HistoryDetailModel {
  String uid;
  String historyuid;
  String questionuid;
  String solution;
  String score;

  HistoryDetailModel(
      {required this.uid, required this.historyuid, required this.questionuid, required this.solution, required this.score});

  // Convert object to a map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'historyuid': historyuid,
      'questionuid': questionuid,
      'solution': solution,
      'score': score,
    };
  }

  // Create an object from a map
  factory HistoryDetailModel.fromJson(Map<String, dynamic> map) {
    return HistoryDetailModel(
      uid: map['uid'],
      historyuid: map['historyuid'],
      questionuid: map['questionuid'],
      solution: map['solution'],
      score: map['score'],
    );
  }
}
