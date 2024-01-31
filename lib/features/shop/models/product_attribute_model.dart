class ProductAttributeModel {
  String? name;
  List<String>? values;

  ProductAttributeModel({
    this.name,
    this.values,
  });

  factory ProductAttributeModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: json.containsKey('name') ? json['name'] : '',
      values: List<String>.from(json['values']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'values': values,
    };
  }
}
