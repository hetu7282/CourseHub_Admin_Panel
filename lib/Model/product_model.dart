class ProductModel {
  String? pid;
  String? pname;
  String? categorie;
  String? price;
  String? quantity;
  String? description;
  String? image;

  ProductModel(
      {this.pid,
      this.pname,
      this.categorie,
      this.price,
      this.quantity,
      this.description,
      this.image});

  ProductModel.fromJson(Map<String, dynamic> json, String id) {
    pid = json['pid'];
    pname = json['p_name'];
    categorie = json['categorie'];
    price = json['price'];
    quantity = json['quantity'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['p_name'] = this.pname;
    data['categorie'] = this.categorie;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}