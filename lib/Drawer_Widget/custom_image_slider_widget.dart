// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, must_be_immutable, unused_import

import 'dart:developer';
import 'dart:io';
import 'package:coures_app/Controller/adminhome_controller.dart';
import 'package:coures_app/Drawer_Widget/custom_hader_widget.dart';
import 'package:coures_app/Custom_Widget/custom_widget.dart';
import 'package:coures_app/Drawer_Widget/hader_widget.dart';
import 'package:coures_app/Utils/custom_alert.dart';
import 'package:coures_app/Utils/custom_textfiled.dart';
import 'package:coures_app/Utils/responsive_screen.dart';
import 'package:coures_app/generated/assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../Utils/app_color.dart';
import '../Utils/constant_widget.dart';
import '../Utils/custom_widget.dart';

class CustomImageSliderWidget extends StatefulWidget {
  const CustomImageSliderWidget({super.key});

  @override
  State<CustomImageSliderWidget> createState() =>
      _CustomImageSliderWidgetState();
}

class _CustomImageSliderWidgetState extends State<CustomImageSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        color: AppColor.whiteColor,
        child: Column(
          children: [
            const HaderWidget(),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomHaderWidget(
                      showSerchBar: false,
                      showaddBtn: true,
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (
                            BuildContext context,
                          ) {
                            return imageAlert(
                              operation: "add",
                            );
                          },
                        );
                      },
                      titel: "Image Sliders",
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: adminHomeController.getImageSliderlist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: Responsive.isDesktop(context)
                              ? 4
                              : (Responsive.isTablet(context)
                                  ? 2
                                  : (Responsive.isMobile(context) ? 1 : 3)),
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 25),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: AppColor.lightblueColor,
                              border: Border.all(color: AppColor.blueColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: Responsive.isDesktop(context)
                                    ? 30.h
                                    : (Responsive.isTablet(context)
                                        ? 35.h
                                        : (Responsive.isMobile(context)
                                            ? 40.h
                                            : 32.h)),
                                width: Responsive.isDesktop(context)
                                    ? 37.h
                                    : (Responsive.isTablet(context)
                                        ? 45.h
                                        : (Responsive.isMobile(context)
                                            ? 50.h
                                            : 45.h)),
                                // color: AppColor.fillColor,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(adminHomeController
                                            .getImageSliderlist[index].imagerul
                                            .toString()),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  customButton(
                                      fontWeight: FontWeight.normal,
                                      height: 35,
                                      width: 120,
                                      onPressed: () {
                                        showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (
                                            BuildContext context,
                                          ) {
                                            return imageAlert(
                                              operation: "update",
                                              imageid: adminHomeController
                                                  .getImageSliderlist[index].id,
                                            );
                                          },
                                        );
                                      },
                                      text: "Edit"),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  customButton(
                                      fontWeight: FontWeight.normal,
                                      height: 35,
                                      width: 120,
                                      onPressed: () {
                                        deleteAlert(
                                          context: context,
                                          onPressed: () {
                                            adminHomeController
                                                .removeImageSlider(
                                                    context,
                                                    adminHomeController
                                                        .getImageSliderlist[
                                                            index]
                                                        .id);
                                          },
                                        );
                                      },
                                      text: "Delete"),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
