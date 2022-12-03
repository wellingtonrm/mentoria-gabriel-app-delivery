class EmpresasModel {
  String? id;
  String? name;
  String? logoImage;
  String? description;
  int? discount;
  String? waitingTime;
  List<Products>? products;

  EmpresasModel(
      {this.id,
      this.name,
      this.logoImage,
      this.description,
      this.discount,
      this.waitingTime,
      this.products});

  EmpresasModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logoImage = json['logoImage'];
    description = json['description'];
    discount = json['discount'];
    waitingTime = json['waitingTime'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logoImage'] = this.logoImage;
    data['description'] = this.description;
    data['discount'] = this.discount;
    data['waitingTime'] = this.waitingTime;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? name;
  String? description;
  double? price;
  int? cashback;

  Products({this.name, this.description, this.price, this.cashback});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    cashback = json['cashback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['cashback'] = this.cashback;
    return data;
  }
}
