class UploadImageResponseModel {
  bool? status;
  String? message;
  String? image;

  UploadImageResponseModel({this.status, this.message, this.image});

  UploadImageResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['image'] = image;
    return data;
  }
}
