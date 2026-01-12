class GetStudentResponseModel {
  bool? status;
  String? message;
  List<GetStudentData>? data;

  GetStudentResponseModel({this.status, this.message, this.data});

  GetStudentResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetStudentData>[];
      json['data'].forEach((v) {
        data!.add(GetStudentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetStudentData {
  int? id;
  String? username;
  String? email;
  String? mobile;
  String? image;
  String? telegramno;
  String? whatsapp;
  String? gender;
  bool? enable;
  String? city;
  String? country;
  String? role;
  String? createdAt;
  String? updateAt;

  GetStudentData(
      {this.id,
      this.username,
      this.email,
      this.mobile,
      this.image,
      this.telegramno,
      this.enable,
      this.whatsapp,
      this.gender,
      this.city,
      this.country,
      this.role,
      this.createdAt,
      this.updateAt});

  GetStudentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'];
    telegramno = json['telegramno'];
    whatsapp = json['whatsapp'];
    gender = json['gender'];
    city = json['city'];
    country = json['country'];
    role = json['role'];
    enable = json['enable'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['mobile'] = mobile;
    data['image'] = image;
    data['telegramno'] = telegramno;
    data['whatsapp'] = whatsapp;
    data['gender'] = gender;
    data['city'] = city;
    data['country'] = country;
    data['role'] = role;
    data['enable'] = enable;
    data['created_at'] = createdAt;
    data['update_at'] = updateAt;
    return data;
  }
}
