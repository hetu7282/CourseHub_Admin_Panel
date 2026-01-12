// ignore_for_file: non_constant_identifier_names

import 'package:coures_app/Custom_Widget/custom_widget.dart';
import 'package:coures_app/Drawer_Widget/hader_widget.dart';
import 'package:coures_app/Utils/app_color.dart';
import 'package:coures_app/Utils/custom_alert.dart';
import 'package:coures_app/Utils/custom_textfiled.dart';
import 'package:coures_app/Utils/custom_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../Controller/adminhome_controller.dart';
import '../Utils/responsive_screen.dart';
import '../Drawer_Widget/custom_hader_widget.dart';
import '../Utils/string_constant.dart';

class CustomTermsOfUseWidget extends StatefulWidget {
  const CustomTermsOfUseWidget({super.key});

  @override
  State<CustomTermsOfUseWidget> createState() => _CustomTermsOfUseWidgetState();
}

class _CustomTermsOfUseWidgetState extends State<CustomTermsOfUseWidget> {
  AdminHomeController adminHomeController = Get.put(AdminHomeController());
  @override
  void initState() {
    super.initState();
    // AboutUsdata();
  }

  // AboutUsdata() async {
  //   // var res = await adminHomeController.Selectabout();
  //   setState(() {});
  //   print('aboutus :::::: ${adminHomeController.aboutusList}');
  //   return res;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColor.whiteColor,
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HaderWidget(),
          Padding(
            padding: EdgeInsets.only(top: 5.sp,left: 10.sp,right: 10.sp),
            child: CustomHaderWidget(
                      showSerchBar: false, showaddBtn: true,onPressed: (){termsofuseAlert(context: context);},
                      titel: "Terms of Use",
                      // onChanged: () {
                      //    adminHomeController.aboutusController.text = adminHomeController.aboutusList[0].text;
                      //   AboutusAlert(context: context);
                      // },
                    ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 5.sp,left: 10.sp,right: 10.sp),
              child: customText(
                  adminHomeController.getTermsDetails.value.data!.terms != null
                      ? adminHomeController.getTermsDetails.value.data!.terms.toString()
                      : terms,
                  color: AppColor.blackColor),
            ),
          ),
        ],
      ),
    );
  }

}