class GetContactUSResponseModel {
  bool? status;
  String? message;
  ContactUSData? data;

  GetContactUSResponseModel({this.status, this.message, this.data});

  GetContactUSResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ContactUSData.fromJson(json['data']) : null;
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

class ContactUSData {
  String? telegramno;
  String? address;
  String? contactno1;
  String? contactno2;
  String? createdAt;
  int? id;
  String? whatsappno;
  String? email;

  ContactUSData(
      {this.telegramno,
      this.address,
      this.contactno1,
      this.contactno2,
      this.createdAt,
      this.id,
      this.whatsappno,
      this.email});

  ContactUSData.fromJson(Map<String, dynamic> json) {
    telegramno = json['telegramno'];
    address = json['address'];
    contactno1 = json['contactno1'];
    contactno2 = json['contactno2'];
    createdAt = json['created_at'];
    id = json['id'];
    whatsappno = json['whatsappno'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['telegramno'] = telegramno;
    data['address'] = address;
    data['contactno1'] = contactno1;
    data['contactno2'] = contactno2;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['whatsappno'] = whatsappno;
    data['email'] = email;
    return data;
  }
}
