import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String image;
  String name;
  bool isFeatured;
  String parentID;

  // Constructor
  CategoryModel({
    required this.id,
    required this.image,
    required this.name,
    required this.isFeatured,
    this.parentID = '',
  });

  // Empty Constructor

  static CategoryModel empty() =>
      CategoryModel(id: '', image: '', name: '', isFeatured: false);

  // From Json
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final json = documentSnapshot.data()!;
      return CategoryModel(
        id: json['id'] ?? '',
        image: json['image'] ?? '',
        name: json['name'] ?? '',
        isFeatured: json['isFeatured'] ?? false,
        parentID: json['parentID'] ?? '',
      );
    } else {
      return CategoryModel.empty();
    }
  }

  // To Json
  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'name': name,
        'isFeatured': isFeatured,
        'parentID': parentID,
      };
}
