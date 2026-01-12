// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:coures_app/Data/API/api_manager.dart';
import 'package:coures_app/Data/Model/admin_login_response_model.dart';
import 'package:coures_app/Data/Repository/authentication_repository.dart';
import 'package:coures_app/Router/routes.dart';
import 'package:coures_app/Screen/Home/admin_home_screen.dart';
import 'package:coures_app/Utils/constant_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Utils/string_constant.dart';

class AuthController extends GetxController {
  final authenticationRepository = AuthenticationRepository(APIManager());

  TextEditingController emailController =
      TextEditingController(text: "admin@gmail.com");
  TextEditingController pwdController =
      TextEditingController(text: "123456789");
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  Rx<AdminLoginResponseModel> loginDetails = AdminLoginResponseModel().obs;

  signIn(BuildContext context, {var type}) async {
    loginDetails.value = await authenticationRepository.loginApiCall(
      email: emailController.text,
      password: pwdController.text,
    );

    if (loginDetails.value.success == true) {
      GetStorage().write(userData, loginDetails.toJson());

      // Get.toNamed(
      //   Routes.ADMIN_HOME_SCREEN,
      // );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const AdminHomePage()),
          (Route<dynamic> route) => false);

      successSnackBar(message: loginDetails.value.message, context: context);
    } else {
      errorSnackBar(message: loginDetails.value.message, context: context);
    }
  }

  // login() {
  //   FirebaseServices().logIn(emailController.text, pwdController.text);
  //   emailController.clear();
  //   pwdController.clear();

  //   update();
  // }

  //  sigUp({required String username,required String email,required String pwd}) {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   FirebaseServices().sigUp(email, pwd,{
  //     "username" : username,
  //     "email" : email,
  //     "uid" : "",
  //   });
  //   emailController.clear();
  //   pwdController.clear();

  //   update();
  // }
}
