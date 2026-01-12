// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks, avoid_print, non_constant_identifier_names, unused_element, unused_local_variable, no_leading_underscores_for_local_identifiers, unused_field, void_checks, unnecessary_null_comparison, unnecessary_string_interpolations, prefer_typing_uninitialized_variables, prefer_final_fields, avoid_function_literals_in_foreach_calls

import 'package:coures_app/Controller/adminhome_controller.dart';
import 'package:coures_app/Data/Model/get_coach_response_model.dart';
import 'package:coures_app/Drawer_Widget/custom_hader_widget.dart';
import 'package:coures_app/Custom_Widget/custom_widget.dart';
import 'package:coures_app/Drawer_Widget/hader_widget.dart';
import 'package:coures_app/Utils/app_color.dart';

import 'package:coures_app/Utils/custom_alert.dart';

import 'package:coures_app/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sizer/sizer.dart';

import '../Utils/responsive_screen.dart';

class CustomCoachWidget extends StatefulWidget {
  const CustomCoachWidget({super.key});

  @override
  State<CustomCoachWidget> createState() => _CustomCoachWidgetState();
}

class _CustomCoachWidgetState extends State<CustomCoachWidget> {
  AdminHomeController adminHomeController = Get.put(AdminHomeController());
  String selectedValue = "";
  bool selectproduct = true;

  List<GetCoachData> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData.addAll(adminHomeController.getCoachlist);
    switchValues.clear();
    switchValues.value = List.generate(
        adminHomeController.getCoachlist.length,
        (index) => ValueNotifier<bool>(
            adminHomeController.getCoachlist[index].enable!));
  }

  RxList<ValueNotifier<bool>> switchValues = <ValueNotifier<bool>>[].obs;

  void _filterSearchResults(String query) {
    List<GetCoachData> dummySearchList = [];
    dummySearchList.addAll(adminHomeController.getCoachlist);
    if (query.isNotEmpty) {
      List<GetCoachData> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.username
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _filteredData.clear();
        _filteredData.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _filteredData.clear();
        _filteredData.addAll(adminHomeController.getCoachlist);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Pallete.whiteColor,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          const HaderWidget(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomHaderWidget(
                        onChanged: (value) {
                          _filterSearchResults(value);
                        },
                        controller: adminHomeController.categoriesController,
                        showaddBtn: false,
                        showSerchBar: true,
                        titel: "Coach",
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Pallete.borderColor1.withOpacity(0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (!Responsive.isMobile(context)) ...{
                                  selectproduct
                                      ? DataTable(
                                          sortAscending: true,
                                          columnSpacing: 15.w,
                                          dataRowHeight: 60,
                                          headingRowHeight: 65,
                                          decoration: BoxDecoration(
                                              color: AppColor.lightfillColor,
                                              border: Border.all(
                                                color: AppColor.blueColor,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          columns: [
                                            dataColumn(text: "No."),
                                            dataColumn(text: "Name"),
                                            dataColumn(text: "Create At"),
                                            dataColumn(text: ""),
                                          ],
                                          rows: _filteredData.asMap().keys.map(
                                            (index) {
                                              var data = _filteredData[index];
                                              var datano = index + 1;
                                              return dataRow(
                                                    initialValue: data.enable,
                                                onChanged: (value) {
                                                  print("Value :::: $value");
                                                  setState(() {
                                                    adminHomeController
                                                        .updateEnableCoach(
                                                            context,
                                                            data.id,
                                                            value);
                                                  });
                                                },
                                                controller: switchValues[index],
                                                context,
                                                datetime:
                                                    data.createdAt.toString(),
                                                name: data.username.toString(),
                                                no: datano.toString(),
                                                delete: () {adminHomeController.getCourse(context,data.id);
                                                  
                                                },
                                                view: () {
                                                  coashAlert(
                                                    category: "coach",
                                                    getcoachData: data,
                                                    context: context,
                                                  );
                                                },
                                              );
                                            },
                                          ).toList(),
                                          //   rows: [
                                          //     dataRow(
                                          //       context,
                                          //       name: "abc",
                                          //       no: "1",
                                          //       datetime: "3:00 PM",
                                          //       delete: () {
                                          //         deleteAlert(
                                          //           context: context,
                                          //           onPressed: () {
                                          //             successSnackBar(
                                          //                 context: context,
                                          //                 message: "");
                                          //           },
                                          //         );
                                          //       },
                                          //       view: () {
                                          //         coashAlert(
                                          //             context: context, cid: "1");
                                          //       },
                                          //     ),
                                          //     dataRow(
                                          //       context,
                                          //       name: "abc",
                                          //       no: "2",
                                          //       datetime: "3:00 PM",
                                          //       delete: () {
                                          //         deleteAlert(
                                          //           context: context,
                                          //           onPressed: () {
                                          //             successSnackBar(
                                          //                 context: context,
                                          //                 message: "");
                                          //           },
                                          //         );
                                          //       },
                                          //       view: () {
                                          //         coashAlert(
                                          //             context: context, cid: "1");
                                          //       },
                                          //     ),
                                          //   ],
                                        )
                                      : Center(
                                          child:
                                              CustomWidgets.text1("not found")),
                                } else ...{
                                  CoachListview(_filteredData),
                                },
                              ],
                            ),
                          ],
                        ),
                      )
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

  CoachListview(_filteredData) {
    return customListView(_filteredData);
  }

  customListView(_filteredData) {
    print("list ---------> $_filteredData");
    return _filteredData.isEmpty
        ? Center(
            child: CustomWidgets.text1("Not found"),
          )
        : Container(
            decoration: BoxDecoration(
                color: AppColor.lightblueColor,
                border: Border.all(
                  color: AppColor.blueColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: _filteredData.length,
              itemBuilder: (context, index) {
                var datano = index + 1;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "No : \t",
                            style: GoogleFonts.lato(
                              color: AppColor.blackColor,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: "${datano.toString()}",
                            style: GoogleFonts.lato(
                              color: AppColor.blackColor.withOpacity(0.8),
                              fontSize: 15,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Name : \t",
                            style: GoogleFonts.lato(
                              color: AppColor.blackColor,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: "${_filteredData[index].username.toString()}",
                            style: GoogleFonts.lato(
                              color: AppColor.blackColor.withOpacity(0.8),
                              fontSize: 15,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Create At : \t",
                            style: GoogleFonts.lato(
                              color: AppColor.blackColor,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text:
                                "${_filteredData[index].createdAt.toString()}",
                            style: GoogleFonts.lato(
                              color: AppColor.blackColor.withOpacity(0.8),
                              fontSize: 15,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          customOutlineButton(
                            height: 30,
                            width: 100,
                            fontSize: 13,
                            text: "View",
                            onPressed: () {
                              coashAlert(
                                category: "coach",
                                getcoachData: _filteredData[index],
                                context: context,
                              );
                            },
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          customOutlineButton(
                            height: 30,
                            width: 100,
                            fontSize: 13,
                            text: "Delete",
                            onPressed: () {
                              deleteAlert(context: context, onPressed: () {});
                            },
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 2.h,
                  child: const Divider(
                    thickness: 0.5,
                    color: Pallete.dividerColor,
                  ),
                );
              },
            ));
  }

  DataRow dataRow(context, {name, no, delete, view, datetime,  controller,
      initialValue,
      void Function(dynamic)? onChanged}) {
    return DataRow(cells: [
      DataCell(
        Container(
          child: customText(
            no,
          ),
        ),
      ),
      DataCell(
        Container(
          child: customText(
            name,
          ),
        ),
      ),
      DataCell(
        Container(
          child: customText(
            datetime,
          ),
        ),
      ),
      if (!Responsive.isMobile(context))
        DataCell(
          Row(
            children: [
              customOutlineButton(onPressed: view, text: "View"),
              SizedBox(
                width: 1.w,
              ),
              customOutlineButton(onPressed: delete, text: "Course"),
              SizedBox(
                width: 2.w,
              ),

              // customOutlineButton(onPressed: delete, text: "Delete")
               AdvancedSwitch(
                  initialValue: initialValue,
                  onChanged: onChanged,
                  width: 60,
                  height: 30,
                  controller: controller,
                  borderRadius: BorderRadius.circular(29),
                ),
            ],
          ),
        ),
    ]);
  }
}
