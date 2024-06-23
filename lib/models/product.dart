class Product {
  late int id;
  late int categoryId;
  late String productName;
  late String quantityPerUnit;
  late double unitPrice;
  late int unitsInStock;

  Product(
      this.id,
      this.categoryId,
      this.productName,
      this.quantityPerUnit,
      this.unitPrice,
      this.unitsInStock,
      );

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0;
    categoryId = json['categoryId'] is int ? json['categoryId'] : int.tryParse(json['categoryId'].toString()) ?? 0;
    productName = json['productName'].toString() ?? '';
    quantityPerUnit = json['quantityPerUnit'].toString() ?? '';
    unitPrice = json['unitPrice'] is double ? json['unitPrice'] : double.tryParse(json['unitPrice'].toString()) ?? 0.0;
    unitsInStock = json['unitsInStock'] is int ? json['unitsInStock'] : int.tryParse(json['unitsInStock'].toString()) ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'ProductName': productName,
      'quantityPerUnit': quantityPerUnit,
      'unitPrice': unitPrice,
      'unitsInStock': unitsInStock,
    };
  }
}
