class PowerUpsModel {
  String uid;
  String name;
  String description;
  int price;
// add icon if needed


  PowerUpsModel({ required this.uid, required this.name, required this.description, required this.price});

  // Convert object to a map
  Map<String, dynamic> toJson() {
    return {
      'uid':uid,
      'name': name,
      'description': description,
      'price':price
    };
  }

  // Create an object from a map
  factory PowerUpsModel.fromJson(Map<String, dynamic> map) {
    return PowerUpsModel(
      uid: map['uid'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
    );
  }
}

