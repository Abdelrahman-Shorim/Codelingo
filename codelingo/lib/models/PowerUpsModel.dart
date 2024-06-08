class PowerUpsModel {
  String uid;
  String name;
  String description;
  int price;
  String iconurl;
// add icon if needed


  PowerUpsModel({ required this.uid, required this.name, required this.description, required this.price,required this.iconurl});

  // Convert object to a map
  Map<String, dynamic> toJson() {
    return {
      'uid':uid,
      'name': name,
      'description': description,
      'price':price,
      'iconurl':iconurl
    };
  }

  // Create an object from a map
  factory PowerUpsModel.fromJson(Map<String, dynamic> map) {
    return PowerUpsModel(
      uid: map['uid'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      iconurl: map['iconurl']
    );
  }
}

