class StudentDetailModel {
  String uid;
  String useruid;
  // course id : course score
  List<Map<String, int>> enrolledcourses;
  String preferedLearningTime;
  List<Map<String, int>> powerups;
  int pocket;
  // course : solved
  List<Map<String, int>> totalsolvedquestions;
  // course : topic
  List<Map<String, String>> learnedTopics;
  // course: currentunit/currentlevel
  List<Map<String, String>> courselevel;
  String streakcounter;
  DateTime? streakdate;

  StudentDetailModel({
    required this.uid,
    required this.useruid,
    this.enrolledcourses = const [],
    required this.preferedLearningTime,
    this.powerups = const [],
    required this.pocket,
    this.totalsolvedquestions = const [],
    this.learnedTopics = const [],
    required this.streakcounter,
    this.streakdate,
    this.courselevel = const [],
  });

  // Convert Person object to a map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'useruid': useruid,
      'enrolledcourses': enrolledcourses,
      'preferedLearningTime': preferedLearningTime,
      'powerups': powerups,
      'pocket': pocket,
      'totalsolvedquestions': totalsolvedquestions,
      'learnedTopics': learnedTopics,
      'streakcounter': streakcounter,
      'streakdate': streakdate?.toIso8601String(),
      'courselevel': courselevel,
    };
  }

  // Create a Person object from a map
  factory StudentDetailModel.fromJson(Map<String, dynamic> map) {
    var enrolledcoursesData = map['enrolledcourses'] as List<dynamic>? ?? [];
    List<Map<String, int>> enrolledcoursesList = enrolledcoursesData.map((topicData) {
      return Map<String, int>.from(topicData);
    }).toList();

    var powerupsData = map['powerups'] as List<dynamic>? ?? [];
    List<Map<String, int>> powerupsList = powerupsData.map((topicData) {
      return Map<String, int>.from(topicData);
    }).toList();

    var totalsolvedquestionsData = map['totalsolvedquestions'] as List<dynamic>? ?? [];
    List<Map<String, int>> totalsolvedquestionsList = totalsolvedquestionsData.map((topicData) {
      return Map<String, int>.from(topicData);
    }).toList();

    var learnedTopicsData = map['learnedTopics'] as List<dynamic>? ?? [];
    List<Map<String, String>> learnedTopicsList = learnedTopicsData.map((topicData) {
      return Map<String, String>.from(topicData);
    }).toList();

    var courselevelData = map['courselevel'] as List<dynamic>? ?? [];
    List<Map<String, String>> courselevelList = courselevelData.map((topicData) {
      return Map<String, String>.from(topicData);
    }).toList();

    return StudentDetailModel(
      uid: map['uid'],
      useruid: map['useruid'],
      enrolledcourses: enrolledcoursesList,
      preferedLearningTime: map['preferedLearningTime'],
      powerups: powerupsList,
      pocket: map['pocket'],
      totalsolvedquestions: totalsolvedquestionsList,
      learnedTopics: learnedTopicsList,
      streakcounter: map['streakcounter'],
      streakdate: map['streakdate'] != null ? DateTime.parse(map['streakdate']) : null,
      courselevel: courselevelList,
    );
  }
}