class GetCategoryResponseModel {
  bool? status;
  String? message;
  List<GetCategoryData>? data;

  GetCategoryResponseModel({this.status, this.message, this.data});

  GetCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetCategoryData>[];
      json['data'].forEach((v) {
        data!.add(GetCategoryData.fromJson(v));
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

class GetCategoryData {
  int? id;
  String? category;
  String? createdAt;
  String? updateAt;
  bool? enable;

  GetCategoryData(
      {this.id, this.category, this.createdAt, this.enable, this.updateAt});

  GetCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    createdAt = json['created_at'];
    enable = json['enable'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['enable'] = enable;
    data['created_at'] = createdAt;
    data['update_at'] = updateAt;
    return data;
  }
}
