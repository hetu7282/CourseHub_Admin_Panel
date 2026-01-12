// ignore_for_file: unused_import

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:coures_app/Data/API/api_exception.dart';
import 'package:coures_app/Data/Model/error_model.dart';
import 'package:coures_app/Utils/constant_widget.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get_storage/get_storage.dart';

class DioManager {
  DioManager._() {
    dio.options = BaseOptions(
      validateStatus: (status) {
        return (status != null && status >= 200 && status < 300) ||
            (status != null && status == 403) ||
            (status != null && status == 401) ||
            (status != null && status == 400);
      },
    );
  }

  static DioManager instance = DioManager._();

  factory DioManager() {
    return instance;
  }

  var authToken1 =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImpAZ21haWwuY29tIiwiaWF0IjoxNjc5Mzc0MjE4fQ.yrhNKbtsCfyuIZj4MBqeCJENu48fT-GWe3f0Voqh06A";

  Dio dio = Dio();

  Future<dynamic> postApiCall(
      {required String url,
      FormData? formData,
      bool isLoaderShow = true}) async {
    dynamic responseJson;
    log("[Calling API] => $url");
    log("[Calling parameters form data] => ${formData!.fields.toString()}");
    log("[Calling parameters form data] => ${formData.files.toString()}");

    try {
      if (isLoaderShow == true) {
        showProgressIndicator();
      }

      final response = await dio.post(url,
          data: formData, options: Options(contentType: 'multipart/form-data'));
      log(response.data.toString());
      responseJson = _response(response);
    } on SocketException {
      errorSnackBarApi(message: 'No Internet Connection');
      throw FetchDataException('No Internet Connection');
    } on TimeoutException catch (_) {
      throw FetchDataException('Server Error');
    } on DioError catch (_) {
      errorSnackBarApi(message: 'No Internet Connection');
    } finally {
      if (isLoaderShow == true) {
        dismissProgressIndicator();
      }
    }
    return responseJson;
  }

  Future<dynamic> patchApiCall(
      {required String url,
      FormData? formData,
      Map<String, dynamic>? headers,
      bool isLoaderShow = true}) async {
    dynamic responseJson;
    log("[Calling API] => $url");
    log("[Calling parameters form data] => ${formData!.fields.toString()}");
    log("[Calling parameters form data] => ${formData.files.toString()}");

    try {
      if (isLoaderShow == true) {
        showProgressIndicator();
      }

      final response = await dio.patch(url,
          data: formData,
          options:
              Options(contentType: 'multipart/form-data', headers: headers));
      log(response.data.toString());
      responseJson = _response(response);
    } on SocketException {
      errorSnackBarApi(message: 'No Internet Connection');
      throw FetchDataException('No Internet Connection');
    } on TimeoutException catch (_) {
      throw FetchDataException('Server Error');
    } on DioError catch (_) {
      errorSnackBarApi(message: 'No Internet Connection');
    } finally {
      if (isLoaderShow == true) {
        dismissProgressIndicator();
      }
    }
    return responseJson;
  }

  dynamic _response(Response response) async {
    switch (response.statusCode) {
      case 200:
        if (ErrorModel.fromJson(response.data).status == 0) {
          errorSnackBarApi(
            message: ErrorModel.fromJson(response.data).message,
          );
          throw BadRequestException(
            ErrorModel.fromJson(response.data).message,
          );
        } else {
          var responseJson = response.data;
          return responseJson;
        }

      case 400:
        errorSnackBarApi(
          message: ErrorModel.fromJson(response.data).message,
        );
        throw BadRequestException(
          ErrorModel.fromJson(response.data).message,
        );

      case 403:
        // authController.showLogout.value = false;
        // authController.isLogin.value = false;
        await GetStorage().erase();
        // FirebaseAuth.instance.signOut();
        // g.Get.offAllNamed(Routes.DASHBOARD_SCREEN);
        errorSnackBarApi(
          message: ErrorModel.fromJson(response.data).message,
        );
        throw UnauthorisedException(
          ErrorModel.fromJson(response.data).message,
        );

      case 500:
      default:
        errorSnackBarApi(
          message: ErrorModel.fromJson(response.data).message,
        );
        throw FetchDataException(
          'An error occured while communication with server with status code: ${response.statusCode}',
        );
    }
  }
}
