class QuestionsModel {
  String uid;
  bool isImage;
  String question;
  // Question,Score
  List<Map<String,String>> choices;
  String difficulty;
  List<String> topicsuid;
  String courseuid;
  

  QuestionsModel(
      {required this.uid,
      required this.isImage,
      required this.question,
      required this.choices,
      required this.difficulty,
      required this.topicsuid,
      required this.courseuid});

  // Convert object to a map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'isImage': isImage,
      'question': question,
      'choices': choices,
      'difficulty': difficulty,
      'topicsuid': topicsuid,
      'courseuid': courseuid,
    };
  }

  // Create an object from a map
  factory QuestionsModel.fromJson(Map<String, dynamic>? map) {
    var choicesdata = map?['choices'] as  List<Map<String,String>>;
     List<Map<String,String>> choiceslist = choicesdata.map((topicData) {
      return topicData as  Map<String,String>;
    }).toList();

    var topicsuiddata = map?['topicsuid'] as List<dynamic>;
    List<String> topicsuidlist = topicsuiddata.map((topicData) {
      return topicData as String;
    }).toList();

    return QuestionsModel(
      uid: map?['uid'],
      isImage: map?['isImage'],
      question: map?['question'],
      difficulty: map?['difficulty'],
      choices: choiceslist,
      topicsuid: topicsuidlist,
      courseuid: map?['courseuid'],
    );
  }
}
