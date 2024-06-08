class UserTypesModel {
  String uid;
  String type;


  UserTypesModel({ required this.uid, required this.type});

  Map<String, dynamic> toJson() {
    return {
      'uid':uid,
      'type': type,
    };
  }

  factory UserTypesModel.fromJson(Map<String, dynamic> map) {
    return UserTypesModel(
      uid: map['uid'],
      type: map['type'],
    );
  }
}

