// ignore_for_file: must_be_immutable

import 'package:coures_app/Controller/adminhome_controller.dart';
import 'package:coures_app/Screen/Authetication/login_screen.dart';
import 'package:coures_app/Utils/app_color.dart';
import 'package:coures_app/Utils/custom_widget.dart';
import 'package:coures_app/Utils/responsive_screen.dart';
import 'package:coures_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HaderWidget extends StatefulWidget {
  const HaderWidget({super.key});

  @override
  State<HaderWidget> createState() => _HaderWidgetState();
}

class _HaderWidgetState extends State<HaderWidget> {
  AdminHomeController adminHomeController = Get.put(AdminHomeController());

  @override
  void dispose() {
    // adminHomeController.searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.lightblueColor,
      child: Row(
        mainAxisAlignment: !Responsive.isDesktop(context)
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.end,
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: AppColor.blueColor,
              ),
              onPressed: () {
                adminHomeController.controlMenu();
              },
            ),
          PopupMenuButton(
            tooltip: "",
            padding: EdgeInsets.zero,
            onSelected: (value) async {
              await GetStorage().erase();
               // ignore: use_build_context_synchronously
               Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false);
            },
           
            position: PopupMenuPosition.under,
            itemBuilder: (BuildContext bc) {
              return [
                PopupMenuItem(
                  padding: const EdgeInsets.only(left: 25,right: 100),
                  value: '/LogOut',
                  child: customText("LogOut",color: AppColor.blueColor),
                ),
              ];
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.blueColor)),
              height: 50,
              width: 100,
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    Assets.assetsPerson,
                    color: AppColor.blueColor,
                    scale: 2,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: AppColor.blueColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
