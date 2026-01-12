class ErrorModel {
  ErrorModel({this.status, this.message});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  String? message;
  var status;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
