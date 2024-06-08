class CoursesModel {
  String uid;
  String coursename;
  String instructoruid;
  String numberofunits;
  String description;
// add icon if needed

  CoursesModel(
      {required this.uid,
      required this.coursename,
      required this.instructoruid,
      required this.numberofunits,
      required this.description});

  // Convert object to a map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'coursename': coursename,
      'instructoruid': instructoruid,
      'numberofunits': numberofunits,
      'description': description,
    };
  }

  // Create an object from a map
  factory CoursesModel.fromJson(Map<String, dynamic> data) {
    return CoursesModel(
      uid: data['uid'],
      coursename: data['coursename'],
      instructoruid: data['instructoruid'],
      numberofunits: data['numberofunits'],
      description: data['description'],
    );
  }
}
