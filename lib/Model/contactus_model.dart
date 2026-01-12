class ContactusMode {
  String? cid;
  String? no1;
  String? no2;
  String? whatsapp;
  String? telegram;

  ContactusMode({this.cid, this.no1, this.no2, this.whatsapp, this.telegram});

  ContactusMode.fromJson(Map<String, dynamic> json, String id) {
    cid = json['cid'];
    no1 = json['no1'];
    no2 = json['no2'];
    whatsapp = json['whatsapp'];
    telegram = json['telegram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this.cid;
    data['no1'] = this.no1;
    data['no2'] = this.no2;
    data['whatsapp'] = this.whatsapp;
    data['telegram'] = this.telegram;
    return data;
  }
}