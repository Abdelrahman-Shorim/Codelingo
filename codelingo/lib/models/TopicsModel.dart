class TopicsModel {
  String uid;
  String name;
  String description;


  TopicsModel({ required this.uid, required this.name, required this.description});

  // Convert object to a map
  Map<String, dynamic> toJson() {
    return {
      'uid':uid,
      'name': name,
      'description': description,
    };
  }

  // Create an object from a map
  factory TopicsModel.fromJson(Map<String, dynamic> map) {
    return TopicsModel(
      uid: map['uid'],
      name: map['name'],
      description: map['description'],
    );
  }
}

