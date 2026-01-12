// ignore_for_file: must_be_immutable, use_super_parameters

import 'package:coures_app/Utils/app_color.dart';
import 'package:coures_app/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/* class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final double horizontalPadding;
  const SocialButton({
    Key? key,
    required this.iconPath,
    required this.label,
    this.horizontalPadding = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(
        iconPath,
        width: 25,
        color: Pallete.whiteColor,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Pallete.whiteColor,
          fontSize: 17,
        ),
      ),
      style: TextButton.styleFrom(
        padding:
            EdgeInsets.symmetric(vertical: 30, horizontal: horizontalPadding),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Pallete.borderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
 */

class CustomButton extends StatelessWidget {
  void Function()? onPressed;
  String text;
  CustomButton({Key? key, this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    
    
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: AppColor.blueColor,
          shadowColor: Colors.transparent,
        ),
        child: customText(
          text,
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: Pallete.whiteColor
        ),
      ),
    );
  }
}


class GradientButton extends StatelessWidget {
  void Function()? onPressed;
  String text;
  GradientButton({Key? key, this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Pallete.gradient1,
            Pallete.gradient2,
            Pallete.gradient3,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: CustomWidgets.text(
          text,
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: Pallete.whiteColor
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  void Function()? onPressed;
  // Icon? icon;
  String? icon;
  double? height;
  double? width;
  CustomIconButton(
      {super.key, this.onPressed, this.icon, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Pallete.gradient1,
            Pallete.gradient2,
            Pallete.gradient3,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            // fixedSize:  const Size(55, 55) ?? Size(width!, height!),
            fixedSize: Size(width!, height!),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          // child: icon),
          child: Image.asset(
            icon!,
            color: Pallete.whiteColor,
         height: 15,
            fit: BoxFit.fill,
            
          )),
      // child: Padding(
      //   padding: const EdgeInsets.all(15),
      //   child: Image.asset(icon!,scale: 30,color:  Pallete.whiteColor,),
      // ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  void Function(String)? onFieldSubmitted;
  void Function(String)? onChanged;
  void Function()? onTap;
  void Function()? onTapclose;

  SearchBarWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.onTap,
    this.onTapclose,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      maxLines: 1,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        hintStyle: GoogleFonts.bitter(),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 15.0),
          child: GestureDetector(onTap: onTapclose, child: const Icon(Icons.close)),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsetsDirectional.only(start: 15.0, end: 10),
          child: Icon(
            Icons.search,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Pallete.borderColor1,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Pallete.gradient2.withOpacity(0.8),
            width: 4,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Pallete.borderColor1,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hintText,
      ),
    );
  }
}

class CustomWidgets {
  static Text text(
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
      style: GoogleFonts.aboreto(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        letterSpacing: letterSpacing,
      ),
    );
  }

  static Text text1(
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
      style: GoogleFonts.bitter(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

