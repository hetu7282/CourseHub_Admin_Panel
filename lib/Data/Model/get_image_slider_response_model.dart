class GetImageSliderResponseModel {
  bool? status;
  String? message;
  List<GetImageSlider>? data;

  GetImageSliderResponseModel({this.status, this.message, this.data});

  GetImageSliderResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetImageSlider>[];
      json['data'].forEach((v) {
        data!.add(GetImageSlider.fromJson(v));
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

class GetImageSlider {
  int? id;
  String? imagerul;

  GetImageSlider({this.id, this.imagerul});

  GetImageSlider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagerul = json['imagerul'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imagerul'] = imagerul;
    return data;
  }
}
