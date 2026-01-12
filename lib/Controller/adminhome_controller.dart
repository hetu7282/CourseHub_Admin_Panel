// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, avoid_print, no_leading_underscores_for_local_identifiers, unrelated_type_equality_checks, await_only_futures, unused_local_variable, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:coures_app/Data/API/api_manager.dart';
import 'package:coures_app/Data/Model/add_category_response_model.dart';
import 'package:coures_app/Data/Model/get_about_us_response_model.dart';
import 'package:coures_app/Data/Model/get_category_response_model.dart';
import 'package:coures_app/Data/Model/get_coach_response_model.dart';
import 'package:coures_app/Data/Model/get_contact_us_response_model.dart';
import 'package:coures_app/Data/Model/get_course_response_model.dart';
import 'package:coures_app/Data/Model/get_image_slider_response_model.dart';
import 'package:coures_app/Data/Model/get_student_response_model.dart';
import 'package:coures_app/Data/Model/get_terma_of_use_response_model.dart';
import 'package:coures_app/Data/Model/update_contact_us_response_model.dart';
import 'package:coures_app/Data/Model/upload_image_response_model.dart';
import 'package:coures_app/Data/Repository/dashboard_repository.dart';
import 'package:coures_app/Utils/constant_widget.dart';
import 'package:coures_app/Utils/custom_alert.dart';
import 'package:coures_app/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AdminHomeController extends GetxController {
  final dashboardRepository = DashboardRepository(APIManager());
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  TextEditingController categoriesController = TextEditingController();
  TextEditingController pnameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController puantityController = TextEditingController();
  TextEditingController pdescriptionController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phContoller = TextEditingController();
  TextEditingController aboutusController = TextEditingController();
  TextEditingController termsController = TextEditingController();
  TextEditingController conemailController = TextEditingController();
  TextEditingController conaddressController = TextEditingController();
  TextEditingController salno1Controller = TextEditingController();
  TextEditingController salno2Controller = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController telegramController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  String savneno = "";
  String dialcode = "";
  String? isocode = "";
  var aboutUs;

  String initialCountry = 'IN';
  PhoneNumber phnumber = PhoneNumber(isoCode: 'IN', dialCode: '+91');
  // PhoneNumber phnumber = PhoneNumber(isoCode: 'IN', dialCode: '+91');
  PhoneNumber updatenumber = PhoneNumber();

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _globalKey;

  List categorieList = [];
  List productList = [];
  List userList = [];
  List aboutusList = [];
  List conatctusList = [];

  RxString selectCategories = "".obs;

  RxBool select = false.obs;

  Rx<GetCategoryResponseModel> getCategoryDetails =
      GetCategoryResponseModel().obs;
  Rx<AddCategoryResponseModel> addCategoryDetails =
      AddCategoryResponseModel().obs;
  Rx<AddCategoryResponseModel> removeCategoryDetails =
      AddCategoryResponseModel().obs;
  Rx<AddCategoryResponseModel> updateCategoryDetails =
      AddCategoryResponseModel().obs;
  Rx<GetCourseResponseModel> getCourseDetails = GetCourseResponseModel().obs;
  Rx<GetCoachResponseModel> getCoachDetails = GetCoachResponseModel().obs;
  Rx<GetStudentResponseModel> getStudentDetails = GetStudentResponseModel().obs;
  Rx<GetContactUSResponseModel> getContactUsDetails =
      GetContactUSResponseModel().obs;
  Rx<UpdateContactUSResponseModel> updateContactUsDetails =
      UpdateContactUSResponseModel().obs;
  Rx<GetAboutUsResponseModel> getAbouteUsDetails =
      GetAboutUsResponseModel().obs;
  Rx<GetTermsOfUseResponseModel> getTermsDetails =
      GetTermsOfUseResponseModel().obs;
  Rx<GetImageSliderResponseModel> getImageSliderDetails =
      GetImageSliderResponseModel().obs;
  Rx<UploadImageResponseModel> uploadImageDetails =
      UploadImageResponseModel().obs;
  Rx<UpdateContactUSResponseModel> addImageDetails =
      UpdateContactUSResponseModel().obs;

  RxList<GetCategoryData> getCategorylist = <GetCategoryData>[].obs;
  RxList<GetCoachData> getCoachlist = <GetCoachData>[].obs;
  RxList<GetStudentData> getStudentlist = <GetStudentData>[].obs;
  RxList<GetImageSlider> getImageSliderlist = <GetImageSlider>[].obs;
  RxList<CourseData> getCourseDatalist = <CourseData>[].obs;

// final RxList<GetCategoryData> filteredCategoryData = <GetCategoryData>[].obs;

  void controlMenu() {
    if (!_globalKey.currentState!.isDrawerOpen) {
      print("open.....");
      _globalKey.currentState!.openDrawer();
    }
  }

  // //********************** onInit Method **********************//

  // @override
  // void onInit() async {
  //   getAllData(context);
  //   super.onInit();
  // }

  getAllData(BuildContext context) {
    getCategory(context);
    getCoach(context);
    getStudent(context);
    getContactUs(context);
    getAboutUs(context);
    getTerms(context);
    getImageSlider(context);
  }

  //*************************************** Category ***************************************//

  getCategory(BuildContext context) async {
    getCategoryDetails.value = await dashboardRepository.getCategoriesApiCall();
    getCategorylist.clear();
    if (getCategoryDetails.value.status == true) {
      getCategorylist.addAll(getCategoryDetails.value.data!.toList());
      print(getCategorylist);
    } else {
      errorSnackBar(
          message: getCategoryDetails.value.message, context: context);
    }
  }

  addCategory(
    BuildContext context,
  ) async {
    addCategoryDetails.value = await dashboardRepository.addCategoriesApiCall(
      category: categoriesController.text,
    );
    getCategorylist.clear();
    if (addCategoryDetails.value.status == true) {
      getCategory(context);

      successSnackBar(
          message: addCategoryDetails.value.message, context: context);
      Get.back();
    } else {
      errorSnackBar(
          message: addCategoryDetails.value.message, context: context);
    }
  }

  removeCategory(BuildContext context, var id) async {
    removeCategoryDetails.value =
        await dashboardRepository.removeCategoriesApiCall(
      id: id,
      category: categoriesController.text,
    );
    if (removeCategoryDetails.value.status == true) {
      successSnackBar(
          message: removeCategoryDetails.value.message, context: context);
      getCategory(context);
      Get.back();
    } else {
      errorSnackBar(
          message: removeCategoryDetails.value.message, context: context);
    }
  }

  updateCategory(
    BuildContext context,
    var id,
  ) async {
    updateCategoryDetails.value =
        await dashboardRepository.updateCategoriesApiCall(
      id: id,
      category: categoriesController.text,
    );
    getCategorylist.clear();
    if (updateCategoryDetails.value.status == true) {
      getCategory(context);

      successSnackBar(
          message: updateCategoryDetails.value.message, context: context);
      Get.back();
    } else {
      errorSnackBar(
          message: updateCategoryDetails.value.message, context: context);
    }
  }

  updateEnableCategory(
    BuildContext context,
    var id,
    var enable,
  ) async {
    updateCategoryDetails.value =
        await dashboardRepository.updateEnableCategoriesApiCall(
      id: id,
      enable: enable,
    );
    if (updateCategoryDetails.value.status == true) {
      successSnackBar(
          message: updateCategoryDetails.value.message, context: context);
    } else {
      errorSnackBar(
          message: updateCategoryDetails.value.message, context: context);
    }
  }

  //*************************************** Coach ***************************************//

  getCoach(BuildContext context) async {
    getCoachDetails.value = await dashboardRepository.getCoachApiCall();
    getCoachlist.clear();
    if (getCoachDetails.value.status == true) {
      getCoachlist.addAll(getCoachDetails.value.data!.toList());
      print(getCoachlist);
    } else {
      errorSnackBar(message: getCoachDetails.value.message, context: context);
    }
  }

  updateEnableCoach(
    BuildContext context,
    var id,
    var enable,
  ) async {
    updateCategoryDetails.value =
        await dashboardRepository.updateEnableCoachApiCall(
      id: id,
      enable: enable,
    );
    if (updateCategoryDetails.value.status == true) {
      successSnackBar(
          message: updateCategoryDetails.value.message, context: context);
    } else {
      errorSnackBar(
          message: updateCategoryDetails.value.message, context: context);
    }
  }

  getCourse(
    BuildContext context,
    var coachId,
  ) async {
    getCourseDetails.value = await dashboardRepository.getCourseApiCall(
      coachId: coachId,
    );
    getCourseDatalist.clear();
    if (getCourseDetails.value.status == true) {
      getCourseDatalist.addAll(getCourseDetails.value.courseData!.toList());
    getCourseDatalist.isNotEmpty?
      courseAlert(
        context: context,
        rows: getCourseDatalist.asMap().keys.map((index) {
          var data = getCourseDatalist[index];
          var datano = index + 1;
          return DataRow(cells: [
            DataCell(
              Container(
                child: customText(
                  datano.toString(),
                ),
              ),
            ),
            DataCell(
              Container(
                child: customText(
                  data.courseName.toString(),
                ),
              ),
            ),
            DataCell(
              Container(
                child: customText(
                  data.price.toString(),
                ),
              ),
            ),
          ]);
        }).toList(),
      ):informationSnackBar(context: context,message: "Sorry, but there are no courses available right now.");
    } else {
      errorSnackBar(
          message: updateCategoryDetails.value.message, context: context);
    }
  }

  //*************************************** Student ***************************************//

  getStudent(BuildContext context) async {
    getStudentDetails.value = await dashboardRepository.getStudentApiCall();
    getStudentlist.clear();
    if (getStudentDetails.value.status == true) {
      getStudentlist.addAll(getStudentDetails.value.data!.toList());
      print(getStudentlist);
    } else {
      errorSnackBar(message: getStudentDetails.value.message, context: context);
    }
  }

  updateEnableStudent(
    BuildContext context,
    var id,
    var enable,
  ) async {
    updateCategoryDetails.value =
        await dashboardRepository.updateEnableStudentApiCall(
      id: id,
      enable: enable,
    );
    if (updateCategoryDetails.value.status == true) {
      successSnackBar(
          message: updateCategoryDetails.value.message, context: context);
    } else {
      errorSnackBar(
          message: updateCategoryDetails.value.message, context: context);
    }
  }

  //*************************************** Contact Us ***************************************//

  getContactUs(BuildContext context) async {
    getContactUsDetails.value = await dashboardRepository.getContactUsApiCall();

    if (getContactUsDetails.value.status == true) {
      conemailController.text =
          getContactUsDetails.value.data!.email.toString();
      conaddressController.text =
          getContactUsDetails.value.data!.address.toString();
      salno1Controller.text =
          getContactUsDetails.value.data!.contactno1.toString();
      salno2Controller.text =
          getContactUsDetails.value.data!.contactno2.toString();
      whatsappController.text =
          getContactUsDetails.value.data!.whatsappno.toString();
      telegramController.text =
          getContactUsDetails.value.data!.telegramno.toString();
    } else {
      errorSnackBar(
          message: getContactUsDetails.value.message, context: context);
    }
  }

  updateContactUs(BuildContext context) async {
    updateContactUsDetails.value =
        await dashboardRepository.updateContactUsApiCall(
      email: conemailController.text,
      address: conaddressController.text,
      contactno1: salno1Controller.text,
      contactno2: salno2Controller.text,
      id: getContactUsDetails.value.data!.id,
      telegramno: telegramController.text,
      whatsappno: whatsappController.text,
    );

    if (updateContactUsDetails.value.status == true) {
      getContactUs(context);
      successSnackBar(
          message: updateContactUsDetails.value.message, context: context);
      Get.back();
    } else {
      errorSnackBar(
          message: updateContactUsDetails.value.message, context: context);
    }
  }

  //*************************************** About Us ***************************************//

  getAboutUs(BuildContext context) async {
    getAbouteUsDetails.value = await dashboardRepository.getAboutUsApiCall();

    if (getAbouteUsDetails.value.status == true) {
      aboutusController.text =
          getAbouteUsDetails.value.data!.aboutus.toString();
    } else {
      errorSnackBar(
          message: getAbouteUsDetails.value.message, context: context);
    }
  }

  updateAboutUs(BuildContext context) async {
    updateContactUsDetails.value =
        await dashboardRepository.updateAboutUsApiCall(
            about: aboutusController.text,
            id: getAbouteUsDetails.value.data!.id);

    if (updateContactUsDetails.value.status == true) {
      getAboutUs(context);
      successSnackBar(
          message: updateContactUsDetails.value.message, context: context);
      Get.back();
    } else {
      errorSnackBar(
          message: updateContactUsDetails.value.message, context: context);
    }
  }
  //*************************************** About Us ***************************************//

  getTerms(BuildContext context) async {
    getTermsDetails.value = await dashboardRepository.getTermsApiCall();

    if (getTermsDetails.value.status == true) {
      termsController.text = getTermsDetails.value.data!.terms.toString();
    } else {
      errorSnackBar(message: getTermsDetails.value.message, context: context);
    }
  }

  updateTerms(BuildContext context) async {
    updateContactUsDetails.value = await dashboardRepository.updateTermsApiCall(
        terms: termsController.text, id: getTermsDetails.value.data!.id);

    if (updateContactUsDetails.value.status == true) {
      getTerms(context);
      successSnackBar(
          message: updateContactUsDetails.value.message, context: context);
      Get.back();
    } else {
      errorSnackBar(
          message: updateContactUsDetails.value.message, context: context);
    }
  }

  //*************************************** Category ***************************************//

  getImageSlider(BuildContext context) async {
    getImageSliderDetails.value =
        await dashboardRepository.getImageSliderApiCall();
    getImageSliderlist.clear();
    if (getImageSliderDetails.value.status == true) {
      getImageSliderlist.addAll(getImageSliderDetails.value.data!.toList());
      print(getImageSliderlist);
    } else {
      errorSnackBar(
          message: getImageSliderDetails.value.message, context: context);
    }
  }

  addImageSlider(BuildContext context, var image) async {
    addImageDetails.value = await dashboardRepository.addImageSliderApiCall(
      image: image,
    );
    getCategorylist.clear();
    if (addImageDetails.value.status == true) {
      getCategory(context);

      successSnackBar(message: addImageDetails.value.message, context: context);
      Get.back();
    } else {
      errorSnackBar(message: addImageDetails.value.message, context: context);
    }
  }

  uploadAddImage(BuildContext context, var image, String name,
      {operation = "add"}) async {
    uploadImageDetails.value = await dashboardRepository.uploadImageApiCall(
      imageName: name,
      image: image,
    );

    if (uploadImageDetails.value.status == true) {
      //   // successSnackBar(
      //   //     message: uploadImageDetails.value.message, context: context);
      //   //     Get.back();
      //   operation == "add"
      addImageSlider(context, uploadImageDetails.value.image.toString());
      //       : updateImageSlider(context, uploadImageDetails.value.image.toString(),id);
    } else {
      errorSnackBar(
          message: uploadImageDetails.value.message, context: context);
    }
  }

  uploadUpdateImage(BuildContext context, var image, String name,
      {var id, operation = "update"}) async {
    uploadImageDetails.value = await dashboardRepository.uploadImageApiCall(
      imageName: name,
      image: image,
    );

    if (uploadImageDetails.value.status == true) {
      updateImageSlider(context, uploadImageDetails.value.image.toString(), id);
    } else {
      errorSnackBar(
          message: uploadImageDetails.value.message, context: context);
    }
  }

  removeImageSlider(BuildContext context, var id) async {
    addImageDetails.value = await dashboardRepository.deleteImageSliderApiCall(
      id: id,
    );
    if (addImageDetails.value.status == true) {
      successSnackBar(message: addImageDetails.value.message, context: context);
      getImageSlider(context);
      Get.back();
    } else {
      errorSnackBar(message: addImageDetails.value.message, context: context);
    }
  }

  updateImageSlider(BuildContext context, var image, int id) async {
    addImageDetails.value = await dashboardRepository.updateImageSliderApiCall(
      image: image,
      id: id,
    );
    getImageSliderlist.clear();
    if (updateCategoryDetails.value.status == true) {
      getImageSlider(context);
      successSnackBar(message: addImageDetails.value.message, context: context);
      Get.back();
    } else {
      errorSnackBar(message: addImageDetails.value.message, context: context);
    }
  }
}
