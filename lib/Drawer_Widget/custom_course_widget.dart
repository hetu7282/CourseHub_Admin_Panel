// ignore_for_file: invalid_use_of_protected_member, non_constant_identifier_names, deprecated_member_use, unnecessary_brace_in_string_interps, avoid_function_literals_in_foreach_calls, no_leading_underscores_for_local_identifiers, avoid_print
import 'package:coures_app/Data/Model/get_category_response_model.dart';
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
import '../Controller/adminhome_controller.dart';
import '../Utils/responsive_screen.dart';

class CustomCourseWidget extends StatefulWidget {
  const CustomCourseWidget({super.key});

  @override
  State<CustomCourseWidget> createState() => _CustomCourseWidgetState();
}

class _CustomCourseWidgetState extends State<CustomCourseWidget> {
  AdminHomeController adminHomeController = Get.put(AdminHomeController());

  @override
  void initState() {
    super.initState();
    _filteredData.addAll(adminHomeController.getCategorylist);
    switchValues.clear();
    switchValues.value = List.generate(
        adminHomeController.getCategorylist.length,
        (index) => ValueNotifier<bool>(
            adminHomeController.getCategorylist[index].enable!));
  }

  bool selectcategori = true;

  RxList<ValueNotifier<bool>> switchValues = <ValueNotifier<bool>>[].obs;
  final RxList<GetCategoryData> _filteredData = <GetCategoryData>[].obs;

  void _filterSearchResults({required String query}) {
    List<GetCategoryData> dummySearchList = [];
    dummySearchList.addAll(adminHomeController.getCategorylist);
    if (query.isNotEmpty) {
      List<GetCategoryData> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.category
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
        _filteredData.addAll(adminHomeController.getCategorylist);
      });
    }
  }

  fetchdata() {
    return _filterSearchResults(query: "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColor.whiteColor,
      // padding: EdgeInsets.all(10.sp),
      child: Column(
        children: [
          const HaderWidget(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomHaderWidget(
                    showaddBtn: true,
                    titel: "Category",
                    showSerchBar: true,
                    onChanged: (value) {
                      _filterSearchResults(query: value);
                    },
                    controller: adminHomeController.searchController,
                    onPressed: () {
                      adminHomeController.categoriesController.clear();
                      categoryAlert(
                          context: context,
                          query: "insert",
                          fetchdata: fetchdata());
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Pallete.borderColor1.withOpacity(0),
                          width: 4,
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
                              selectcategori
                                  ? Theme(
                                      data: ThemeData(),
                                      child: Obx(
                                        () => DataTable(
                                          sortAscending: true,
                                          columnSpacing: 25.w,
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
                                            dataColumn(text: "Category"),
                                            dataColumn(text: ""),
                                          ],
                                          rows: _filteredData.asMap().keys.map(
                                            (index) {
                                              var data = _filteredData[index];
                                              var datano = index + 1;
                                              return dataRow(
                                                initialValue: data.enable,
                                                onChanged: (value) {
                                                  print("Value :::: ${value}");
                                                  setState(() {
                                                    adminHomeController
                                                        .updateEnableCategory(
                                                            context,
                                                            data.id,
                                                            value);
                                                  });
                                                },
                                                controller: switchValues[index],

                                                context,
                                                name: data.category.toString(),
                                                no: datano.toString(),
                                                // delete: () {
                                                //   deleteAlert(
                                                //       context: context,
                                                //       onPressed: () {
                                                //         adminHomeController
                                                //             .removeCategory(
                                                //                 context,
                                                //                 data.id);
                                                //       });
                                                // },
                                                update: () {
                                                  adminHomeController
                                                          .categoriesController
                                                          .text =
                                                      data.category.toString();
                                                  categoryAlert(
                                                      context: context,
                                                      cid: data.id,
                                                      query: "update");
                                                },
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ))
                                  : Center(
                                      child: CustomWidgets.text1("not found"))
                            } else ...{
                              categoriListview(_filteredData),
                            }
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  categoriListview(_filteredData) {
    return customListView(_filteredData);
  }

  customListView(_filteredData) {
    print("list ---------> ${_filteredData}");
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
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "No : \t",
                            style: GoogleFonts.lato(
                              color: AppColor.blackColor,
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: datano.toString(),
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
                            text: "Categories : \t",
                            style: GoogleFonts.lato(
                              color: AppColor.blackColor,
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: _filteredData[index].category.toString(),
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
                            text: "Update",
                            onPressed: () {
                              adminHomeController.categoriesController.text =
                                  _filteredData[index].category.toString();
                              categoryAlert(
                                  context: context,
                                  cid: _filteredData[index].id,
                                  query: "update");
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
                              deleteAlert(
                                  context: context,
                                  onPressed: () {
                                    adminHomeController.removeCategory(
                                        context, _filteredData[index].id);
                                  });
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
            ),
          );
  }

  DataRow dataRow(context,
      {name,
      no,
      delete,
      update,
      controller,
      initialValue,
      void Function(dynamic)? onChanged}) {
    return DataRow(
      cells: [
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
        if (!Responsive.isMobile(context))
          DataCell(
            Row(
              children: [
                customOutlineButton(onPressed: update, text: "Update"),
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
      ],
    );
  }
}
