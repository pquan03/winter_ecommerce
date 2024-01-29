class BrandModel {
  String id;
  String image;
  int productsCount;
  bool isFeatured;
  String name;

  BrandModel({
    required this.id,
    required this.image,
    required this.productsCount,
    required this.isFeatured,
    required this.name,
  });

  static BrandModel empty() => BrandModel(
        id: '',
        image: '',
        productsCount: 0,
        isFeatured: false,
        name: '',
      );

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: json['id'],
      image: json['Image'],
      productsCount: json['ProductsCount'],
      isFeatured: json['isFeatured'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'products_count': productsCount,
      'is_featured': isFeatured,
      'name': name,
    };
  }
}
