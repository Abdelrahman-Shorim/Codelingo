class HistoryModel {
  String uid;
  DateTime date;
  String useruid;
  String questionuid;
  String solution;
  String leveluid;

// add icon if needed


  HistoryModel({ required this.uid, required this.date, required this.useruid, required this.questionuid, required this.solution,
  required this.leveluid});

  // Convert object to a map
  Map<String, dynamic> toJson() {
    return {
      'uid':uid,
      'date': date,
      'useruid': useruid,
      'questionuid':questionuid,
      'solution':solution,
      'leveluid':leveluid,
    };
  }

  // Create an object from a map
  factory HistoryModel.fromJson(Map<String, dynamic> map) {
    return HistoryModel(
      uid: map['uid'],
      date: map['date'],
      useruid: map['useruid'],
      questionuid: map['questionuid'],
      solution: map['solution'],
      leveluid: map['leveluid'],
    );
  }
}

