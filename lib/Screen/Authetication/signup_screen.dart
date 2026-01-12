// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:web_demo/web_demo1/Controller/authetication_controller.dart';
// import 'package:web_demo/web_demo1/Custom_Widget/app_color.dart';
// import 'package:web_demo/web_demo1/Custom_Widget/custom_widget.dart';
// import 'package:web_demo/web_demo1/Screen/Auth/login_screen.dart';

// import '../../../generated/assets.dart';
// import '../Admin_Panel/admin_home_screen.dart';

// class SingUpScreen extends StatefulWidget {
//   const SingUpScreen({super.key});

//   @override
//   State<SingUpScreen> createState() => _SingUpScreenState();
// }

// class _SingUpScreenState extends State<SingUpScreen> {

// AuthController authController = Get.put(AuthController());

//   TextEditingController userController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController pwdController = TextEditingController();
//   GlobalKey<FormState> globalKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: globalKey,
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Image.asset(Assets.assetsBooking),
//                 const Text(
//                   'Sign Up.',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 50,
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 const SizedBox(height: 15),
//                 TextFiled(maxLines: 1,
//                   hintText: 'Username',
//                   controller: userController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Email is required";
//                     } else if (value.length <= 4) {
//                       return 'Required min 4 length';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 15),
//                 TextFiled(maxLines: 1,
//                   hintText: 'Email',
//                   controller: emailController,
//                   validator: (value) {
//                     RegExp emailRegExp = RegExp(
//                         r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
//                     if (value!.isEmpty) {
//                       return "Email is required";
//                     } else if (!emailRegExp.hasMatch(value)) {
//                       return 'Invalid Email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 15),
//                 TextFiled(maxLines: 1,
//                   obscureText: true,
//                   hintText: 'Password',
//                   controller: pwdController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Password is required";
//                     } else if (value.length <= 6) {
//                       return 'Required min 6 length';
//                     } else if (value.length >= 12) {
//                       return 'Required max 12 length';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 GradientButton(
//                     text: 'Sign Up',
//                     onPressed: () {
//                       if (globalKey.currentState!.validate()) {

//                         authController.sigUp(username: userController.text, email: emailController.text,pwd: pwdController.text);
//                         Get.offAll(const AdminHomePage());
//                         emailController.clear();
//                         pwdController.clear();
//                         userController.clear();
//                       }
//                     }),
//                 const SizedBox(height: 15),
//                 const Text(
//                   'or',
//                   style: TextStyle(
//                     fontSize: 17,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 // SocialButton(
//                 //     iconPath: googlelogo, label: 'Continue with Google'),
//                 // const SizedBox(height: 20),
//                 // SocialButton(
//                 //   iconPath: fblogo,
//                 //   label: 'Continue with Facebook',
//                 //   horizontalPadding: 90,
//                 // ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Already have an account? ',
//                       style: TextStyle(
//                         fontSize: 17,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Get.offAll(const LoginScreen());
//                       },
//                       child: const Text(
//                         'Login here',
//                         style:
//                             TextStyle(fontSize: 17, color: Pallete.gradient2),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
