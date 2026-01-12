// ignore_for_file: non_constant_identifier_names

import 'package:coures_app/Drawer_Widget/custom_hader_widget.dart';
import 'package:coures_app/Drawer_Widget/hader_widget.dart';
import 'package:coures_app/Utils/custom_alert.dart';
import 'package:coures_app/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../Controller/adminhome_controller.dart';
import '../Utils/app_color.dart';

class CustomContactUsWidget extends StatefulWidget {
  const CustomContactUsWidget({super.key});

  @override
  State<CustomContactUsWidget> createState() => _CustomContactUsWidgetState();
}

class _CustomContactUsWidgetState extends State<CustomContactUsWidget> {
  AdminHomeController adminHomeController = Get.put(AdminHomeController());

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
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomHaderWidget(
                        showSerchBar: false,
                        showaddBtn: true,
                        onPressed: () {
                          contactusAlert(context: context);
                        },
                        titel: "Contact Us",
                      ),
                      Container(
                        // height: 200,
                        width: 600,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColor.lightblueColor,
                            border: Border.all(
                                color: AppColor.blueColor, width: 1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            customText("Coures Enquiry:",
                                color: AppColor.blueColor, fontSize: 25),
                            const Divider(
                              thickness: 0.5,
                              color: AppColor.dividerColor,
                            ),
                            customText(
                                // "${(adminHomeController.getContactUsDetails.value.data!.contactno1 != "" || adminHomeController.getContactUsDetails.value.data!.contactno1 != null) ? adminHomeController.getContactUsDetails.value.data!.contactno1.toString() : "+91 9925161204"} \n${(adminHomeController.getContactUsDetails.value.data!.contactno2 != "" || adminHomeController.getContactUsDetails.value.data!.contactno2 != null) ? adminHomeController.getContactUsDetails.value.data!.contactno2.toString() : "+91 9925161204"}\n${(adminHomeController.getContactUsDetails.value.data!.address != "" || adminHomeController.getContactUsDetails.value.data!.address != null) ? adminHomeController.getContactUsDetails.value.data!.address.toString() : "Surat"} \n${(adminHomeController.getContactUsDetails.value.data!.email != "" || adminHomeController.getContactUsDetails.value.data!.email != null) ? adminHomeController.getContactUsDetails.value.data!.email.toString() : "couresehub@gmail.com"}",
                                "${(adminHomeController.getContactUsDetails.value.data!.contactno1 != "" || adminHomeController.getContactUsDetails.value.data!.contactno1 != null) ? adminHomeController.getContactUsDetails.value.data!.contactno1.toString() : "+91 9925161204"} \n${(adminHomeController.getContactUsDetails.value.data!.contactno2 != "" || adminHomeController.getContactUsDetails.value.data!.contactno2 != null) ? adminHomeController.getContactUsDetails.value.data!.contactno2.toString() : "+91 9925161204"}",
                                color: AppColor.blackColor.withOpacity(0.8),
                                fontSize: 20),
                            SizedBox(
                              height: 1.h,
                            ),
                            richText(
                                fontWeight2: FontWeight.normal,
                                fontWeight1: FontWeight.normal,
                                color2: AppColor.blackColor.withOpacity(0.8),
                                text1: "Address : ",
                                text2: (adminHomeController.getContactUsDetails
                                                .value.data!.address !=
                                            "" ||
                                        adminHomeController.getContactUsDetails
                                                .value.data!.address !=
                                            null)
                                    ? adminHomeController
                                        .getContactUsDetails.value.data!.address
                                        .toString()
                                    : "Surat",
                                fontSize1: 3.sp,
                                fontSize: 3.sp),
                            SizedBox(
                              height: 1.h,
                            ),
                            richText(
                                fontWeight2: FontWeight.normal,
                                fontWeight1: FontWeight.normal,
                                color2: AppColor.blackColor.withOpacity(0.8),
                                text1: "Email : ",
                                text2: (adminHomeController.getContactUsDetails
                                                .value.data!.email !=
                                            "" ||
                                        adminHomeController.getContactUsDetails
                                                .value.data!.email !=
                                            null)
                                    ? adminHomeController
                                        .getContactUsDetails.value.data!.email
                                        .toString()
                                    : "couresehub@gmail.com",
                                fontSize1: 3.sp,
                                fontSize: 3.sp),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        // height: 20.h,

                        width: 600,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColor.lightblueColor,
                            border: Border.all(
                                color: AppColor.blueColor, width: 1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            customText("Live Chat:",
                                color: AppColor.blueColor, fontSize: 25),
                            const Divider(
                              thickness: 0.5,
                              color: AppColor.dividerColor,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            customText("WhatsApp Number",
                                fontSize: 20, color: AppColor.blueColor),
                            customText(
                              (adminHomeController.getContactUsDetails.value
                                              .data!.whatsappno !=
                                          "" ||
                                      adminHomeController.getContactUsDetails
                                              .value.data!.whatsappno !=
                                          null)
                                  ? adminHomeController.getContactUsDetails
                                      .value.data!.whatsappno
                                      .toString()
                                  : "+91 9925161204",
                              fontSize: 20,
                              color: AppColor.blackColor.withOpacity(0.8),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            customText("Telegram Number",
                                fontSize: 20, color: AppColor.blueColor),
                            customText(
                              (adminHomeController.getContactUsDetails.value
                                              .data!.telegramno !=
                                          "" ||
                                      adminHomeController.getContactUsDetails
                                              .value.data!.telegramno !=
                                          null)
                                  ? adminHomeController.getContactUsDetails
                                      .value.data!.telegramno
                                      .toString()
                                  : "+91 9925161204",
                              fontSize: 20,
                              color: AppColor.blackColor.withOpacity(0.8),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
