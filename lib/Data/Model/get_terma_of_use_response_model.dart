class GetTermsOfUseResponseModel {
  bool? status;
  String? message;
  Data? data;

  GetTermsOfUseResponseModel({this.status, this.message, this.data});

  GetTermsOfUseResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  String? terms;
  String? createdAt;
  int? id;
  String? updateAt;

  Data({this.terms, this.createdAt, this.id, this.updateAt});

  Data.fromJson(Map<String, dynamic> json) {
    terms = json['terms'];
    createdAt = json['created_at'];
    id = json['id'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['terms'] = terms;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['update_at'] = updateAt;
    return data;
  }
}