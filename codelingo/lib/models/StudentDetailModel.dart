class StudentDetailModel {
  String uid;
  String useruid;
  // course id : course score
  List<Map<String, int>>? enrolledcourses;
  String preferedLearningTime;
  List<Map<String, int>>? powerups;
  int pocket;
  // course : solved
  List<Map<String, int>>? totalsolvedquestions;
  // course : topic
  List<Map<String, String>>? learnedTopics;
  // course: currentunit/currentlevel
  List<Map<String, String>>? courselevel;
  String streakcounter;
  DateTime? streakdate;


  

  StudentDetailModel(
      {required this.uid,
      required this.useruid,
      required this.enrolledcourses,
      required this.preferedLearningTime,
      required this.powerups,
      required this.pocket,
      required this.totalsolvedquestions,
      required this.learnedTopics,
      required this.streakcounter,
      required this.streakdate,
      required this.courselevel});

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
      'streakdate': streakdate,
      'courselevel':courselevel,
    };
  }

  // Create a Person object from a map
  factory StudentDetailModel.fromJson(Map<String, dynamic> map) {

    var enrolledcoursesData = map?['enrolledcourses'] as List<Map<String, int>>;
    List<Map<String, int>> enrolledcoursesList = enrolledcoursesData.map((topicData) {
      return topicData as Map<String, int>;
    }).toList();

    var powerupsData = map?['powerups'] as List<Map<String, int>>;
    List<Map<String, int>> powerupsList = powerupsData.map((topicData) {
      return topicData as Map<String, int>;
    }).toList();

    var totalsolvedquestionsData = map?['totalsolvedquestions'] as List<Map<String, int>>;
    List<Map<String, int>> totalsolvedquestionsList = totalsolvedquestionsData.map((topicData) {
      return topicData as Map<String, int>;
    }).toList();

    var learnedTopicsData = map?['learnedTopics'] as List<Map<String, String>>;
    List<Map<String, String>> learnedTopicsList = learnedTopicsData.map((topicData) {
      return topicData as Map<String, String>;
    }).toList();

    var courselevelData = map?['learnedTopics'] as List<Map<String, String>>;
    List<Map<String, String>> courselevelList = courselevelData.map((topicData) {
      return topicData as Map<String, String>;
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
      streakdate: map['streakdate'],
      courselevel: courselevelList,
    );
  }
}
