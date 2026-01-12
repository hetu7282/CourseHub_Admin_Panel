class GetAboutUsResponseModel {
  bool? status;
  String? message;
  AboutData? data;

  GetAboutUsResponseModel({this.status, this.message, this.data});

  GetAboutUsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? AboutData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AboutData {
  String? aboutus;
  String? createdAt;
  int? id;
  String? updateAt;

  AboutData({this.aboutus, this.createdAt, this.id, this.updateAt});

  AboutData.fromJson(Map<String, dynamic> json) {
    aboutus = json['aboutus'];
    createdAt = json['created_at'];
    id = json['id'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aboutus'] = aboutus;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['update_at'] = updateAt;
    return data;
  }
}
