class CourseUnitsModel {
  String uid;
  String courseuid;
  String unitname;
  String numberoflevels;
  String description;
  int ordernumber;
// add icon if needed

  CourseUnitsModel(
      {required this.uid,
      required this.courseuid,
      required this.unitname,
      required this.numberoflevels,
      required this.description,
      required this.ordernumber,
      });

  // Convert object to a map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'courseuid': courseuid,
      'unitname': unitname,
      'numberoflevels': numberoflevels,
      'description': description,
      'ordernumber': ordernumber,
    };
  }

  // Create an object from a map
  factory CourseUnitsModel.fromJson(Map<String, dynamic> data) {
    return CourseUnitsModel(
      uid: data['uid'],
      courseuid: data['courseuid'],
      unitname: data['unitname'],
      numberoflevels: data['numberoflevels'],
      description: data['description'],
      ordernumber: data['ordernumber'],
    );
  }
}
