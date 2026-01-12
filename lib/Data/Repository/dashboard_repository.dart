// // ignore_for_file: unused_local_variable, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

// import 'package:get_storage/get_storage.dart';
// import 'package:sanghavi_and_sons/Data/API/api_manager.dart';
// import 'package:sanghavi_and_sons/Data/Model/delete_request_response_model.dart';
// import 'package:sanghavi_and_sons/Data/Model/edit_profile_response_model.dart';
// import 'package:sanghavi_and_sons/Data/Model/my_request_data_response_model.dart';
// import 'package:sanghavi_and_sons/Data/Model/otp_response_model.dart';
// import 'package:sanghavi_and_sons/Data/Model/place_order_responce_model.dart';
// import 'package:sanghavi_and_sons/Data/Model/recent_search_list_response_model.dart';
// import 'package:sanghavi_and_sons/Data/Model/remove_product_response_model.dart';
// import 'package:sanghavi_and_sons/Data/Model/search_product_responce_model.dart';
// import '../../Utils/string_constant.dart';
// import '../Model/my_profile_response_model.dart';

import 'package:coures_app/Data/API/api_manager.dart';
import 'package:coures_app/Data/API/dio_manager.dart';
import 'package:coures_app/Data/Model/add_category_response_model.dart';
import 'package:coures_app/Data/Model/get_about_us_response_model.dart';
import 'package:coures_app/Data/Model/get_category_response_model.dart';
import 'package:coures_app/Data/Model/get_coach_response_model.dart';
import 'package:coures_app/Data/Model/get_contact_us_response_model.dart';
import 'package:coures_app/Data/Model/get_image_slider_response_model.dart';
import 'package:coures_app/Data/Model/get_student_response_model.dart';
import 'package:coures_app/Data/Model/get_terma_of_use_response_model.dart';
import 'package:coures_app/Data/Model/update_contact_us_response_model.dart';
import 'package:coures_app/Data/Model/upload_image_response_model.dart';
import 'package:coures_app/Utils/string_constant.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../Model/get_course_response_model.dart';

class DashboardRepository {
  DioManager dioManager = DioManager();
  DashboardRepository(this.apiManager);

  final APIManager apiManager;

  //****************************************** get categories api call *******************************************//

  Future<GetCategoryResponseModel> getCategoriesApiCall() async {
    var jsonData = await apiManager.getAPICall(
      url: '$baseUrl/getcategories',
    );

    var response = GetCategoryResponseModel.fromJson(jsonData);
    return response;
  }

  //****************************************** add categories api call *******************************************//

  Future<AddCategoryResponseModel> addCategoriesApiCall(
      {required String category}) async {
    var jsonData = await apiManager.postAPICall(
        url: '$baseUrl/addCategories', params: {'category': category});

    var response = AddCategoryResponseModel.fromJson(jsonData);
    return response;
  }

  //****************************************** update categories api call *******************************************//

  Future<AddCategoryResponseModel> updateCategoriesApiCall(
      {required String category, var id}) async {
    var jsonData = await apiManager.postAPICall(
        url: '$baseUrl/update-category/$id', params: {'category': category});

    var response = AddCategoryResponseModel.fromJson(jsonData);
    return response;
  }

  Future<AddCategoryResponseModel> updateEnableCategoriesApiCall(       
      {required  enable, var id}) async {
    var jsonData = await apiManager.postAPICall(
        url: '$baseUrl/update-enable-category/$id', params: {'enable': enable});

    var response = AddCategoryResponseModel.fromJson(jsonData);
    return response;
  }
  //****************************************** update categories api call *******************************************//

  Future<AddCategoryResponseModel> removeCategoriesApiCall(
      {required String category, var id}) async {
    var jsonData = await apiManager.postAPICall(
        url: '$baseUrl/delete-category/$id', params: {'category': category});

    var response = AddCategoryResponseModel.fromJson(jsonData);
    return response;
  }

  //****************************************** get categories api call *******************************************//

  Future<GetCoachResponseModel> getCoachApiCall() async {
    var jsonData = await apiManager.getAPICall(
      url: '$baseUrl/get-all-coach',
    );

    var response = GetCoachResponseModel.fromJson(jsonData);
    return response;
  }

    Future<AddCategoryResponseModel> updateEnableCoachApiCall(       
      {required  enable, var id}) async {
    var jsonData = await apiManager.postAPICall(
        url: '$baseUrl/enable-coach/$id', params: {'enable': enable});

    var response = AddCategoryResponseModel.fromJson(jsonData);
    return response;
  }
 
  Future<GetCourseResponseModel> getCourseApiCall({var coachId}) async {
    var jsonData = await apiManager.postAPICall(params: {
      "coach_id":coachId
    },
      url: '$baseUrl/get-course',
    );

    var response = GetCourseResponseModel.fromJson(jsonData);
    return response;
  }

 
  //****************************************** get student api call *******************************************//

  Future<GetStudentResponseModel> getStudentApiCall() async {
    var jsonData = await apiManager.getAPICall(
      url: '$baseUrl/get-all-student',
    );

    var response = GetStudentResponseModel.fromJson(jsonData);
    return response;
  }

  Future<AddCategoryResponseModel> updateEnableStudentApiCall(       
      {required  enable, var id}) async {
    var jsonData = await apiManager.postAPICall(
        url: '$baseUrl/enable-user/$id', params: {'enable': enable});

    var response = AddCategoryResponseModel.fromJson(jsonData);
    return response;
  }
  //******************************************  contact us api call *******************************************//

  Future<GetContactUSResponseModel> getContactUsApiCall() async {
    var jsonData = await apiManager.getAPICall(
      url: '$baseUrl/get-contactus',
    );

    var response = GetContactUSResponseModel.fromJson(jsonData);
    return response;
  }

  Future<UpdateContactUSResponseModel> updateContactUsApiCall(
      {required String email,
      address,
      contactno1,
      contactno2,
      telegramno,
      whatsappno,
      var id}) async {
    var jsonData = await apiManager.postAPICall(
      url: '$baseUrl/update-contact-us/$id',
      params: {
        'email': email,
        'address': address,
        'contactno1': contactno1,
        'contactno2': contactno2,
        'telegramno': telegramno,
        'whatsappno': whatsappno,
      },
    );

    var response = UpdateContactUSResponseModel.fromJson(jsonData);
    return response;
  }

  //******************************************  about us api call *******************************************//

  Future<GetAboutUsResponseModel> getAboutUsApiCall() async {
    var jsonData = await apiManager.getAPICall(
      url: '$baseUrl/get-aboutus',
    );

    var response = GetAboutUsResponseModel.fromJson(jsonData);
    return response;
  }

  Future<UpdateContactUSResponseModel> updateAboutUsApiCall(
      {required String about, var id}) async {
    var jsonData = await apiManager.postAPICall(
      url: '$baseUrl/update-about-us/$id',
      params: {
        'aboutus': about,
      },
    );

    var response = UpdateContactUSResponseModel.fromJson(jsonData);
    return response;
  }

  //******************************************  terms of use api call *******************************************//

  Future<GetTermsOfUseResponseModel> getTermsApiCall() async {
    var jsonData = await apiManager.getAPICall(
      url: '$baseUrl/get-terms',
    );

    var response = GetTermsOfUseResponseModel.fromJson(jsonData);
    return response;
  }

  Future<UpdateContactUSResponseModel> updateTermsApiCall(
      {required String terms, var id}) async {
    var jsonData = await apiManager.postAPICall(
      url: '$baseUrl/update-terms/$id',
      params: {
        'terms': terms,
      },
    );

    var response = UpdateContactUSResponseModel.fromJson(jsonData);
    return response;
  }

  //******************************************  image slider api call *******************************************//

  Future<GetImageSliderResponseModel> getImageSliderApiCall() async {
    var jsonData = await apiManager.getAPICall(
      url: '$baseUrl/get-slider-image',
    );

    var response = GetImageSliderResponseModel.fromJson(jsonData);
    return response;
  }

  Future<UpdateContactUSResponseModel> addImageSliderApiCall(
      {required String image}) async {
    var jsonData = await apiManager.postAPICall(
      url: '$baseUrl/addsliderimage',
      params: {
        'imagerul': image,
      },
    );

    var response = UpdateContactUSResponseModel.fromJson(jsonData);
    return response;
  }

  // Future<UploadImageResponseModel> uploadImageApiCall({var image}) async {
  //   var jsonData = await apiManager.postAPICall(
  //     url: '$baseUrl/upload-image',
  //     params: {
  //       'image': image,
  //     },
  //   );

  //   var response = UploadImageResponseModel.fromJson(jsonData);
  //   return response;
  // }

  Future<UploadImageResponseModel> uploadImageApiCall(
      {required List<int> image, required String imageName}) async {
    Map<String, dynamic> params = {
      "image": MultipartFile.fromBytes(image,
          contentType: MediaType('image', 'jpg'), filename: imageName),
    };

    FormData formData = FormData.fromMap(params);
    dynamic response = await dioManager.postApiCall(
      url: '$baseUrl/upload-image',
      formData: formData,
    );

    UploadImageResponseModel data = UploadImageResponseModel.fromJson(response);
    return data;
  }

  Future<UpdateContactUSResponseModel> updateImageSliderApiCall(
      {required String image, var id}) async {
    var jsonData = await apiManager.postAPICall(
      url: '$baseUrl/update-slider-image/$id',
      params: {
        'imagerul': image,
      },
    );

    var response = UpdateContactUSResponseModel.fromJson(jsonData);
    return response;
  }

  Future<UpdateContactUSResponseModel> deleteImageSliderApiCall(
      {var id}) async {
    var jsonData = await apiManager.postAPICall(
      url: '$baseUrl/delete-slider-image/$id',
      params: {
        'imagerul': id,
      },
    );

    var response = UpdateContactUSResponseModel.fromJson(jsonData);
    return response;
  }
}
