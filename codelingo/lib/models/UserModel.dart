class UserModel {
  String uid;
  String name;
  String usertypeuid;
  

  UserModel({required this.uid, required this.name, required this.usertypeuid});

  // Convert Person object to a map
  Map<String, dynamic> toJson() {
    return {
      'uid' : uid,
      'name' : name,
      'usertypeuid': usertypeuid,
    };
  }

  // Create a Person object from a map
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      usertypeuid: map['usertypeuid'],
    );
  }
}