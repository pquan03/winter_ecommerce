import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String id;
  final String categoryId;
  final String productId;

  ProductCategoryModel({
    required this.id,
    required this.categoryId,
    required this.productId,
  });

  // To json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'productId': productId,
    };
  }

  // From snapshot
  factory ProductCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final snapshot = document.data();
    if (snapshot == null) {
      return ProductCategoryModel(id: '', categoryId: '', productId: '');
    }
    return ProductCategoryModel(
      id: snapshot['id'],
      categoryId: snapshot['categoryId'],
      productId: snapshot['productId'],
    );
  }
}
