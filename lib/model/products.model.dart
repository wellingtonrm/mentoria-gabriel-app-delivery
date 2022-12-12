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
