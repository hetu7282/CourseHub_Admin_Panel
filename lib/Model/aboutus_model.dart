class AboutusModel {
  String? text;
  String? aid;

  AboutusModel({this.text,this.aid});

  AboutusModel.fromJson(Map<String, dynamic> json, String id) {
    aid = json['aid'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aid'] = this.aid;
    data['text'] = this.text;
    return data;
  }
}