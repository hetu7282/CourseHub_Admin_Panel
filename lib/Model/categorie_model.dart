// ignore_for_file: non_constant_identifier_names

class CategorieModel {
  String? cid;
  String? Categories;
  
  CategorieModel.fromJson(Map<String, dynamic> map, String uid) {
    Categories = map['categorie'];
    cid = map['cid'];
    
  }

  CategorieModel.tojson() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['categorie'] = Categories;
    map['cid'] = cid;
 
  }
}