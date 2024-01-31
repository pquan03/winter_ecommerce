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
      image: json['image'],
      productsCount: int.parse((json['products_count'] ?? 0).toString()),
      isFeatured: json['is_featured'],
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
