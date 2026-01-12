// ignore_for_file: unused_local_variable, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'dart:js';

import 'package:coures_app/Data/API/api_manager.dart';
import 'package:coures_app/Data/Model/admin_login_response_model.dart';
import 'package:coures_app/Utils/string_constant.dart';
import 'package:flutter/widgets.dart';

class AuthenticationRepository {
  AuthenticationRepository(this.apiManager);

  final APIManager apiManager;

//   //****************************************** signup api call *******************************************//

//   Future<SignUpResponseModel> signupApiCall({
//     required String username,
//     required String fname,
//     required String lname,
//     required String email,
//     required String phno,
//     required String city,
//     required String comapany,
//     required String country,
//     required String countrycode,
//   }) async {
//     var jsonData = await apiManager.postAPICall(
//       '${baseUrl}',
//       {
//         "tag": "register",
//         "Name": fname,
//         "lastName": lname,
//         "username": username,
//         "Email": email,
//         "Phone": phno,
//         "company_name": comapany,
//         "City": city,
//         "Country": country,
//         "mobile_country_code": countrycode,
//       },
//     );

//     var response = SignUpResponseModel.fromJson(jsonData);
//     return response;
//   }
//   //****************************************** Otp verifiy api call *******************************************//

//   Future<OtpResponseModel> otpVerifyApiCall({
//     required var email,
//     required var otp,
//     required var type,
//   }) async {
//     var jsonData = await apiManager.postAPICall(
//       '${baseUrl}',
//       {
//         "tag": "otp_validate",
//         "email": email,
//         "otp": otp,
//         "type": type
//       },
//     );

//     var response = OtpResponseModel.fromJson(jsonData);
//     return response;
//   }

//   //****************************************** Resend Otp api call *******************************************//

//   Future<ResendOtpResponseModel> resendOtpApiCall({
//     required var email,
//   }) async {
//     var jsonData = await apiManager.postAPICall(
//       '${baseUrl}',
//       {
//         "tag": "resend_otp",
//         "email": email,
//       },
//     );

//     var response = ResendOtpResponseModel.fromJson(jsonData);
//     return response;
//   }
//   //****************************************** signup api call *******************************************//

//   Future<CountryResponseModel> countryApiCall() async {
//     var jsonData = await apiManager.postAPICall(
//       isLoaderShow: false,
//       '${baseUrl}',
//       {
//         "tag": "getcountrylist",
//       },
//     );

//     var response = CountryResponseModel.fromJson(jsonData);
//     return response;
//   }

  //****************************************** login api call *******************************************//

  Future<AdminLoginResponseModel> loginApiCall(
      {required String email, required String password}) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}/login',
      params: {
        "email": email,
        "password": password,
      },
    );

    var response = AdminLoginResponseModel.fromJson(jsonData);
    return response;
  }

//   //****************************************** forgot password api call *******************************************//

//   Future<ForgotPwdModel> forgotpwdApiCall({
//     required String email,
//   }) async {
//     var jsonData = await apiManager.postAPICall(
//       '${baseUrl}',
//       {
//         "tag": "forgotpassword",
//         "email": email,
//       },
//     );

//     var response = ForgotPwdModel.fromJson(jsonData);
//     return response;
//   }

//   //****************************************** change password api call *******************************************//

//   Future<ChangePwdModel> changepwdApiCall({
//     required String oldpassword,
//     required String newpassword,
//   }) async {
//     var jsonData = await apiManager.postAPICall(
//       '${baseUrl}',
//       {
//         "tag": "changepassword",
//         "uid": OtpResponseModel.fromJson(
//           GetStorage().read(
//             userData,
//           ),
//         ).uid.toString(),
//         "oldpassword": oldpassword,
//         "newpassword": newpassword,
//       },
//     );

//     var response = ChangePwdModel.fromJson(jsonData);
//     return response;
//   }
}
