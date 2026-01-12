// import 'package:cloud_firestore/cloud_firestore.dart';

// class Category{

//  var categories = FirebaseFirestore.instance.collection("categories");

//  insertCategories(){}

// }



import 'package:coures_app/Utils/string_constant.dart';
import 'package:universal_html/html.dart';

class WebStorage {
  //Singleton
  WebStorage._internal();
  static final WebStorage instance = WebStorage._internal();
  factory WebStorage() {
    return instance;
  }

  String get sessionId => window.localStorage['SessionId'].toString();
  set sessionId(String sid) => (sid == null)
      ? window.localStorage.remove('SessionId')
      : window.localStorage['SessionId'] = sid;
}

class SessionStorageHelper {
  static Storage sessionStorage = window.localStorage;

  static void saveValue( String value) {
    sessionStorage[userData] = value;
  }

  static getValue() {
   return sessionStorage[userData];
  }

    static void removeValue() {
    sessionStorage.remove(userData);
  }

   static void clearAll() {
    sessionStorage.clear();
  }
}
