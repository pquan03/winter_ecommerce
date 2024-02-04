class ProductVariationModel {
  String id;
  Map<String, String> attributes;
  String? image;
  double? price;
  double? salePrice;
  int? stock;
  String? description;
  String? sku;

  ProductVariationModel({
    required this.id,
    required this.attributes,
    this.image,
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    this.description,
    this.sku,
  });

  static ProductVariationModel empty() {
    return ProductVariationModel(
      id: '',
      attributes: {},
    );
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: json['id'],
      attributes: json['attributes'] == null
          ? {}
          : Map<String, String>.from(json['attributes']),
      image: json['image'] ?? '',
      price: double.parse((json['price'] ?? 0.0).toString()),
      salePrice: double.parse((json['salePrice'] ?? 0.0).toString()),
      stock: int.parse((json['stock'] ?? 0).toString()),
      description: json['description'] ?? '',
      sku: json['SKU'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'attributes': attributes,
      'image': image,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'description': description,
      'SKU': sku,
    };
  }
}
