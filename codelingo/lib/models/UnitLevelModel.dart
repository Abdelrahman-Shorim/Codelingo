class UnitLevelModel {
  String uid;
  String courseunitid;
  String levelname;
  List<String> leveltopics;
  int ordernumber;
// add icon if needed

  UnitLevelModel(
      {required this.uid,
      required this.courseunitid,
      required this.levelname,
      required this.leveltopics,
      required this.ordernumber,
      });

  // Convert object to a map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'courseunitid': courseunitid,
      'levelname': levelname,
      'leveltopics': leveltopics,
      'ordernumber': ordernumber,
    };
  }

  // Create an object from a map
  factory UnitLevelModel.fromJson(Map<String, dynamic> data) {
    var levelstopicsData = data?['leveltopics'] as List<dynamic>;
    List<String> leveltopicsList = levelstopicsData.map((leveldata) {
      return leveldata as String;
    }).toList();

    return UnitLevelModel(
      uid: data['uid'],
      courseunitid: data['courseunitid'],
      levelname: data['levelname'],
      leveltopics: leveltopicsList,
      ordernumber: data['ordernumber'],
    );
  }
}
