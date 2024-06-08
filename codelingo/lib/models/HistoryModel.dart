class HistoryModel {
  String uid;
  DateTime date;
  String useruid;
  String unitlevelid;
  String totalscore;

  HistoryModel(
      {required this.uid,
      required this.date,
      required this.useruid,
      required this.unitlevelid,
      required this.totalscore,
      });

  // Convert object to a map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'date': date,
      'useruid': useruid,
      'unitlevelid': unitlevelid,
      'totalscore': totalscore,
    };
  }

  factory HistoryModel.fromJson(Map<String, dynamic> map) {
    return HistoryModel(
      uid: map['uid'],
      date: map['date'],
      useruid: map['useruid'],
      unitlevelid: map['unitlevelid'],
      totalscore: map['totalscore'],
    );
  }
}
