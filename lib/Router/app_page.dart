// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:coures_app/Router/routes.dart';
import 'package:coures_app/Screen/Authetication/login_screen.dart';
import 'package:coures_app/Screen/Home/admin_home_screen.dart';
import 'package:get/get.dart';

Transition transition =
    Platform.isAndroid ? Transition.noTransition : Transition.cupertino;

class AppPages {
  static const ADMIN_HOME_ROUTE = Routes.ADMIN_HOME_SCREEN;
  static const LOGIN_ROUTE = Routes.LOGIN_SCREEN;
  static final routes = [
    ///
    /// Authetication
    ///

    GetPage(
      name: Routes.ADMIN_HOME_SCREEN,
      page: () => const AdminHomePage(),
      transition: transition,
    ),
    GetPage(
      name: Routes.LOGIN_SCREEN,
      page: () => const LoginScreen(),
      transition: transition,
    ),
   
  ];
}
