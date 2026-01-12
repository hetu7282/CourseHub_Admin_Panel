// ignore_for_file: camel_case_types, unused_field, prefer_typing_uninitialized_variables

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:coures_app/Controller/adminhome_controller.dart';
import 'package:coures_app/Data/Model/get_coach_response_model.dart';
import 'package:coures_app/Data/Model/get_student_response_model.dart';
import 'package:coures_app/Utils/app_color.dart';
import 'package:coures_app/Utils/constant_widget.dart';
import 'package:coures_app/Utils/custom_textfiled.dart';
import 'package:coures_app/Utils/custom_widget.dart';
import 'package:coures_app/Utils/responsive_screen.dart';
import 'package:coures_app/generated/assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

AdminHomeController adminHomeController = Get.put(AdminHomeController());

categoryAlert(
    {required BuildContext context, String? query, var cid, fetchdata}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (
      BuildContext context,
    ) {
      return AlertDialog(
        scrollable: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        actionsPadding: EdgeInsets.zero,
        backgroundColor: AppColor.whiteColor,
        content: SizedBox(
          // width: 40.w,
          width: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    customText(
                        query == "insert"
                            ? "Add Categories"
                            : "Update Categories",
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        // !Responsive.isMobile(context) ? 4.sp : 8.sp,
                        color: AppColor.blueColor),
                    InkWell(
                      child: Icon(Icons.close,
                          color: AppColor.blueColor.withOpacity(0.8)),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Form(
                key: adminHomeController.globalKey,
                child: Container(
                  width: 30.w,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: AppColor.blueColor, width: 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: CustomTextFiled(
                            maxLines: 1,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                adminHomeController.categoriesController
                                    .clear();
                                return "Category is required";
                              }

                               if(value.length >= 50) {
                                return "Please add limated character ";
                              }
                              return null;
                            },
                            hintText: "Category",
                            controller:
                                adminHomeController.categoriesController),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      customButton(
                        height: 50,
                        width: 350,
                        text: query == "insert" ? "Add" : "Update",
                        onPressed: () async {
                          if (adminHomeController.globalKey.currentState!
                              .validate()) {
                            if (query == "insert") {
                              adminHomeController.addCategory(
                                context,
                              );
                              fetchdata;
                            } else {
                              adminHomeController.updateCategory(
                                context,
                                cid,
                              );
                              fetchdata;
                            }
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

coashAlert(
    {required BuildContext context,
    GetCoachData? getcoachData,
    GetStudentData? getstudentData,
    var category}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (
      BuildContext context,
    ) {
      return AlertDialog(
        scrollable: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        actionsPadding: EdgeInsets.zero,
        backgroundColor: AppColor.whiteColor,
        content: SizedBox(
          // width: 40.w,
          width: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    customText(category == "coach" ? "View Coach" : "View User",
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: AppColor.blueColor),
                    InkWell(
                      child: Icon(Icons.close,
                          color: AppColor.blueColor.withOpacity(0.8)),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                width: 30.w,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: AppColor.lightblueColor,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppColor.blueColor, width: 1)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Responsive.isMobile(context)
                            ? Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColor.blueColor),
                                  image: category == "coach"
                                      ? (getcoachData!.image.toString() == ""
                                          ? const DecorationImage(
                                              image: AssetImage(
                                                  Assets.assetsProfile),
                                              fit: BoxFit.fill)
                                          : DecorationImage(
                                              image: NetworkImage(getcoachData
                                                  .image
                                                  .toString()),
                                              fit: BoxFit.fill))
                                      : (getstudentData!.image.toString() == ""
                                          ? const DecorationImage(
                                              image: AssetImage(
                                                  Assets.assetsProfile),
                                              fit: BoxFit.fill)
                                          : DecorationImage(
                                              image: NetworkImage(getstudentData
                                                  .image
                                                  .toString()),
                                              fit: BoxFit.fill)),
                                ))
                            : Container(),
                        Responsive.isMobile(context)
                            ? const SizedBox(
                                height: 25,
                              )
                            : Container(),
                        richText(
                            text1: "Name : ",
                            text2: category == "coach"
                                ? getcoachData!.username.toString()
                                : getstudentData!.username.toString(),
                            fontSize1: 18,
                            fontSize: 15),
                        const SizedBox(
                          height: 15,
                        ),
                        richText(
                            text1: "Email Id : ",
                            text2: category == "coach"
                                ? getcoachData!.email.toString()
                                : getstudentData!.email.toString(),
                            fontSize1: 18,
                            fontSize: 15),
                        const SizedBox(
                          height: 15,
                        ),
                        richText(
                            text1: "Gender : ",
                            text2: category == "coach"
                                ? getcoachData!.gender.toString()
                                : getstudentData!.gender.toString(),
                            fontSize1: 18,
                            fontSize: 15),
                        const SizedBox(
                          height: 15,
                        ),
                        richText(
                            text1: "City : ",
                            text2: category == "coach"
                                ? getcoachData!.city.toString()
                                : getstudentData!.city.toString(),
                            fontSize1: 18,
                            fontSize: 15),
                        const SizedBox(
                          height: 15,
                        ),
                        richText(
                            text1: "Country : ",
                            text2: category == "coach"
                                ? getcoachData!.country.toString()
                                : getstudentData!.city.toString(),
                            fontSize1: 18,
                            fontSize: 15),
                        const SizedBox(
                          height: 15,
                        ),
                        category == "coach"
                            ? richText(
                                text1: "Experience : ",
                                text2: getcoachData!.experience.toString(),
                                fontSize1: 18,
                                fontSize: 15)
                            : Container(),
                        category == "coach"
                            ? const SizedBox(
                                height: 15,
                              )
                            : Container(),
                        richText(
                            text1: "Ph No. : ",
                            text2:
                                "+91 ${category == "coach" ? getcoachData!.mobile.toString() : getstudentData!.mobile.toString()}",
                            fontSize1: 18,
                            fontSize: 15),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    (Responsive.isDesktop(context))
                        ? Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: AppColor.lightfillColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.blueColor),
                              image: category == "coach"
                                  ? (getcoachData!.image.toString() == ""
                                      ? const DecorationImage(
                                          image:
                                              AssetImage(Assets.assetsProfile),
                                          fit: BoxFit.fill)
                                      : DecorationImage(
                                          image: NetworkImage(
                                              getcoachData.image.toString()),
                                          fit: BoxFit.fill))
                                  : (getstudentData!.image.toString() == ""
                                      ? const DecorationImage(
                                          image:
                                              AssetImage(Assets.assetsProfile),
                                          fit: BoxFit.fill)
                                      : DecorationImage(
                                          image: NetworkImage(
                                              getstudentData.image.toString()),
                                          fit: BoxFit.fill)),
                            ))
                        : (Responsive.isTablet(context)
                            ? Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: AppColor.lightblueColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColor.blueColor),
                                  // shape: BoxShape.circle,
                                  image: category == "coach"
                                      ? (getcoachData!.image.toString() == ""
                                          ? const DecorationImage(
                                              image: AssetImage(
                                                  Assets.assetsProfile),
                                              fit: BoxFit.fill)
                                          : DecorationImage(
                                              image: NetworkImage(getcoachData
                                                  .image
                                                  .toString()),
                                              fit: BoxFit.fill))
                                      : (getstudentData!.image.toString() == ""
                                          ? const DecorationImage(
                                              image: AssetImage(
                                                  Assets.assetsProfile),
                                              fit: BoxFit.fill)
                                          : DecorationImage(
                                              image: NetworkImage(getstudentData
                                                  .image
                                                  .toString()),
                                              fit: BoxFit.fill)),
                                ),
                              )
                            : (!Responsive.isMobile(context)
                                ? Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: AppColor.lightblueColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: AppColor.blueColor),
                                      // shape: BoxShape.circle,
                                      image: category == "coach"
                                          ? (getcoachData!.image.toString() ==
                                                  ""
                                              ? const DecorationImage(
                                                  image: AssetImage(
                                                      Assets.assetsProfile),
                                                  fit: BoxFit.fill)
                                              : DecorationImage(
                                                  image: NetworkImage(
                                                      getcoachData.image
                                                          .toString()),
                                                  fit: BoxFit.fill))
                                          : (getstudentData!.image.toString() ==
                                                  ""
                                              ? const DecorationImage(
                                                  image: AssetImage(
                                                      Assets.assetsProfile),
                                                  fit: BoxFit.fill)
                                              : DecorationImage(
                                                  image: NetworkImage(
                                                      getstudentData.image
                                                          .toString()),
                                                  fit: BoxFit.fill)),
                                    ),
                                  )
                                : Container())),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

courseAlert({required BuildContext context, var category,required List<DataRow> rows}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (
      BuildContext context,
    ) {
      return AlertDialog(
        scrollable: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        actionsPadding: EdgeInsets.zero,
        backgroundColor: AppColor.whiteColor,
        content: SizedBox(
          // width: 40.w,
          width: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    customText("View courses",
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: AppColor.blueColor),
                    InkWell(
                      child: Icon(Icons.close,
                          color: AppColor.blueColor.withOpacity(0.8)),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              
              DataTable(
                sortAscending: true,
                // columnSpacing: 15.w,
                dataRowHeight: 60,
                headingRowHeight: 65,
                decoration: BoxDecoration(
                    color: AppColor.lightfillColor,
                    border: Border.all(
                      color: AppColor.blueColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                columns: [
                  dataColumn(text: "No."),
                  dataColumn(text: "Course name"),
                  dataColumn(text: "Price"),
                ],
                rows: rows,
              /*   rows: [
                  DataRow(cells: [
                    DataCell(
                      Container(
                        child: customText(
                          "1",
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        child: customText(
                          "Flutter Widgets",
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        child: customText(
                          "100",
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Container(
                        child: customText(
                          "2",
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        child: customText(
                          "React Componets",
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        child: customText(
                          "200",
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Container(
                        child: customText(
                          "3",
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        child: customText(
                          "Android",
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        child: customText(
                          "300",
                        ),
                      ),
                    ),
                  ]),
                ], */
              ),
            ],
          ),
        ),
      );
    },
  );
}

contactusAlert({
  required BuildContext context,
}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          scrollable: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          actionsPadding: EdgeInsets.zero,
          backgroundColor: AppColor.whiteColor,
          content: SizedBox(
            width: 40.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      customText("Edit Contact Us",
                          fontWeight: FontWeight.w600,
                          fontSize: 4.sp,
                          color: AppColor.blueColor),
                      InkWell(
                        child: Icon(Icons.close,
                            color: AppColor.blueColor.withOpacity(0.8)),
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Form(
                  key: adminHomeController.globalKey,
                  child: Container(
                    // height: 25.h,
                    width: 30.w,
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border:
                            Border.all(color: AppColor.blueColor, width: 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        customText("Email", color: AppColor.blueColor),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 40.w,
                          child: CustomTextFiled(
                              maxLines: 1,
                              validator: (value) {
                                RegExp emailRegExp = RegExp(
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
                                if (value!.isEmpty) {
                                  return "email is required";
                                } else if (!emailRegExp.hasMatch(value)) {
                                  return 'Invalid Email';
                                }
                                return null;
                              },
                              hintText: "Enter email",
                              controller:
                                  adminHomeController.conemailController),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        customText("Address", color: AppColor.blueColor),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 40.w,
                          child: CustomTextFiled(
                              maxLines: 3,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "address is required";
                                }
                                return null;
                              },
                              hintText: "Enter email",
                              controller:
                                  adminHomeController.conaddressController),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        customText("Contact Number 1",
                            color: AppColor.blueColor),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 40.w,
                          child: CustomTextFiled(
                              maxLines: 1,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "number is required";
                                }
                                return null;
                              },
                              hintText: "Enter contact number 1",
                              controller: adminHomeController.salno1Controller),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        customText("contact Number 2",
                            color: AppColor.blueColor),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 40.w,
                          child: CustomTextFiled(
                              maxLines: 1,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "number is required";
                                }
                                return null;
                              },
                              hintText: "Enter contact number 2",
                              controller: adminHomeController.salno2Controller),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        customText("WhatsApp Number",
                            color: AppColor.blueColor),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 40.w,
                          child: CustomTextFiled(
                              maxLines: 1,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "number is required";
                                }
                                return null;
                              },
                              hintText: "Enter whatsapp number",
                              controller:
                                  adminHomeController.whatsappController),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        customText("Telegram Number",
                            color: AppColor.blueColor),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 40.w,
                          child: CustomTextFiled(
                              maxLines: 1,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "number is required";
                                }
                                return null;
                              },
                              hintText: "Enter telegram number",
                              controller:
                                  adminHomeController.telegramController),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        customButton(
                          text: "Save",
                          height: 50,
                          width: 350,
                          onPressed: () {
                            if (adminHomeController.globalKey.currentState!
                                .validate()) {
                              adminHomeController.updateContactUs(context);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

aboutusAlert({
  required BuildContext context,
}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          scrollable: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          actionsPadding: EdgeInsets.zero,
          backgroundColor: AppColor.whiteColor,
          content: SizedBox(
            width: 40.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      customText("Edit About US",
                          fontWeight: FontWeight.w600,
                          fontSize:
                              !Responsive.isMobile(context) ? 4.sp : 10.sp,
                          color: AppColor.blueColor),
                      InkWell(
                        child: Icon(Icons.close,
                            color: AppColor.blueColor.withOpacity(0.8)),
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Form(
                  key: adminHomeController.globalKey,
                  child: Container(
                    // height: 25.h,
                    width: 30.w,
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border:
                            Border.all(color: AppColor.blueColor, width: 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 40.w,
                          child: CustomTextFiled(
                              maxLines: 10,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Aboutus is required";
                                }
                                return null;
                              },
                              hintText: "About us",
                              controller:
                                  adminHomeController.aboutusController),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        customButton(
                          height: 50,
                          width: 350,
                          text: "Save",
                          onPressed: () {
                            if (adminHomeController.globalKey.currentState!
                                .validate()) {
                              adminHomeController.updateAboutUs(context);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

termsofuseAlert({
  required BuildContext context,
}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          scrollable: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          actionsPadding: EdgeInsets.zero,
          backgroundColor: AppColor.whiteColor,
          content: SizedBox(
            width: 40.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      customText("Edit terms of use",
                          fontWeight: FontWeight.w600,
                          fontSize:
                              !Responsive.isMobile(context) ? 4.sp : 10.sp,
                          color: AppColor.blueColor),
                      InkWell(
                        child: Icon(Icons.close,
                            color: AppColor.blueColor.withOpacity(0.8)),
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Form(
                  key: adminHomeController.globalKey,
                  child: Container(
                    // height: 25.h,
                    width: 30.w,
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border:
                            Border.all(color: AppColor.blueColor, width: 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 40.w,
                          child: CustomTextFiled(
                              maxLines: 10,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "terms is required";
                                }
                                return null;
                              },
                              hintText: "Terms of use",
                              controller: adminHomeController.termsController),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        customButton(
                          height: 50,
                          width: 350,
                          text: "Save",
                          onPressed: () {
                            if (adminHomeController.globalKey.currentState!
                                .validate()) {
                              adminHomeController.updateTerms(context);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

class imageAlert extends StatefulWidget {
  String operation;
  var imageid;
  // String? image1;
  // dynamic productdata;
  imageAlert({
    super.key,
    required this.operation,
    this.imageid,
    // this.image1,
    // this.productdata
  });

  @override
  State<imageAlert> createState() => _imageAlertState();
}

class _imageAlertState extends State<imageAlert> {
  AdminHomeController adminHomeController = Get.put(AdminHomeController());
  String selectedValue = "";
  File? _pickedImage;
  var imagename;
  Uint8List webImage = Uint8List(8);
  String downloadUrl = "";
  // XFile? image;
  var Selected;
  Rx<String> sliderImageName = "".obs;

  Future<void> _pickImage() async {
    setState(() {});
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      sliderImageName.value = image.name;
      // var Selected = image;
      setState(() {
        webImage = f;
        _pickedImage = File('a');
      });
      log('image path ::::::::::::::::: ${sliderImageName.value}');
    } else {
      log("No Image has been picked...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        actionsPadding: EdgeInsets.zero,
        backgroundColor: AppColor.whiteColor,
        content: StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              width: 40.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        customText("Add Image",
                            fontWeight: FontWeight.w600,
                            fontSize:
                                !Responsive.isMobile(context) ? 4.sp : 10.sp,
                            color: AppColor.blueColor),
                        InkWell(
                          child: Icon(Icons.close,
                              color: AppColor.blueColor.withOpacity(0.8)),
                          onTap: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Form(
                    key: adminHomeController.globalKey,
                    child: Container(
                      // height: 25.h,
                      width: 30.w,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: AppColor.blueColor, width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _pickImage();
                                });
                              },
                              child: Container(
                                width: 40.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.blueColor),
                                  color: AppColor.lightfillColor,
                                  borderRadius: BorderRadius.circular(4.sp),
                                ),
                                child: sliderImageName.value != ""
                                    ? Container(
                                        width: 40.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                          color: AppColor.blueColor,
                                          borderRadius:
                                              BorderRadius.circular(4.sp),
                                          image: DecorationImage(
                                            image: MemoryImage(webImage),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    : const Icon(
                                        Icons.add,
                                        color: AppColor.blueColor,
                                        size: 35,
                                      ),
                              )),
                          SizedBox(
                            height: 3.h,
                          ),
                          customButton(
                            text: "Save",
                            height: 50,
                            width: 350,
                            onPressed: () async {
                              if (widget.operation == "add") {
                                adminHomeController.uploadAddImage(
                                  context,
                                  webImage,
                                  sliderImageName.value,
                                );
                              } else {
                                adminHomeController.uploadUpdateImage(
                                    context, webImage, sliderImageName.value,
                                    id: widget.imageid);
                              }

                              /*     if (adminHomeController.globalKey.currentState!
                                  .validate()) {
                                if (adminHomeController.select.value == true) {
                                  // add

                                  if (webImage != null) {
                                    uploadImage(webImage);
                                    Timer(
                                      Duration(seconds: 7),
                                      () {
                                        if (downloadUrl != '') {
                                          adminHomeController.AddProduct(
                                            pname: adminHomeController
                                                .pnameController.text,
                                            categorie: selectedValue,
                                            description: adminHomeController
                                                .pdescriptionController.text,
                                            image: downloadUrl == ''
                                                ? ""
                                                : downloadUrl,
                                            price: adminHomeController
                                                .priceController.text,
                                            quantity: adminHomeController
                                                .puantityController.text,
                                          );
                                          log("Add Product.........");
                                          widget.productdata;
                                          log("Add Product____________");

                                          
                                        } else {
                                          errorSnackBar(
                                              message:
                                                  "Don not add Product. Please try again");
                                          adminHomeController.pnameController
                                              .clear();
                                          adminHomeController.priceController
                                              .clear();
                                          adminHomeController.puantityController
                                              .clear();
                                          adminHomeController
                                              .pdescriptionController
                                              .clear();
                                        }
                                        Get.back();
                                      },
                                    );

                                    // ProductData();
                                  }
                                } else {
                                  // update
                                  if (_pickedImage == null) {
                                    showProgressIndicator();
                                    downloadUrl = widget.image1!;
                                    Timer(
                                      Duration(seconds: 10),
                                      () {
                                        // adminHomeController.Updateproduct(
                                        //   {
                                        //     "p_name": adminHomeController
                                        //         .pnameController.text,
                                        //     "categorie": selectedValue == ""
                                        //         ? widget.selectedValue1
                                        //         : selectedValue,
                                        //     "price": adminHomeController
                                        //         .priceController.text,
                                        //     "quantity": adminHomeController
                                        //         .puantityController.text,
                                        //     "description": adminHomeController
                                        //         .pdescriptionController.text,
                                        //     "image": downloadUrl,
                                        //   },
                                        //   widget.pid.toString(),
                                        // );
                                      },
                                    );
                                    widget.productdata;
                                    dismissProgressIndicator();
                                   
                                  } else {
                                    uploadImage(webImage);
                                    Timer(
                                      Duration(seconds: 7),
                                      () {
                                        // if (downloadUrl != '') {
                                        //   adminHomeController.Updateproduct({
                                        //     "p_name": adminHomeController
                                        //         .pnameController.text,
                                        //     "categorie": selectedValue == ""
                                        //         ? widget.selectedValue1
                                        //         : selectedValue,
                                        //     "price": adminHomeController
                                        //         .priceController.text,
                                        //     "quantity": adminHomeController
                                        //         .puantityController.text,
                                        //     "description": adminHomeController
                                        //         .pdescriptionController.text,
                                        //     "image": downloadUrl,
                                        //   }, widget.pid.toString());
                                        //   widget.productdata;
                                        // } else {
                                        //   errorSnackBar(
                                        //       message:
                                        //           "Don not Update Product. Please try again");
                                        // }
                                       
                                      },
                                    );
                                  }

                                  selectedValue = "";
                                  // ProductData();
                                }
                              } */
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

deleteAlert({
  required BuildContext context,
  required void Function() onPressed,
}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          scrollable: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          actionsPadding: EdgeInsets.zero,
          backgroundColor: AppColor.whiteColor,
          content: SizedBox(
            width: 40.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  // height: 25.h,
                  width: 30.w,
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.sp),
                      border: Border.all(color: AppColor.blueColor, width: 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        Assets.assetsInformation,
                        scale: 4,
                        color: AppColor.blueColor,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      customText(
                        "Are you sure you want to delete?",
                        textAlign: TextAlign.center,
                        softWrap: true,
                        fontSize: 20,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customOutlineButton(
                            onPressed: onPressed,
                            text: "Yes, delete it!",
                            fontSize: Responsive.isMobile(context) ? 11 : 15,
                            height: Responsive.isMobile(context) ? 30 : 50,
                            width: Responsive.isMobile(context) ? 100 : 15.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          customButton(
                            fontSize: Responsive.isMobile(context) ? 11 : 15,
                            height: Responsive.isMobile(context) ? 30 : 50,
                            width: Responsive.isMobile(context) ? 100 : 15.w,
                            text: "Cancel",
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
