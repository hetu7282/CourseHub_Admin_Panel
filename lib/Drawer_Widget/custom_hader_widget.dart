// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:coures_app/Controller/adminhome_controller.dart';
import 'package:coures_app/Utils/app_color.dart';
import 'package:coures_app/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomHaderWidget extends StatefulWidget {
  String? titel;
  void Function(String)? onChanged;
  TextEditingController? controller;
  bool showSerchBar = true;
  bool showaddBtn = true;
  void Function()? onPressed;
  CustomHaderWidget(
      {super.key,
      this.titel,
      this.onChanged,
      required this.showaddBtn,this.onPressed,
      this.controller,
      required this.showSerchBar});

  @override
  State<CustomHaderWidget> createState() => _CustomHaderWidgetState();
}

class _CustomHaderWidgetState extends State<CustomHaderWidget> {
  AdminHomeController adminHomeController = Get.put(AdminHomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(8),
      child: Container(
        color: AppColor.whiteColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customText(widget.titel!,
                    color: AppColor.blackColor, fontSize: 30),
                const Spacer(),
                widget.showSerchBar == true
                    ? SizedBox(
                        width: 25.w,
                        height: 50,
                        child: TextFormField(
                          controller: widget.controller,
                          onChanged: widget.onChanged,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.search),
                            hintStyle: GoogleFonts.lato(),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColor.dividerColor,
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
                                color: AppColor.dividerColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ))
                    : Container(),
                const SizedBox(
                  width: 10,
                ),
                widget.showaddBtn == true
                    ? SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: widget.onPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.lightblueColor,
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            side: const BorderSide(color: AppColor.blueColor),
                            elevation: 0,
                            shadowColor: AppColor.blueColor.withOpacity(0.9),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: AppColor.blueColor,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            const Divider(
              thickness: 0.5,
              color: Pallete.dividerColor,
              height: 50.0,
            ),
            SizedBox(
              height: 3.h,
            ),
          ],
        ),
      ),
    );
  }
}
