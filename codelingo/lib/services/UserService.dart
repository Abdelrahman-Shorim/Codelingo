import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelingo/models/CoursesModel.dart';
import 'package:codelingo/models/StudentDetailModel.dart';
import 'package:codelingo/models/UserModel.dart';
import 'package:codelingo/services/CoursesService.dart';
import 'package:codelingo/services/StudentDetailService.dart';
import 'package:codelingo/services/UserTypeService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  final StudentDetailService _studendDetailService = StudentDetailService();
  final UserTypesService _userTypesService = UserTypesService();

  Future<User?> signInWithGoogle({String? isSignin}) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (isSignin != "signin") {
        await adduser(userCredential.user!.uid, userCredential.user!.email);
        await addStudentDetailData(userCredential.user!.uid);
      }

      return userCredential.user;
    } catch (e) {
      print('Error during Google sign-in: $e');
      return null;
    }
  }

  Future<User?> signUpWithGoogle() async {
    return await signInWithGoogle(isSignin: "signin");
  }

  Future<void> signup(String email, String password) async {
    try {
      UserCredential cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (cred.user != null) {
        var userid = cred.user!.uid;
        await adduser(userid, email);
        await addStudentDetailData(userid);

        print('User created successfully!');
        // You can also access user information like uid
        print('User ID: ${cred.user?.uid}');
      } else {
        // User creation failed
        print('User creation failed.');
        // return result;
      }
    } catch (e) {
      throw Exception("failed to create user: $e");
    }
  }

  Future<void> login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // Log in user with email and password.
        final credentials =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        throw Exception("incorrect parameters");
      }
    } catch (e) {
      throw Exception("Failed to login: $e");
    }
  }

  Future<void> adduser(var userid, var email) async {
    try {
      var allusertypes = await _userTypesService.getAllUserTypes();

      var studentType = allusertypes
          .firstWhere((usertype) => usertype.type.toLowerCase() == "student");
      if (studentType != null) {
        // Create a UserModel with the user type ID of the "student"
        UserModel studentdata = UserModel(
          uid: userid,
          name: email,
          usertypeuid: studentType.uid,
          iconurl: '',
        );
        await _usersCollection.add(studentdata.toJson());
      }
    } catch (e) {
      throw Exception("Failed to add StudentDetail: $e");
    }
  }

  Future<void> addAdmin(var userid, var email) async {
    try {
      var allusertypes = await _userTypesService.getAllUserTypes();

      var studentType = allusertypes
          .firstWhere((usertype) => usertype.type.toLowerCase() == "admin");
      if (studentType != null) {
        // Create a UserModel with the user type ID of the "student"
        UserModel studentdata = UserModel(
          uid: userid,
          name: email,
          usertypeuid: studentType.uid,
          iconurl: '',
        );
        await _usersCollection.add(studentdata.toJson());
      }
    } catch (e) {
      throw Exception("Failed to add StudentDetail: $e");
    }
  }

  Future<void> addStudentDetailData(var userid) async {
    StudentDetailModel studentdata = new StudentDetailModel(
        uid: userid,
        useruid: userid,
        enrolledcourses: null,
        preferedLearningTime: "10",
        powerups: null,
        pocket: 0,
        totalsolvedquestions: null,
        learnedTopics: null,
        streakcounter: "0",
        streakdate: null);

    try {
      await _studendDetailService.addStudentDetail(StudentDetail: studentdata);
    } catch (e) {
      throw Exception("Failed to add StudentDetail: $e");
    }
  }

  // // Add a new user with automatically generated ID
  // Future<void> addUser(UserModel user) async {
  //   try {
  //     await _usersCollection.add(user.toJson());
  //   } catch (e) {
  //     throw Exception("Failed to add user: $e");
  //   }
  // }

  // // Update an existing user by document ID
  // Future<void> updateUserById({required String userId,required UserModel user}) async {
  //   try {
  //     await _usersCollection.doc(userId).update(user.toJson());
  //   } catch (e) {
  //     throw Exception("Failed to update user: $e");
  //   }
  // }

  // // Get all users
  // Future<List<UserModel>> getAllUsers() async {
  //   try {
  //     var querySnapshot = await _usersCollection.get();
  //     return querySnapshot.docs
  //         .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
  //         .toList();
  //   } catch (e) {
  //     throw Exception("Failed to get all users: $e");
  //   }
  // }

  // // Get a user by document ID
  // Future<UserModel?> getUserById(String userId) async {
  //   try {
  //     var userDoc = await _usersCollection.doc(userId).get();
  //     if (userDoc.exists) {
  //       return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     throw Exception("Failed to get user: $e");
  //   }
  // }

  // // Delete a user by document ID
  // Future<void> deleteUserById(String userId) async {
  //   try {
  //     await _usersCollection.doc(userId).delete();
  //   } catch (e) {
  //     throw Exception("Failed to delete user: $e");
  //   }
  // }
}
