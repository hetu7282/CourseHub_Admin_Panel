// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, non_constant_identifier_names, avoid_unnecessary_containers, unused_local_variable

import 'package:coures_app/Controller/adminhome_controller.dart';
import 'package:coures_app/Custom_Widget/custom_widget.dart';
import 'package:coures_app/Utils/app_color.dart';
import 'package:coures_app/Utils/custom_widget.dart';
import 'package:coures_app/Utils/responsive_screen.dart';
import 'package:coures_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../Controller/sidemenu_controller.dart';

class CustomSideMenubarWidget extends StatefulWidget {
  const CustomSideMenubarWidget({super.key});

  @override
  State<CustomSideMenubarWidget> createState() =>
      _CustomSideMenubarWidgetState();
}

class _CustomSideMenubarWidgetState extends State<CustomSideMenubarWidget> {
  SideMenuController sideMenuController = Get.put(SideMenuController());
  AdminHomeController adminHomeController = Get.put(AdminHomeController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Drawer(
      backgroundColor: AppColor.lightblueColor,
      elevation: 0.0,
      child: Expanded(
          child: Obx(
        () => Container(
          padding: EdgeInsets.zero,
          color: AppColor.lightblueColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Theme(
                data: ThemeData(dividerColor: AppColor.transparent),
                child: DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Center(
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.assetsLogo,
                          color: AppColor.blueColor,scale: 10,
                        ),
                        SizedBox(width: 0.5.w,),
                        customText("Coach Hub",fontSize:30,color: AppColor.blueColor),
                      ],
                    ),
                  ),
                ),
              ),
              DrawerItemListTileWidget(
                selected: sideMenuController.selectedDestination == 0,
                onTap: () {
                  sideMenuController.selectdestination(0);
                  adminHomeController.getCoach(context);
                  adminHomeController.getStudent(context);
                  Get.back();
                },
                title: "Dashboard",
              ),
              DrawerItemListTileWidget(
                selected: sideMenuController.selectedDestination == 1,
                onTap: () {
                  adminHomeController.categoriesController.clear();
                  sideMenuController.selectdestination(1);
                  adminHomeController.getCategory(context);
                  Get.back();
                },
                title: "Category",
              ),
              DrawerItemListTileWidget(
                selected: sideMenuController.selectedDestination == 2,
                onTap: () {
                  adminHomeController.categoriesController.clear();
                  sideMenuController.selectdestination(2);
                  adminHomeController.getCoach(context);
                  Get.back();
                },
                title: "Coach",
              ),
              DrawerItemListTileWidget(
                selected: sideMenuController.selectedDestination == 3,
                onTap: () {
                  adminHomeController.categoriesController.clear();
                  sideMenuController.selectdestination(3);
                  adminHomeController.getStudent(context);
                  Get.back();
                },
                title: "Users",
              ),
              DrawerItemListTileWidget(
                selected: sideMenuController.selectedDestination == 4,
                onTap: () {
                  sideMenuController.selectdestination(4);
                  adminHomeController.getImageSlider(context);
                  Get.back();
                },
                title: "Image Sliders",
              ),
              DrawerItemListTileWidget(
                selected: sideMenuController.selectedDestination == 5,
                onTap: () {
                  sideMenuController.selectdestination(5);
                  adminHomeController.getContactUs(context);
                  Get.back();
                },
                title: "Contact Us",
              ),
              DrawerItemListTileWidget(
                selected: sideMenuController.selectedDestination == 6,
                onTap: () {
                  sideMenuController.selectdestination(6);

                  adminHomeController.getAboutUs(context);
                  Get.back();
                },
                title: "About US",
              ),
              DrawerItemListTileWidget(
                selected: sideMenuController.selectedDestination == 7,
                onTap: () {
                  sideMenuController.selectdestination(7);
                  adminHomeController.getTerms(context);
                  Get.back();
                },
                title: "Terms & Condition",
              ),
            ],
          ),
        ),
      )),
    );
  }

  LogoutAlert({
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
            backgroundColor: Pallete.alertColor,
            content: SizedBox(
              width: 40.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomWidgets.text1(
                    "Are You sure, do you want to logout?",
                    fontSize: !Responsive.isMobile(context) &&
                            !Responsive.isTablet(context)
                        ? 3.sp
                        : 9.sp,
                    color: Pallete.whiteColor.withOpacity(0.8),
                  ),
                ],
              ),
            ),
            titlePadding: EdgeInsets.only(top: 5.h, bottom: 3.h, left: 2.w),
            contentPadding: EdgeInsets.only(top: 2.h, bottom: 5.h, left: 2.w),
            buttonPadding: EdgeInsets.only(top: 2.h, bottom: 5.h, left: 2.w),
            title: CustomWidgets.text(
              "Log Out",
              fontWeight: FontWeight.w600,
              fontSize:
                  !Responsive.isMobile(context) && !Responsive.isTablet(context)
                      ? 4.sp
                      : 10.sp,
              color: Pallete.gradient2,
            ),
            actions: [
              SizedBox(
                  width: 15.w,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Pallete.gradient2,
                      side: const BorderSide(
                        color: Pallete.gradient2,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 17,
                      ),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                    ),
                    child: CustomWidgets.text1("No"),
                  )),
              SizedBox(
                  width: 15.w,
                  child: GradientButton(
                      text: "Yes",
                      onPressed: () {
                        // sideMenuController.selectdestination(7);
                        // FirebaseServices().logOut();

                        // sideMenuController.selectedDestination.value = 0;
                      })),
            ],
          );
        });
  }
}

class DrawerItemListTileWidget extends StatelessWidget {
  String title;
  VoidCallback onTap;
  bool selected;
  DrawerItemListTileWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      selectedColor: AppColor.whiteColor,
      // autofocus: true,

      selectedTileColor: AppColor.blueColor,
      title: Container(
        height: 50,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            color: selected ? AppColor.blueColor : AppColor.transparent,
            borderRadius: BorderRadius.circular(10)),
        child: customText(title),
      ),

      onTap: onTap,
    );
  }
}
