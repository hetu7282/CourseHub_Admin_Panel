// ignore_for_file: unnecessary_null_comparison, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';

/* class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 576;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 576 &&
      MediaQuery.of(context).size.width <= 992;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 992;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 992) {
      return desktop;
    } else if (size.width >= 576 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
} */


class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive({super.key,required this.mobile,required this.tablet,required this.desktop});


   static bool isMobile(context) => MediaQuery.of(context).size.width < 900;
  static bool isTablet(context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 900;
  static bool isDesktop(context) => MediaQuery.of(context).size.width >= 1700;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    } else {
      // return mobile;
    }

    return Container();
  }
}

