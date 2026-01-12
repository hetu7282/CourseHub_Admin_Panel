// ignore_for_file: must_be_immutable

import 'package:coures_app/Utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFiled extends StatelessWidget {
  final String hintText;
  String? Function(String?)? validator;
  final TextEditingController controller;
  bool obscureText;
  int? maxLines;
  CustomTextFiled(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.maxLines,
      this.obscureText = false,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        maxLines: maxLines,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: AppColor.fillColor,
          filled: true,
          hintStyle: GoogleFonts.lato(),
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.blueColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.blueColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.redColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
