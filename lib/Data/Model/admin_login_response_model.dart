class AdminLoginResponseModel {
  bool? success;
  String? message;
  Admindata? userdata;

  AdminLoginResponseModel({this.success, this.message, this.userdata});

  AdminLoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    userdata = json['userdata'] != null
        ? Admindata.fromJson(json['userdata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (userdata != null) {
      data['userdata'] = userdata!.toJson();
    }
    return data;
  }
}

class Admindata {
  String? password;
  int? id;
  String? email;
  String? username;

  Admindata({this.password, this.id, this.email, this.username});

  Admindata.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    id = json['id'];
    email = json['email'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    return data;
  }
}
