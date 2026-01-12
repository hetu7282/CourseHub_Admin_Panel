// // ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers, unnecessary_brace_in_string_interps, avoid_print

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:web_demo/web_demo1/Screen/welcome_screen.dart';

// import '../Custom_Widget/custom_widget.dart';

// class FirebaseServices {
//   // static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   sigUp(String email, String password, Map<String, dynamic> map) async {
//     try {
//       var _firebaseAuth = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       var firebaseUser = _firebaseAuth.user;

//       FirebaseFirestore.instance
//           .collection('Admin')
//           .doc(_firebaseAuth.user!.uid)
//           .set(map);

//       FirebaseFirestore.instance
//           .collection('Admin')
//           .doc(_firebaseAuth.user!.uid)
//           .update(map);
//       print("Map ${map}");
//       return firebaseUser;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//         errorSnackBar(title: "Error", message: "No user found for that email");
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided.');
//         errorSnackBar(title: "Error", message: "Wrong password provided");
//       }
//     }
//   }

//   /* *************************************************************************************************** */

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   String? uid;
//   String? userEmail;

//   logIn(String email, String password) async {
//     try {
//       final data = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       Get.offAll(const MainPage());

//       return data;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//         errorSnackBar(title: "Error", message: "No user found for that email");
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided.');
//         errorSnackBar(title: "Error", message: "Wrong password provided");
//       }
//     }
//   }

// /* *************************************************************************************************** */

//   logOut() async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       successSnackBar(message: "User signed out");
//       Get.offAll(const MainPage());
//       // Get.offAll(LoginScreen());
//     } catch (e) {
//       errorSnackBar(title: "Error", message: "User not signed out");
//       return e.toString();
//     }
//   }

// /* *************************************************************************************************** */
// }
