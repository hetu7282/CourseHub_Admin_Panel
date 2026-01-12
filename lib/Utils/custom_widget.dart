import 'package:coures_app/Utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

/* ***************************** Custom Button ****************************** */

SizedBox customButton(
    {void Function()? onPressed,
    String? text,
    var width,
    var height,
    double? fontSize,
    FontWeight? fontWeight}) {
  return SizedBox(
    width: width ?? 100,
    height: height ?? 30,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(395, 55),
        backgroundColor: AppColor.blueColor,
        shadowColor: Colors.transparent,
      ),
      child: customText(text!,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontSize: fontSize ?? 17,
          color: AppColor.whiteColor),
    ),
  );
}

/* ***************************** Custom Text ****************************** */

Text customText(
  String content, {
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  int? maxLine,
  double? letterSpacing = 0.0,
  TextAlign? textAlign,
  double? height = 1.7,
  TextOverflow? overflow,
  TextDecoration? decoration,
  bool? softWrap,
}) {
  return Text(
    content,
    textAlign: textAlign,
    maxLines: maxLine,
    overflow: overflow,
    softWrap: softWrap,
    style: GoogleFonts.lora(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      letterSpacing: letterSpacing,
    ),
  );
}

/* ***************************** Custom DataColumn ****************************** */

DataColumn dataColumn({required String text}) {
  return DataColumn(
      label: customText(
    text,
    color: AppColor.blackColor,
    fontSize: 20,
  ));
}

/* ***************************** Custom Button ****************************** */

SizedBox customOutlineButton({
  void Function()? onPressed,
  String? text,
  var width,
  var height,
  double? fontSize,
}) {
  return SizedBox(
    width: width ?? 100,
    height: height ?? 30,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.lightblueColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: const BorderSide(color: AppColor.blueColor),
        // fixedSize: Size(35.w, 5.h),
        elevation: 0,
        shadowColor: AppColor.blueColor.withOpacity(0.9),
      ),
      child: customText(text!,
          fontWeight: FontWeight.w600,
          fontSize: fontSize ?? 15,
          color: AppColor.blueColor),
    ),
  );
}

RichText richText({
  String? text1,
  String? text2,
  TextOverflow? overflow,
  int? maxLines,
  double? fontSize,
  double? fontSize1,
  Color? color1,
  Color? color2,
  FontWeight? fontWeight1,
  FontWeight? fontWeight2,
}) {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
        style: const TextStyle(
          height: 1.4,
          color: AppColor.blackColor,
        ),
        text: "",
        children: [
          TextSpan(
              text: "$text1",
              style: TextStyle(
                overflow: overflow,
                color: color1 ?? AppColor.blueColor,
                fontSize: fontSize1 ?? 12.sp,
                fontWeight: fontWeight1 ?? FontWeight.w800,
                // fontFamily: fontFamilyphilosopherbold,
              )),
          TextSpan(
              style: TextStyle(
                  fontWeight: fontWeight2 ?? FontWeight.normal,
                  overflow: overflow,
                  // fontFamily: fontFamilyphilosopherbold,
                  color: color2,
                  fontSize: fontSize),
              text: "$text2"),
        ]),
    maxLines: maxLines,
  );
}
