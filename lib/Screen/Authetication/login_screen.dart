import 'package:coures_app/Controller/authetication_controller.dart';
import 'package:coures_app/Custom_Widget/custom_widget.dart';
import 'package:coures_app/Utils/app_color.dart';
import 'package:coures_app/Utils/custom_textfiled.dart';
import 'package:coures_app/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../Home/admin_home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: authController.globalKey,
        child: Center(
          child: Container(
            width: 40.w,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.blueColor,width: 1),
                color: AppColor.lightblueColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(Assets.assetsBg),
                customText(
                  'Login',
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: AppColor.blueColor
                ),
               const SizedBox(height: 40),
                CustomTextFiled(
                  maxLines: 1,
                  hintText: 'Email',
                  controller: authController.emailController,
                  validator: (value) {
                    RegExp emailRegExp = RegExp(
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
                    if (value!.isEmpty) {
                      return "Email is required";
                    } else if (!emailRegExp.hasMatch(value)) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextFiled(
                  maxLines: 1,
                  obscureText: true,
                  hintText: 'Password',
                  controller: authController.pwdController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    } else if (value.length <= 6) {
                      return 'Required min 6 length';
                    } else if (value.length >= 15) {
                      return 'Required max 15 length';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                CustomButton(
                    text: 'Login',
                    onPressed: () {
                      if (authController.globalKey.currentState!.validate()) {
                        authController.signIn(context);
                        // const AdminHomePage();
                      }
                    }),
                const SizedBox(height: 15),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
