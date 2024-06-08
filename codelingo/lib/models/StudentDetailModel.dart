class StudentDetailModel {
  String uid;
  String useruid;
  // course id : course score
  List<Map<String, String>>? enrolledcourses;
  String preferedLearningTime;
  List<Map<String, String>>? powerups;
  int pocket;
  // course : solved
  List<Map<String, String>>? totalsolvedquestions;
  // course : topic
  List<Map<String, String>>? learnedTopics;
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
      required this.streakdate});

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
    };
  }

  // Create a Person object from a map
  factory StudentDetailModel.fromJson(Map<String, dynamic> map) {

    var enrolledcoursesData = map?['enrolledcourses'] as List<Map<String, String>>;
    List<Map<String, String>> enrolledcoursesList = enrolledcoursesData.map((topicData) {
      return topicData as Map<String, String>;
    }).toList();

    var powerupsData = map?['powerups'] as List<Map<String, String>>;
    List<Map<String, String>> powerupsList = powerupsData.map((topicData) {
      return topicData as Map<String, String>;
    }).toList();

    var totalsolvedquestionsData = map?['totalsolvedquestions'] as List<Map<String, String>>;
    List<Map<String, String>> totalsolvedquestionsList = totalsolvedquestionsData.map((topicData) {
      return topicData as Map<String, String>;
    }).toList();

    var learnedTopicsData = map?['learnedTopics'] as List<Map<String, String>>;
    List<Map<String, String>> learnedTopicsList = learnedTopicsData.map((topicData) {
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
    );
  }
}
