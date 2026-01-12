import 'package:flutter/material.dart';

class Pallete {
  static const Color backgroundColor = Color.fromRGBO(24, 24, 32, 1);
  static const Color gradient1 = Color.fromRGBO(187, 63, 221, 1);
  static const Color gradient2 = Color.fromRGBO(251, 109, 169, 1);
  static const Color gradient3 = Color.fromRGBO(255, 159, 124, 1);
  static const Color borderColor = Color.fromRGBO(52, 51, 67, 1);
  static const Color borderColor1 = Color.fromRGBO(74, 72, 103, 1);
  static const Color sidemenuColor = Color.fromRGBO(24, 24, 40, 1);
  static const Color dividerColor = Color.fromRGBO(97, 97, 101, 1);
  static const Color bgColor = Color.fromRGBO(40, 40, 58, 1);
  static const Color alertColor = Color.fromRGBO(41, 41, 58, 1);
  static const Color whiteColor = Colors.white;

  static const Color blueColor = Color.fromRGBO(4, 88, 212, 1);
  static const Color lightblueColor = Color.fromRGBO(244, 249, 255, 1);
}

// // set system primary color
// MaterialColor primaryColorSwatch = MaterialColor(
//   Pallete.gradient2.value,
//   const <int, Color>{
//     50: Pallete.gradient2,
//     100: Pallete.gradient2,
//     200: Pallete.gradient2,
//     300: Pallete.gradient2,
//     400: Pallete.gradient2,
//     500: Pallete.gradient2,
//     600: Pallete.gradient2,
//     700: Pallete.gradient2,
//     800: Pallete.gradient2,
//     900: Pallete.gradient2,
//   },
// );
class AppColor {
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color redColor = Color.fromARGB(255, 255, 0, 0);
  static const Color blueColor = Color.fromRGBO(4, 88, 212, 1);
  static const Color fillColor = Color.fromRGBO(229, 238, 250, 1);
  static const Color lightfillColor = Color.fromRGBO(249, 252, 255, 1);
  static const Color lightblueColor = Color.fromRGBO(244, 249, 255, 1);
  static const Color dividerColor = Color.fromRGBO(97, 97, 101, 1);
}

// set system primary color
MaterialColor primaryColorSwatch = MaterialColor(
  AppColor.blueColor.value,
  const <int, Color>{
    50: AppColor.blueColor,
    100: AppColor.blueColor,
    200: AppColor.blueColor,
    300: AppColor.blueColor,
    400: AppColor.blueColor,
    500: AppColor.blueColor,
    600: AppColor.blueColor,
    700: AppColor.blueColor,
    800: AppColor.blueColor,
    900: AppColor.blueColor,
  },
);
