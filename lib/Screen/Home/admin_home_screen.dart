// ignore_for_file: unrelated_type_equality_checks

import 'package:coures_app/Controller/adminhome_controller.dart';
import 'package:coures_app/Custom_Widget/custom_side_menubar_widget.dart';
import 'package:coures_app/Custom_Widget/custom_widget.dart';
import 'package:coures_app/Drawer_Widget/custom_aboutus_widget.dart';
import 'package:coures_app/Drawer_Widget/custom_contactus_widget.dart';
import 'package:coures_app/Drawer_Widget/custom_image_slider_widget.dart';
import 'package:coures_app/Drawer_Widget/custom_terms_of_condition_widget.dart';
import 'package:coures_app/Utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/sidemenu_controller.dart';
import '../../Drawer_Widget/custom_coach_widget.dart';
import '../../Drawer_Widget/custom_course_widget.dart';
import '../../Drawer_Widget/custom_dashboard_widget.dart';
import '../../Drawer_Widget/custom_user_widget.dart';
import '../../Utils/responsive_screen.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  SideMenuController sideMenuController = Get.put(SideMenuController());
  AdminHomeController adminHomeController = Get.put(AdminHomeController());

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    adminHomeController.getAllData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      drawer: const CustomSideMenubarWidget(),
      key: adminHomeController.scaffoldKey,
      body: SafeArea(
          child: Row(
        children: [
          if (Responsive.isDesktop(context))
             const Expanded(child: CustomSideMenubarWidget()),
             
          Obx(
            () => Expanded(
              flex: 6,
              child: sideMenuController.selectedDestination == 0
                  ? const CustomDashboardWidget()
                  : sideMenuController.selectedDestination == 1
                 ? const CustomCourseWidget()
                 : sideMenuController.selectedDestination == 2
                     ? const CustomCoachWidget()
                     : sideMenuController.selectedDestination == 3
                         ? const CustomUserWidget()
                         : sideMenuController.selectedDestination == 4
                             ? const CustomImageSliderWidget()
                             : sideMenuController.selectedDestination == 5
                                 ? const CustomContactUsWidget()
                                 : sideMenuController
                                             .selectedDestination ==
                                         6
                                     ? const CustomAboutUsWidget()
                                     : sideMenuController
                                                 .selectedDestination ==
                                             7
                                         ? const CustomTermsOfUseWidget()
                                         : Center(
                                             child: CustomWidgets.text(
                                                 "Null"),
                                                 )
            ),
          )
        ],
      )),
    );
  }
}
