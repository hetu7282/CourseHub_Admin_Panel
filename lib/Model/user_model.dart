class UserModel {
  String? uname;
  String? uid;
  String? email;
  String? phno;
  String? dialcode;
  String? address;
  String? rdate;
  String? password;
  String? isoCode;

  UserModel(
      {this.uname, this.uid, this.email, this.phno, this.address, this.rdate,this.password,this.dialcode,this.isoCode});

  UserModel.fromJson(Map<String, dynamic> json, String id) {
    uname = json['u_name'];
    uid = json['uid'];
    email = json['email'];
    phno = json['phno'];
    address = json['address'];
    rdate = json['r_date'];
    password = json['password'];
    dialcode = json['dialcode'];
    isoCode = json['isoCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['u_name'] = this.uname;
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['phno'] = this.phno;
    data['address'] = this.address;
    data['r_date'] = this.rdate;
    data['password'] = this.password;
    data['dialcode'] = this.dialcode;
    data['isoCode'] = this.isoCode;
    return data;
  }
}