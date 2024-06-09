import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/CoursesModel.dart';
import 'package:codelingo/models/StudentDetailModel.dart';
import 'package:codelingo/services/StudentDetailService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class CoursesService {
  final CollectionReference _CoursessCollection =
      FirebaseFirestore.instance.collection('Courses');
  final StudentDetailService _studentDetailService = StudentDetailService();


  Future<List<StudentDetailModel>> getCourseLeaderboard(var courseuid) async {
    try {
      List<StudentDetailModel> students = await _studentDetailService.getAllStudentDetail();
      
      List<StudentDetailModel> enrolledStudents = students.where((student) {
        if (student.enrolledcourses != null) {
          for (var course in student.enrolledcourses!) {
            if (course.containsKey(courseuid)) {
              return true;
            }
          }
        }
        return false;
      }).toList();


      enrolledStudents.sort((a, b) {
      int scoreA = 0;
      int scoreB = 0;

      // Get the course score for student A
      if (a.enrolledcourses != null) {
        for (var course in a.enrolledcourses!) {
          if (course.containsKey(courseuid)) {
            scoreA = course[courseuid]!;
            break;
          }
        }
      }

      // Get the course score for student B
      if (b.enrolledcourses != null) {
        for (var course in b.enrolledcourses!) {
          if (course.containsKey(courseuid)) {
            scoreB = course[courseuid]!;
            break;
          }
        }
      }

      // Compare the scores in descending order
      return scoreB.compareTo(scoreA);
    });

      return enrolledStudents;
    } catch (e) {
      throw Exception("Failed to get students enrolled in course: $e");
    }
  }



  Future<void> enrollStudentCourse(var courseid) async {
    var currentuserid = FirebaseAuth.instance.currentUser!.uid;
    try {
      var student = await _studentDetailService.getStudentDetailById(
          StudentDetailId: currentuserid);
      bool courseFound = false;

      if (student?.enrolledcourses != null) {
        for (var course in student!.enrolledcourses!) {
          if (course.containsKey(courseid)) {
            // course[courseid] = courseScore;
            courseFound = true;
            break;
          }
        }
      } else {
        student?.enrolledcourses = [];
      }

      if (!courseFound) {
        student?.enrolledcourses!.add({courseid: 0});
        student?.courselevel!.add({courseid:"1/1"});
      }
      await _studentDetailService.updateStudentDetailById(
          StudentDetailId: student!.uid, StudentDetail: student);
    } catch (e) {
      throw Exception("Error enrolling course to student: $e");
    }
  }

  Future<void> updateCourseScore(var courseid, int score) async {
    var currentuserid = FirebaseAuth.instance.currentUser!.uid;
    try {
      var student = await _studentDetailService.getStudentDetailById(
          StudentDetailId: currentuserid);
      bool courseFound = false;

      if (student?.enrolledcourses != null) {
        for (var course in student!.enrolledcourses!) {
          if (course.containsKey(courseid)) {
            course[courseid] = (course[courseid]! + score);
            break;
          }
        }
      }
      await _studentDetailService.updateStudentDetailById(
          StudentDetailId: student!.uid, StudentDetail: student);
    } catch (e) {
      throw Exception("Error enrolling course to student: $e");
    }
  }

  Future<List<CoursesModel>> getDoctorCourses(var instructorid) async {
    try {
      var querySnapshot = await _CoursessCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              CoursesModel.fromJson(doc.data() as Map<String, dynamic>))
          .where(
            (element) => element.instructoruid == instructorid,
          )
          .toList();
    } catch (e) {
      throw Exception("Failed to get all Coursess: $e");
    }
  }

  Future<List<CoursesModel>> getStudentCourses(
      StudentDetailModel studentdetail) async {
    List<CoursesModel> courses = [];

    if (studentdetail.enrolledcourses != null) {
      for (var courseMap in studentdetail.enrolledcourses!) {
        for (var courseId in courseMap.keys) {
          try {
            CoursesModel? course = await getCourseById(CourseId: courseId);
            if (course != null) {
              courses.add(course);
            }
          } catch (e) {
            print('Failed to fetch course with ID $courseId: $e');
          }
        }
      }
    }
    return courses;
  }

  Future<String> addCourse({required CoursesModel Course}) async {
    try {
      var uuid = const Uuid().v4();
      Course.uid = uuid;
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        Course.instructoruid = currentUser.uid;
        await _CoursessCollection.doc(uuid).set(Course.toJson());
        return uuid;
      } else {
        throw Exception("error getting current user");
      }
    } catch (e) {
      throw Exception("Failed to add Courses: $e");
    }
  }

  Future<void> updateCourseById(
      {required String CourseId, required CoursesModel Course}) async {
    try {
      await _CoursessCollection.doc(CourseId).update(Course.toJson());
    } catch (e) {
      throw Exception("Failed to update Courses: $e");
    }
  }

  Future<List<CoursesModel>> getAllCourses() async {
    try {
      var querySnapshot = await _CoursessCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              CoursesModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to get all Coursess: $e");
    }
  }

  Future<CoursesModel?> getCourseById({required String CourseId}) async {
    try {
      var CoursesDoc = await _CoursessCollection.doc(CourseId).get();
      if (CoursesDoc.exists) {
        return CoursesModel.fromJson(CoursesDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Failed to get Courses: $e");
    }
  }

  Future<void> deleteCourseById({required String CourseId}) async {
    try {
      await _CoursessCollection.doc(CourseId).delete();
    } catch (e) {
      throw Exception("Failed to delete Courses: $e");
    }
  }
}
