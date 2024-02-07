import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  final String id;
  final String brandId;
  final String categoryId;

  BrandCategoryModel({
    required this.id,
    required this.brandId,
    required this.categoryId,
  });

  // To json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brandId': brandId,
      'categoryId': categoryId,
    };
  }

  // From snapshot
  factory BrandCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final snapshot = document.data();
    if (snapshot == null) {
      return BrandCategoryModel(id: '', brandId: '', categoryId: '');
    }
    return BrandCategoryModel(
      id: snapshot['id'],
      brandId: snapshot['brandId'],
      categoryId: snapshot['categoryId'],
    );
  }
}
