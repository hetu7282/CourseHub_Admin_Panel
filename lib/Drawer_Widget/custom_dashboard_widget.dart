import 'package:coures_app/Drawer_Widget/custom_hader_widget.dart';
import 'package:coures_app/Drawer_Widget/hader_widget.dart';
import 'package:coures_app/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../Controller/adminhome_controller.dart';
import '../Utils/app_color.dart';

class CustomDashboardWidget extends StatefulWidget {
  const CustomDashboardWidget({super.key});

  @override
  State<CustomDashboardWidget> createState() => _CustomDashboardWidgetState();
}

class _CustomDashboardWidgetState extends State<CustomDashboardWidget> {
  AdminHomeController adminHomeController = Get.put(AdminHomeController());

  @override
  void initState() {
    super.initState();
    // UserData();
    // ProductData();
    // CategoriesData();
  }

  // UserData() async {
  //   var res = await adminHomeController.Selectuser();
  //   setState(() {});
  //   print('userlist :::::: ${adminHomeController.userList}');
  //   return res;
  // }

  // ProductData() async {
  //   var res = await adminHomeController.Selectproduct();
  //   setState(() {});
  //   print('productlist :::::: ${adminHomeController.productList}');
  //   return res;
  // }

  // CategoriesData() async {
  //   var res = await adminHomeController.Selectcategories();
  //   setState(() {});
  //   print('categorieslist :::::: ${adminHomeController.categorieList}');
  //   return res;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColor.whiteColor,
      // padding: EdgeInsets.all(10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HaderWidget(),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomHaderWidget(showSerchBar: false, titel: "Dashboard",showaddBtn: false,),
                   
                    SizedBox(
                      height: 3.h,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 200,
                          width: 600,
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: AppColor.lightblueColor,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: AppColor.blueColor, width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              customText("Users",
                                  color: AppColor.blueColor, fontSize: 25),
                              const Divider(
                                thickness: 0.5,
                                color: AppColor.dividerColor,
                              ),
                              customText(
                                  "${adminHomeController.getStudentlist.isNotEmpty ? adminHomeController.getStudentlist.length.toString() : 0}",
                                  fontSize: 20),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          height: 200,
                          width: 600,
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: AppColor.lightblueColor,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: AppColor.blueColor, width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              customText("Coach",
                                  color: AppColor.blueColor, fontSize: 25),
                              const Divider(
                                thickness: 0.5,
                                color: AppColor.dividerColor,
                              ),
                              customText(
                                  "${adminHomeController.getCoachlist.isNotEmpty ? adminHomeController.getCoachlist.length.toString() : 0}",
                                  fontSize: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
//   late List<_ChartData> data;
//   late TooltipBehavior _tooltip;
// }

// class _ChartData {
//   _ChartData(this.x, this.y);

//   final String x;
//   final double y;
// }
