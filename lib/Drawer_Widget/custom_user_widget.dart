// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks, avoid_print, non_constant_identifier_names, unused_element, unused_local_variable, no_leading_underscores_for_local_identifiers, unused_field, void_checks, unnecessary_null_comparison, unnecessary_string_interpolations, prefer_typing_uninitialized_variables

import 'dart:io';
import 'dart:typed_data';
import 'package:coures_app/Controller/adminhome_controller.dart';
import 'package:coures_app/Drawer_Widget/custom_hader_widget.dart';
import 'package:coures_app/Custom_Widget/custom_widget.dart';
import 'package:coures_app/Drawer_Widget/hader_widget.dart';
import 'package:coures_app/Utils/app_color.dart';
import 'package:coures_app/Utils/custom_textfiled.dart';
import 'package:coures_app/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../Data/Model/get_student_response_model.dart';
import '../Utils/custom_alert.dart';
import '../Utils/responsive_screen.dart';

class CustomUserWidget extends StatefulWidget {
  const CustomUserWidget({super.key});

  @override
  State<CustomUserWidget> createState() => _CustomUserWidgetState();
}

class _CustomUserWidgetState extends State<CustomUserWidget> {
  AdminHomeController adminHomeController = Get.put(AdminHomeController());
  String selectedValue = "";

  bool selectproduct = true;

  final List<GetStudentData> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData.addAll(adminHomeController.getStudentlist);
    switchValues.clear();
    switchValues.value = List.generate(
        adminHomeController.getStudentlist.length,
        (index) => ValueNotifier<bool>(
            adminHomeController.getStudentlist[index].enable!));
  }

RxList<ValueNotifier<bool>> switchValues = <ValueNotifier<bool>>[].obs;

  void _filterSearchResults(String query) {
    List<GetStudentData> dummySearchList = [];
    dummySearchList.addAll(adminHomeController.getStudentlist);
    if (query.isNotEmpty) {
      List<GetStudentData> dummyListData = [];
      for (var item in dummySearchList) {
        if (item.username
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      setState(() {
        _filteredData.clear();
        _filteredData.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _filteredData.clear();
        _filteredData.addAll(adminHomeController.getStudentlist);
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
                        titel: "Users",
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
                                                        .updateEnableStudent(
                                                            context,
                                                            data.id,
                                                            value);
                                                  });
                                                },
                                                controller: switchValues[index],
                                                
                                                context,
                                                name: data.username.toString(),
                                                no: datano.toString(),
                                                datetime:
                                                    data.createdAt.toString(),
                                                delete: () {},
                                                view: () {
                                                  coashAlert(
                                                      context: context,
                                                      getstudentData: data,
                                                      category: "student");
                                                },
                                              );
                                            },
                                          ).toList(),
                                        )
                                      : Center(
                                          child:
                                              CustomWidgets.text1("not found")),
                                } else ...{
                                  StudentListview(_filteredData),
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

  StudentListview(_filteredData) {
    return customListView(_filteredData);
  }

  customListView(_filteredData) {
    print("list ---------> $_filteredData");
    return Container(
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
                        text: "${_filteredData[index].createdAt.toString()}",
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
                              context: context,
                              getstudentData: _filteredData[index],
                              category: "student");
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
                        onPressed: () {},
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

  DataRow dataRow(context, {name, no, delete, view, datetime, controller,
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

              /*   customOutlineButton(onPressed: delete, text: "Delete"),  */ SizedBox(
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

  ProdectviewAlert({
    required BuildContext context,
    required pid,
  }) {
    for (int i = 0; i <= adminHomeController.productList.length; i++) {
      if (pid == adminHomeController.productList[i].pid) {
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomWidgets.text("View Product",
                                fontWeight: FontWeight.w600,
                                fontSize: !Responsive.isMobile(context)
                                    ? 4.sp
                                    : 10.sp,
                                color: Pallete.gradient2),
                            InkWell(
                              child: Icon(Icons.close,
                                  color: Pallete.whiteColor.withOpacity(0.8)),
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
                          width: 30.w,
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: Pallete.borderColor1, width: 4)),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Table(
                                    border: TableBorder.all(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.shade300,
                                    ),
                                    children: [
                                      TableRow(children: [
                                        TableCell(
                                            child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 2.h,
                                            left: 2.w,
                                            bottom: 2.h,
                                          ),
                                          child: CustomWidgets.text1(
                                            "Name",
                                            textAlign: TextAlign.start,
                                            fontSize:
                                                !Responsive.isMobile(context)
                                                    ? 3.sp
                                                    : 10.sp,
                                          ),
                                        )),
                                        TableCell(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                  top: 2.h,
                                                  right: 0.5.w,
                                                  left: 2.w,
                                                  bottom: 1.h,
                                                ),
                                                child: CustomWidgets.text1(
                                                    "${adminHomeController.productList[i].pname}",
                                                    textAlign: TextAlign.start,
                                                    fontSize:
                                                        !Responsive.isMobile(
                                                                context)
                                                            ? 2.5.sp
                                                            : 8.sp,
                                                    color: Pallete.gradient2))),
                                      ]),
                                      TableRow(children: [
                                        // charges
                                        TableCell(
                                            child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 2.h,
                                            left: 2.w,
                                            bottom: 2.h,
                                          ),
                                          child: CustomWidgets.text1(
                                            "Categories",
                                            textAlign: TextAlign.start,
                                            fontSize:
                                                !Responsive.isMobile(context)
                                                    ? 3.sp
                                                    : 10.sp,
                                          ),
                                        )),
                                        //price
                                        TableCell(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                  top: 2.h,
                                                  right: 0.5.w,
                                                  left: 2.w,
                                                  bottom: 2.h,
                                                ),
                                                child: CustomWidgets.text1(
                                                    "${adminHomeController.productList[i].categorie}",
                                                    textAlign: TextAlign.start,
                                                    fontSize:
                                                        !Responsive.isMobile(
                                                                context)
                                                            ? 2.5.sp
                                                            : 8.sp,
                                                    color: Pallete.gradient2))),
                                      ]),
                                      TableRow(children: [
                                        // charges
                                        TableCell(
                                            child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 2.h,
                                            left: 2.w,
                                            bottom: 2.h,
                                          ),
                                          child: CustomWidgets.text1(
                                            "Price",
                                            textAlign: TextAlign.start,
                                            fontSize:
                                                !Responsive.isMobile(context)
                                                    ? 3.sp
                                                    : 10.sp,
                                          ),
                                        )),
                                        //price
                                        TableCell(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                  top: 2.h,
                                                  right: 0.5.w,
                                                  left: 2.w,
                                                  bottom: 2.h,
                                                ),
                                                child: CustomWidgets.text1(
                                                    "${adminHomeController.productList[i].price}",
                                                    textAlign: TextAlign.start,
                                                    fontSize:
                                                        !Responsive.isMobile(
                                                                context)
                                                            ? 2.5.sp
                                                            : 8.sp,
                                                    color: Pallete.gradient2))),
                                      ]),
                                      TableRow(children: [
                                        // charges
                                        TableCell(
                                            child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 2.h,
                                            left: 2.w,
                                            bottom: 2.h,
                                          ),
                                          child: CustomWidgets.text1(
                                            "Quantity",
                                            textAlign: TextAlign.start,
                                            fontSize:
                                                !Responsive.isMobile(context)
                                                    ? 3.sp
                                                    : 10.sp,
                                          ),
                                        )),
                                        //price
                                        TableCell(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                  top: 2.h,
                                                  right: 0.5.w,
                                                  left: 2.w,
                                                  bottom: 2.h,
                                                ),
                                                child: CustomWidgets.text(
                                                    "${adminHomeController.productList[i].quantity}",
                                                    textAlign: TextAlign.start,
                                                    fontSize:
                                                        !Responsive.isMobile(
                                                                context)
                                                            ? 2.5.sp
                                                            : 8.sp,
                                                    fontWeight: FontWeight.w900,
                                                    color: Pallete.gradient2))),
                                      ]),
                                      TableRow(children: [
                                        // charges
                                        TableCell(
                                            child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 2.h,
                                            left: 2.w,
                                            bottom: 2.h,
                                          ),
                                          child: CustomWidgets.text1(
                                            "Description",
                                            textAlign: TextAlign.start,
                                            fontSize:
                                                !Responsive.isMobile(context)
                                                    ? 3.sp
                                                    : 10.sp,
                                          ),
                                        )),
                                        //price
                                        TableCell(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                  top: 2.h,
                                                  right: 0.5.w,
                                                  left: 2.w,
                                                  bottom: 2.h,
                                                ),
                                                child: CustomWidgets.text1(
                                                    "${adminHomeController.productList[i].description}",
                                                    textAlign: TextAlign.start,
                                                    fontSize:
                                                        !Responsive.isMobile(
                                                                context)
                                                            ? 2.5.sp
                                                            : 8.sp,
                                                    color: Pallete.gradient2))),
                                      ]),
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }
    }
  }
}

class ProductAlert extends StatefulWidget {
  String? pid;
  String? selectedValue1;
  String? image1;
  dynamic productdata;
  ProductAlert(
      {super.key,
      this.pid,
      this.selectedValue1,
      this.image1,
      this.productdata});

  @override
  State<ProductAlert> createState() => _ProductAlertState();
}

class _ProductAlertState extends State<ProductAlert> {
  AdminHomeController adminHomeController = Get.put(AdminHomeController());
  String selectedValue = "";
  File? _pickedImage;
  var imagename;
  Uint8List webImage = Uint8List(8);
  String downloadUrl = "";
  XFile? image;

  @override
  void initState() {
    super.initState();
    // widget.productdata;
  }

  // Future<void> _pickImage() async {
  //   if (!kIsWeb) {
  //     final ImagePicker _picker = ImagePicker();
  //     image = await _picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       var Selected = File(image!.path);
  //       setState(() {
  //         _pickedImage = Selected;
  //       });
  //     } else {
  //       log("No Image has been picked...");
  //     }
  //   } else if (kIsWeb) {
  //     setState(() {});
  //     final ImagePicker _picker = ImagePicker();
  //     image = await _picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       var f = await image!.readAsBytes();
  //       setState(() {
  //         webImage = f;
  //         _pickedImage = File('a');
  //       });
  //     } else {
  //       log("No Image has been picked...");
  //     }
  //   } else {
  //     log("Something want wrong");
  //   }
  // }

  // Future<String> uploadImage(Uint8List xfile) async {
  //   showProgressIndicator();
  //   downloadUrl = "";
  //   Reference ref = FirebaseStorage.instance.ref().child('Product');
  //   String id = const Uuid().v1();
  //   ref = ref.child(id);

  //   UploadTask uploadTask = ref.putData(
  //     xfile,
  //     SettableMetadata(contentType: 'image/jpg'),
  //     // SettableMetadata(contentType: ),
  //   );
  //   TaskSnapshot snapshot = await uploadTask;
  //   downloadUrl = await snapshot.ref.getDownloadURL();

  //   print("image >>>>>>>>>>>>>>>> ${downloadUrl}");
  //   dismissProgressIndicator();
  //   return downloadUrl;
  // }

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
        backgroundColor: Pallete.alertColor,
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
                        CustomWidgets.text(
                            adminHomeController.select == true
                                ? "Add Product"
                                : "Update Product",
                            fontWeight: FontWeight.w600,
                            fontSize:
                                !Responsive.isMobile(context) ? 4.sp : 10.sp,
                            color: Pallete.gradient2),
                        InkWell(
                          child: Icon(Icons.close,
                              color: Pallete.whiteColor.withOpacity(0.8)),
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
                          border: Border.all(
                              color: Pallete.borderColor1, width: 4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  // _pickImage();
                                });
                              },
                              child: adminHomeController.select.value == true
                                  ? ((_pickedImage == null)
                                      ? Container(
                                          width: 40.w,
                                          height: 25.h,
                                          decoration: BoxDecoration(
                                            color: Pallete.borderColor,
                                            borderRadius:
                                                BorderRadius.circular(4.sp),
                                          ),
                                          // child: Image.asset(
                                          //   Assets.assetsAddimage,
                                          //   scale: 6,
                                          //   color: Pallete.whiteColor
                                          //       .withOpacity(0.3),
                                          // ),
                                        )
                                      : Container(
                                          width: 40.w,
                                          height: 25.h,
                                          decoration: BoxDecoration(
                                            color: Pallete.borderColor,
                                            borderRadius:
                                                BorderRadius.circular(4.sp),
                                            image: DecorationImage(
                                              image: MemoryImage(webImage),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ))
                                  : (((widget.image1!.isNotEmpty ||
                                              widget.image1 != "") &&
                                          (downloadUrl.isEmpty ||
                                              downloadUrl == "") &&
                                          (_pickedImage == null))
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4.sp),
                                          child: Image(
                                            width: 40.w,
                                            height: 25.h,
                                            image: NetworkImage(
                                              "${widget.image1}",
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      : ((_pickedImage == null)
                                          ? Container(
                                              width: 40.w,
                                              height: 25.h,
                                              decoration: BoxDecoration(
                                                color: Pallete.borderColor,
                                                borderRadius:
                                                    BorderRadius.circular(4.sp),
                                              ),
                                              // child: Image.asset(
                                              //   Assets.assetsAddimage,
                                              //   scale: 6,
                                              //   color: Pallete.whiteColor
                                              //       .withOpacity(0.3),
                                              // ),
                                            )
                                          : Container(
                                              width: 40.w,
                                              height: 25.h,
                                              decoration: BoxDecoration(
                                                color: Pallete.borderColor,
                                                borderRadius:
                                                    BorderRadius.circular(4.sp),
                                                image: DecorationImage(
                                                  image: MemoryImage(webImage),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            )))),
                          SizedBox(
                            height: 3.h,
                          ),
                          SizedBox(
                            width: 40.w,
                            child: CustomTextFiled(
                                maxLines: 1,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    adminHomeController.pnameController.clear();
                                    return "Product is required";
                                  }
                                  return null;
                                },
                                hintText: "Enter Product Name",
                                controller:
                                    adminHomeController.pnameController),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          /*   DropdownButtonFormField2<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Pallete.borderColor1,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Pallete.gradient2,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Pallete.borderColor1,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            // iconStyleData: IconStyleData(
                            //   icon: Icon(
                            //     Icons.arrow_drop_down,
                            //     color: Pallete.whiteColor.withOpacity(0.8),
                            //   ),
                            //   iconSize: 24,
                            // ),
                            autofocus: false,
                            hint: CustomWidgets.text1(
                              'Select Categories',
                            ),
                            items: adminHomeController.categorieList
                                .map((item) => DropdownMenuItem<String>(
                                      value: item.Categories,
                                      child: Text(
                                        item.Categories,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: adminHomeController.select == true
                                ? (selectedValue!.isEmpty || selectedValue == ''
                                    ? null
                                    : selectedValue)
                                : (selectedValue!.isEmpty || selectedValue == ''
                                    ? widget.selectedValue1
                                    : selectedValue),
                            onChanged: (value) {
                              selectedValue = value!;
                            },
                            onSaved: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                              print('categorie >>>>>>>>>  ${selectedValue}');
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select categorie.';
                              }
                              return null;
                            },
                          ),
                         */
                          SizedBox(
                            height: 1.h,
                          ),
                          SizedBox(
                            width: 40.w,
                            child: CustomTextFiled(
                                maxLines: 1,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    adminHomeController.priceController.clear();
                                    return "Price is required";
                                  }
                                  return null;
                                },
                                hintText: "Enter Price",
                                controller:
                                    adminHomeController.priceController),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          SizedBox(
                            width: 40.w,
                            child: CustomTextFiled(
                                maxLines: 1,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    adminHomeController.puantityController
                                        .clear();
                                    return "Quantity is required";
                                  }
                                  return null;
                                },
                                hintText: "Enter Quantity",
                                controller:
                                    adminHomeController.puantityController),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          SizedBox(
                            width: 40.w,
                            child: CustomTextFiled(
                                maxLines: 5,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    adminHomeController.pdescriptionController
                                        .clear();
                                    return "Description is required";
                                  }
                                  return null;
                                },
                                hintText: "Enter Description",
                                controller:
                                    adminHomeController.pdescriptionController),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          GradientButton(
                            text: adminHomeController.select.value == true
                                ? "Add"
                                : "Update",
                            onPressed: () async {
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
