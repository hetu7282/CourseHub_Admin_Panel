class GetCoachResponseModel {
  bool? status;
  String? message;
  List<GetCoachData>? data;

  GetCoachResponseModel({this.status, this.message, this.data});

  GetCoachResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetCoachData>[];
      json['data'].forEach((v) {
        data!.add(GetCoachData.fromJson(v));
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

class GetCoachData {
  int? id;
  String? username;
  String? email;
  String? mobile;
  String? image;
  String? telegramno;
  String? whatsapp;
  String? gender;
  String? city;
  String? country;
  String? experience;
  String? role;
  bool? enable;
  String? createdAt;
  String? updateAt;

  GetCoachData(
      {this.id,
      this.username,
      this.email,
      this.mobile,
      this.image,
      this.telegramno,
      this.whatsapp,
      this.gender,
      this.city,
      this.country,
      this.experience,
      this.role,
      this.createdAt,
      this.enable,
      this.updateAt});

  GetCoachData.fromJson(Map<String, dynamic> json) {
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
    experience = json['experience'];
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
    data['experience'] = experience;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['enable'] = enable;
    data['update_at'] = updateAt;
    return data;
  }
}
