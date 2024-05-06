class UserModel {
  String name;
  int age;

  UserModel({required this.name, required this.age});

  // Convert Person object to a map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  // Create a Person object from a map
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      age: map['age'],
    );
  }
}
