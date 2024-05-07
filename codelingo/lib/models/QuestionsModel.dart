class QuestionsModel {
  String uid;
  String question;
  List<String> choices;
  String difficulty;
  List<String> topicsuid;
// add icon if needed


  QuestionsModel({ required this.uid, required this.question, required this.choices, required this.difficulty, 
  required this.topicsuid});

  // Convert object to a map
  Map<String, dynamic> toJson() {
    return {
      'uid':uid,
      'question': question,
      'choices': choices,
      'difficulty':difficulty,
      'topicsuid':topicsuid,
    };
  }

  // Create an object from a map
  factory QuestionsModel.fromJson(Map<String, dynamic>? map) {

    var choicesdata = map?['choices'] as List<dynamic>;
    List<String> choiceslist = choicesdata.map((topicData) {
      return topicData as String;
    }).toList();

    var topicsuiddata = map?['choices'] as List<dynamic>;
    List<String> topicsuidlist = topicsuiddata.map((topicData) {
      return topicData as String;
    }).toList();

    return QuestionsModel(
      uid: map?['uid'],
      question: map?['question'],
      difficulty: map?['difficulty'],
      choices: choiceslist,
      topicsuid: topicsuidlist,
    );
  }
}

